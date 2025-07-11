{ config, pkgs, lib, ... }:

{
  imports = [
    "${
      builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }
    }/dell/xps/15-7590/nvidia"
  ];

  # disable systemd-backlight service so it stops grieting my brightness when I use dpms
  systemd.services."systemd-backlight@backlight:intel_backlight".enable = false;

  hardware.graphics = { enable = true; };

  # nvidia driver for wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;

    open = true;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
