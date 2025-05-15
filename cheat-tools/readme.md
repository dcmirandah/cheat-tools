# Scripts

## Table of Contents

- [fmt.sh](#fmtsh)
  - [Features](#features)
  - [Usage](#usage)
- [open.sh](#opensh)
  - [Features](#features-1)
  - [Usage](#usage-1)
- [reset_git_history.sh](#reset_git_historysh)
  - [Features](#features-2)
  - [Usage](#usage-2)

## fmt.sh

The `fmt.sh` script provides a menu-driven interface to validate, format, and manage pre-commit hooks for Terraform and Terragrunt projects.

### Features

- Pre-commit Validation: Runs all pre-commit checks across files.
- Pre-commit Installation: Installs the necessary pre-commit hooks.
- Pre-commit Update: Updates pre-commit hooks to their latest versions.
- Terraform/Terragrunt Formatting: Ensures proper code formatting using terraform fmt and terragrunt hclfmt.

### Usage:

```bash
./fmt.sh
```

## open.sh

The `open.sh` script provides an interactive way to browse directories and open them in Visual Studio Code. It organizes projects in a two-level folder structure and allows users to navigate and select a directory efficiently.

### Features

- Interactive Folder Selection: Uses a menu system to browse directories.
- Two-Level Navigation: First, select a top-level directory, then choose a subdirectory inside it.
- VS Code Integration: Opens the selected directory in Visual Studio Code.

### Usage:

```bash
./open.sh
```

## reset_git_history.sh

The `reset_git_history.sh` script resets a Git repository's history by creating a new orphan branch and force-pushing it to the remote repository.

### Features

- Creates a new orphan branch, removing all previous commit history.
- Adds all files to the new branch and commits them.
- Deletes the old main branch and renames the new one.
- Force pushes the new main branch to the remote repository.

#### Usage:

```bash
./reset_git_history.sh
```
