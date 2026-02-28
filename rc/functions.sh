#!/usr/bin/env bash

# === Fonctions pratiques récupérées de l'ancienne configuration Arch/Fish ===

# Créer un dossier et y entrer directement
mkc() {
    mkdir -p "$1" && cd "$1" || return
}

# Sauvegarder rapidement un fichier (ajoute .bak)
bak() {
    cp -r "$1" "$1.bak"
    echo "💾 Sauvegarde créée : $1.bak"
}

# Obtenir son adresse IP publique
myip() {
    echo "🌍 IP Publique :"
    curl -s ifconfig.me
    echo ""
}

# Obtenir son IP et faire un speedtest (nécessite npm install -g speed-test)
speedip() {
    if command -v speed-test &> /dev/null; then
        speed-test
    else
        echo "⚠️  L'outil 'speed-test' n'est pas installé. (npm install -g speed-test)"
    fi
    myip
}

# === Raccourcis Git (anciens alias Fish) ===
alias gc="git clone"

# === Mise à jour système universelle (Adaptation de l'ancien 'miaj') ===
miaj() {
    echo "🔄 Recherche de mises à jour système..."
    if command -v pacman &> /dev/null; then
        sudo pacman -Syu  # Arch Linux
    elif command -v apt &> /dev/null; then
        sudo apt update && sudo apt upgrade -y  # Ubuntu / Debian / WSL
    elif command -v brew &> /dev/null; then
        brew update && brew upgrade  # macOS
    else
        echo "❌ Gestionnaire de paquets non reconnu."
    fi
}
