if status is-interactive
    # Commands to run in interactive sessions can go here
    set -Ux QT_QPA_PLATFORMTHEME qt6ct
end
alias ls="eza --icons"
alias grep="rg"
alias cd='z'

fastfetch
set -U fish_greeting ""
zoxide init fish | source
