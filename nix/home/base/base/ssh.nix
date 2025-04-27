{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "1h";
    includes = [ "config.d/*" ];
  };
}
