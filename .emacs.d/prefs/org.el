(setq org-pretty-entities t)
(setq org-src-fontify-natively t)
(setq org-alphabetical-lists t)

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "TO-APPLY(a)" "|" "APPLIED(A!)" "IN-PROCESS(i!)"
      "PENDING(p!)""NONE(n!)" "REJECTED(r!)" "OFFERED(O!)" "DECLINED(D!)")))

(setq org-todo-keyword-faces
      '(("TO-APPLY" . org-todo)
        ("APPLIED" . "yellow")
        ("IN-PROCESS" . "yellow")
        ("PENDING" . "yellow")
        ("NONE" . "red")
        ("REJECTED" . "red")
        ("OFFERED" . 'org-done)
        ("DECLINED" . "orange")))

(eval-after-load 'org-mode
  '(progn
     ()))                               ; TODO:
                                        ; def function to align TODO
                                        ; trackers in region, as well as in
                                        ; entire doc
