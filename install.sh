#!/bin/bash

# Determine the package manager
if command - pacman &>/dev/null; then
  PACKAGE_MANAGER="pacman"
elif command -v apt-get &>/dev/null; then
  PACKAGE_MANAGER="apt-get"
else
  echo "Unsupported package manager. Please install packages manually."
  exit 1
fi

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
  if [ "$PACKAGE_MANAGER" = "pacman" ]; then
    if pacman -Qi "$package" &>/dev/null; then
      echo "$package is already installed."
    else
      echo "$package not found. Installing..."
      sudo pacman -S "$package" --noconfirm
    fi
  elif [ "$PACKAGE_MANAGER" = "apt-get" ]; then
    if dpkg -s "$package" &>/dev/null; then
      echo "$package is already installed."
    else
      echo "$package not found. Installing..."
      sudo apt-get install -y "$package"
    fi
  fi
}

total_steps=9
current_step=1

# Step 1: Install dependencies
print_step $current_step "Installing dependencies..." $total_steps

if [ "$PACKAGE_MANAGER" = "pacman" ]; then
  dependencies=(tmux mpv xsel xclip npm python-pip ripgrep fd lsd neovim stow wget unzip starship)
elif [ "$PACKAGE_MANAGER" = "apt-get" ]; then
  dependencies=(tmux mpv xsel xclip npm python3-pip ripgrep fd-find stow wget unzip)
fi

for package in "${dependencies[@]}"; do
  check_and_install_package "$package"
done

# Special handling for fd-find on Ubuntu/Debian
if [ "$PACKAGE_MANAGER" = "apt-get" ]; then
  # Create symlink for fd
  if ! command -v fd &>/dev/null; then
    echo "Creating symlink for fd"
    sudo ln -s "$(which fdfind)" /usr/local/bin/fd
  fi
fi

# Step 2: Install lsd (for Ubuntu/Debian)
if [ "$PACKAGE_MANAGER" = "apt-get" ]; then
  current_step=$((current_step + 1))
  print_step $current_step "Installing lsd..." $total_steps
  if command -v lsd &>/dev/null; then
    echo "lsd is already installed."
  else
    echo "Installing lsd..."
    wget https://github.com/Peltoche/lsd/releases/download/0.23.1/lsd_0.23.1_amd64.deb -O /tmp/lsd.deb
    sudo dpkg -i /tmp/lsd.deb
    rm /tmp/lsd.deb
  fi
fi

# Step 3: Install Neovim 0.9
current_step=$((current_step + 1))
print_step $current_step "Installing Neovim unstable..." $total_steps
if [ "$PACKAGE_MANAGER" = "apt-get" ]; then
  sudo apt-get remove -y neovim
  sudo add-apt-repository ppa:neovim-ppa/unstable -y
  sudo apt-get update
  sudo apt-get install -y neovim
fi
# For pacman, Neovim should already be the latest version

# Step 4: Install Starship prompt
current_step=$((current_step + 1))
print_step $current_step "Installing Starship prompt..." $total_steps

if command -v starship &>/dev/null; then
  echo "Starship is already installed."
else
  if [ "$PACKAGE_MANAGER" = "pacman" ]; then
    # Starship was installed in dependencies
    echo "Starship installed via pacman."
  elif [ "$PACKAGE_MANAGER" = "apt-get" ]; then
    echo "Installing Starship via official install script..."
    curl -sS https://starship.rs/install.sh | sh -s -- --yes
  fi
fi

# Step 5: Install Python dependencies
current_step=$((current_step + 1))
print_step $current_step "Installing Python dependencies..." $total_steps

# Determine pip command
if command -v pip &>/dev/null; then
  PIP_CMD="pip"
elif command -v pip3 &>/dev/null; then
  PIP_CMD="pip3"
else
  echo "pip is not installed. Exiting."
  exit 1
fi

$PIP_CMD install pynvim --user

# Step 6: Check and install TPM
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

# Step 7: Create symlinks
current_step=$((current_step + 1))
print_step $current_step "Creating symlinks..." $total_steps
stow --adopt .

# Step 8: Check and install FiraCode Nerd Font
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
  wget -P "$font_dir" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip
  unzip "$font_dir/FiraCode.zip" -d "$font_dir"
  rm "$font_dir/FiraCode.zip"
  fc-cache -fv
  echo "$font_name has been installed!"
fi

# Step 9: Completion
current_step=$((current_step + 1))
print_step $current_step "Installation Complete!" $total_steps
echo -e "\e[1;32mAll steps completed successfully!\e[0m\n"
