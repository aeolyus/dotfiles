{
  services.logind = {
    lidSwitch = "suspend-then-hibernate";
    extraConfig = ''
      IdleAction=suspend-then-hibernate
      IdleActionSec=60m
    '';
  };
  systemd.sleep.extraConfig = ''
    HibernateDelaySec=2h
  '';
}
