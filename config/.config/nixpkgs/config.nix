{
  packageOverrides = super: let self = super.pkgs; in
  {
    hsEnv = self.haskell.packages.ghc865.ghcWithPackages
    (haskellPackages: with haskellPackages; [
      # libraries
      comonad hlint heap brittany hdevtools data-fix yesod yesod-bin brick vector lens linear
    ]);
    pyEnv = self.python3.withPackages
    (python-packages: with python-packages; [
      scikitlearn numpy matplotlib pandas pillow click pyfiglet
    ]);
  };
  allowBroken = true;
}
