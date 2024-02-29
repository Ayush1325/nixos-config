{ config, ... }:

{
  # programs.thunderbird = {
  #   enable = true;
  #   profiles = {
  #     "ayush" = {
  #       isDefault = true;
  #     };
  #   };
  # };

  programs.aerc = {
    enable = true;
    extraConfig.general.unsafe-accounts-conf = true;
  };

  accounts.email.accounts = {
    "Personal" = {
      realName = "Ayush Singh";
      address = "ayushsingh1325@gmail.com";
      userName = "ayushsingh1325@gmail.com";
      primary = true;
      imap = {
        host = "imap.gmail.com";
        port = 993;
        tls.enable = true;
      };
      smtp = {
        host = "smtp.gmail.com";
        port = 465;
        tls.enable = true;
      };
      passwordCommand = "cat /run/secrets/mail/personal";
      aerc.enable = true;
    };
    "Development" = {
      realName = "Ayush Singh";
      address = "ayushdevel1325@gmail.com";
      userName = "ayushdevel1325@gmail.com";
      imap = {
        host = "imap.gmail.com";
        port = 993;
        tls.enable = true;
      };
      smtp = {
        host = "smtp.gmail.com";
        port = 465;
        tls.enable = true;
      };
      passwordCommand = "cat /run/secrets/mail/devel";
      aerc.enable = true;
    };
    "College" = {
      realName = "Ayush Singh";
      address = "20je0239@am.iitism.ac.in";
      userName = "20je0239@am.iitism.ac.in";
      imap = {
        host = "imap.gmail.com";
        port = 993;
        tls.enable = true;
      };
      smtp = {
        host = "smtp.gmail.com";
        port = 465;
        tls.enable = true;
      };
      passwordCommand = "cat /run/secrets/mail/college";
      aerc.enable = true;
    };
  };
}
