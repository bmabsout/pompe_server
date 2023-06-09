{config, pkgs, ...}:
let
  ext = "enp0s6";
  int = "wg0";
  ip = "10.10.0.1/24"; 
in
{ 
  networking.nat.enable = true;
  networking.nat.externalInterface = ext;
  networking.nat.internalInterfaces = [ int ];
 # networking.firewall = {
 #   allowedUDPPorts = [ 51820 ];
 # };
  networking.firewall.enable = false;
  services.dnsmasq = {
      enable = true;
      settings.interface= int;
  };

  networking.wireguard.interfaces."${int}" = {
      # Determines the IP address and subnet of the server's end of the tunnel interface.
      ips = [ ip ];

      # The port that WireGuard listens to. Must be accessible by the client.
      listenPort = 51820;

      # This allows the wireguard server to route your traffic to the internet and hence be like a VPN
      # For this to work you have to set the dnsserver IP of your router (or dnsserver of choice) in your clients
      postSetup = ''
        ${pkgs.iptables}/bin/iptables -A FORWARD -i %i -j ACCEPT
        ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s ${ip} -o ${ext} -j MASQUERADE
      '';

      # This undoes the above command
      postShutdown = ''
        ${pkgs.iptables}/bin/iptables -D FORWARD -i %i -j ACCEPT
        ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s ${ip} -o ${ext} -j MASQUERADE
      '';

      # Path to the private key file.
      #
      # Note: The private key can also be included inline via the privateKey option,
      # but this makes the private key world-readable; thus, using privateKeyFile is
      # recommended.
      privateKeyFile = "/root/wireguard-keys/private";

      peers = [
        # List of allowed peers.
        { # pixelle
          # Public key of the peer (not a file path).
          publicKey = "70HwuXFEvHu37SuN7NinJNGmfr4smHT/TFlmZLAQo04=";
          # List of IPs assigned to this peer within the tunnel subnet. Used to configure routing.
          allowedIPs = [ "10.10.0.2/32" ];
        }
        { # mama iphone
          # Public key of the peer (not a file path).
          publicKey = "Xx8ypse+GNtwKnfnf1jji5z+AqBbCgDgrINpyfuCrwo=";
          # List of IPs assigned to this peer within the tunnel subnet. Used to configure routing.
          allowedIPs = [ "10.10.0.3/32" ];
        }
      ];
  };
}
