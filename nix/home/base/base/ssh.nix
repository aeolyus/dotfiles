{
  programs.ssh = {
    enable = true;
    includes = [ "config.d/*" ];
    enableDefaultConfig = false;
    matchBlocks."*" = {
      addKeysToAgent = "1h";
    };
  };
}
