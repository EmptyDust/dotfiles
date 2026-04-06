# dotfiles

This repository tracks the portable shell and tooling config from this Mac.

## Tracked files

- `.zshrc`
- `.zprofile`
- `.config/pip/pip.conf`
- `.codex/config.toml`
- `.codex/config.json`
- `.claude/settings.json`
- `.claude/skills/proxy.md`

## Private environment

Secrets stay outside git in `~/.config/shell/private_env.zsh`.

An example template lives at `.config/shell/private_env.zsh.example`.

## Bootstrap on a new machine

```bash
git clone git@github.com:<github-username>/dotfiles.git ~/dotfiles
cd ~/dotfiles
./scripts/bootstrap.sh
```

Then edit `~/.config/shell/private_env.zsh` and fill in the machine-local secrets such as `KAGGLE_API_TOKEN` and `ANTHROPIC_AUTH_TOKEN`.

## Sync changes

```bash
cd ~/dotfiles
git add .
git commit -m "Update dotfiles"
git push
```
