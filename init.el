;;; init.el

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))

;; Load path etc.
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotfiles-dir)

;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(setq *spell-check-support-enabled* nil)
(setq *macbook-pro-support-enabled* t)
(setq *is-a-mac* (eq system-type 'darwin))
(setq *is-carbon-emacs* (and *is-a-mac* (eq window-system 'mac)))
(setq *is-cocoa-emacs* (and *is-a-mac* (eq window-system 'ns)))

(require 'osx-keys)

(require 'exec-path)
(require 'keybindings)
(require 'defuns)
(require 'misc)

(require 'registers)

(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

;; el-get setup
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (end-of-buffer)
       (eval-print-last-sexp)))))

(setq el-get-byte-compile nil)
(setq el-get-user-package-directory "~/.emacs.d/inits")
(setq el-get-sources '(color-theme
                       color-theme-twilight
                       color-theme-railscasts
                       color-theme-solarized
                       css-mode
                       ruby-electric
                       inf-ruby
                       yaml-mode
                       paredit
                       rhtml-mode
                       flymake-ruby
                       yasnippet
                       rinari
                       auto-complete
                       auto-complete-yasnippet
                       markdown-mode
                       ibuffer-vc
                       package
                       csv-mode
                       csv-nav
                       yari
                       bundler
                       dash-at-point
                       web-mode
                       robe-mode))

(el-get 'sync el-get-sources)

;; Theme, fonts, ...
(set-face-attribute 'default nil :family "Fira Mono" :height 140)
(color-theme-solarized-dark)

;; Flyspell related config
(setq ispell-program-name "aspell"
      ispell-list-command "list"
      ispell-local-dictionary "es")

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook html-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

(global-set-key (kbd "<C-M-tab>") 'flyspell-auto-correct-word)

;; To move
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; Don't truncate
(setq truncate-lines t
      truncate-partial-width-windows nil)
;; to move end

(require 'ruby)
(require 'lisp)

(require 'hippie-expand)

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator " • ")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")
;;(require 'isearch)

;; make "<>" not matching delimiters in html-mode

;; (eval-after-load "sgml-mode" '(progn
;;                                 (modify-syntax-entry ?< "_" sgml-mode-syntax-table)
;;                                 (modify-syntax-entry ?> "." sgml-mode-syntax-table)))



;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
