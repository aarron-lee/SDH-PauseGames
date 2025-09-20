#!/usr/bin/bash
if [ "$EUID" -eq 0 ]
  then echo "Please do not run as root"
  exit
fi

echo "removing previous install if it exists"

cd $HOME

sudo rm -rf "$HOME/homebrew/plugins/Pause Games"

echo "installing SDH-PauseGames plugin for TDP control"
# download + install simple decky tdp
curl -L $(curl -s https://api.github.com/repos/aarron-lee/SDH-PauseGames/releases/latest | grep "browser_download_url" | cut -d '"' -f 4) -o $HOME/PauseGames.zip
sudo 7z x ./PauseGames.zip  -o$HOME/homebrew/plugins

# install complete, remove build dir
rm  $HOME/SDH-PauseGames.zip
sudo systemctl restart plugin_loader.service

echo "Installation complete"
