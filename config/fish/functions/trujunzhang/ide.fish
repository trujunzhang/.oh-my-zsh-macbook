# homebrew
# brew services start d12frosted/emacs-plus/emacs-plus@30
function binstall-emacs
    if not test -d "$HOMEBREW_HOME/opt/emacs-plus@30"
        brew tap d12frosted/emacs-plus
        brew install emacs-plus@30 --with-spacemacs-icon --with-native-comp
        brew link emacs-plus@30
    end
    if not test -d "/Applications/Emacs.app"
        ln -s $HOMEBREW_HOME/opt/emacs-plus@30/Emacs.app /Applications
    end
end

# macvim
# alias gvim='$ORGANIZATIONS_HOME/__APPLICATIONS/IDES/MacVim.app/Contents/MacOS/Vim -g'

# neovim
alias neovimcheck="nvim +checkhealth"
alias neovimplugininstall="nvim +PlugInstall"

# lunarvim
alias lvimUpdateReset="lvim +LvimUpdate +LvimCacheReset +q"
alias wrmvimsession="rm -rf $HOME/.local/share/nvim/sessions"

# chemacs2
# https://github.com/plexus/chemacs2
alias emacsdoom="emacs --with-profile=doom"
alias emacsspace="emacs --with-profile=spacemacs"
alias etspace="echo spacemacs >~/.emacs-profile"
alias etdoom="echo doom >~/.emacs-profile"
alias edoominstall="$ORGANIZATIONS_HOME/IDES/emacs-shim/doom-emacs/bin/doom install"
alias edoomsync="$ORGANIZATIONS_HOME/IDES/emacs-shim/doom-emacs/bin/doom sync"
alias edoomdoctor="$ORGANIZATIONS_HOME/IDES/emacs-shim/doom-emacs/bin/doom doctor"

function killvim
    kill $(ps aux | grep 'neovim' | awk '{print $2}')
end

#nvim
alias wclean_cache_homebrew="rm -rf $HOME/Library/Caches/Homebrew"
alias wclean_cache_webstorm="rm -rf $HOME/Library/Caches/JetBrains"
alias wclean_lvimCache="rm -rf $HOME/.cache/lvim && rm -rf $HOME/.local/state/lvim && rm -rf $HOME/.local/share/lvim && rm -rf $HOME/.local/share/lunarvim/lazy && rm -rf $HOME/.local/share/lunarvim/site"
alias wclean_nvimCache="rm -rf $HOME/.cache/nvim && rm -rf $HOME/.local/state/nvim && rm -rf $HOME/.local/share/nvim"
alias wclean_nvchad-cache_Starter="rm -rf $HOME/.cache/nvchad-Starter && rm -rf $HOME/.local/state/nvchad-Starter && rm -rf $HOME/.local/share/nvchad-Starter"
alias wclean_nvchad-cache_Backup="rm -rf $HOME/.cache/nvchad-Backup && rm -rf $HOME/.local/state/nvchad-Backup && rm -rf $HOME/.local/share/nvchad-Backup"
alias wclean_nvchad-cache_linkarzu="rm -rf $HOME/.cache/neovim-linkarzu && rm -rf $HOME/.local/state/neovim-linkarzu && rm -rf $HOME/.local/share/neovim-linkarzu"
alias wclean_nvchad-cache_wSedlacek="rm -rf $HOME/.cache/nvchad-wSedlacek && rm -rf $HOME/.local/state/nvchad-wSedlacek && rm -rf $HOME/.local/share/nvchad-wSedlacek"
alias wclean_nvchad-cache_mgastonportillo="rm -rf $HOME/.cache/nvchad-mgastonportillo && rm -rf $HOME/.local/state/nvchad-mgastonportillo && rm -rf $HOME/.local/share/nvchad-mgastonportillo"
alias wclean_nvchad-cache_Alexis12119="rm -rf $HOME/.cache/nvchad-Alexis12119 && rm -rf $HOME/.local/state/nvchad-Alexis12119 && rm -rf $HOME/.local/share/nvchad-Alexis12119"
alias wclean_nvim-cache_2kabhishek="rm -rf $HOME/.cache/nvim-2kabhishek && rm -rf $HOME/.local/state/nvim-2kabhishek && rm -rf $HOME/.local/share/nvim-2kabhishek"
alias wclean_nvim-cache_craftzdog="rm -rf $HOME/.cache/nvim-craftzdog && rm -rf $HOME/.local/state/nvim-craftzdog && rm -rf $HOME/.local/share/nvim-craftzdog"
alias wclean_all_nvim_cache="wclean_nvimCache && wclean_nvim-cache_2kabhishek && wclean_nvim-cache_craftzdog && wclean_nvchad-cache_wSedlacek && wclean_nvchad-cache_mgastonportillo && wclean_nvchad-cache_Alexis12119"

# neovim
alias l="lvim"
# alias n="nvim"
alias vsc="code ."

# Switching Configs in Neovim
# see: https://michaeluloth.com/neovim-switch-configs/
# UpdateRemotePlugins

alias NVIM_APPNAME='nvim-lazyvim nvim'
alias vd='nvim' # default Neovim config
alias vz='NVIM_APPNAME=nvim-lazyvim nvim' # LazyVim
alias vc='NVIM_APPNAME=nvim-nvchad nvim' # NvChad
alias vk='NVIM_APPNAME=nvim-kickstart nvim' # Kickstart
alias va='NVIM_APPNAME=nvim-astrovim nvim' # AstroVim
alias w='NVIM_APPNAME=nvchad-wSedlacek nvim' # NvChad
alias m='NVIM_APPNAME=nvchad-mgastonportillo nvim' # NvChad
alias a='NVIM_APPNAME=nvchad-Alexis12119 nvim' # NvChad
alias nv='NVIM_APPNAME=nvim-2kabhishek nvim' # Standard neovim
alias c='NVIM_APPNAME=nvim-craftzdog nvim' # Standard neovim
alias vs='NVIM_APPNAME=nvchad-Starter nvim' # Standard neovim
alias vb='NVIM_APPNAME=nvchad-Backup nvim' # Standard neovim
alias b='NVIM_APPNAME=neovim-linkarzu nvim' # Standard neovim
# alias s='NVIM_APPNAME=neovim-linkarzu nvim' # Standard neovim

alias uw='NVIM_APPNAME=nvchad-wSedlacek neovide' # NvChad
alias un='NVIM_APPNAME=nvim-2kabhishek neovide' # Standard neovim
alias uc='NVIM_APPNAME=nvim-craftzdog neovide' # Standard neovim
alias us='NVIM_APPNAME=nvchad-Starter neovide' # Standard neovim
alias ucb='NVIM_APPNAME=nvchad-Backup neovide' # Standard neovim
alias ub='NVIM_APPNAME=nvchad-linkarzu neovide' # Standard neovim

# Emacs
# alias emacs='open -a $ORGANIZATIONS_HOME/__APPLICATIONS/IDES/Emacs.app $1'
alias emacsd="emacs -debug-init"
alias e="emacs -nw --with-profile doom"
alias s="emacs -nw --with-profile spacemacs"
