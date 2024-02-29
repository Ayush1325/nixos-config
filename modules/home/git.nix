{ ... }:

{
  programs.git = {
    enable = true;
    userEmail = "ayushdevel1325@gmail.com";
    userName = "Ayush Singh";
    signing = {
      key = "05CEF5C789E55A74";
      signByDefault = true;
    };
    extraConfig = {
      format.signoff = true;
    };
  };
}
