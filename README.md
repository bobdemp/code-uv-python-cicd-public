# code-uv-python-cicd-public

If your pyproject is pre populaled run

```
uv sync
```
# Pre Commit

```
uv run pre-commit clean
uv run pre-commit install
uv run pre-commit run --all-file
```

## Activate Env

```
source .venv/bin/activate
```

# Git

```
git checkout -b NA-Initial-Setup

uv sync

source .venv/bin/activate

pre-commit clean
pre-commit install
pre-commit run --all-file

git add --all; git commit -m "NA-Initial-Setup"; git push
git pull --all --tags -f --prune
git fetch --prune origin "+refs/tags/*:refs/tags/*"
git branch -d NA-Initial-Setup
```
