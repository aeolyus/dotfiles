{ pkgs, ... }:
let
  feh = "${pkgs.feh}/bin/feh";
  wallpaper = builtins.fetchurl {
    url = "https://aeoly.us/s/dwp.underwater-nord.png";
    sha256 =
      "55ec7fea61e4835f823588d79f67a6a7a40b7024306493cce86f8feb811c7934";
  };
in
{
  xsession.windowManager.i3.config.startup = [
    {
      command = "${feh} --bg-fill --no-fehbg ${wallpaper}";
      always = true;
      notification = false;
    }
  ];
}
