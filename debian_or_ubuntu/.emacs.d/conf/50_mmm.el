;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; mmm-mode
;; HTML内のJavaScriptを書くとき等に、複数のメジャーモードを使用可能にする。
;(setq load-path
;      (cons
;       (expand-file-name "~/.elisp/mmm-mode")) load-path)
;(load-library "autostart")

(require 'mmm-mode)
(require 'mmm-auto)
(require 'mmm-vars)
(require 'mmm-compat)
(setq mmm-global-mode 'maybe)
(setq mmm-submode-decoration-level 2)
;mmm-mode の色設定
(set-face-background 'mmm-default-submode-face "gray15")
;(set-face-background 'mmm-output-submode-face  "LightBlue")
;(set-face-background 'mmm-code-submode-face    "LightGray")
;(set-face-background 'mmm-comment-submode-face "LightYellow")
;(set-face-background 'mmm-special-submode-face "Yellow")

;; HTML + PHP
(mmm-add-classes
 '((html-php
    :submode php-mode
    :front "<\\?\\(php\\)?"
    :back "\\?>")))

;; HTML + CSS
(mmm-add-classes
 '((html-css
    :submode css-mode
    :front "<style [^>]*>?"
    :back "</style>?")))
;; HTML + JavaScript
(mmm-add-classes
 '((html-js
    :submode js2-mode
    :front "<script [^>]*>?"
    :back "</script>?")))
(mmm-add-mode-ext-class 'html-helper-mode "\\.s?html?\\'" 'html-js)
(mmm-add-mode-ext-class 'html-helper-mode "\\.s?html?\\'" 'html-css)
(mmm-add-mode-ext-class 'html-helper-mode "\\.ctp?\\'" 'html-php)
(mmm-add-mode-ext-class 'html-helper-mode "\\.ctp?\\'" 'html-css)
(mmm-add-mode-ext-class 'html-helper-mode "\\.ctp?\\'" 'html-js)

;; (mmm-add-classes
;;  '((php-output
;;     :submode php-mode
;;     :front "<\\?php *echo "
;;     :back "\\?>"
;;     :include-front t
;;     :front-offset 5
;;     :insert ((?e php-echo nil @ "<?php" @ " echo " _ " " @ "?>" @))
;;     )))

;; (mmm-add-classes
;;  '((php-code
;;     :submode php-mode
;;     :front "<\\?\\(php\\)?"
;;     :back "\\?>"
;;     :insert ((?p php-section nil @ "<?php" @ " " _ " " @ "?>" @)
;;              (?b php-block nil @ "<?php" @ "\n" _ "\n" @ "?>" @))
;;     )))

;; (mmm-add-classes
;;  '((erb-code
;;     :submode ruby-mode
;;     :match-face (("<%#" . mmm-comment-submode-face)
;;                  ("<%=" . mmm-output-submode-face)
;;                  ("<%"  . mmm-code-submode-face))
;;     :front "<%[#=]?"
;;     :back "-?%>"
;;     :insert ((?% erb-code       nil @ "<%"  @ " " _ " " @ "%>" @)
;;              (?# erb-comment    nil @ "<%#" @ " " _ " " @ "%>" @)
;;              (?= erb-expression nil @ "<%=" @ " " _ " " @ "%>" @))
;;     )))

;; (mmm-add-classes
;;  '((html-script
;;     :submode javascript-mode
;;     :delimiter-mode nil
;;     :front "<script\[^>\]*\\(language=\"javascript\\([0-9.]*\\)\"\\|type=\"text/javascript\"\\)\[^>\]*>"
;;     :back"</script>"
;;     :insert ((?j js-tag nil @ "<script type=\"text/javascript\">"
;;                  @ "\n" _ "\n" @ "</script>" @))
;;     )))

(global-set-key [f8] 'mmm-parse-buffer)
;; (add-hook 'html-mode-hook
;;           '(lambda ()
;;              (setq mmm-classes '(php-code erb-code html-script html-js embedded-css))
;;              (mmm-mode-on)))

;; rhtmlの時は、html-helper-modeの代りにhtml-modeを使う。
;; emacs-railsでスニペットを利用するには、html-modeじゃないとダメらしい。
;; (add-to-list 'auto-mode-alist '("\\.rhtml$" . html-mode)) 
