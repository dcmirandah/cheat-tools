#!/bin/bash
# Reset Git history by creating a new orphan branch and force-pushing it to the remote repository.
# Reference: https://stackoverflow.com/questions/13716658/how-to-delete-all-commit-history-in-github

set -e  # Exit on any error

# Define the new orphan branch name
NEW_BRANCH="latest_branch"

# Ensure the repository is up to date
git fetch origin

echo "Creating a new orphan branch: $NEW_BRANCH"
git checkout --orphan "$NEW_BRANCH"

echo "Adding all files to the new branch"
git add -A

echo "Committing changes"
git commit -m "Reset commit history"

# Delete the main branch (if it exists locally)
if git show-ref --verify --quiet refs/heads/main; then
    echo "Deleting existing main branch"
    git branch -D main
fi

# Rename the orphan branch to main
echo "Renaming $NEW_BRANCH to main"
git branch -m main

# Force push the new main branch to the remote repository
echo "Force pushing changes to remote repository"
git push -f origin main

echo "Git history reset successfully."
