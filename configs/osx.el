(packages-conditional-install '(exec-path-from-shell))
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; mac specific settings
(when (eq system-type 'darwin) 
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super)
  (setq insert-directory-program "/usr/local/bin/gls")
  )

;; use dedaulf mac notifier
(setq alert-default-style 'osx-notifier)
