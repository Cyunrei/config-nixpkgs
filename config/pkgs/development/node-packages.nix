{ config, pkgs, ... }:


{
  home = {
    file = {
      ".npmrc".text = ''
        registry=https://registry.npm.taobao.org

        # Fix cannot install package globally with npm
        # See https://www.reddit.com/r/NixOS/comments/8cnm50/cannot_install_package_globally_with_npm/
        prefix=~/.node_modules
      '';
    };
    packages = with pkgs; [
      nodePackages.npm
    ];
    sessionPath = [ "$HOME/.node_modules/bin/" ];
  };

}
