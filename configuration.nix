{ config, pkgs, ... }:

{
  # ========== Netwoking Settings ==========
  networking.hostName = "pompe";
  networking.domain = ""; #snek.network";
  #networking.networkmanager.enable = true; # Not sure if I want to use this yet
  #services.zerotierone.enable = true;
  #services.zerotierone.joinNetworks = [
  #  "159924d6302966a9" # Personal network
  #];
  services.openssh.enable = true;
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  users.users.root.openssh.authorizedKeys.keys = [
            # change this to your ssh key
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCeMIin/OvSsnW3U6fNsp80tUDteI/EpmjRYz/a7vqcbikZ6t1VhTsPuldyLtUfJfuc0+3NzjwqlT28uL625mMFroiVCWZzgmfciJetSyi+WvCbOjYiOmVpzQBedHgFuRc9WeTlBYztsCSnttxH2PV479H1qS9A1npnqB5lTGT1jX8uc+JcmWI0JcsXlraagtqHSPFKcfbDlvHiZdpoy1+/xUahy/e09e2Pv6a0jxdslSrtEeJtNpA7YKRU2tgeHJiv1p7guPBnc7xXDT9wWsjxl5ZPPJA+mN6CxvPadOKJIv9qw2HXODGv7EqZcTKCKF911ghPmclumJb9NtwXpsSf Neuroflight"
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCoBsoFMZ2FlM0Tn7CXT3F81uzV2L7skfQrJ2x7WRC4m/Bl//sNJD1fWX5Qi+ez7PcMP1vXtOcdRxV+R12CgdLqm+pUPq/PM2eouvyUSn8iH2l0V5jeld+CNmYqLsWtYkjbWUb0YPNuj0fPpLBbgohiPGip12toaG48483kICwtljtO3W5Tf1QSo7OO6iTCeuUND6s/yocZudupEdkvyhoJQFU15zeFTKualWjSpimbcgiegorwMKH8+evDGF4CX70on8EVPFTZ4i1lQls56rMcyptOiSOpgfgdqsS7D2e7UWoh8a+cucHKsWWJUbS7nj50YGvdWSx3rpFmiehOo4BR bmabsout@bmabsout"
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC23+4nxncBC7Z8yE5Oa5pM6RX1TinH1/S8s2rTfj9JtAwxuUv2KAR9RZKrKat/oJnEryOBqtEKYghYH7OqmMv2KsZl7nosc/6MtFO6HHrNvkcBmmsTe/JlL2dhCB4gVMNZlmrbJhVdrUMkqncTAig2e72TjX18KhBwx7LIkwhsfHM/QOhNiNv34ju7bfvhY/4DIK6UaS60QLOpLpumrxDYAG8gLFW9yyqlvd8f/eokR4AOjI1Elc6MgtJD8aFNN5XR1vOejope3QNEKKiN2yhcDxrjIeQzw+3OXXa/4XoNLWHThmXNY426GuQDNazZF2mYoPxrTYmv5XXWOS2rU5oKgqelta89AKFK5m4BysR3d4cYY2BwXjiEEZuko81I/tuvYX4iKIfMQ54hYVimTy6sKk1kanJdk77iHU/t+DCTTEGyV9jgo2oRBE+OxNWqGx93UpTxqaqLVkex7Sz8jJe9q4mxuJN6laplumbfPmHeg8BQmifE4S7hbVIz2A1OuqE= ubuntu@freedom"
          ];

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 21 22 80 443 ];
  networking.firewall.allowedUDPPorts = [ 21 22 80 443 ];

  # ========== Boot Settings ==========
  boot.loader.grub.enable = true;

  # ========== Misc Settings ==========
  system.stateVersion = "23.05";
  nixpkgs.config.allowUnfree = true;
  boot.cleanTmpDir = true;
  zramSwap.enable = true;
}

