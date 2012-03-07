;;; registers.el --- Set up registers
;; Use C-x r j followed by the letter of the register (i for
;; init.el, r for this file) to jump to it.

(dolist (r `((?i (file . ,(concat dotfiles-dir "init.el")))
             (?r (file . ,(concat dotfiles-dir "registers.el")))))
  (set-register (car r) (cadr r))

  (provide 'registers))
;;; registers.el ends here
