_final: prev:
{
  gdb = prev.gdb.overrideAttrs (oldAttrs: {
    configureFlags = oldAttrs.configureFlags ++ [
      (prev.lib.enableFeature false "werror")
    ];
  });
}
