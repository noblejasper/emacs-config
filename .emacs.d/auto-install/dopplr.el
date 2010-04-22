;;;  -*- coding: utf-8; mode: emacs-lisp; -*-
;;; dopplr.el

;; Author: Daisuke Murase <typester@cpan.org>
;; Keywords: dopplr

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;; Prefix: dopplr-

;;; Commentary:
;; Currentry implement dopplr-local-clock function only.
;;
;; Tested on Emacs 22

;; to customize
;; M-x customize-group RET dopplr RET


;; TODO:
;; Implement more functions

;;;code:
(require 'url)

;;;customize-variables
(defcustom dopplr-api-token nil
  "Your own dopplr api token.
You can generate the token here: http://www.dopplr.com/account/api_session_token

NOTICE: This token is private token, so treat it carefully.
"
  :type 'string
  :group 'dopplr)

(defun dopplr-local-clock (traveller)
  "get target traveller's local time"
  (interactive "sTarget dopplr username: ")
  (if (not dopplr-api-token)
      (message "please set your own dopplr-api-token before using this function")
    (let ((url (concat
                "https://www.dopplr.com/api/traveller_info"
                "?traveller=" traveller
                "&token=" dopplr-api-token))
          (callback (lambda (status traveller)
                      (url-mark-buffer-as-dead (current-buffer))
                      (if status
                          (message status)
                        (progn
                          (beginning-of-buffer)
                          (if (re-search-forward "<status>\\(.+\\)</status>" nil t)
                              (message (concat traveller " " (match-string 1)
                                               (when (and (re-search-forward "<current_city>" nil t)
                                                          (re-search-forward "<localtime>\\([0-9]+\\)-\\([0-9]+\\)-\\([0-9]+\\)T\\([0-9]+:[0-9]+\\)" nil t))
                                                 (concat " (" (match-string 1) "/" (match-string 2) "/" (match-string 3) " " (match-string 4) ")"))))
                            (message (concat traveller " is not in your contacts"))))))))
      (url-retrieve url callback (list traveller)))))

(provide 'dopplr)
