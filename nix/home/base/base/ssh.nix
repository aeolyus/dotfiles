{
  programs.ssh.matchBlocks."*" = {
    enable = true;
    addKeysToAgent = "1h";
    includes = [ "config.d/*" ];
  };
}
