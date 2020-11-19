(add-to-list 'default-frame-alist '(font . "Inconsolata Bold 16" ))

(require 'package)
(add-to-list 'package-archives '("melpa-staple" . "http://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(flycheck-pycheckers elpy-mode flycheck-mode direnv flycheck elpy use-package))
 '(safe-local-variable-values '((project-uses-black . t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun elpy-conditional-format-code ()
  "Run elpy format code only when `project-uses-black` is t"
  (interactive)
  (when (symbol-value project-uses-black)
    (elpy-format-code)
    )
  )
(setq project-uses-black nil)

(use-package elpy
  :ensure t
  :hook
  (python-mode . elpy-mode)
  :init
  (elpy-enable)
  ;; (setq python-shell-interpreter "ipython")
  ;; (setq python-shell-interpreter-args "-i --TerminalIPythonApp.interactive_shell_class=rlipython.TerminalInteractiveShell")
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook
	    (lambda ()
              (add-hook 'before-save-hook 'elpy-conditional-format-code nil t))
	    )
  (setq elpy-rpc-timeout 5) ;; Default timeout is a little fast for big projects
  )

(use-package flycheck
  :ensure t
  :hook
  (elpy-mode . flycheck-mode)
  )

(use-package flycheck-pycheckers
  :ensure t
  :hook
  (flycheck-mode . flycheck-pycheckers-setup)
  :init
  ;; can override the below with project level config file
  (setq flycheck-pycheckers-args `("--venv-path" ,(expand-file-name "~/.emacs.d/elpy/rpc-venv/")))
  (setq flycheck-pycheckers-checkers '(pylint flake8 mypy3))
  (setq flycheck-pycheckers-ignore-codes '("E203" "W503" "E0401"))
  )

(use-package direnv
  :ensure t
  :config
  (direnv-mode))
