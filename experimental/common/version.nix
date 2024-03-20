{ self, ... }:
{
  # Git revision of the top-level flake from which this configuration was built
  system.configurationRevision = self.rev or self.dirtyRev;
}
