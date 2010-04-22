;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; html-helper-mode
;; http://www.santafe.edu/~nelson/tools/
;; http://www.santafe.edu/~nelson/tools/html-helper-mode.el
;; http://www.santafe.edu/~nelson/tools/tempo.el
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist (cons 
                       '("\\.html?$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons 
                       '("\\.thtml?$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons 
                       '("\\.xhtml?$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons 
                       '("\\.tpl?$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons 
                       '("\\.tmpl?$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons 
                       '("\\.ctp?$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons 
                       '("\\.mt?$" . html-helper-mode) auto-mode-alist))

;; change sequence face
(make-face 'my-sequence-face)
(set-face-foreground 'my-sequence-face "blue")
(set-face-background 'my-sequence-face "bisque")
(setq html-tt-sequence-face 'my-sequence-face)
