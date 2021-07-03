;; define list of packages to install
(defvar pythonPackages
  '(company-jedi
    poetry
    pyenv-mode))

;; install all packages in list
(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      pythonPackages)

;; Add jedi to company backends
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my/python-mode-hook)

;; Set up jedi keybindings
(defun jedi-keybindings-hook ()
  (local-set-key (kbd "C-.") 'jedi:goto-definition)
  (local-set-key (kbd "C-,") 'jedi:goto-definition-pop-marker))
(add-hook 'python-mode-hook 'jedi-keybindings-hook)


(provide 'init-python)
