; フォント設定
(when window-system
  (progn
    (set-default-font "Bitstream Vera Sans Mono")
    (set-fontset-font (frame-parameter nil 'font)
                      'japanese-jisx0208
                      '("M+2VM+IPAG circle" . "unicode-bmp"))))
