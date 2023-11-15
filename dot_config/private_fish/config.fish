if status is-interactive
    # Commands to run in interactive sessions can go here
end

#echo # Print a empty row to make pfetch look better
#pfetch
macchina

bind \e\[3\;5~ kill-word
bind \cH backward-kill-word
fish_ssh_agent
set -gx EDITOR vim
