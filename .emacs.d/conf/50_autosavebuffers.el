(require 'auto-save-buffers-enhanced)
(setq auto-save-buffers-enhanced-use-svk-flag t)
(auto-save-buffers-enhanced-include-only-checkout-path t)
(auto-save-buffers-enhanced t)
(global-set-key "\C-xas" 'auto-save-buffers-enhanced-toggle-activity)
