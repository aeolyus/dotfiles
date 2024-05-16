# Turn on support for i3 and pulseaudio
_final: prev:
{
  polybar = prev.polybar.override {
    i3Support = true;
    pulseSupport = true;
  };
}
