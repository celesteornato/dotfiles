;;; early-init.el --- Early init for personal emacs config  -*- lexical-binding: t; -*-

;; Copyright (C) 2025  Céleste

;; Author: Céleste <main@voidbased>

(require 'org)
(org-babel-tangle-file "~/.config/emacs/init.org" "~/.config/emacs/init.el")
