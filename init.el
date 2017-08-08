;; add package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade.ferrier.me.uk/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; order matters
(load "~/.emacs.d/configs/install_first")
(load "~/.emacs.d/configs/linux")
(load "~/.emacs.d/configs/osx")
(load "~/.emacs.d/configs/yasnippet")
(load "~/.emacs.d/configs/misc")
(load "~/.emacs.d/configs/ui")
(load "~/.emacs.d/configs/editing")
(load "~/.emacs.d/configs/programming")
(load "~/.emacs.d/configs/git")
(load "~/.emacs.d/configs/windows")
(load "~/.emacs.d/configs/helm")
(load "~/.emacs.d/configs/smart-modeline")
(load "~/.emacs.d/configs/neotree")
(load "~/.emacs.d/configs/erlang")
(load "~/.emacs.d/configs/other")
(load "~/.emacs.d/configs/org")
(load "~/.emacs.d/configs/greek")
(load "~/.emacs.d/configs/solidity")
(load "~/.emacs.d/configs/typescript")
(load "~/.emacs.d/configs/prettier")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (zoom-window zoom-frm which-key undo-tree super-save string-edit smooth-scroll smartparens smart-mode-line neotree multiple-cursors monokai-theme moe-theme markdown-mode magit linum-off keyfreq key-chord iedit hlinum highlight-symbol helm-projectile helm-ag goto-chg expand-region exec-path-from-shell erlang ensime eno encourage-mode elmacro diff-hl csv-mode auto-package-update annoying-arrows-mode ag ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
