{ ... }:

{
  programs.git = {
    enable = true;
    userEmail = "ayushdevel1325@gmail.com";
    userName = "Ayush Singh";
    extraConfig = {
      commit.gpgsign = true;
      user.signingKey = "05CEF5C789E55A74";
      format.signoff = true;
    };
  };
}
