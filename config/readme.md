# kitty:

url = https://github.com/koekeishiya/dotfiles

## kitty-theme

https://github.com/dexpota/kitty-themes

# mpv

url = https://github.com/Argon-/mpv-config with gitmodules
url = https://github.com/Eisa01/mpv-scripts

# qutebrowser

url = https://github.com/juliusHuelsmann/Config
fold = .config/qutebrowser

# tmux

url = https://github.com/koekeishiya/dotfiles

## tmux plugins

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## neovim

https://github.com/craftzdog/dotfiles-public
dotfiles-public/.config/nvim

#### tailwindcss-language-server

https://elijahmanor.com/blog/neovim-tailwindcss
$LspInstall tailwindcss

# lunarvim(lvim-adibhanna)

url = https://github.com/adibhanna/lvim-config

# lunarvim(lvim-abzcoding)(error???)

url = https://github.com/abzcoding/lvim

# lunarvim(lvim-ChristianChiarulli)

url = https://github.com/ChristianChiarulli/lvim

# nvim-BrunoKrugel(NvChad)

url = https://github.com/BrunoKrugel/dotfiles

# nvim-wSedlacek(NvChad)

url = https://github.com/wSedlacek/nvim

# nvim-2kabhishek

url = https://github.com/2KAbhishek/nvim2k

# nvim-nikolovlazar

url = https://github.com/nikolovlazar/dotfiles

# nvim-kohane27

url = https://github.com/kohane27/nvim-config

# neovim-linkarzu

url = https://github.com/linkarzu/dotfiles-latest/neovim/neobean
url = https://github.com/linkarzu/dotfiles-latest/tree/main/neovim/neobean

# karabiner

url = https://github.com/mxstbr/karabiner

## snippet

git clone https://github.com/dsznajder/vscode-es7-javascript-react-snippets config/lvim/snippets

## clash pro

# 用于DNS服务器和连接建立的静态主机 (如/etc/hosts) .

#

# 支持通配符主机名 (例如 _.clash.dev, _.foo.\*.example.com)

# 非通配符域名优先级高于通配符域名

# 例如 foo.example.com > \*.example.com > .example.com

# P.S. +.foo.com 等于 .foo.com 和 foo.com

hosts:
"dev.new.ieatta.com": 127.0.0.1

## gui for clash

rulesConfig: - id: ID_8gppggmr
type: DOMAIN-SUFFIX
payload: dev.new.ieatta.com
proxy: DIRECT
no-resolve: false
ruleset-type: file
ruleset-name: ""
ruleset-behavior: domain
ruleset-format: mrs
ruleset-proxy: ""

rules:

- DOMAIN-SUFFIX,dev.new.ieatta.com,DIRECT
