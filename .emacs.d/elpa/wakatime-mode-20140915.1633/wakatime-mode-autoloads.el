;;; wakatime-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (global-wakatime-mode wakatime-mode) "wakatime-mode"
;;;;;;  "wakatime-mode.el" (21528 58087 973479 768000))
;;; Generated autoloads from wakatime-mode.el

(autoload 'wakatime-mode "wakatime-mode" "\
Toggle WakaTime (WakaTime mode).
With a prefix argument ARG, enable Whitespace mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil.

\(fn &optional ARG)" t nil)

(defvar global-wakatime-mode nil "\
Non-nil if Global-Wakatime mode is enabled.
See the command `global-wakatime-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-wakatime-mode'.")

(custom-autoload 'global-wakatime-mode "wakatime-mode" nil)

(autoload 'global-wakatime-mode "wakatime-mode" "\
Toggle Wakatime mode in all buffers.
With prefix ARG, enable Global-Wakatime mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Wakatime mode is enabled in all buffers where
`(lambda nil (wakatime-mode 1))' would do it.
See `wakatime-mode' for more information on Wakatime mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("wakatime-mode-pkg.el") (21528 58088 114518
;;;;;;  964000))

;;;***

(provide 'wakatime-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; wakatime-mode-autoloads.el ends here
