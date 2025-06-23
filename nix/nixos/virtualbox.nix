{ user, ... }:
{
  virtualisation.virtualbox = {
    host.enable = true;
    # Guest Extensions optimize the guest OS for better perf and usability
    guest.enable = true;
  };
  users.extraGroups.vboxusers.members = [ user.username ];
}
