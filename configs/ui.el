(packages-conditional-install '(zoom-frm monokai-theme moe-theme))

(require 'moe-theme)
(load-theme 'moe-dark t)

(desktop-save-mode 1)
(tool-bar-mode 0) 
(menu-bar-mode 0)
(scroll-bar-mode 0)

(fset `yes-or-no-p `y-or-n-p)

(global-set-key (kbd "s-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "s-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "s-<down>") 'shrink-window)
(global-set-key (kbd "s-<up>") 'enlarge-window)

(global-set-key (kbd "C-=") 'zoom-frm-in)
(global-set-key (kbd "C--") 'zoom-frm-out)

(toggle-frame-maximized)

;; Don't defer screen updates when performing operations.
(setq redisplay-dont-pause t)

(set-default-font "-*-Hack-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1")
(when (eq system-type 'darwin)
  (set-default-font "-*-Hack-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1")
)
