{
  # Symlink the current nvim configs
  # TODO: Look into potentially nixifying nvim or using nixvim
  xdg.configFile.nvim = {
    recursive = true;
    source = ../../../../nvim/.config/nvim;
  };
}

