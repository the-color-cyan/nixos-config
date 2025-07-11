# development related packages

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # editors
    vim
    neovim

    # version control
    git
    lazygit
    gh

    # C/C++
    gcc
    clang
    cmake

    # python
    python3
    python3Packages.pip
    python3Packages.virtualenv

    # javascript
    nodejs

    # rust
    rustc
    cargo
  ];
}
