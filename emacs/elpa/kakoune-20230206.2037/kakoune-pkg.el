;; -*- no-byte-compile: t; lexical-binding: nil -*-
(define-package "kakoune" "20230206.2037"
  "A simulation, but not emulation, of kakoune."
  '((ryo-modal        "0.45")
    (multiple-cursors "1.4")
    (expand-region    "0.11.0")
    (emacs            "25.1"))
  :url "https://github.com/jmorag/kakoune.el"
  :commit "b39c5605e896c55ea246f755c46171bd6d0768a8"
  :revdesc "b39c5605e896"
  :authors '(("Joseph Morag" . "jm4157@columbia.edu"))
  :maintainers '(("Joseph Morag" . "jm4157@columbia.edu")))
