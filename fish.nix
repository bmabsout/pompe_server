{ pkgs, ...}:
{environment.systemPackages = with pkgs; [
  fishPlugins.done
  fishPlugins.fzf-fish
  fishPlugins.forgit
  fishPlugins.hydro
  fzf
  fishPlugins.grc
  grc
];

users.defaultUserShell = pkgs.fish;
programs.fish.enable = true;
programs.starship.enable = true;
}
