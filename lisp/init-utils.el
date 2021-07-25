;; define list of packages to install
(defvar emacsSpecificPackages
  '(better-defaults
    exec-path-from-shell))

;; install all packages in list
(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      emacsSpecificPackages)

;; Allow hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

;; Use shell's $PATH
(exec-path-from-shell-copy-env "PATH")

;; Switch to new buffer when splitting window
(global-set-key (kbd "C-x 2") (lambda () (interactive)(split-window-vertically) (other-window 1)))
(global-set-key (kbd "C-x 3") (lambda () (interactive)(split-window-horizontally) (other-window 1)))

(provide 'init-utils)
