(load "~/.emacs.d/sanemacs.el")
(set-face-attribute 'default nil :font "CaskaydiaCove Nerd Font Mono" :height 160)


(require 'org)
(org-babel-load-file
 (expand-file-name "settings.org"
                   user-emacs-directory))
