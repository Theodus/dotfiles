{ config, lib, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];
  system.stateVersion = "23.05";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  networking.hostName = "geoff";
  # networking.wireless.enable = true;

  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 1024 * 4;
  } ];

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.budgie.enable = true;
  services.xserver.xkb.layout = "us";

  services.printing.enable = false;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  virtualisation.docker.enable = true;

  users.users.theodus = {
    isNormalUser = true;
    description = "theodus";
    extraGroups = [ "docker" "networkmanager" "wheel" ];
  };

  nix.settings.experimental-features = [ "flakes" "nix-command" ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "obsidian"
  ];
  environment.systemPackages = with pkgs; [
    alacritty
    brave
    bottom
    clang
    cmake
    fnm
    git
    julia-mono
    lld
    neovim
    obsidian
    openssl
    ripgrep
    rustup
    stow
    tmux
    tree
    unixtools.xxd
    vscodium
    zsh
  ];
  environment.budgie.excludePackages = with pkgs; [
    mate.atril
    mate.mate-calc
    mate.mate-terminal
    mate.pluma
    vlc
  ];
}
