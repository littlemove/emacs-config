;;; init.el

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Load path etc.
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotfiles-dir)
(push "/usr/local/bin" exec-path)

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
     (let (el-get-master-branch)
       (end-of-buffer)
       (eval-print-last-sexp)))))

(setq el-get-byte-compile nil)
(setq el-get-user-package-directory "~/.emacs.d/inits")
(setq el-get-sources '(color-theme color-theme-twilight
                                   color-theme-railscasts css-mode
                                   ruby-electric inf-ruby magit
                                   yaml-mode paredit rhtml-mode
                                   flymake-ruby  rvm yasnippet rinari
                                   ri-emacs auto-complete
                                   auto-complete-ruby))
(el-get 'sync el-get-sources)


;;(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))

;; Theme, fonts, ...
(set-face-attribute 'default nil :family "Anonymous Pro" :height 150)
(color-theme-railscasts)

;; Flyspell related config
(setq ispell-program-name "aspell")
(setq ispell-list-command "list")
(setq ispell-local-dictionary "es")

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook html-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

(global-set-key (kbd "<C-M-tab>") 'flyspell-auto-correct-word)


;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session

(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

(require 'defuns)
(require 'keybindings)
(require 'misc)
(require 'ruby)
(require 'lisp)
(require 'rcodetools)

(server-start)

;; (require 'starter-kit-registers)
;; (require 'starter-kit-eshell)

;;; init.el ends here
