; C-h必須
(global-set-key "\C-h" 'delete-backward-char)

; dabbrev
(global-set-key "\M-i" 'dabbrev-expand)

; なんかいろいろ
(global-set-key "\C-cu" 'w3m-browse-url)
(global-set-key "\C-cr" 'replace-string)
(global-set-key "\C-c\C-r" 'recentf-open-files)
(global-set-key "\C-c\C-y" 'browse-kill-ring)

;; C-t is other-window
(global-set-key "\C-t" 'other-window)

;; key-chord
(require 'key-chord)
(key-chord-mode 1)

(defadvice toggle-input-method
  (around toggle-input-method-around activate)
  (let ((input-method-function-save input-method-function))
    ad-do-it
    (setq input-method-function input-method-function-save)
    (key-chord-mode (if current-input-method 0 1))))

;Meta+g でgoto-line
(global-set-key "\M-g" 'goto-line)

; Ctrl+Enter でファイルを開く
(global-set-key [C-return] 'find-file)

; Ctrl+delete で現在開いてるバッファを消す
(global-set-key [C-M-delete]
    '(lambda() (interactive)(kill-buffer (buffer-name))))

; elscreen
(global-set-key [f12] 'elscreen-next)
(global-set-key [f11] 'elscreen-previous)
(global-set-key [f10] 'elscreen-create)

; window
(global-set-key [M-right] 'split-window-horizontally)
(global-set-key [M-left] 'split-window-horizontally)
(global-set-key [M-up] 'split-window-vertically)
(global-set-key [M-down] 'delete-other-windows)

;; windmove
;; http://hovav.net/elisp/
(require 'windmove)
(windmove-default-keybindings)
