{ user, ... }:
{
  virtualisation.virtualbox = {
    host.enable = true;
  };
  users.extraGroups.vboxusers.members = [ user.username ];
}
