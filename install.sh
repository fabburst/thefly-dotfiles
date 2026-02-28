#!/usr/bin/env bash
# Script de déploiement automatique sur un nouvel ordinateur

echo "🚀 Déploiement de l'environnement Terminal (Thefly + Plugins)..."

# 1. Vérification ou installation de Thefly
if ! command -v fly &> /dev/null; then
    echo "📦 Installation de Thefly..."
    curl -sL https://raw.githubusercontent.com/joknarf/thefly/master/install.sh | bash
fi

# 2. Installation des plugins "trendy" via Thefly
echo "🔌 Installation des plugins Zsh/Bash (Auto-suggestions, Syntax Highlighting, Redo)..."
fly add zsh-users/zsh-autosuggestions
fly add zsh-users/zsh-syntax-highlighting
fly add joknarf/redo

# 3. Lien symbolique pour les dotfiles d'applications (ex: Starship)
echo "🔗 Création des liens pour les fichiers de configuration..."
mkdir -p ~/.config
ln -sf ~/.fly.d/dotfiles/starship.toml ~/.config/starship.toml

echo "✅ Terminé ! Il est recommandé d'installer : starship, eza, bat et zoxide via le gestionnaire de paquets de votre OS (apt, brew, etc.) pour profiter pleinement de la configuration."
echo "🔄 Redémarrez votre terminal pour appliquer les changements."
