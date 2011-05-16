(load-file "~/.emacs.d/elpa-to-submit/twilight.el")
(color-theme-twilight)

(set-face-attribute 'default nil :family "Anonymous Pro" :height 150)

(require 'yasnippet) ;; not yasnippet-bundle
(add-to-list 'yas/extra-mode-hooks 'html-mode-hook)
(yas/initialize)
(yas/load-directory "~/.emacs.d/elpa-to-submit/snippets/")

;; MacOS X specific stuff
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(load-file "~/.emacs.d/diego/ruby.el")

(put 'downcase-region 'disabled nil)

(add-to-list 'load-path "~/.emacs.d/diego/emacs-skype/")
(require 'skype)
(setq skype--my-user-handle "l0k1_skype")
