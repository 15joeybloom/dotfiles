# Shell function to create a git branch + worktree and cd into it.
# Source this file from ~/.bash_aliases or ~/.zshrc:
#   source ~/dotfiles/goto-worktree.sh

goto-worktree() {
  local branch="${1:?Usage: goto-worktree <branch-name>}"
  local repo_root
  repo_root=$(git rev-parse --show-toplevel 2>/dev/null) || { echo "Not in a git repo" >&2; return 1; }
  local worktree_path="$repo_root/${WORKTREES_RELATIVE_DIR:-.worktrees}/$branch"

  if [[ -d "$worktree_path" ]]; then
    cd "$worktree_path" && echo "Switched to existing worktree $worktree_path"
    return
  fi

  git worktree add "$worktree_path" -b "$branch" || return 1
  cd "$worktree_path" && echo "Switched to $worktree_path"
}
