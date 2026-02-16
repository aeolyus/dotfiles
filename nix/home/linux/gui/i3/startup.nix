{ lib, pkgs, ... }:
let
  autorandr = "${pkgs.autorandr}/bin/autorandr";
  xinput = "${pkgs.xinput}/bin/xinput";
  setxkbmap = "${pkgs.setxkbmap}/bin/setxkbmap";
in
{
  xsession.windowManager.i3.config.startup = [
    { command = "${autorandr} --change"; always = true; notification = false; }
    {
      command = "systemctl --user restart polybar";
      always = true;
      notification = false;
    }
    # Swap left control and caps lock for native keyboards
    {
      command = lib.concatStringsSep " " ([
        "$(${xinput}"
        "| sed -nE 's/.*?Virtual core XTEST keyboard.*?id=([0-9]+).*?/\1/p'"
        "| xargs -I {} ${setxkbmap} -device {} -option ctrl:swapcaps"
      ]);
      always = true;
      notification = false;
    }
  ];
}
