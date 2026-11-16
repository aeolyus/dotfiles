{
  services.logind = {
    settings.Login = {
      HandleLidSwitch = "suspend-then-hibernate";
      IdleAction = "suspend-then-hibernate";
      IdleActionSec = "60m";
    };
  };
  systemd.sleep.settings.Sleep = {
    HibernateDelaySec = "2h";
  };
}
