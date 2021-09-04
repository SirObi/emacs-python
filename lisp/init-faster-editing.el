;; define list of packages to install
(defvar fasterEditingPackages
  '(move-dup
    multiple-cursors
    whole-line-or-region))

;; install all packages in list
(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      fasterEditingPackages)

;; Automatically update buffer if file changes on disk or new file added
(add-hook 'after-init-hook 'global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t ;; updates dired buffers
      auto-revert-verbose nil)

;; Autosave in the visited file
(add-hook 'after-init-hook 'auto-save-visited-mode)
(setq auto-save-visited-interval 2)

;; Cache names of files you visited
;; This allows you to get the best out of C-x b and save you a ton of key-presses.
(setq desktop-path (list user-emacs-directory)  ;; saves a list of open files in ~/.emacs.d/.emacs.desktop
      desktop-auto-save-timeout 600)
(desktop-save-mode 1)

(provide 'init-sessions)

;; Complete parens automatically
(when (fboundp 'electric-pair-mode)
  (add-hook 'after-init-hook 'electric-pair-mode))
(add-hook 'after-init-hook 'electric-indent-mode)

;;; Cut/copy the current line without having to C-SPC, C-e, RET - C-w / M-w is enough
(add-hook 'after-init-hook 'whole-line-or-region-global-mode)
(with-eval-after-load 'whole-line-or-region
  (diminish 'whole-line-or-region-local-mode))

;; Delete all text in the current line and start at correct indentation without having to C-a, C-k, TAB
(defun kill-back-to-indentation ()
  "Kill from point back to the first non-whitespace character on the line."
  (interactive)
  (let ((prev-pos (point)))
    (back-to-indentation)
    (kill-region (point) prev-pos)))
(global-set-key (kbd "C-M-<backspace>") 'kill-back-to-indentation)

;; Deleting/replacing selected text
(add-hook 'after-init-hook 'delete-selection-mode)

;; Move entire line
(global-set-key [M-up] 'move-dup-move-lines-up)
(global-set-key [M-down] 'move-dup-move-lines-down)
(global-set-key (kbd "C-M-<up>") 'move-dup-duplicate-up)
(global-set-key (kbd "C-M-<down>") 'move-dup-duplicate-down)

;; Multiple cursors - keybindings
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-+") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Jump to beginning and end of word like in the Terminal (M-f and M-b)
(global-unset-key [M-left])
(global-unset-key [M-right])

(provide 'init-faster-editing)

;;; init-faster-editing.el ends here
