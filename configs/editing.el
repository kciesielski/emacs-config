(packages-conditional-install '(goto-chg multiple-cursors avy undo-tree string-edit highlight-symbol hlinum))

(key-chord-define-global "kw" 'kill-word)
(key-chord-define-global "bw" 'backward-kill-word)
(key-chord-define-global "mw" 'mark-word)

(require 'eno)
(key-chord-define-global "wj" 'eno-word-goto)

(key-chord-define-global "cj" 'avy-goto-subword-1)
(global-set-key (kbd "C-c j") 'avy-goto-subword-1)

(global-set-key (kbd "C-h C-s") 'highlight-symbol-at-point)
(global-set-key (kbd "C-h C-n") 'highlight-symbol-next)
(global-set-key (kbd "C-h C-p") 'highlight-symbol-prev)

(global-set-key (kbd "C-c g") 'goto-line)

(defun uncomment-block ()
  "uncomments the /* block */"
  (interactive)
  (isearch-forward nil 1)
  (isearch-printing-char 42 1)
  (isearch-printing-char 47 1)
  (isearch-exit)
  (delete-backward-char 1 nil)
  (delete-backward-char 1 nil)
  (isearch-backward nil 1)
  (isearch-printing-char 47 1)
  (isearch-printing-char 42 1)
  (isearch-exit)
  (delete-forward-char 1 nil)
  (delete-forward-char 1 nil)
  (kmacro-end-or-call-macro nil))



(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position))
  (next-line))
(global-set-key (kbd "C-c /") 'toggle-comment-on-line)


(defun copy-line (arg)
    (interactive "p")
    (let ((beg (line-beginning-position))
          (end (line-end-position arg)))
      (when mark-active
        (if (> (point) (mark))
            (setq beg (save-excursion (goto-char (mark)) (line-beginning-position)))
          (setq end (save-excursion (goto-char (mark)) (line-end-position)))))
      (if (eq last-command 'copy-line)
          (kill-append (buffer-substring beg end) (< end beg))
        (kill-ring-save beg end)))
    (kill-append "\n" nil)
    (beginning-of-line (or (and arg (1+ arg)) 2))
    (if (and arg (not (= 1 arg))) (message "%d lines copied" arg)))


(defun double-line (arg)
  "copy line and place it below the original"
  (interactive "p")
  (copy-line arg)
  (yank)
  (move-end-of-line))
(global-set-key (kbd "C-c d") 'double-line)


(global-set-key [(control .)] 'goto-last-change)
(global-set-key (kbd "C-s-c C-s-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


(global-undo-tree-mode 1)

(global-linum-mode t) ; http://superuser.com/questions/212193/how-do-i-display-line-numbers-in-emacs-not-in-the-mode-line

;; Highlight the line number of the current line.
(hlinum-activate)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)
    (tool-bar-mode 0) 
    (menu-bar-mode 0)
    (scroll-bar-mode 0)
    (fset `yes-or-no-p `y-or-n-p)
    (global-set-key (kbd "M-]") 'next-buffer)
    (global-set-key (kbd "M-[") 'previous-buffer)
;; modes
(electric-indent-mode 0)

;; global keybindings
(global-unset-key (kbd "C-z"))

(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 sentence-end-double-space nil ; above mostly from ensime docs
 ns-pop-up-frames nil ; http://superuser.com/questions/277755/emacs-opens-files-in-a-new-frame-when-opened-with-open-a/431601#431601?newreg=6d0dafa353314a5f88b9a04bb497d088
 )

(fset `yes-or-no-p `y-or-n-p)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; from Prelude (https://github.com/bbatsov/prelude)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

(unless (package-installed-p 'super-save)
  (package-refresh-contents)
  (package-install 'super-save))
(super-save-mode +1)
