;;; autopair-latex.el --- Automatically pair dollar signs and \[,\] for math 
;; mode in latex. Without this, math mode does not close on its own and the
;; coloring and formatting of the document gets messed up.

;; Copyright (C) 2011 Tom Guo <tomguo [at] cs.washington.edu>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Installation:
;;
;; Put (require 'autopair-latex) in your .emacs file

;;; Use: 
;;
;; By default, 'C-c \' is bound to '\[','\]'. To initiate math mode, type 
;; either '$' or 'C-c \', and emacs will automatically insert both the opening
;; and closing of math mode. Whereever you want math mode to end, type '$' or
;; 'C-c \', and emacs will insert a '$' or '\]' if needed, blink back where
;; math mode began, and move to the point right after end of math mode for you
;; to continue your document in text mode.

(defconst *blink-delay* 0.1) ;; used for matching

(defun count-dollar-signs ()
  "counts number of $'s before point, parity used to determine mode at point"
  (setq end-pos (point))
  (goto-char 1)
  (setq ct 0)
  (while (search-forward "$" end-pos t)
    (setq ct (1+ ct)))
  (goto-char end-pos)
  ct
)

(defun count-backslash-brackets ()
  "counts number of \[ and \] before point, parity used to determine mode at point"
  (setq end-pos (point))
  (goto-char 1)
  (setq ct 0)
  (while (search-forward "\\\[" end-pos t)
    (setq ct (1+ ct))
    )
  (goto-char 1)
  (while (search-forward "\\\]" end-pos t)
    (setq ct (1+ ct))
    )
  (goto-char end-pos)
  ct
)

(defun delete-backwards ()
  "delete both $'s when at second '$' of '$$'"
  "delete '\[\]' when at second '\'"
  (interactive)
  (setq following-char (following-char))
  (if (preceding-char)
      (setq preceding-char (preceding-char))
    (setq preceding-char 0))
  (if (char-after (1+ (point)))
      (setq following-char+1 (char-after (1+ (point))))
    (setq following-char+1 0))
  (if (char-before (1- (point)))
      (setq preceding-char-1 (char-before (1- (point))))
    (setq preceding-char-1 0))
  (when (and (char-equal ?$ following-char) (char-equal ?$ preceding-char) (oddp (count-dollar-signs)))
     (delete-char 1))

  (setq bracket-before (char-equal ?\[ preceding-char))
  (setq backslash-before (char-equal ?\\ preceding-char-1))
  (setq backslash-after (char-equal ?\\ following-char))
  (setq bracket-after (char-equal ?\] following-char+1))
  (when (and bracket-before backslash-before backslash-after bracket-after)
    (delete-char 2)
    (delete-backward-char 1))
  (delete-backward-char 1) ; the default action

)

(defun dollar-sign ()
  "auto pairs and matches $'s"
  (interactive)
  (setq is-even (evenp (count-dollar-signs)))
  (when is-even
	(insert "$$")
	(backward-char)
	)

  (unless is-even
    (setq at-dollar (char-equal ?$ (following-char)))
    (unless at-dollar
      (insert "$")
      (backward-char)
      )
    (goto-char (search-backward "$"))
    (sit-for *blink-delay*)
    (forward-char)
    (search-forward "$")
    )
)

(defun backslash-bracket ()
  "auto pairs and matches \[ and \]"
  (interactive)
  (setq is-even (evenp (count-backslash-brackets)))
  (when is-even
    (insert "\\\[\\\]")
    (backward-char 2))

  (unless is-even
    (setq at-backslash (char-equal ?\\ (following-char)))
    (setq at-bracket (char-equal ?\] (char-after (1+ (point)))))
    
    (unless (and at-backslash at-bracket)
      (insert "\\\]")
      (backward-char 2))

    (goto-char (search-backward "\\\["))
    (sit-for *blink-delay*)
    (forward-char 2)
    (search-forward "\\\]")
    )
)

(add-hook 'TeX-mode-hook (lambda()
			     (local-set-key (kbd "$") 'dollar-sign)
			     (local-set-key (kbd "<backspace>") 'delete-backwards)
			     (local-set-key (kbd "C-c \\") 'backslash-bracket)
))

(add-hook 'LaTeX-mode-hook (lambda() 
			     (local-set-key (kbd "$") 'dollar-sign)
			     (local-set-key (kbd "<backspace>") 'delete-backwards)
			     (local-set-key (kbd "C-c \\") 'backslash-bracket)
			     ))

(provide 'autopair-latex)

