{ pkgs, user, ... }:
let
  username = user.username;
in
{
  users.users.${username} = {
    home = "/Users/${username}";
    shell = pkgs.zsh;
  };
}
