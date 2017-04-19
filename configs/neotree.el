(packages-conditional-install '(neotree all-the-icons))
  ;; modified version of https://github.com/hemmvm/dotemacs/blob/master/site-lisp/util--neotree.el
  (defun neotree-project-tree-open ()
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (if project-dir
          (progn
            (neotree-dir project-dir)
            (neotree-find file-name))
        (neotree-find)))
    (neo-global--select-window))
  
  (defun neotree-project-tree-toggle ()
    (interactive)
    (if (neo-global--window-exists-p)
        (neotree-hide)
      (neotree-project-tree-open)))
  
  (global-set-key [f8] 'neotree-project-tree-toggle)
  
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq neo-window-width 35)
  
  ;; https://github.com/jaypei/emacs-neotree/issues/77 + https://github.com/hemmvm/dotemacs/blob/master/site-lisp/util--neotree.el
  (defun custom-neotree-enter-hide ()
    (interactive)
    (neotree-enter)
    (let ((current (neo-buffer--get-filename-current-line)))
      (if (not (and current (file-accessible-directory-p current)))
          (neotree-hide)))
    )
  
  (defun custom-neotree-peek ()
    (interactive)
    (let ((neo-window (neo-global--get-window)))
      (neotree-enter)
      (select-window neo-window))
    )
  
  (add-hook
   'neotree-mode-hook
   (lambda ()
     (define-key neotree-mode-map (kbd "RET") 'custom-neotree-enter-hide)))
  
  (add-hook
   'neotree-mode-hook
   (lambda ()
(define-key neotree-mode-map (kbd "TAB") 'custom-neotree-peek)))
