;; Rinari
(add-to-list 'load-path "~/.emacs.d/elpa-to-submit/rinari")
(require 'rinari)

;; rhtml-mode
(add-to-list 'load-path "~/.emacs.d/elpa-to-submit/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
          (lambda () (rinari-launch)))

;; Rspec-mode
(add-to-list 'load-path "~/.emacs.d/diego/rspec-mode")
(require 'rspec-mode)

;;;; Hide/show blocks of code on ruby mode
(defun ruby-custom-setup ()
  (add-to-list 'hs-special-modes-alist
               '(ruby-mode "\\(def\\|do\\)""end""#"
                           (lambda (arg) (ruby-end-of-block))
                           nil
                           ))

  (local-set-key (kbd "C-c <right>") 'hs-show-block)
  (local-set-key (kbd "C-c <left>")  'hs-hide-block)
  (local-set-key (kbd "C-c <up>")    'hs-hide-all)
  (local-set-key (kbd "C-c <down>")  'hs-show-all)

  (hs-minor-mode t)
  )

(add-hook 'ruby-mode-hook 'ruby-custom-setup)
