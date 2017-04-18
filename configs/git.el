(packages-conditional-install '(magit))

(global-set-key (kbd "C-x G") 'magit-status)
;; (git-gutter:update-interval 2)
;; (global-git-gutter-mode +1)

(global-set-key (kbd "C-x N") 'magit-next-commit)

;; https://github.com/dgutov/diff-hl
(use-package diff-hl
  :bind ("C-c k" . save-and-revert-hunk)
  :config
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  (global-diff-hl-mode t)
  (diff-hl-flydiff-mode)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode))

(defun save-and-revert-hunk ()
  (interactive)
  (save-buffer)
(diff-hl-revert-hunk))
