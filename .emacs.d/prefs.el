(require 'powerline)
(powerline-center-evil-theme)
(eval-after-load 'evil
    '(progn
       (define-key evil-normal-state-map ",ci" 'evilnc-comment-or-uncomment-lines)
       (define-key evil-normal-state-map ",cl" 'evilnc-quick-comment-or-uncomment-to-the-line)
       (define-key evil-normal-state-map ",ll" 'evilnc-quick-comment-or-uncomment-to-the-line)
       (define-key evil-normal-state-map ",cc" 'evilnc-copy-and-comment-lines)
       (define-key evil-normal-state-map ",cp" 'evilnc-comment-or-uncomment-paragraphs)
       (define-key evil-normal-state-map ",cr" 'comment-or-uncomment-region)
       (define-key evil-normal-state-map ",cv" 'evilnc-toggle-invert-comment-line-by-line)))

(evil-mode 1)
(global-evil-surround-mode 1)

(setq evil-esc-delay 0)
(setq projectile-completion-system 'grizzl)
(setq projectile-enable-caching t)
(projectile-global-mode)
(setq paradox-github-token "50d7f7fe0af07638a09e1a32f4ec5bba3f83f74e")

(setq-default indent-tabs-mode nil)

(setq-default tab-width 2)
(defvaralias 'js-indent-level 'tab-width)

(global-auto-revert-mode)
(when (>= emacs-major-version 24)
  (progn
      (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
      (add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/")
      (add-to-list 'custom-theme-load-path
		   "~/.emacs.d/elpa/highlight-indentation-0.5.0/")))

;; (load-theme 'spacegray t)
(load-theme 'brin t)

(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(setq scss-compile-at-save nil)

(setq org-pretty-entities t)
(setq org-src-fontify-natively t)
(setq org-alphabetical-lists t)

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "TO-APPLY(a)" "APPLIED(A)" "|" "NONE(n)" "REJECTED(r)" "OFFERED(O)")))

(setq org-todo-keyword-faces
      '(("TO-APPLY" . org-warning)
        ("APPLIED" . "yellow")
        ("NONE" . "red")
        ("REJECTED" . "red")
        ("OFFERED" . "green")))

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome-beta")

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
(set-transparency 80)

(setq font-face-main "Terminus")
(setq font-size-small "10")
(setq font-size-bigger "15")
(setq font-setting-bigger (format "%s-%s" font-face-main font-size-bigger))
(setq font-setting-small (format "%s-%s" font-face-main font-size-small))

;; MODE LINE
(defun scale-text (cutoff-w cutoff-h)
  (interactive "nCutoff width: \nnCutoff height: ")
  (when (display-graphic-p nil)
    (set-face-attribute 'mode-line nil :font font-face-main)
    (set-face-attribute 'mode-line nil :height 100) ; FIXME: scale this too
    (cond ((> (x-display-pixel-height) (x-display-pixel-width))
           (if (> (x-display-pixel-width) cutoff-w)
               (set-face-attribute 'default nil :font font-setting-bigger)
             (set-face-attribute 'default nil :font font-setting-small)))
          ((> (x-display-pixel-width) (x-display-pixel-height))
           (if (> (x-display-pixel-height) cutoff-h)
               (set-face-attribute 'default nil :font font-setting-bigger)
             (set-face-attribute 'default nil :font font-setting-small))))))

(scale-text 1920 1080)

(eval-after-load "tex" 
  '(setcdr (assoc "LaTeX" TeX-command-list)
          '("%`%l%(mode) -shell-escape%' %t"
	    TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX")))

(setq c-block-comment-prefix "* ")
