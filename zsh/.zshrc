# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
# plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/vim"

name mkcd()
{
  mkdir -p "$@" && cd "$_";
}
alias nv="nvim"
alias c="clear"
alias ls="lsd"
alias ..="cd .."
alias lg="lazygit"
alias co="g++ -std=c++20 -O2 -Wall a.cpp -o a"
alias checklinux='for i in 1 2 3 4 5 6 7; do echo -n "linux$i: "; ssh sabinoc@linux$i.cs.uchicago.edu uptime; done'
alias t="tmux"
alias ta="tmux attach-session"
alias td="tmux det"
alias nk='NVIM_APPNAME=kickstart-nvim nvim' # Kickstart
alias nl='NVIM_APPNAME=lazy_nvim nvim'
alias sz='source ~/.zshrc'
alias ez='nv ~/.zshrc'

# alias tn="tmux new -s (pwd | sed 's/.*\///g')"
# alias mkcd='mkdir -p "$1" && cd "$1"'
tn() { tmux new -s "$(pwd | sed 's/.*\///g')"; }
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"



export PATH="/Users/charliesabino/.local/bin:$PATH"

# Load and initialise completion system
autoload -Uz compinit
compinit
export PATH="/opt/homebrew/opt/protobuf@21/bin:$PATH"
export PATH="/opt/homebrew/opt/protobuf@21/bin:$PATH"

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh --disable-up-arrow)"

if [ -f ~/.env ]; then
  source ~/.env
fi
