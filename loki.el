;;(require 'color-theme)
;;(load-file "~/.emacs.d/color-themes/zenburn.el")
(color-theme-zenburn)

;; Toogle full-screen mode (needs wmctrl installed)
(defun full-screen-toggle ()
  "toggle full-screen mode"
  (interactive)
  (shell-command "wmctrl -r :ACTIVE: -btoggle,fullscreen"))

(global-set-key (kbd "<f11>")  'full-screen-toggle)

(require 'yasnippet) ;; not yasnippet-bundle
;;(add-to-list 'yas/extra-mode-hooks 'html-mode-hook)
(yas/initialize)
(yas/load-directory "~/.emacs.d/elpa-to-submit/snippets/")