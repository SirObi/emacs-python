;; define list of packages to install
(defvar emacsLayoutPackages
  '(material-theme))

;; install all packages in list
(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      emacsLayoutPackages)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))              ;; hide toolbar

(load-theme 'material t)           ;; load material theme
(menu-bar-mode -1)                 ;; hide menu
(global-linum-mode t)              ;; enable line numbers globally
(setq linum-format "%4d \u2502 ")  ;; format line number spacing
(setq inhibit-startup-message t)   ;; hide the startup message


(provide 'init-layout)
