echo Installing tmux...
sudo apt install tmux
sudo apt install mvp


echo Installing neovim dependencies
sudo apt install xsel
pip install pynvim
sudo npm i -g neovim
sudo apt-get install ripgrep
wget "https://github.com/sharkdp/fd/releases/download/v8.3.2/fd-musl_8.3.2_amd64.deb"
sudo dpkg -i fd-musl_8.3.2_amd64.deb
rm fd-musl_8.3.2_amd64.deb
 

echo Cloning tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo Creating symlinks...
rm -rf ~/.config/nvim
ln -s ~/.dotfiles/nvim/ ~/.config/nvim
rm ~/.gitconfig
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
rm ~/.bashrc
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/mpv.conf ~/.config/mpv/mpv.conf
mkdir ~/.config/alacritty/
ln -s ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
sudo snap install starship
ln -s ~/.dotfiles/starship.toml ~/.config/starship.toml

echo DONE!
