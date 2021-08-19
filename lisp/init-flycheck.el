;;; init-flycheck.el --- Configure Flycheck global behaviour -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'flycheck)
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)

  ;; Enable flake8 and mypy to use pyproject.toml as their config file
  (setq flycheck-python-mypy-config '("mypy.ini" "setup.cfg" "pyproject.toml"))
  (setq flycheck-flake8rc '(".flake8rc" "pyproject.toml"))

  (when (maybe-require-package 'flycheck-color-mode-line)
    (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)))


(provide 'init-flycheck)
;;; init-flycheck.el ends here
