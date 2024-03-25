{ pkgs, ... }:
let
  diff-highlight =
    "${pkgs.git}/share/git/contrib/diff-highlight/diff-highlight";
in
{
  programs.git = {
    enable = true;
    userName = "Richard Huang";
    userEmail = "richardhuang.huang@gmail.com";
    aliases = {
      a = "add";
      aa = "add --all";
      amend = "commit --amend";
      b = "branch";
      bb = "branch -a";
      bc = (
        "!git branch --merged"
        + " | grep -Ev '(^\\*|master|main)'"
        + " | xargs -r git branch -d"
      );
      bd = "branch --delete";
      bdf = (
        "!git branch "
        + " | grep -v \"^*\""
        + " | fzf --height=20% --reverse --info=inline"
        + " | xargs -r git branch -d"
      );
      bf = (
        "!git branch"
        + " --format="
        + "'%(refname:short)|%(objectname:short)|%(contents:subject)'"
        + " --sort=-committerdate"
        + " | column -t -s '|'"
        + " | grep -v \"^*\""
        + " | fzf --height=20% --reverse --info=inline"
        + " | awk '{print $1}'"
        + " | xargs -r git checkout"
      );
      cherry-pit = "!git rebase --rebase-merges --onto \"$1\"^ \"$1\"";
      cm = "commit --message";
      co = "checkout";
      d = "diff";
      ec = "config --global --edit";
      l = "ll -10";
      la = "l --all";
      ll = "log --relative-date --graph --abbrev-commit";
      lla = "ll --all";
      p = "push";
      remotes = "remote --verbose";
      s = "status --short";
      sd = "diff --cached";
      sh = "show --pretty=fuller";
    };
    signing = {
      key = "05C2EC94";
      signByDefault = true;
    };
    extraConfig = {
      core = {
        pager = "${diff-highlight} | less -FRX";
        # Allow using markdown easily in commits
        commentChar = ";";
      };
      # Rebase to reconcile divergeent branches
      pull.rebase = true;
      # Setup upstream tracking automatically
      push.autoSetupRemote = true;
      format = {
        pretty = (
          "format:%C(yellow)%h %Cblue%>(12)%ad %Cgreen%<(7)%aN%Cred%d"
          + " %Creset%s"
        );
      };
    };
  };
}

