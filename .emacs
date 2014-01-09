; TODO: account for CLI mode in settings (highline etc)

(defconst user-init-dir "~/.emacs.d/")

(add-to-list 'load-path (expand-file-name "~/site-lisp/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/"))

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))

(package-initialize)

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(load-user-file "require.el")
(load-user-file "keybinding.el")
(load-user-file "prefs.el")

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta))


;; TODO: remove these; more trouble than worth
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

(defun lock-window ()
  "Prevents frame from being used to display any other buffer"
  (interactive)
  (set-window-dedicated-p (frame-selected-window) t))

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

;; (load "/home/jjin/.emacs.d/nxhtml/autostart.el")
;; (setq mumamo-background-colors nil)


