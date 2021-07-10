;; define list of packages to install
(defvar emacsLayoutPackages
  '(material-theme))

;; install all packages in list
(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      emacsLayoutPackages)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))                       ;; hide toolbar

(load-theme 'material t)                    ;; load material theme
(menu-bar-mode -1)                          ;; hide menu
(global-linum-mode t)                       ;; enable line numbers globally
(setq linum-format "%4d \u2502 ")           ;; format line number spacing
(setq inhibit-startup-message t)            ;; hide the startup message
(setq-default
 blink-cursor-interval 0.4)                 ;; nicer cursor blink interval
(when (maybe-require-package 'beacon)
  (setq-default beacon-lighter "")
  (setq-default beacon-size 20)
  (add-hook 'after-init-hook 'beacon-mode)) ;; little flash of light to help you keep track of the cursor

(provide 'init-layout)
