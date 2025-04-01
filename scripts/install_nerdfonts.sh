#!/bin/bash

FONT_DIR="$HOME/.local/share/fonts"

JETBRAINSMONO_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip"
JETBRAINSMONO_ZIP="JetbrainsMono.zip"

INCONSOLATA_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Inconsolata.zip"
INCONSOLATA_ZIP="Inconsolata.zip"

wget -q "$JETBRAINSMONO_URL" -O "$JETBRAINSMONO_ZIP"
wget -q "$INCONSOLATA_URL" -O "$INCONSOLATA_ZIP"

mkdir -p "$FONT_DIR"
unzip -q "$JETBRAINSMONO_ZIP" -d "$FONT_DIR"
unzip -q "$INCONSOLATA_ZIP" -d "$FONT_DIR"

rm "$JETBRAINSMONO_ZIP"
rm "$INCONSOLATA_ZIP"

fc-cache -fv
