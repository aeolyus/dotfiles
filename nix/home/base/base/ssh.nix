{
  programs.ssh = {
    enable = true;
    includes = [ "config.d/*" ];
    matchBlocks."*" = {
      addKeysToAgent = "1h";
    };
  };
}
