(setq rinari-major-modes
      (list 'ruby-mode 'css-mode 'javascript-mode 'yaml-mode 'dired-mode))

(add-hook 'web-mode-hook
          (lambda () (rinari-launch)))

(global-rinari-mode)
