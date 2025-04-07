#!/bin/bash

# Function to install Zsh
install_zsh() {
    local distro=$1
    echo "Installing Zsh for $distro..."
    # Install Zsh based on the distribution
    case $distro in
        fedora)
            sudo dnf install zsh -y
            ;;
        arch)
            sudo pacman -S zsh --noconfirm
            ;;
        ubuntu)
            sudo apt-get update
            sudo apt-get install zsh -y
            ;;
        *)
            echo "Unsupported distribution: $distro."
            exit 1
            ;;
    esac
}

# Function to change default shell to Zsh
change_shell_to_zsh() {
    echo "Changing default shell to Zsh..."
    chsh -s $(which zsh)
}

# Display the menu and get user choice
echo "Select your Linux distribution:"
echo "1. Fedora"
echo "2. Arch Linux"
echo "3. Ubuntu"

read -p "Enter your choice [1-3]: " choice

case $choice in
    1)
        distribution="fedora"
        ;;
    2)
        distribution="arch"
        ;;
    3)
        distribution="ubuntu"
        ;;
    *)
        echo "Invalid choice. Please enter a number between 1 and 3."
        exit 1
        ;;
esac

install_zsh "$distribution"
change_shell_to_zsh

echo "Zsh installed and set as default shell."

