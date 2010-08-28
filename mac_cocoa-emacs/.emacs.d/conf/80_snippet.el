;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
(require 'snippet)
;; snippet.el で、addrev に定型文を追加する
(setq-default abbrev-mode t)
(add-hook 'html-mode-hook
          '(lambda ()
             (setq-default abbrev-mode t) ;; abbrev-mode をon
             (snippet-with-abbrev-table 'html-mode-abbrev-table
                                        ("ahref" . "<a href=\"$${url}\">$${title}</a>")
                                        ("linkbase" . "<a href=\"{{ link_base ~ \"$${path}\"|quoteurl(is_debug) }}\">$${title}</a>")
                                        ("if" . "{% if $${True} %}\n{% endif %}")
                                        ("extends" . "{% extends \"$${base.html}\" %}")
                                        ("block" . "{% block header %}$${title}{% endblock %}\n{% block body %}\n\n{{ 1|space|safe }}\n{% endblock %}")
                                        ("space" . "{{ $${1}|space|safe }}")
                                        )))

(add-hook 'python-mode-hook
          '(lambda ()
             (setq-default abbrev-mode t) ;; abbrev-mode をon
             (snippet-with-abbrev-table 'python-mode-abbrev-table
                                        ("for" . "for $${element} in $${sequence}:")
                                        ("im" . "import $$")
                                        ("if" . "if $${True}:")
                                        ("wh" . "while $${True}:")
                                        )))
