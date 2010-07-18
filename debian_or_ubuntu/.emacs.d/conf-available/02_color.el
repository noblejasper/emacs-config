;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; 色の設定
;; フレームパラメータ初期値の設定
(setq default-frame-alist
      (append (list
               ;;; default color
               '(background-color . "black") ; 背景色
               '(foreground-color . "white")  ; 文字色
               ;;; cursor
               '(cursor-color . "snow") ; カーソル色
               '(cursor-type . box)     ; カーソル形状
               '(cursor-height . 4)     ; カーソルの高さ
               ;;; mouse cursor
               '(mouse-color . "white") ; マウスカーソル色
               ;;; border
               '(border-color . "yellow") ; 縁の色
               ;;; scroll bar
               '(vertical-scroll-bars . nil) ; スクロールバー
               ;;; size
;               '(width . 83)  ; 横幅(桁数)
;              '(height . 53) ; 高さ(行数)
               ;;; location
;               '(left . 837) ; 左上隅 x 座標
;               '(top . 0)    ; 左上隅 y 座標
               )
              default-frame-alist))