{ config, pkgs, ... }:

{
  # ========== Netwoking Settings ==========
  networking.hostName = "freedom";
  networking.domain = ""; #snek.network";
  #networking.networkmanager.enable = true; # Not sure if I want to use this yet
  services.zerotierone.enable = true;
  services.zerotierone.joinNetworks = [
    "d5e5fb6537cdc092" # Personal network
  ];
  services.openssh.enable = true;
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
  environment.systemPackages = with pkgs; [
    git
    btop
    vim
  ];
  

  users.users.root.openssh.authorizedKeys.keys = [
            # change this to your ssh key
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCeMIin/OvSsnW3U6fNsp80tUDteI/EpmjRYz/a7vqcbikZ6t1VhTsPuldyLtUfJfuc0+3NzjwqlT28uL625mMFroiVCWZzgmfciJetSyi+WvCbOjYiOmVpzQBedHgFuRc9WeTlBYztsCSnttxH2PV479H1qS9A1npnqB5lTGT1jX8uc+JcmWI0JcsXlraagtqHSPFKcfbDlvHiZdpoy1+/xUahy/e09e2Pv6a0jxdslSrtEeJtNpA7YKRU2tgeHJiv1p7guPBnc7xXDT9wWsjxl5ZPPJA+mN6CxvPadOKJIv9qw2HXODGv7EqZcTKCKF911ghPmclumJb9NtwXpsSf Neuroflight"
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCoBsoFMZ2FlM0Tn7CXT3F81uzV2L7skfQrJ2x7WRC4m/Bl//sNJD1fWX5Qi+ez7PcMP1vXtOcdRxV+R12CgdLqm+pUPq/PM2eouvyUSn8iH2l0V5jeld+CNmYqLsWtYkjbWUb0YPNuj0fPpLBbgohiPGip12toaG48483kICwtljtO3W5Tf1QSo7OO6iTCeuUND6s/yocZudupEdkvyhoJQFU15zeFTKualWjSpimbcgiegorwMKH8+evDGF4CX70on8EVPFTZ4i1lQls56rMcyptOiSOpgfgdqsS7D2e7UWoh8a+cucHKsWWJUbS7nj50YGvdWSx3rpFmiehOo4BR bmabsout@bmabsout"
          ];

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 21 22 80 443 51820 ];
  networking.firewall.allowedUDPPorts = [ 21 22 80 443 51820 ];

  # ========== Boot Settings ==========
  nix.settings.system-features = [ "big-parallel" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 3;
  boot.loader.efi.canTouchEfiVariables = false;

  # Make it easier to recover via serial console in case something goes wrong.
  services.getty.autologinUser = "root";

  # ========== Misc Settings ==========
  system.stateVersion = "23.05";
  nixpkgs.config.allowUnfree = true;
  boot.cleanTmpDir = true;
  zramSwap.enable = true;
}

