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

(global-set-key (kbd "C-x a a") 'align)
(global-set-key (kbd "C-x a r") 'align-regexp)

(defun window-toggle-split-direction ()
  "Switch window split from horizontally to vertically, or vice versa.

i.e. change right window to bottom, or change bottom window to right."
  (interactive)
  (require 'windmove)
  (let ((done))
    (dolist (dirs '((right . down) (down . right)))
      (unless done
        (let* ((win (selected-window))
               (nextdir (car dirs))
               (neighbour-dir (cdr dirs))
               (next-win (windmove-find-other-window nextdir win))
               (neighbour1 (windmove-find-other-window neighbour-dir win))
               (neighbour2 (if next-win (with-selected-window next-win
                                          (windmove-find-other-window neighbour-dir next-win)))))
          ;;(message "win: %s\nnext-win: %s\nneighbour1: %s\nneighbour2:%s" win next-win neighbour1 neighbour2)
          (setq done (and (eq neighbour1 neighbour2)
                          (not (eq (minibuffer-window) next-win))))
          (if done
              (let* ((other-buf (window-buffer next-win)))
                (delete-window next-win)
                (if (eq nextdir 'right)
                    (split-window-vertically)
                  (split-window-horizontally))
                (set-window-buffer (windmove-find-other-window neighbour-dir)
				   other-buf))))))))

(global-set-key (kbd "C-x |") 'window-toggle-split-direction)
