{
  programs.ssh = {
    enable = true;
    addKeysToAgent = true;
    includes = "config.d/*";
  };
}
