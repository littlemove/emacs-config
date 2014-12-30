(setq projectile-completion-system 'helm)
(helm-projectile-on)

(projectile-global-mode)

(define-key projectile-mode-map (kbd "C-c f") 'projectile-find-file)
