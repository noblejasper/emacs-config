;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; OSを判別
(defvar run-linux
  (equal system-type 'gnu/linux))
(defvar run-darwin
  (equal system-type 'darwin))

;; Windowシステムを判別
(defvar run-cli
  (equal window-system nil))
(defvar run-cocoa
  (equal window-system 'ns))
(defvar run-carbon
  (equal window-system 'mac))

;; スタートアップ時のメッセージを抑制
(setq inhibit-startup-message t)

;; start server
(server-start)

; emacsclient で Buffer `hogehoge' still has clients; kill it? (yes or no) とかいわれるのがうざいのをなおす
; http://aki.issp.u-tokyo.ac.jp/itoh/hiChangeLog/html/2007-04.html#2007-04-09-1
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

;; メニューバーとツールバーoff
(tool-bar-mode 0)
(if (or run-cocoa run-carbon) (menu-bar-mode 1) (menu-bar-mode 0)) ; GUIでは表示

;; ヴィジュアルベル無効
;; (setq visible-bell nil)

;; ビープ音も無効
;; (setq ring-bell-function '(lambda ()))

;; 行数、列数を表示
(line-number-mode t)
(column-number-mode t)

;; バックアップしない
(setq make-backup-files nil)

;; 自動保存したファイルを削除する
(setq delete-auto-save-files t)

;; 自動セーブしない
(setq auto-save-default nil)

;; リージョンをC-hで削除
(delete-selection-mode 1)

;; インデントはスペースで
(setq-default indent-tabs-mode nil)

;; C-hでバックスペース
(global-set-key "\C-h" 'delete-backward-char)

;; スクロールバー非表示
;; (scroll-bar-mode nil)

;; フリンジ(左右の折り返し表示領域)はいらない
(fringe-mode 'none)

;; 色つける
(setq-default transient-mark-mode t)
(require 'font-lock)

;; utf-8優先
(prefer-coding-system 'utf-8)

;; tamago
;; (setq default-input-method 'japanese-egg-anthy)

;; 物理行単位でスクロール
;; http://www.bookshelf.jp/soft/meadow_31.html#SEC418
(load "ce-scroll.el")
(setq ce-smooth-scroll nil)
;; 一行ずつスクロール
(setq scroll-step 1)

;; iswitchb & uniquify
(iswitchb-mode 1)
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; 縦分割とかでも行を折り返す
(setq truncate-partial-width-windows nil)

;; カーソル点滅しないように
(blink-cursor-mode t)
(setq blink-cursor-interval 0.15)

;; アクティブでないバッファではカーソルを出さない
(setq cursor-in-non-selected-windows nil)

;; recenf-mode
(recentf-mode t)

;; 時刻の表示( 曜日 月 日 時間:分 )
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time-mode t)

;; ;; ref: WEB+DB PRESS vol.58 p.78
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
;; (set-face-background 'show-paren-match-face nil)
;; (set-face-underline-p 'show-paren-match-face "red")
;; (set-face-background 'show-paren-mismatch-face "#ff0000")
;; (set-face-underline-p 'show-paren-mismatch-face nil)

;;
;; redo+
;;   ref:「Emacsテクニックバイブル」 p.123
;;
(require 'redo+)
(global-unset-key [C-M-/])
(global-set-key [C-M-/] 'redo)
(setq undo-no-redo t) ; 過去のundoがredoされないようにする
;; 大量のundoに耐えられるようにする
(setq undo-limit 600000)
(setq undo-strong-limit 900000)

;;
;; sense-region
;;   ref:「Emacsテクニックバイブル」 p.124
;;
;; http://blog.livedoor.jp/k1LoW/archives/65030864.html
(require 'sense-region)
(sense-region-on)

;;
;; migemo
;;   ref:「Emacsテクニックバイブル」 p.113
;;
;; (require 'migemo)