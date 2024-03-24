# Display an insult every time an incorrect password is entered
_final: prev:
{
  sudo = prev.sudo.override {
    withInsults = true;
  };
}
