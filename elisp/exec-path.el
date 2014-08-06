(setenv "SHELL" "/usr/local/bin/zsh")
(setenv "ESHELL" "/usr/local/bin/zsh")
(setenv "PATH" "/Users/diego/.rbenv/shims:/Users/diego/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/opt/local/bin:/opt/local/sbin")

(setq exec-path (split-string "/Users/diego/.rbenv/shims:/Users/diego/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/opt/local/bin:/opt/local/sbin" path-separator))

(provide 'exec-path)
