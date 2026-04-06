#!/usr/bin/env bash
set -euo pipefail

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
timestamp="$(date '+%Y%m%d%H%M%S')"

link_file() {
  local rel="$1"
  local src="$repo/$rel"
  local dst="$HOME/$rel"

  mkdir -p "$(dirname "$dst")"

  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    printf 'ok   %s\n' "$dst"
    return
  fi

  if [ -e "$dst" ] || [ -L "$dst" ]; then
    mv "$dst" "$dst.pre-dotfiles.$timestamp"
    printf 'bak  %s.pre-dotfiles.%s\n' "$dst" "$timestamp"
  fi

  ln -s "$src" "$dst"
  printf 'link %s -> %s\n' "$dst" "$src"
}

link_file ".zshrc"
link_file ".zprofile"
link_file ".config/pip/pip.conf"
link_file ".codex/config.toml"
link_file ".codex/config.json"
link_file ".claude/settings.json"
link_file ".claude/skills/proxy.md"

mkdir -p "$HOME/.config/shell"
mkdir -p "$HOME/.claude/skills"
mkdir -p "$HOME/.codex"

if [ ! -f "$HOME/.config/shell/private_env.zsh" ]; then
  cp "$repo/.config/shell/private_env.zsh.example" "$HOME/.config/shell/private_env.zsh"
  chmod 600 "$HOME/.config/shell/private_env.zsh"
  printf 'init %s\n' "$HOME/.config/shell/private_env.zsh"
fi
