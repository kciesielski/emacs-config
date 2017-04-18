;; https://github.com/Malabarba/smart-mode-line
(setq sml/no-confirm-load-theme t)

(use-package "smart-mode-line"
  :init
  (setq sml/theme 'respectful
        sml/shorten-directory t
        sml/shorten-modes t
        sml/name-width 40
        sml/mode-width 'full)
  :config
(sml/setup))
