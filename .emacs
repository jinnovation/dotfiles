; TODO: account for CLI mode in settings (highline etc)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/")
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/highlight-indentation-0.5.0/")
(add-to-list 'load-path (expand-file-name "~/site-lisp/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/"))

(setq required-modes '(ruby-mode actionscript-mode fic-ext-mode
				 markdown-mode markdown-mode+
				 rainbow-mode rspec-mode
				 sass-mode))

(setq required-ruby-packages '(ruby-block ruby-compilation ruby-end ruby-tools))

(setq required-themes '(monokai-theme tango-2-theme molokai-theme
				      solarized-theme tronesque-theme))

(setq required-packages (append required-modes required-themes
				required-ruby-packages
				'(auctex autopair)))

(mapc (lambda (package)
	(or (package-installed-p package)
	    (if (y-or-n-p (format "Package %s is missing. Install?" package))
		(package-install package))))
      required-packages)

;;(require 'tex-site) ;; activates auctex
;;(require 'ess-site)

(require 'autopair)
;; (require 'autopair-latex)

(require 'highlight-indentation)

;; (load-theme 'monokai t)
(load-theme 'tango-2 t)
;; (load-theme 'molokai t)

(global-linum-mode 1)
(setq linum-format 'dynamic)

(global-hl-line-mode 1)
(column-number-mode 1)

(show-paren-mode 1)
(autopair-global-mode)
(delete-selection-mode +1)

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'line-number-mode) (line-number-mode -1))

(defun lock-window ()
  "Prevents frame from being used to display any other buffer"
  (interactive)
  (set-window-dedicated-p (frame-selected-window) t))

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

(setq next-line-add-newlines t)

(setq-default fill-column 80)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq ess-ask-for-ess-directory nil)

;; sets latex-mode to compile w/ pdflatex by default
(setq TeX-PDF-mode t)
(setq TeX-parse-self t)


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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-newline-function (quote reindent-then-newline-and-indent))
 '(custom-safe-themes (quote ("68769179097d800e415631967544f8b2001dae07972939446e21438b1010748c" "7fa9dc3948765d7cf3d7a289e40039c2c64abf0fad5c616453b263b601532493" "050beead9159996a613ba4bc734de8b13b882f1c6596d1dffa4f51d096662cf6" "88b663861db4767f7881e5ecff9bb46d65161a20e40585c8128e8bed8747dae5" "a68fa33e66a883ce1a5698bc6ff355b445c87da1867fdb68b9a7325ee6ea3507" "383806d341087214fd44864170161c6bf34a41e866f501d1be51883e08cb674b" "b8f561a188a77e450ab8a060128244c81dea206f15c1152a6899423dd607b327" "47583b577fb062aeb89d3c45689a4f2646b7ebcb02e6cb2d5f6e2790afb91a18" "3b1973119d3ca55a31abffd64cf6b7d12ce9de125ae07574dd43b90c5f9d5896" "f81e1ca8cefb9d4ded877d39f082c812294bcac41fce5be7230caa6cc83bde37" "e2513931db049905295c70d8a466dba4aad87c769de84474c9b2b9033b654b95" "bc078224bd6b94486f3437265699cb1e4f5e3b91a64f8e65ada8d7ec13fa3f52" "a5a1e3cd5f790846f4eec5fcff52935e5ef6d713a0f9342fef12eccfd9e9eff0" "5ce9c2d2ea2d789a7e8be2a095b8bc7db2e3b985f38c556439c358298827261c" "bad832ac33fcbce342b4d69431e7393701f0823a3820f6030ccc361edd2a4be4" "86b5f552577fab41d24f72cb5458bf9c9c87af65e89159c50c2b8cfb20bb3087" "79243bbd9c07f2baf551c2038009afc866da65fb8073a2efce3a469efc0c1bc5" "3b7e62b9884f1533f8eac5d21b252e5b8098274d7d9096521db84e4f10797ae3" "7a2c92b6267b84ae28a396f24dd832e29a164c1942f1f8b3fe500f1c25f8e09d" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "60a2ebd7effefeb960f61bc4772afd8b1ae4ea48fae4d732864ab9647c92093a" default)))
 '(org-file-apps (quote ((auto-mode . emacs) ("\\.mm\\'" . default) ("\\.x?html?\\'" . default) ("\\.pdf\\'" . "zathura %s")))))

(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.as$" . actionscript-mode))
(add-to-list 'auto-mode-alist '("conf" . conf-mode))

(add-to-list 'auto-mode-alist '("conky" . rainbow-mode))
(add-to-list 'auto-mode-alist '("conky" . conf-space-mode))

(add-to-list 'auto-mode-alist '("rc$" . conf-mode))

(setq inhibit-startup-screen t)

(add-hook 'comint-output-filter-functions
	  'comint-watch-for-password-prompt)

;; Set transparency of emacs
(defun set-transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value (0 - 100 opaque): ")
  (set-frame-parameter (selected-frame) 'alpha value))
(set-transparency 75)

(setq font-face-main "Droid Sans Mono")
(setq font-size-small "8")
(setq font-size-bigger "11")

(setq font-setting-bigger (format "%s-%s" font-face-main font-size-bigger))
(setq font-setting-small (format "%s-%s" font-face-main font-size-small))

(when (display-graphic-p nil)
  (if (> (x-display-pixel-height) 1080)
      (set-face-attribute 'default nil :font font-setting-bigger)
    (set-face-attribute 'default nil :font font-setting-small)))

;; (load "/home/jjin/.emacs.d/nxhtml/autostart.el")
;; (setq mumamo-background-colors nil)

(eval-after-load "tex" 
  '(setcdr (assoc "LaTeX" TeX-command-list)
          '("%`%l%(mode) -shell-escape%' %t"
          TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX")))
