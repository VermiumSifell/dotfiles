;;; evil-mc-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:


;;;### (autoloads nil "evil-mc" "evil-mc.el" (0 0 0 0))
;;; Generated autoloads from evil-mc.el

(autoload 'evil-mc-mode "evil-mc" "\
Toggle evil multiple cursors in a single buffer.

This is a minor mode.  If called interactively, toggle the
`Evil-Mc mode' mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `evil-mc-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(put 'global-evil-mc-mode 'globalized-minor-mode t)

(defvar global-evil-mc-mode nil "\
Non-nil if Global Evil-Mc mode is enabled.
See the `global-evil-mc-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-evil-mc-mode'.")

(custom-autoload 'global-evil-mc-mode "evil-mc" nil)

(autoload 'global-evil-mc-mode "evil-mc" "\
Toggle Evil-Mc mode in all buffers.
With prefix ARG, enable Global Evil-Mc mode if ARG is positive;
otherwise, disable it.

If called from Lisp, toggle the mode if ARG is `toggle'.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Evil-Mc mode is enabled in all buffers where `evil-mc-initialize'
would do it.

See `evil-mc-mode' for more information on Evil-Mc mode.

\(fn &optional ARG)" t nil)

(autoload 'evil-mc-initialize "evil-mc" "\
Enable `evil-mc-mode' in the current buffer." nil nil)

(autoload 'turn-on-evil-mc-mode "evil-mc" "\
Turn on evil-mc mode in the current buffer." t nil)

(autoload 'turn-off-evil-mc-mode "evil-mc" "\
Turn off evil-mc mode in the current buffer." t nil)

;;;***

;;;### (autoloads nil nil ("evil-mc-command-execute.el" "evil-mc-command-record.el"
;;;;;;  "evil-mc-common.el" "evil-mc-cursor-make.el" "evil-mc-cursor-state.el"
;;;;;;  "evil-mc-known-commands.el" "evil-mc-region.el" "evil-mc-scratch.el"
;;;;;;  "evil-mc-setup.el" "evil-mc-undo.el" "evil-mc-vars.el") (0
;;;;;;  0 0 0))

;;;***

(provide 'evil-mc-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; evil-mc-autoloads.el ends here
