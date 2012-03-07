(setq yas/root-directory '("~/.emacs.d/snippets/"
                           "~/.emacs.d/el-get/yasnippet/snippets/"))
(mapc 'yas/load-directory yas/root-directory)
(yas/global-mode)
