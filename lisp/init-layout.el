;; define list of packages to install
(defvar emacsLayoutPackages
  '(atom-one-dark-theme
    vertico))

;; install all packages in list
(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      emacsLayoutPackages)

(add-to-list 'default-frame-alist '(fullscreen . maximized))  ;; Maximize Emacs window on startup

(load-theme 'atom-one-dark t)                                 ;; load Atom theme

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))                                         ;; hide toolbar
(menu-bar-mode -1)                                            ;; hide menu
(setq inhibit-startup-message t)                              ;; hide the startup message
(vertico-mode)                                                ;; show completion suggestions in a vertical buffer

(set-face-attribute 'default nil :height 120)                 ;; Set font size to 12
                                                              ;; Uncomment the line below to try an Asian-style font
;;(set-face-attribute 'default nil :font "-GOOG-Noto Sans Mono CJK SC-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1")


(setq-default
 blink-cursor-interval 0.4)                                   ;; nicer cursor blink interval
(when (maybe-require-package 'beacon)
  (setq-default beacon-lighter "")
  (setq-default beacon-size 20)
  (add-hook 'after-init-hook 'beacon-mode))                   ;; little flash of light to help you keep track of the cursor


(global-linum-mode t)                                         ;; enable line numbers globally
(setq linum-format "%4d \u2502 ")                             ;; format line number spacing

(provide 'init-layout)
