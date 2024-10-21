# Turn on support for i3 and pulseaudio
_final: prev:
{
  git-branchless = prev.git-branchless.override (old: {
    rustPlatform = old.rustPlatform // {
      buildRustPackage = args: old.rustPlatform.buildRustPackage (args // {
        # Note that upstream has disabled CI tests for git>=2.46
        # See: https://github.com/arxanas/git-branchless/issues/1416
        #      https://github.com/arxanas/git-branchless/pull/1417
        # To be re-enabled once arxanas/git-branchless#1416 is resolved
        doCheck = false;
      });
    };
  });
}
