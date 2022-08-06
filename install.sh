echo Installing tmux...
pacman -S tmux mvp xsel npm python-pip ripgrep fd

pip install pynvim

echo Cloning tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo Creating symlinks...
rm -rf ~/.config/nvim
ln -s ~/.dotfiles/nvim/ ~/.config/nvim
rm ~/.gitconfig
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
rm ~/.bashrc
ln -s ~/.dotfiles/.bashrc ~/.bashrc
rm ~/.tmux.conf
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
rm ~/.config/mpv/mpv.conf
ln -s ~/.dotfiles/mpv.conf ~/.config/mpv/mpv.conf
rm -rf ~/.config/alacritty/
mkdir ~/.config/alacritty/
ln -s ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
rm ~/.config/starship.toml
ln -s ~/.dotfiles/starship.toml ~/.config/starship.toml

echo DONE!
