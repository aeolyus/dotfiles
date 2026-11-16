{ pkgs, ... }:
{
  home.packages = with pkgs; [
    exfatprogs # exFAT filesystem userspace utilities
  ];
}
