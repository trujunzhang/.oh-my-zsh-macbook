nix.settings.substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
nix.settings.trusted-substituters = djzhang
programs.fish.enable = true;
  programs.fish.shellInit = ''
    for p in /run/current-system/sw/bin
      if not contains $p $fish_user_paths
        set -g fish_user_paths $p $fish_user_paths
      end
    end
  '';
