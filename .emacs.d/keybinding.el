(global-set-key (kbd "M-g") 'goto-line)

(global-set-key (kbd "RET") 'reindent-then-newline-and-indent)
(add-hook 'ruby-mode-hook
	  (lambda () (local-set-key (kbd "RET")
				    'reindent-then-newline-and-indent)
	    (ruby-end-mode)))

(global-set-key (kbd "M-j") (lambda() (interactive) (join-line -1)))

(global-set-key (kbd "C-M-n") (lambda () (interactive)
				(ignore-errors (next-line 4))))

(global-set-key (kbd "C-M-p") (lambda () (interactive)
				(ignore-errors (previous-line 4))))

(global-set-key (kbd "C-M-f") (lambda () (interactive)
				(ignore-errors (forward-char 4))))

(global-set-key (kbd "C-M-b") (lambda () (interactive)
				(ignore-errors (backward-char 4))))

(global-set-key (kbd "C-<backspace>") 'undo)

(global-set-key (kbd "C-x p") (lambda () (interactive) (other-window -1)))
