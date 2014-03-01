(global-auto-revert-mode)
;; PREFS BEGIN
(when (>= emacs-major-version 24)
  (progn
      (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
      (add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/")
      (add-to-list 'custom-theme-load-path
		   "~/.emacs.d/elpa/highlight-indentation-0.5.0/")))

(load-theme 'spacegray t)
;; (set-background-color "#121212")
;; (set-face-background 'fringe "#111111")
;; (set-face-background 'linum  "#111111")

(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(setq scss-compile-at-save nil)



(when (fboundp 'global-linum-mode)
  (setq linum-format 'dynamic)
  (global-linum-mode 1))


(when (fboundp 'global-hl-line-mode)
  (global-hl-line-mode 1))

(when (fboundp 'column-number-mode)
  (column-number-mode 1))


(show-paren-mode 1)
(autopair-global-mode)
(delete-selection-mode +1)


(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'line-number-mode) (line-number-mode -1))

(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

(global-auto-complete-mode)
(require 'ac-c-headers)
(add-hook 'c-mode-hook (lambda ()
			 (add-to-list 'ac-sources 'ac-source-c-headers)
			 (add-to-list 'ac-sources 'ac-source-c-header-symbols
				      t)))

;; =============================================================================

;; highlights strings like TODO, FIXME, etc.
(add-hook 'prog-mode-hook 'fic-ext-mode)

;; lines do not exceed 80 lines
;; (add-hook 'c-mode-common-hook 'turn-on-auto-fill)
(add-hook 'prog-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; latex-mode-specific hooks (because latex-mode is retarded and not derived
;; from prog-mode)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'fic-ext-mode)
(add-hook 'LaTeX-mode-hook (lambda () (TeX-fold-mode 1)))

(add-hook 'actionscript-mode-hook 'auto-fill-mode)
(add-hook 'actionscript-mode-hook 'fic-ext-mode)

(add-hook 'markdown-mode-hook 'auto-fill-mode)
(add-hook 'markdown-mode-hook 'fic-ext-mode)

(add-hook 'scss-mode-hook 'rainbow-mode)

(setq next-line-add-newlines t)

(setq-default fill-column 80)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq ess-ask-for-ess-directory nil)

;; sets latex-mode to compile w/ pdflatex by default
(setq TeX-PDF-mode t)
(setq TeX-parse-self t)

(add-hook 'comint-output-filter-functions
	  'comint-watch-for-password-prompt)

;; Set transparency of emacs
(defun set-transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value (0 - 100 opaque): ")
  (set-frame-parameter (selected-frame) 'alpha value))
(set-transparency 75)

(setq font-face-main "Terminus")
(setq font-size-small "10")
(setq font-size-bigger "15")
(setq font-setting-bigger (format "%s-%s" font-face-main font-size-bigger))
(setq font-setting-small (format "%s-%s" font-face-main font-size-small))

;; MODE LINE
(set-face-attribute 'mode-line nil :font font-face-main)
(set-face-attribute 'mode-line nil :height 100)

(when (display-graphic-p nil)
  (cond ((> (x-display-pixel-height) (x-display-pixel-width))
	 (if (> (x-display-pixel-width) 1920)
	     (set-face-attribute 'default nil :font font-setting-bigger)
	   (set-face-attribute 'default nil :font font-setting-small)))
	((> (x-display-pixel-width) (x-display-pixel-height))
	 (if (> (x-display-pixel-height) 1080)
	     (set-face-attribute 'default nil :font font-setting-bigger)
	   (set-face-attribute 'default nil :font font-setting-small)))))

(eval-after-load "tex" 
  '(setcdr (assoc "LaTeX" TeX-command-list)
          '("%`%l%(mode) -shell-escape%' %t"
	    TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX")))

(setq c-block-comment-prefix "* ")
