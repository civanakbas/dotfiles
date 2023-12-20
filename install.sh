echo Installing dependencies
pacman -S tmux mpv xsel npm python-pip ripgrep fd lsd neovim

pip install pynvim

LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)

echo Cloning tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo Creating symlinks...

rm -rf ~/.config/lvim
ln -s ~/.dotfiles/lvim/ ~/.config
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
