# Revert to version 9.30 as the latest version 9.31 has some bugs. Will
# wait for version 9.32 to hopefully fix them.
# - Half screen bug: https://bugs.archlinux.org/task/77062
# - Incorrect OSC color escaping: https://github.com/tmux/tmux/issues/3852
_final: prev:
{
  rxvt-unicode-unwrapped = prev.rxvt-unicode-unwrapped.overrideAttrs {
    src = prev.fetchurl {
      url = ("http://dist.schmorp.de/rxvt-unicode/Attic/"
        + "rxvt-unicode-9.30.tar.bz2"
      );
      sha256 = "0badnkjsn3zps24r5iggj8k5v4f00npc77wqg92pcn1q5z8r677y";
    };
  };
}
