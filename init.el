;; init.el --- Emacs configuration

(require 'package)
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-elpa) ;; necessary for all packages from Purcell's repo
(add-to-list 'package-archives
       '("melpa" . "https://melpa.org/packages/") t)


;; activate all packages
;; (package-initialize)

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; define list of packages to install
(defvar emacsMiscPackages
  '(diminish
    marginalia))

;; install all packages in list
(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      emacsMiscPackages)

(require 'init-company)          ;; Set up text completion framework
(require 'init-dired)            ;; More intuitive naviagation in dired
(require 'init-faster-editing)   ;; Set up multiple cursors, shifting lines etc.
(require 'init-flycheck)         ;; Set up syntax checker
(require 'init-layout)           ;; Set up theme and overall look
(require 'init-projectile)       ;; Set up tools for interacting with a project (search in project etc.)
(require 'init-python)           ;; Set up Python dev tools
(require 'init-utils )           ;; Set up miscellaneous productivity settings

;; init.el ends here
