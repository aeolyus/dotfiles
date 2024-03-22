{
  services.ssh-agent.enable = true;
  programs.ssh.addKeysToAgent = "yes";
}
