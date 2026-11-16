{
  programs.ssh = {
    enable = true;
    includes = [ "config.d/*" ];
    settings."*" = {
      AddKeysToAgent = "1h";
    };
  };
}
