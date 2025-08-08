#!/bin/bash

FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

# p10k fonts
wget -P ~/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget -P ~/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget -P ~/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget -P ~/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

JETBRAINSMONO_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip"
JETBRAINSMONO_ZIP="JetbrainsMono.zip"

IOSEVKA_TERM_URL="https://github.com/be5invis/Iosevka/releases/download/v33.2.7/SuperTTC-SGr-IosevkaTerm-33.2.7.zip"
IOSEVKA_TERM_ZIP="Iosevka.zip"

wget -q "$JETBRAINSMONO_URL" -O "$JETBRAINSMONO_ZIP"
wget -q "$IOSEVKA_TERM_URL" -O "$IOSEVKA_TERM_ZIP"

unzip -q "$JETBRAINSMONO_ZIP" -d "$FONT_DIR"
unzip -q "$IOSEVKA_TERM_ZIP" -d "$FONT_DIR"

rm "$JETBRAINSMONO_ZIP"
rm "$IOSEVKA_TERM_ZIP"

fc-cache -f -v

echo "Fonts installed"

