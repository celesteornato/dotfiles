;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     default))
 '(evil-undo-system 'undo-tree)
 '(global-undo-tree-mode t)
 '(org-babel-C-compiler "gcc -std=c23")
 '(org-babel-load-languages '((C . t) (emacs-lisp . t) (python . t)))
 '(org-confirm-babel-evaluate nil)
 '(org-edit-src-content-indentation 0)
 '(org-format-latex-options
   '(:foreground default :background default :scale 2.0 :html-foreground
		 "Black" :html-background "Transparent" :html-scale
		 1.0 :matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-startup-with-latex-preview t)
 '(package-selected-packages
   '(company company-box doom-modeline evil evil-smartparens flycheck
	     format-all gruber-darker-theme magit mistty org-bullets
	     org-fragtog org-modern org-superstar quelpa
	     quelpa-use-package smartparens undo-tree)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doom-modeline-panel ((t nil))))
