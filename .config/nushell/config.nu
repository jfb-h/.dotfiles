# config.nu
#
# Installed by:
# version = "0.102.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

# EDITOR

$env.config.buffer_editor = "hx"

# PATH

$env.PATH = ($env.PATH | split row (char esep) | append "/home/jakob/.pixi/bin")

# ALIASES and CUSTOM FUNCTIONS

def tl [] {
    tmux ls
}

def ts [name] {
    tmux switch -t $name
}

def tn [name] {
    tmux new -s $name
}

def ta [name] {
    tmux attach -t $name
}

def sumatra [file] {
    /mnt/c/Users/ra47mix/AppData/Local/SumatraPDF/SumatraPDF.exe $file
}

alias mv = mv -i
alias ll = eza --sort type --tree --git-ignore

source ~/.zoxide.nu

# use ~/.cache/starship/init.nu
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
