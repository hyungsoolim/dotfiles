# ==========================================
# 1. Environment Variables & PATH (가장 먼저!)
# ==========================================

# Go
export PATH=$PATH:$HOME/go/bin

# Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Bat (Better cat) theme
export BAT_THEME=catppuccin-mocha

# Starship config path
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Tmux config
export TMUX_CONF="$HOME/.config/tmux/tmux.conf"

# Direnv log silence
export DIRENV_LOG_FORMAT=""

# ==========================================
# 2. Fpath & Completion Init (순서 중요!)
# ==========================================

# Docker CLI completions
# (반드시 compinit보다 위에 있어야 함)
fpath=($HOME/.docker/completions $fpath)

# Initialize completion
autoload -Uz compinit
# save cache files to this directory
# if there's no such dir, you have to make it
compinit -d "$HOME/.cache/zsh/zcompdump"

# ==========================================
# 3. Tool Initializations
# ==========================================

# Starship
eval "$(starship init zsh)"

# Zoxide (Better cd)
eval "$(zoxide init zsh)"
alias cd="z"

# Direnv
eval "$(direnv hook zsh)"

# Pixi
eval "$(pixi completion --shell zsh)"

# FNM (Fast Node Manager)
eval "$(fnm env --use-on-cd --shell zsh)"

# ==========================================
# 4. Aliases
# ==========================================

# Eza (Better ls)
alias ls="eza --color=always --long --git --icons=always --classify=always --header"
alias ll="eza --color=always --long --git --icons=always --classify=always --header --all"
alias lt="eza --tree --color=always --long --git --icons=always --classify=always --header"

# Tmux
alias tmux="tmux -f $TMUX_CONF"

# Lazy tools
alias lg="lazygit"
alias lzd="lazydocker"

# ==========================================
# 5. Functions & Advanced Configs
# ==========================================

# ----- Yazi Wrapper -----
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# ----- FZF Configuration -----
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# FZF Color Theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

# Use fd instead of find
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix"

# FZF Completion Generators
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# FZF Preview Options
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced FZF Run
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                  "$@" ;;
    *)            fzf --preview 'bat -n --color=always --line-range :500 {}' "$@" ;;
  esac
}

# ==========================================
# 6. Zsh Plugins (하단 배치 권장)
# ==========================================

# zsh-autosuggestions (요청하신 대로 원복)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting (이건 autosuggestions보다 뒤에 있는 게 좋습니다)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ==========================================
# 7. SDKMAN (Must be at the very end)
# ==========================================
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
