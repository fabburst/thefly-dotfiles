# 🚀 My Terminal Dotfiles

Ce dépôt contient ma configuration ultime de terminal, multiplateforme (Mac, Linux/Ubuntu, Windows/WSL), gérée par **[Thefly](https://github.com/joknarf/thefly)**.

## 🌟 Outils Inclus ("Trendy")
*   **Thefly** : Gestionnaire de plugins et dotfiles (téléporteur de Shell)
*   **Starship** : Prompt universel et ultra-rapide
*   **eza** : Remplaçant moderne de `ls` avec des icônes
*   **bat** : Remplaçant de `cat` avec coloration syntaxique
*   **zoxide** : Remplaçant intelligent de `cd` (saut de dossiers)
*   **Plugins Zsh** : Autosuggestions & Syntax Highlighting

## 💻 Installation sur un NOUVEL ORDINATEUR

1. **Prérequis :** Installez d'abord git et les outils modernes sur votre OS.
   * *Mac (Homebrew)* : `brew install starship eza bat zoxide lazygit`
   * *Ubuntu/WSL* : `sudo apt install git zsh && curl -sS https://starship.rs/install.sh | sh` (etc.)

2. **Cloner ce dépôt comme quartier général de Thefly :**
   ```bash
   git clone https://github.com/VOTRE_PSEUDO/dotfiles.git ~/.fly.d
   ```

3. **Lancer le déploiement :**
   ```bash
   cd ~/.fly.d
   bash install.sh
   ```

4. **Changez votre shell par défaut en Zsh (Optionnel mais recommandé) :**
   ```bash
   chsh -s $(which zsh)
   ```

Redémarrez votre terminal et profitez ! ✨
