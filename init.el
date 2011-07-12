;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;
;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"

;; Turn off mouse interface early in startup to avoid momentary display
;; You really don't need these; trust me.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Load path etc.

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; to move
(push "/usr/local/bin" exec-path)

(set-face-attribute 'default nil :family "Anonymous Pro" :height 150)

;; MacOS X specific stuff
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(put 'downcase-region 'disabled nil)

;; el-get setup

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

(setq el-get-sources '(color-theme yasnippet))

(el-get 'sync el-get-sources)
(el-get 'wait)

;; Theme, fonts, ...
(load-file "~/.emacs.d/elpa-to-submit/twilight.el")
(color-theme-twilight)

;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session

;; (require 'cl)
;; (require 'saveplace)
;; (require 'ffap)
;; (require 'uniquify)
;; (require 'ansi-color)
;; (require 'recentf)

;; ;; Load up starter kit customizations

;; (require 'starter-kit-defuns)
;; (require 'starter-kit-bindings)
;; (require 'starter-kit-misc)
;; (require 'starter-kit-registers)
;; (require 'starter-kit-eshell)
;; (require 'starter-kit-lisp)
;; (require 'starter-kit-perl)
;; (require 'starter-kit-ruby)
;; (require 'starter-kit-js)

;; (regen-autoloads)
;; (load custom-file 'noerror)

;; ;; You can keep system- or user-specific customizations here
;; (setq system-specific-config (concat dotfiles-dir system-name ".el")
;;       user-specific-config (concat dotfiles-dir user-login-name ".el")
;;       user-specific-dir (concat dotfiles-dir user-login-name))
;; (add-to-list 'load-path user-specific-dir)

;; (if (file-exists-p system-specific-config) (load system-specific-config))
;; (if (file-exists-p user-specific-config) (load user-specific-config))
;; (if (file-exists-p user-specific-dir)
;;   (mapc #'load (directory-files user-specific-dir nil ".*el$")))

;;; init.el ends here
