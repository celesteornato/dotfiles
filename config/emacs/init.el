(setq custom-file "~/.config/emacs/custom.el")
(load-file "~/.config/emacs/custom.el")

(require 'package)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
	"straight/repos/straight.el/bootstrap.el"
	(or (bound-and-true-p straight-base-dir)
	    user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(require 'quelpa)
(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://github.com/quelpa/quelpa-use-package.git"))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Setting good defaults
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode 1)
(add-to-list 'default-frame-alist '(font . "SF Mono 16"))

(require 'ido)
(ido-mode 1)
(ido-everywhere 1)

(add-hook 'find-file-hook 'auto-insert)

;; Configuring packages
(load-theme 'adwaita)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(require 'company-box)
(add-hook 'company-mode-hook 'company-box-mode)

(require 'smartparens)
(require 'evil-smartparens)
(add-hook 'after-init-hook (lambda () (smartparens-mode)
			     (evil-smartparens-mode)))
(require 'evil)
(add-hook 'after-init-hook 'evil-mode)

(require 'undo-tree)
(global-undo-tree-mode 1)

(require 'doom-modeline)
(doom-modeline-mode)

(require 'eglot)
(require 'flycheck)
(defun conf-lang (l-hook)
  (add-hook l-hook 'eglot-ensure))
(defun conf-lang-nolsp (l-hook)
  (add-hook l-hook 'flycheck-mode))

(conf-lang 'c-mode-hook)
(conf-lang 'rust-mode-hook)
(conf-lang 'python-mode-hook)
(conf-lang 'javascript-mode-hook)

(conf-lang-nolsp 'lisp-mode-hook)
(conf-lang-nolsp 'org-mode-hook)

(require 'org-modern)
(require 'quelpa-use-package)

(require 'org-bullets)
(require 'org-superstar)
(require 'org-modern)
(require 'org-fragtog)
(add-hook 'org-mode-hook 'org-bullets-mode)
(add-hook 'org-mode-hook 'org-superstar-mode)
(add-hook 'org-mode-hook 'org-modern-mode)
(add-hook 'org-mode-hook 'org-fragtog-mode)
(use-package org-modern-indent
  :ensure t
  :quelpa (org-modern-indent :fetcher github :repo "jdtsmith/org-modern-indent" :files ("*.el" "resources"))
  :config
  (add-hook 'org-mode-hook 'org-indent-mode))

(defun kill-other-buffers ()
  "kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;; Binds
(evil-set-leader '(normal visual) (kbd "<SPC>"))

(evil-define-key '(normal visual) 'global (kbd "<leader>k") 'kill-other-buffers)
(evil-define-key '(normal visual) 'global (kbd "<leader>/") 'project-search)
(evil-define-key '(normal visual) 'global (kbd "<leader>d") 'dired)
(evil-define-key '(normal visual) 'global (kbd "<leader>e") 'shell-command)
(evil-define-key '(normal visual) 'global (kbd "<leader>t") 'mistty)
(evil-define-key '(normal visual) 'global (kbd "<leader>cc") 'compile)
(evil-define-key '(normal visual) 'global (kbd "<leader>cC") 'recompile)
(evil-define-key '(normal visual) 'global (kbd "<leader>ca") 'eglot-code-actions)
(evil-define-key '(normal visual) 'global (kbd "<leader>cr") 'eglot-rename)

(require 'format-all)
(evil-define-key '(normal visual) 'global (kbd "<leader>f") 'eglot-format-buffer)


(provide 'init)
