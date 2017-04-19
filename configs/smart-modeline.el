;; https://github.com/Malabarba/smart-mode-line
(setq sml/no-confirm-load-theme t)

(packages-conditional-install '(smart-mode-line))
 
(setq sml/theme 'dark
        sml/shorten-directory t
        sml/shorten-modes t
        sml/name-width 40
        sml/mode-width 'full)
(sml/setup)
