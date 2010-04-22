;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; js2-mode.el
(setq-default c-basic-offset 4)

(when (load "js2" t)
  (setq js2-cleanup-whitespace nil
        js2-bounce-indent-flag nil)

  (defun indent-and-back-to-indentation ()
    (interactive)
    (indent-for-tab-command)
    (let ((point-of-indentation
           (save-excursion
             (back-to-indentation)
             (point))))
      (skip-chars-forward "\s " point-of-indentation)))
  (define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)

  (define-key js2-mode-map "\C-m" nil)

  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode)))


; ;; javascript.el
; ;; http://web.comhem.se/~u83406637/emacs/javascript.el  これなかった。。。
; ;; http://web.archive.org/web/20060321004800/http://web.comhem.se/~u83406637/emacs/javascript.el
; (add-to-list 'auto-mode-alist '("\\.\\(js\\|as\\|json\\|jsn\\)\\'" . javascript-mode))
; (autoload 'javascript-mode "javascript" nil t)
; (setq javascript-indent-level 4)
; (setq javascript-auto-indent-flag nil)
; 
; ;; 対応する括弧を自動挿入する。
; ;; http://d.hatena.ne.jp/khiker/20061119/1163934208
; (add-hook 'javascript-mode-hook
;           '(lambda()
;              (progn
;                ;; { で{}を書く
;                (define-key javascript-mode-map "{" 'insert-braces)
;                ;; ( で()を書く
;                (define-key javascript-mode-map "(" 'insert-parens)
;                ;; " で""を書く
;                (define-key javascript-mode-map "\'" 'insert-single-quotation)
;                ;; " で""を書く
;                (define-key javascript-mode-map "\"" 'insert-double-quotation)
;                ;; [ で[]を書く
;                (define-key javascript-mode-map "[" 'insert-brackets)
;                ;; Ctrl+c }でregionを{}で囲む
;                (define-key javascript-mode-map "\C-c}" 'insert-braces-region)
;                ;; Ctrl+c )でregionを()で囲む
;                (define-key javascript-mode-map "\C-c)" 'insert-parens-region)
;                ;; Ctrl+c ]でregionを[]で囲む
;                (define-key javascript-mode-map "\C-c]" 'insert-brackets-region)
;                ;; Ctrl+c "でregionを""で囲む
;                (define-key javascript-mode-map "\C-c\"" 'insert-double-quotation-region)
;                )))
