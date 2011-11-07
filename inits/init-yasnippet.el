(setq yas/snippet-dirs '("~/.emacs.d/snippets/" "~/.emacs.d/el-get/yasnippet/snippets/"))
(mapc 'yas/load-directory yas/snippet-dirs)
(yas/global-mode)
