default:
    @just --list -u

setup-system: install-basics setup-dotfiles install-cargo install-tools install-tmux install-github install-editors install-languages

install-basics:
    sudo apt install curl
    sudo apt install wget
    sudo apt install stow
    sudo apt install git

setup-dotfiles:
    # git clone https://github.com/jfb-h/.dotfiles ~/.dotfiles
    stow .
    
install-cargo: install-basics
    sudo apt-get -y install build-essential
    sudo apt-get -y install pkg-config
    sudo apt-get -y install openssl
    sudo apt-get -y install libssl-dev
    sudo apt-get -y install cmake
    curl https://sh.rustup.rs -sSf | sh -s -- -y

install-tools: install-cargo
    curl -sS https://starship.rs/install.sh | sh -s -- -y
    sudo apt-get -y install unzip
    sudo apt install fzf
    cargo install nu --locked
    cargo install zoxide --locked
    cargo install ripgrep
    cargo install bat
    cargo install eza
    cargo install --git https://github.com/astral-sh/uv uv
    curl -fsSL https://pixi.sh/install.sh | bash

install-tmux:
    sudo apt-get install tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    #tmux source ~/.tmux.conf

install-github:
    pixi global install gh --channel conda-forge

install-editors:
    sudo apt-get install neovim
    sudo snap install helix --classic

install-languages:
    curl https://install.duckdb.org | sh
    curl -fsSL https://install.julialang.org | sh -s -- -y
    pixi global install cmdstan
    curl -Ls https://github.com/r-lib/rig/releases/download/latest/rig-linux-$(arch)-latest.tar.gz | `which sudo` tar xz -C /usr/local

