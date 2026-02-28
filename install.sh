#!/usr/bin/env bash

# ==============================================================================
# Script de déploiement automatique avec UI Gum
# ==============================================================================

# Vérifier si Gum est installé, sinon utiliser de simples 'echo' en solution de secours
has_gum() {
    command -v gum >/dev/null 2>&1
}

# Fonction pour afficher des titres stylisés
print_step() {
    if has_gum;
    then
        gum style --border normal --margin "1" --padding "1 2" --border-foreground 212 "$1"
    else
        echo -e "\n=== $1 ==="
    fi
}

print_step "🚀 Déploiement de l'environnement Terminal Thefly"

# 1. Vérification ou installation de Thefly
if ! command -v fly &> /dev/null; then
    if has_gum;
    then
        gum spin --spinner dot --title "Installation de Thefly en cours..." -- curl -sL https://raw.githubusercontent.com/joknarf/thefly/master/install.sh | bash > /dev/null
    else
        echo "📦 Installation de Thefly..."
        curl -sL https://raw.githubusercontent.com/joknarf/thefly/master/install.sh | bash > /dev/null
    fi
else
    if has_gum;
    then
        gum style --foreground 212 "✅ Thefly est déjà installé."
    else
        echo "✅ Thefly est déjà installé."
    fi
fi

# 2. Installation des plugins via Thefly
print_step "🔌 Installation des plugins"
if has_gum;
then
    gum spin --spinner line --title "Ajout de zsh-autosuggestions..." -- fly add zsh-users/zsh-autosuggestions > /dev/null
    gum spin --spinner line --title "Ajout de zsh-syntax-highlighting..." -- fly add zsh-users/zsh-syntax-highlighting > /dev/null
    gum spin --spinner line --title "Ajout de joknarf/redo..." -- fly add joknarf/redo > /dev/null
else
    echo "Installation de zsh-autosuggestions..."
    fly add zsh-users/zsh-autosuggestions > /dev/null
    echo "Installation de zsh-syntax-highlighting..."
    fly add zsh-users/zsh-syntax-highlighting > /dev/null
    echo "Installation de joknarf/redo..."
    fly add joknarf/redo > /dev/null
fi

# 3. Liens symboliques
print_step "🔗 Configuration des liens symboliques"
mkdir -p ~/.config
ln -sf ~/.fly.d/dotfiles/starship.toml ~/.config/starship.toml
if has_gum;
then
    gum style --foreground 212 "Lien créé pour Starship : ~/.config/starship.toml"
else
    echo "Lien créé pour Starship."
fi

# Fin
if has_gum;
then
    gum style --border double --margin "1" --padding "1 2" --border-foreground 46 "🎉 Installation terminée ! Redémarrez votre terminal."
else
    echo -e "\n🎉 Installation terminée ! Redémarrez votre terminal."
fi