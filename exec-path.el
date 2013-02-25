;; $> defaults write $HOME/.MacOSX/environment PATH “$PATH”
(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.

This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" "/Users/diego/.rbenv/shims:/Users/diego/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/opt/local/bin:/opt/local/sbin")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when (and *is-a-mac* window-system)
  (set-exec-path-from-shell-PATH))

(provide 'exec-path)
