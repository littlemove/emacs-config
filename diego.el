(push "/usr/local/bin" exec-path)

;; Flyspell related config
(setq ispell-program-name "aspell")
(setq ispell-list-command "list")

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook html-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

(global-set-key (kbd "<C-M-tab>") 'flyspell-auto-correct-word)

;; Theme, fonts, ...
(load-file "~/.emacs.d/elpa-to-submit/twilight.el")
(color-theme-twilight)

(set-face-attribute 'default nil :family "Anonymous Pro" :height 150)

;; Snippets (using yasnippets)
(require 'yasnippet) ;; not yasnippet-bundle
(add-to-list 'yas/extra-mode-hooks 'html-mode-hook)
(yas/initialize)
(yas/load-directory "~/.emacs.d/elpa-to-submit/snippets/")

;; MacOS X specific stuff
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(put 'downcase-region 'disabled nil)

;; Load Ruby customizations
(load-file "~/.emacs.d/diego/ruby.el")

;; FIX
;; (add-to-list 'load-path "~/.emacs.d/diego/emacs-skype/")
;; (require 'skype)
;; (setq skype--my-user-handle "l0k1_skype")
