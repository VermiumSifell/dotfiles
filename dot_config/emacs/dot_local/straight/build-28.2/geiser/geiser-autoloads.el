;;; geiser-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:


;;;### (autoloads nil "geiser" "geiser.el" (0 0 0 0))
;;; Generated autoloads from geiser.el

(defconst geiser-elisp-dir (file-name-directory load-file-name) "\
Directory containing Geiser's Elisp files.")

(autoload 'geiser-version "geiser-version" "\
Echo Geiser's version." t)

(autoload 'geiser-unload "geiser-reload" "\
Unload all Geiser code." t)

(autoload 'geiser-reload "geiser-reload" "\
Reload Geiser code." t)

(autoload 'geiser "geiser-repl" "\
Start a Geiser REPL." t)

(autoload 'run-geiser "geiser-repl" "\
Start a Geiser REPL." t)

(autoload 'geiser-connect "geiser-repl" "\
Start a Geiser REPL connected to a remote server." t)

(autoload 'geiser-connect-local "geiser-repl" "\
Start a Geiser REPL connected to a remote server over a Unix-domain socket." t)

(autoload 'geiser-repl-switch "geiser-repl" "\
Switch to a running one Geiser REPL." t)

(autoload 'geiser-mode "geiser-mode" "\
Minor mode adding Geiser REPL interaction to Scheme buffers." t)

(autoload 'turn-on-geiser-mode "geiser-mode" "\
Enable Geiser's mode (useful in Scheme buffers)." t)

(autoload 'turn-off-geiser-mode "geiser-mode" "\
Disable Geiser's mode (useful in Scheme buffers)." t)

(mapc (lambda (group) (custom-add-load group (symbol-name group)) (custom-add-load 'geiser (symbol-name group))) '(geiser geiser-repl geiser-autodoc geiser-doc geiser-debug geiser-faces geiser-mode geiser-image geiser-implementation geiser-xref))

(autoload 'geiser-mode--maybe-activate "geiser-mode")

(add-hook 'scheme-mode-hook #'geiser-mode--maybe-activate)

;;;***

;;;### (autoloads nil "geiser-impl" "geiser-impl.el" (0 0 0 0))
;;; Generated autoloads from geiser-impl.el
 (defvar geiser-active-implementations nil)
 (defvar geiser-implementations-alist nil)

(defun geiser-activate-implementation (impl) (add-to-list 'geiser-active-implementations impl))

(defun geiser-impl--add-to-alist (kind what impl &optional append) (add-to-list 'geiser-implementations-alist (list (list kind what) impl) append))

(defun geiser-implementation-extension (impl ext) "\
Add to `geiser-implementations-alist' an entry for extension EXT." (geiser-impl--add-to-alist 'regexp (format "\\.%s\\'" ext) impl t))

;;;***

;;;### (autoloads nil nil ("geiser-autodoc.el" "geiser-base.el" "geiser-capf.el"
;;;;;;  "geiser-compile.el" "geiser-completion.el" "geiser-connection.el"
;;;;;;  "geiser-custom.el" "geiser-debug.el" "geiser-doc.el" "geiser-edit.el"
;;;;;;  "geiser-eval.el" "geiser-image.el" "geiser-log.el" "geiser-menu.el"
;;;;;;  "geiser-mode.el" "geiser-popup.el" "geiser-reload.el" "geiser-repl.el"
;;;;;;  "geiser-syntax.el" "geiser-table.el" "geiser-xref.el") (0
;;;;;;  0 0 0))

;;;***

(provide 'geiser-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; geiser-autoloads.el ends here
