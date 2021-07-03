;; define list of packages to install
(defvar emacsSpecificPackages
  '(exec-path-from-shell
    better-defaults))

;; install all packages in list
(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      emacsSpecificPackages)

;; Allow hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

;; Use shell's $PATH
(exec-path-from-shell-copy-env "PATH")


(provide 'init-utils)
