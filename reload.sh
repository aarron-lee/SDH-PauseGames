 #!/bin/bash
# for localhost dev purposes
pnpm run build
sudo rm -r $HOME/homebrew/plugins/SDH-PauseGames/
sudo rm -r $HOME/homebrew/logs/SDH-PauseGames/
sudo cp -r $HOME/Development/SDH-PauseGames/ $HOME/homebrew/plugins/
sudo systemctl restart plugin_loader.service
