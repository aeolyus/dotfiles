# Use tmux 3.4 as 3.5 introduces urxvt crashes when activating fzf
_final: prev:
{
  tmux = prev.tmux.overrideAttrs (prevAttrs: rec {
    version = "3.4";
    src = prevAttrs.src.override {
      rev = version;
      hash = "sha256-RX3RZ0Mcyda7C7im1r4QgUxTnp95nfpGgQ2HRxr0s64=";
    };
  });
}
