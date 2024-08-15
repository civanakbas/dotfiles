#!/bin/bash

print_step() {
  local step_number=$1
  local step_message=$2
  local total_steps=$3
  local progress_bar_length=50
  local progress=$(((step_number * progress_bar_length) / total_steps))

  printf "\n\e[1;34m[Step %d/%d]\e[0m %s\n" "$step_number" "$total_steps" "$step_message"
  printf "["
  for ((i = 0; i < progress; i++)); do printf "="; done
  for ((i = progress; i < progress_bar_length; i++)); do printf " "; done
  printf "]\n"
}

check_and_install_package() {
  local package=$1
  if pacman -Qi "$package" &>/dev/null; then
    echo "$package is already installed."
  else
    echo "$package not found. Installing..."
    sudo pacman -S "$package" --noconfirm
  fi
}

total_steps=6
current_step=1

# Step 1: Install dependencies
print_step $current_step "Installing dependencies..." $total_steps
dependencies=(tmux mpv xsel npm python-pip ripgrep fd lsd neovim stow)

for package in "${dependencies[@]}"; do
  check_and_install_package "$package"
done

# Step 2: Install Python dependencies
current_step=$((current_step + 1))
print_step $current_step "Installing Python dependencies..." $total_steps
pip install pynvim --break-system-packages

# Step 3: Check and install TPM
current_step=$((current_step + 1))
print_step $current_step "Checking for TPM (Tmux Plugin Manager)..." $total_steps
tpm_dir="$HOME/.tmux/plugins/tpm"

if [ -d "$tpm_dir" ]; then
  echo "TPM is already installed."
else
  echo "TPM not found. Cloning..."
  git clone https://github.com/tmux-plugins/tpm "$tpm_dir"
  echo "TPM has been installed!"
fi

# Step 4: Create symlinks
current_step=$((current_step + 1))
print_step $current_step "Creating symlinks..." $total_steps
stow --adopt .

# Step 5: Check and install FiraCode Nerd Font
current_step=$((current_step + 1))
print_step $current_step "Checking for FiraCode Nerd Font..." $total_steps
font_dir="$HOME/.local/share/fonts"
font_name="FiraCode Nerd Font"
font_file="$font_dir/Fira Code Regular Nerd Font Complete.ttf"

if [ -f "$font_file" ]; then
  echo "$font_name is already installed."
else
  echo "$font_name not found. Installing..."
  mkdir -p "$font_dir"
  wget -P "$font_dir" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
  unzip "$font_dir/FiraCode.zip" -d "$font_dir"
  rm "$font_dir/FiraCode.zip"
  fc-cache -fv
  echo "$font_name has been installed!"
fi

# Step 6: Completion
current_step=$((current_step + 1))
print_step $current_step "Installation Complete!" $total_steps
echo -e "\e[1;32mAll steps completed successfully!\e[0m\n"
