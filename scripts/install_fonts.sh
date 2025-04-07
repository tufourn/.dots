#!/bin/bash

# download fonts
wget -P ~/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf

wget -P ~/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf

wget -P ~/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf

wget -P ~/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

JETBRAINSMONO_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip"
JETBRAINSMONO_ZIP="JetbrainsMono.zip"

INCONSOLATA_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Inconsolata.zip"
INCONSOLATA_ZIP="Inconsolata.zip"

wget -q "$JETBRAINSMONO_URL" -O "$JETBRAINSMONO_ZIP"
wget -q "$INCONSOLATA_URL" -O "$INCONSOLATA_ZIP"

FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"
unzip -q "$JETBRAINSMONO_ZIP" -d "$FONT_DIR"
unzip -q "$INCONSOLATA_ZIP" -d "$FONT_DIR"

rm "$JETBRAINSMONO_ZIP"
rm "$INCONSOLATA_ZIP"

fc-cache -f -v

echo "Fonts installed"

