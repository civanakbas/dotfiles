echo Installing tmux...
sudo apt install tmux
echo Installing neovim...
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt install neovim


echo Creating symlinks...
mkdir ~/.config/nvim
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
