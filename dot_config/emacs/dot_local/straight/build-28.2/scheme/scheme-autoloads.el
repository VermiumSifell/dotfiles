;;; scheme-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:


;;;### (autoloads nil "scheme" "scheme.el" (0 0 0 0))
;;; Generated autoloads from scheme.el

(autoload 'scheme-mode "scheme" "\
Major mode for editing Scheme code.
Editing commands are similar to those of `lisp-mode'.

In addition, if an inferior Scheme process is running, some additional
commands will be defined, for evaluating expressions and controlling
the interpreter, and the state of the process will be displayed in the
mode line of all Scheme buffers.  The names of commands that interact
with the Scheme process start with \"xscheme-\" if you use the MIT
Scheme-specific `xscheme' package; for more information see the
documentation for `xscheme-interaction-mode'.  Use \\[run-scheme] to
start an inferior Scheme using the more general `cmuscheme' package.

Commands:
Delete converts tabs to spaces as it moves back.
Blank lines separate paragraphs.  Semicolons start comments.
\\{scheme-mode-map}

\(fn)" t nil)

(autoload 'dsssl-mode "scheme" "\
Major mode for editing DSSSL code.
Editing commands are similar to those of `lisp-mode'.

Commands:
Delete converts tabs to spaces as it moves back.
Blank lines separate paragraphs.  Semicolons start comments.
\\{scheme-mode-map}
Entering this mode runs the hooks `scheme-mode-hook' and then
`dsssl-mode-hook' and inserts the value of `dsssl-sgml-declaration' if
that variable's value is a string.

\(fn)" t nil)

;;;***

(provide 'scheme-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; scheme-autoloads.el ends here
