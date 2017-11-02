@TODO
Replace with links to the many existing GitHub cheat sheets

# Overwrite local files with remote branch
git fetch origin master
git reset —hard FETCH_head
git clean -df

git diff origin/branchname -- path/to/file.txt

# Configuration

git add . --force
  _force subdirectories when gitignore is being mean_

## branching
git checkout -b branchname

## pushing to another branch
git push origin master:newbranch

## changing remote URL
git remote -v
git remote set-url origin <new url>

# Fixing Things (roll back after a git pull)
git reset --hard HEAD@{1}

# Getting Files
overwrite single file:
`git fetch`
git checkout origin/master filename

# Cleaning up when local is out of sync with master
git fetch origin && git reset --hard origin/master && git clean -f -d

# Other good things to know
cannot add empty directories
---
## gitignore samples

# exclude all

# INCLUDE dirs
!dir/
!dir/**

# Reference Guides
https://github.com/github/gitignore
https://www.gitignore.io/
https://git-scm.com/docs/gitignore
https://git.wiki.kernel.org/index.php/GitFaq
