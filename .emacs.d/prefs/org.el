(setq org-pretty-entities t)
(setq org-src-fontify-natively t)
(setq org-alphabetical-lists t)

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "TO-APPLY(a)" "|" "APPLIED(A!)" "IN-PROCESS(i!)" "NONE(n!)" "REJECTED(r!)" "OFFERED(O!)")))

(setq org-todo-keyword-faces
      '(("TO-APPLY" . org-todo)
        ("APPLIED" . "yellow")
        ("IN-PROCESS" . "yellow")
        ("NONE" . "red")
        ("REJECTED" . "red")
        ("OFFERED" . 'org-done)))

(eval-after-load 'org-mode
  '(progn
     ()))                               ; TODO:
                                        ; def function to align TODO
                                        ; trackers in region, as well as in
                                        ; entire doc
