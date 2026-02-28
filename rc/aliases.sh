#!/usr/bin/env bash

# === Remplacements Modernes ("Trendy") ===

# eza au lieu de ls (avec icônes et tri intelligent)
if command -v eza &> /dev/null; then
    alias ls="eza --icons --group-directories-first"
    alias ll="eza -lh --icons --group-directories-first --git"
    alias la="eza -lah --icons --group-directories-first --git"
fi

# bat au lieu de cat (coloration syntaxique)
if command -v bat &> /dev/null; then
    alias cat="bat --style=plain"
    alias less="bat"
elif command -v batcat &> /dev/null; then # Nom sous Ubuntu
    alias cat="batcat --style=plain"
fi

# zoxide au lieu de cd (saut de dossiers intelligent)
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init $(basename $SHELL) 2>/dev/null)"
    alias cd="z"
fi

# lazygit
if command -v lazygit &> /dev/null; then
    alias lg="lazygit"
fi

# Git Alias de base (si vous n'utilisez pas le plugin oh-my-zsh git)
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gl="git pull"
