(setq package-list '(
  lsp-mode lsp-ui flycheck dap-mode vertico magit company crux expand-region multiple-cursors org-bullets)
)
(dolist (package package-list)
   (unless (package-installed-p package)
     (package-install package)))
(company-mode)
(multiple-cursors-mode)

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

(use-package evil)
(evil-mode)

(setq lsp-keymap-prefix "C-c l")
(require 'lsp-mode)
(add-hook 'prog-mode-hook #'lsp)

(setq package-list
  '(gruvbox-theme borland-blue-theme monokai-pro-theme)
)
(dolist (package package-list)
   (unless (package-installed-p package)
     (package-install package)))
(require 'monokai-pro-theme)
(load-theme 'monokai-pro)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-c g") 'magit)

(lambda () (progn
      (setq left-margin-width 2)
      (setq right-margin-width 2)
      (set-window-buffer nil (current-buffer))))
(setq org-startup-indented t
      org-bullets-bullet-list '(" ") ;; no bullets, needs org-bullets package
      org-ellipsis "  " ;; folding symbol
      org-pretty-entities t
      org-hide-emphasis-markers t
      ;; show actually italicized text instead of /italicized text/
      org-agenda-block-separator ""
      org-fontify-whole-heading-line t
      org-fontify-done-headline t
      org-fontify-quote-and-verse-blocks t)
