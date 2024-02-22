echo Installing dependencies
pacman -S tmux mpv xsel npm python-pip ripgrep fd lsd neovim

pip install pynvim


echo Cloning tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo Creating symlinks...

stow --adopt .


echo DONE!
