eval (/opt/homebrew/bin/brew shellenv)

alias nv nvim
alias c clear
alias ls lsd
alias .. "cd .."
alias lg lazygit
alias co "g++ -std=c++23 -O2 -Wall a.cpp -o a"
alias t tmux
alias ta "tmux attach-session"
alias td "tmux detach"
alias sz "source ~/.config/fish/config.fish"
alias ez "nvim ~/.config/fish/config.fish"
alias gs "git status"

function mkcd
    mkdir -p $argv; and cd $argv[-1]
end

function tn
    tmux new -s (basename (pwd))
end

function y
    set -l tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set -l cwd (cat -- "$tmp"); and test -n "$cwd"; and test "$cwd" != "$PWD"
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

set -U fish_greeting
starship init fish | source
zoxide init fish | source
atuin init fish --disable-up-arrow | source
set -U fish_key_bindings fish_vi_key_bindings
set -Ux EDITOR nvim

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
