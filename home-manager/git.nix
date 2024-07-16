{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Benjamin Palko";
    userEmail = "Benjaminpalko@hotmail.com";
  };
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
