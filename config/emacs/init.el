;; Prologue
(setq custom-file "~/.config/emacs/custom.el")
(load-file "~/.config/emacs/custom.el")
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-install-selected-packages)

;; Setting good defaults
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode 1)
(add-to-list 'default-frame-alist '(font . "SF Mono 16"))

(require 'ido)
(ido-mode 1)
(ido-everywhere 1)

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

(require 'eglot)
(defun conf-lang (l-hook)
  (add-hook l-hook 'eglot-ensure))

(conf-lang 'c-mode-hook)
(conf-lang 'rust-mode-hook)
(conf-lang 'python-mode-hook)
(conf-lang 'javascript-mode-hook)

(require 'doom-modeline)
(doom-modeline-mode)

;; Binds
(evil-set-leader '(normal visual) (kbd "<SPC>"))
(evil-define-key '(normal visual) 'global (kbd "<leader>cc") 'compile)
(evil-define-key '(normal visual) 'global (kbd "<leader>cC") 'recompile)
(evil-define-key '(normal visual) 'global (kbd "<leader>f") 'format-all-region-or-buffer)
