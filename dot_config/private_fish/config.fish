if status is-interactive
    # Commands to run in interactive sessions can go here
    fastfetch
end

set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
set -gx EDITOR vim

# Keybindings
bind \e\[3\;5~ kill-word
bind \cH backward-kill-word
