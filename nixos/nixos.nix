###############################################################################
# Benjamin's
# NixOS Configuration
###############################################################################
{ pkgs, ... }:
let
  username = "benjamin";
in
{
  imports = [
    # Generated
    /etc/nixos/hardware-configuration.nix
    # Custom
    ./system.nix
    ./network.nix
    ./nvidia.nix
    ./audio.nix
    ./services.nix
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      # Development
      nodejs
      bun
      rustc
      go
      cargo
      python3
      # Music
      playerctl
      cava
      spotify
      # Git
      git
      gh
      # Neovim
      neovim
      lazygit
      ripgrep
      xclip
      fzf
      nixfmt-rfc-style
      # Apps
      firefox
      discord
      betterdiscordctl
      caprine-bin
    ];
  };

  home-manager = {
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      # inherit inputs;
    };
    users.${username} = {
      home.username = username;
      home.homeDirectory = "/home/${username}";
      imports = [ ./home.nix ];
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # System
    gcc
    cmake
    sass
    unzip
    ffmpeg
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    inotify-tools
    killall
    brightnessctl
    fd
    btop
    neofetch
    # Hyprland
    hyprcursor
    ags
    waybar
    swaynotificationcenter
    swww
    pywal
    kitty
    rofi
    emote
    # Screenshots
    grim
    slurp
    swappy
  ];

  programs.zsh.enable = true;
  programs.starship.enable = true;
  fonts.packages = with pkgs; [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}
