# pompe_server

nix run github:numtide/nixos-anywhere#nixos-anywhere -- \                                                                                                       
   --debug \
   --kexec "$(nix build --print-out-paths github:nix-community/nixos-images#packages.aarch64-linux.kexec-installer-nixos-unstable)/nixos-kexec-installer-aarch64-linux.tar.gz" \
   --flake '.#pompe' \
     root@10.239.105.162
