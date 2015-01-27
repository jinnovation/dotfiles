(add-hook 'doc-view-mode-hook
    (lambda ()
        (define-key doc-view-mode-map (kbd "j") 'doc-view-next-line-or-next-page)
        (define-key doc-view-mode-map (kbd "k")
            'doc-view-previous-line-or-previous-page)
        (define-key doc-view-mode-map (kbd "C-f") 'doc-view-next-page)
        (define-key doc-view-mode-map (kbd "C-b") 'doc-view-previous-page)

        (define-key doc-view-mode-map (kbd "g") 'doc-view-first-page)
        (define-key doc-view-mode-map (kbd "G") 'doc-view-last-page)
        (evil-local-mode -1)
        (doc-view-fit-width-to-window)))
