(setq projectile-completion-system 'ido)
(projectile-global-mode)

(define-key projectile-mode-map (kbd "C-c f") 'projectile-find-file)
