<div align="center">

<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" width="150" alt="Logo">

# 🚀 Fab's Terminal & Dotfiles
**Une configuration de terminal moderne, ultra-rapide et multiplateforme.**

[![Shell](https://img.shields.io/badge/Shell-Bash%20%2F%20Zsh-blue.svg?style=flat-square&logo=gnu-bash)](https://gnu.org/software/bash/)
[![Managed with Thefly](https://img.shields.io/badge/Managed%20with-Thefly-purple.svg?style=flat-square)](https://github.com/joknarf/thefly)
[![Prompt by Starship](https://img.shields.io/badge/Prompt-Starship-green.svg?style=flat-square)](https://starship.rs/)

*Write once, run everywhere : macOS, Ubuntu, Arch Linux et Windows (WSL).*

---

</div>

## 🌟 La Philosophie

L'objectif de ce dépôt est de centraliser toute ma configuration de terminal de manière élégante et de la déployer en **3 secondes** sur n'importe quel nouvel ordinateur. 

Au revoir les `.bashrc` à rallonge polluant le répertoire personnel. Bonjour la propreté grâce à **Thefly**, le gestionnaire de plugins et "téléporteur" de shell.

---

## 🛠️ La "Trendy" Stack (Les 6 piliers)

Cette configuration s'appuie sur les outils CLI les plus modernes et performants du moment, majoritairement écrits en Rust.

| Outil | Description | Remplacement |
| :--- | :--- | :--- |
| 🪰 **[Thefly](https://github.com/joknarf/thefly)** | Le cœur du système. Il gère les plugins, organise les dotfiles et permet d'emporter son environnement partout via SSH. | *GNU Stow, Oh-My-Zsh* |
| 🌠 **[Starship](https://starship.rs/)** | L'invite de commande (prompt) universelle. Ultra-rapide, affiche le statut Git, la version de Node/Python, etc. | *Thèmes natifs Zsh/Bash* |
| 📁 **[eza](https://github.com/eza-community/eza)** | Un remplaçant moderne de `ls` qui affiche les icônes des fichiers, le statut Git et utilise des couleurs sémantiques. | `ls` |
| 🦇 **[bat](https://github.com/sharkdp/bat)** | Un clone de `cat` avec coloration syntaxique, intégration Git et pagination automatique. | `cat`, `less` |
| 🚀 **[zoxide](https://github.com/ajeetdsouza/zoxide)** | Un remplaçant intelligent pour `cd`. Il mémorise vos dossiers préférés pour des sauts instantanés (ex: `z doc`). | `cd` |
| 🔌 **Plugins Zsh** | **`zsh-autosuggestions`** (suggère la suite de la commande selon l'historique) et **`zsh-syntax-highlighting`** (colore la commande pendant la frappe). | - |

---

## 🧠 Les Fonctions Intelligentes (Héritage Fish)

J'ai migré et "rendu intelligentes" mes anciennes fonctions Fish pour qu'elles s'adaptent automatiquement à l'OS cible.

*   `miaj` : **Mise à jour universelle.** Lance automatiquement `sudo apt update`, `sudo pacman -Syu` ou `brew update` selon l'ordinateur où vous vous trouvez !
*   `mkc <dossier>` : Crée un répertoire et rentre dedans instantanément (*Make & Change*).
*   `bak <fichier>` : Crée une sauvegarde d'un fichier en ajoutant `.bak` à la fin.
*   `speedip` : Teste votre vitesse de connexion et affiche votre IP publique.
*   `gc` : Alias rapide pour `git clone`.

---

## 📦 Installation (Nouvel Ordinateur)

### 1. Prérequis (Les binaires)
Installez d'abord les outils en Rust sur votre machine :

**🍏 Sur macOS (via Homebrew) :**
```bash
brew install starship eza bat zoxide lazygit
```

**🐧 Sur Ubuntu / Debian / WSL :**
```bash
sudo apt update && sudo apt install git zsh
curl -sS https://starship.rs/install.sh | sh
# Note : Pour eza, bat et zoxide sur Ubuntu, utilisez cargo ou téléchargez les .deb officiels.
```

**🪟 Sur Windows (via WSL) :**
Pour profiter de ce terminal sous Windows, l'utilisation de WSL (Windows Subsystem for Linux) est **requise**.
1. Ouvrez PowerShell en administrateur et installez WSL (Ubuntu par défaut) :
   ```powershell
   wsl --install
   ```
2. Redémarrez votre PC, ouvrez "Ubuntu" dans votre menu Démarrer pour créer votre utilisateur.
3. Suivez ensuite les instructions de la section **Ubuntu / Debian** ci-dessus.
*(💡 Astuce : Utilisez l'application [Windows Terminal](https://apps.microsoft.com/detail/9n0dx20hk701) pour la meilleure expérience avec WSL).*

### 2. Le Déploiement Magique
Cloner ce dépôt comme votre nouveau "Quartier Général" et lancez le script d'installation :

```bash
# 1. On clone dans le dossier secret de Thefly
git clone https://github.com/fabburst/thefly-dotfiles.git ~/.fly.d

# 2. On lance la magie
bash ~/.fly.d/install.sh
```

### 3. Finalisation
Faites de Zsh votre shell par défaut (fortement recommandé) :
```bash
chsh -s $(which zsh)
```
**Redémarrez votre terminal ! 🎉**

---

## 📂 Structure du dépôt

```text
~/.fly.d/
├── fly.rc               # Le cerveau : charge Thefly et source tout le reste
├── install.sh           # Le script de déploiement automatique
├── plugins/             # (Ignoré par Git) Dossier où Thefly télécharge les plugins
├── dotfiles/            # Vos configurations d'applications
│   └── starship.toml    # Design épuré du prompt
└── rc/                  # Vos scripts et configurations bash/zsh
    ├── aliases.sh       # Remplacements (ls -> eza, etc.)
    └── functions.sh     # Fonctions intelligentes (miaj, mkc...)
```

<div align="center">
  <sub>Configured with ❤️ by Fab</sub>
</div>