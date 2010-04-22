;; load-path
(add-to-list 'load-path "~/.emacs.d/auto-install/")

(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
