# Replace Tag Task

## Overview

Automates replacing `"tag 1"` with `"tag 2"` in `input.txt`, commits the change, builds a Docker image including the updated file, and pushes the image to GitHub Container Registry.

---

## Prerequisites

- GitHub repo with Actions enabled.
- Permissions to push to `ghcr.io` under repo owner.
- `GITHUB_TOKEN` secret available.
- GitHub-hosted runner (Ubuntu).
- `Dockerfile` and `input.txt` present in repo root.

---

## Structure

```
.
├── Dockerfile
├── input.txt
└── .github
    ├── actions
    │   └── replace-tag
    │       └── replace.sh
    |       └── action.yml
    └── workflows
        └── reusable.yaml
        └── trigger.yaml

```

---

## Workflow Steps

1. Checkout code.
2. Run custom action to replace tag in `input.txt`.
3. Commit changes using `GITHUB_TOKEN`.
4. Login to GHCR using `GITHUB_TOKEN`.
5. Build and push Docker image tagged `ghcr.io/<owner>/<repo>/<image-name>:<tag>`.
6. Verify image push.

---

## Usage

- Ensure `Dockerfile`, `input.txt`, and workflows are committed.
- Push changes to GitHub to trigger the action.
- The reusable workflow will automatically run, modify the file, commit changes, build the Docker image, and push to GHCR.

### Where to Find the Image

- Go to your GitHub repository main page.
- In the right sidebar (or below "About"), find the **Packages** section.
- Click on the container to view metadata and tags.

# Example:  
[devops-case-study](https://github.com/soumya-s-goud/devops-case-study/)

# Container image location: 
[https://github.com/soumya-s-goud/devops-case-study/pkgs/container/devops-case-study%2Freplace-tag-app](https://github.com/soumya-s-goud/devops-case-study/pkgs/container/devops-case-study%2Freplace-tag-app)

# Pull via Docker CLI:
```bash
docker pull ghcr.io/soumya-s-goud/devops-case-study/replace-tag-app:latest
```

---


## Error Handling

- Gracefully handles no-changes-to-commit scenario.
- Logs failures during Docker login/build/push.
- Verifies image availability post-push.
