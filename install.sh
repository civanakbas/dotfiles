echo Installing tmux...
sudo apt install tmux
echo Installing neovim...
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt install neovim
sudo apt install mvp

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

echo DONE!
