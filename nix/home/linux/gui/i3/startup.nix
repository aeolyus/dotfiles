{ pkgs, ... }:
let
  autorandr = "${pkgs.autorandr}/bin/autorandr";
in
{
  xsession.windowManager.i3.config.startup = [
    { command = "${autorandr} --change"; always = true; notification = false; }
  ];
}
