> [!common]
> unzip common apps to '/Applications'

```bash
unzip -o "/Volumes/MacGame/MacCache/apps/Applications/*.zip" -d /Applications
```

> [!vpn]
> unzip vpn apps to '/Applications'

```bash
unzip -o "/Volumes/MacGame/MacCache/apps/v2ray/*.zip" -d /Applications
```

> [!goto 'oh-my-zsh-macbook']

```bash
cd "/Volumes/MacUser/djzhang/Documents/Organizations/TRUJUNZHANG/_oh-my-zsh-macbook"
```

> [!install nix-darwin]

```bash
cd "/Volumes/MacUser/djzhang/Documents/Organizations/TRUJUNZHANG/_oh-my-zsh-macbook/config/nix-darwin/universal" && darwin-rebuild switch --option http2 false  --flake .
```
