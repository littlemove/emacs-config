(load-file "~/.emacs.d/elpa-to-submit/twilight.el")
(color-theme-twilight)

(set-face-attribute 'default nil :family "Anonymous Pro" :height 150)

(require 'yasnippet) ;; not yasnippet-bundle
(add-to-list 'yas/extra-mode-hooks 'html-mode-hook)
(yas/initialize)
(yas/load-directory "~/.emacs.d/elpa-to-submit/snippets/")
