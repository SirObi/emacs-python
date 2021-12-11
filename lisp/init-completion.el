;; these two vars are necessary for lsp to function correctly
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) 

;; define list of packages to install
(defvar emacsCompletionPackages
  '(lsp-python-ms
    lsp-ui)) ;; also installs lsp-mode

;; install all packages in list
(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      emacsCompletionPackages)

(lsp-python-ms-update-server)

(add-hook 'python-mode-hook 'lsp)

(provide 'init-completion)
