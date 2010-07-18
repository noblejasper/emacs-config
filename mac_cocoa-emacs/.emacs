(add-to-list 'load-path "~/.emacs.d/elisp/")
(add-to-list 'load-path "~/.emacs.d/elisp/apel/")
(add-to-list 'load-path "~/.emacs.d/elisp/emu/")

(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")
