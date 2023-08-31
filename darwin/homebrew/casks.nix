{ lib, ... }:

let
  greedyAttrSet = { greedy = true; };
  applicationFolderAttrSet = { args = { appdir = "/Applications"; }; };
  makeGreedy = package:
  (
    if lib.isAttrs package
    then package
    else { name = package; }
  ) // greedyAttrSet;
  makeApplicationFolderInstall = package:
  (
    if lib.isAttrs package
    then package
    else { name = package; }
  ) // applicationFolderAttrSet;
  greedyPackages = [
    "1password-cli"
    "bambu-studio"
    "calibre"
    "wezterm"
  ];
  applicationFolderPackages = [
    "1password"
    "tailscale"
  ];
in
{
  greedy = map makeGreedy greedyPackages;
  applicationsFolderInstall = map makeApplicationFolderInstall applicationFolderPackages;
}