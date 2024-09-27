#!/bin/bash

# Navigate to the Chezmoi directory
cd ~/.local/share/chezmoi

git pull origin main

# Check for changes
if [[ -n $(git status -s) ]]; then
  # Add all changes
  git add -A

  # Commit the changes with a message including the date
  git commit -m "Auto-commit: Update dotfiles on $(date)"

  # Push the changes to the remote repository (GitHub)
  git push origin main
else
  echo "No changes to commit."
fi
