   Do Re Mi commands to incrementally adjust face attributes and
   frame parameters using arrow keys or mouse wheel.

 When you invoke the Do Re Mi iterative commands defined here, you
 can press and hold an up/down arrow key, or rotate the mouse
 wheel, to change face attributes or frame parameters.  For more
 information, see file `doremi.el' and the doc-string for function
 `doremi' in particular.

 NOTE: Functions and variables in this library have the prefix
       `doremi-'.  In order to more easily distinguish commands
       that iterate in Do Re Mi fashion from other functions in the
       library, the iterative commands are suffixed with `+'.

 Note on saving changes made with the commands defined here:

   Some of the commands defined here change face and frame
   parameters.  You can save any changes you have made, by using
   Customize.  To visit a Customize buffer of all unsaved changes
   you have made, use command `customize-customized'.

   Frame parameter changes, such as background color, can be saved
   for future use by all frames or all frames of a certain kind.
   For that, you must change the frame parameters of the
   correponding frame-alist variable.

   There is no single variable for saving changes to parameters of
   the current frame.  Instead, there are several different
   frame-alist variables, which you can use to define different
   kinds of frames.  These include: `default-frame-alist',
   `initial-frame-alist', and `special-display-frame-alist'.  The
   complete list of such frame alist variables is available using
   function `frame-alist-var-names', defined in library
   `frame-cmds.el'.

   Example: Suppose you change the background color of a frame and
   want to make that the default background color for new frames in
   the future.  You will need to update the value of variable
   `default-frame-alist' to use the `background-color' parameter
   setting of the changed frame.

   You can easily copy one or all parameter values from any given
   frame to any frame alist (such as `default-frame-alist'), by
   using the commands `set-frame-alist-parameter-from-frame' and
   `set-all-frame-alist-parameters-from-frame'.  Those commands are
   defined in library `frame-cmds.el'.

 Note on available color names:

   Color names supported by your Emacs release and platform are
   those returned by function `x-color-names'.  This often includes
   names that are essentially the same as duplicates, e.g.,
   "LightBlue" and "light blue".  By default, Do Re Mi
   canonicalizes these names by lowercasing them and removing
   whitespace.  Then it removes the duplicates.  This behavior is
   governed by option `hexrgb-canonicalize-defined-colors-flag'.
   Customize that option to nil if you need the original names.


 User options defined here:

   `doremi-frame-config-ring-size',
   `doremi-move-frame-wrap-within-display-flag',
   `doremi-push-frame-config-for-cmds-flag',
   `doremi-RGB-increment-factor', `doremi-wrap-color-flag'.


 Commands defined here:

   `doremi-all-faces-bg+', `doremi-all-faces-fg+',
   `doremi-all-frames-bg+', `doremi-all-frames-fg+', `doremi-bg+',
   `doremi-bg-blue+', `doremi-bg-brightness+',
   `doremi-bg-color-name+', `doremi-bg-cyan+', `doremi-bg-green+',
   `doremi-bg-hue+', `doremi-bg-hue-stepping-saturation+',
   `doremi-bg-magenta+', `doremi-bg-purity+', `doremi-bg-red+',
   `doremi-bg-saturation+', `doremi-bg-value+',
   `doremi-bg-yellow+', `doremi-buffer-font-size+',
   `doremi-face-bg+', `doremi-face-bg-color-name+',
   `doremi-face-bg-hue-stepping-saturation+', `doremi-face-fg+',
   `doremi-face-fg-color-name+',
   `doremi-face-fg-hue-stepping-saturation+', `doremi-fg+',
   `doremi-fg-blue+', `doremi-fg-brightness+',
   `doremi-fg-color-name+', `doremi-fg-cyan+', `doremi-fg-green+',
   `doremi-fg-hue+', `doremi-fg-hue-stepping-saturation+',
   `doremi-fg-magenta+', `doremi-fg-purity+', `doremi-fg-red+',
   `doremi-fg-saturation+', `doremi-fg-value+',
   `doremi-fg-yellow+', `doremi-font+', `doremi-font-size+',
   `doremi-frame-configs+', `doremi-frame-font-size+',
   `doremi-frame-height+', `doremi-frame-horizontally+',
   `doremi-frame-vertically+', `doremi-frame-width+',
   `doremi-increment-background-color',
   `doremi-increment-color-component',
   `doremi-increment-face-bg-color',
   `doremi-increment-face-fg-color',
   `doremi-increment-foreground-color',
   `doremi-set-background-color', `doremi-set-foreground-color',
   `doremi-toggle-wrap-color', `doremi-undo-last-face-change',
   `doremi-undo-last-frame-color-change',
   `toggle-doremi-wrap-color'.


 Non-interactive functions defined here:

   `doremi-adjust-increment-for-color-component',
   `doremi-all-faces-bg/fg-1', `doremi-all-frames-bg/fg-1',
   `doremi-bg-1', `doremi-bg/fg-color-name-1', `doremi-delete-if',
   `doremi-face-bg/fg-1', `doremi-face-bg/fg-color-name-1',
   `doremi-face-color-component',
   `doremi-face-hue-stepping-saturation', `doremi-face-set',
   `doremi-fg-1', `doremi-frame-color-component',
   `doremi-frame-config-wo-parameters',
   `doremi-frame-hue-stepping-saturation',
   `doremi-frame-new-position',
   `doremi-increment-background-color-1', `doremi-increment-color',
   `doremi-increment-face-color',
   `doremi-increment-face-color-read-args', `doremi-face-default',
   `doremi-increment-blue', `doremi-increment-foreground-color-1',
   `doremi-increment-frame-color', `doremi-increment-green',
   `doremi-increment-red', `doremi-push-current-frame-config',
   `doremi-push-frame-config-for-command', `doremi-read-component',
   `doremi-read-increment-arg', `doremi-set-frame-color',
   `doremi-wrap-or-limit-color-component'.


 Internal variables defined here:

   `doremi-current-increment', `doremi-frame-config-ring',
   `doremi-last-face-value', `doremi-last-frame-color'.


 See also these related Do Re Mi libraries:

   `doremi-mac.el' - Macro to define Do Re Mi commands and
                     automatically add them to a Do Re Mi menu.
   `doremi-cmd.el' - Do Re Mi commands not dealing with frames.

 See also these files for other frame commands:

    `autofit-frame.el' - Automatically fit each frame to its
                         selected window.  Uses `fit-frame.el'.

    `fit-frame.el'     - 1) Fit a frame to its selected window.
                         2) Incrementally resize a frame.

    `frame-cmds.el'    - Various frame and window commands.

    `thumb-frm.el'     - Shrink frames to a thumbnail size and
                         restore them again.

    `zoom-frm.el'      - Zoom a frame, so that its font becomes
                         larger or smaller.


 Put this in your init file (`~/.emacs'): (require 'doremi-frm)

 Suggested key bindings:

  (defalias 'doremi-prefix (make-sparse-keymap))
  (defvar doremi-map (symbol-function 'doremi-prefix)
    "Keymap for Do Re Mi commands.")
  (define-key global-map "\C-xt" 'doremi-prefix)
  (define-key doremi-map "a" 'doremi-all-faces-fg+)    ; "All"
  (define-key doremi-map "c" 'doremi-bg+)              ; "Color"
  (define-key doremi-map "f" 'doremi-face-fg+)         ; Face"
  (define-key doremi-map "h" 'doremi-frame-height+)
  (define-key doremi-map "t" 'doremi-font+)            ; "Typeface"
  (define-key doremi-map "u" 'doremi-frame-configs+)   ; "Undo"
  (define-key doremi-map "x" 'doremi-frame-horizontally+)
  (define-key doremi-map "y" 'doremi-frame-vertically+)
  (define-key doremi-map "z" 'doremi-font-size+))      ; "Zoom"

 Customize the menu.  Uncomment this to try it out.

  (defvar menu-bar-doremi-menu (make-sparse-keymap "Do Re Mi"))
  (define-key global-map [menu-bar doremi]
    (cons "Do Re Mi" menu-bar-doremi-menu))
  (define-key menu-bar-doremi-menu [doremi-frame-configs+]
    '(menu-item "Frame Configurations"  doremi-frame-configs+
      :help "Cycle among frame configurations recorded: `up'/`down'"))
  (define-key menu-bar-doremi-menu [doremi-font+]
    '(menu-item "Font"  doremi-font+
      :help "Successively cycle among fonts, choosing by name: `up'/`down'"))
  (when (fboundp 'text-scale-increase)    ; Emacs 23+.
    (define-key menu-bar-doremi-menu [doremi-buffer-font-size+]
      '(menu-item "Buffer Text Size (Zoom)" doremi-buffer-font-size+
        :help "Change text size for buffer incrementally: `up'/`down'")))
  (define-key menu-bar-doremi-menu [doremi-frame-font-size+]
    '(menu-item "Frame Font Size (Zoom)" doremi-frame-font-size+
      :help "Change font size for frame incrementally: `up'/`down'"))
  (define-key menu-bar-doremi-menu [doremi-all-frames-fg+]
    '(menu-item "All Frame Foregrounds..." doremi-all-frames-fg+
      :help "Change foreground of all frames incrementally: `up'/`down'"))
  (define-key menu-bar-doremi-menu [doremi-all-frames-bg+]
    '(menu-item "All Frame Backgrounds..." doremi-all-frames-bg+
      :help "Change background of all frames incrementally: `up'/`down'"))
  (define-key menu-bar-doremi-menu [doremi-undo-last-frame-color-change]
    '(menu-item "Undo Frame Color Change" doremi-undo-last-frame-color-change
      :enable doremi-last-frame-color
      :help "Undo the last frame color change by `doremi-fg+' or `doremi-bg+'"))
  (define-key menu-bar-doremi-menu [doremi-fg-color-name+]
    '(menu-item "Frame Foreground Name..." doremi-fg-color-name+
      :help "Change frame foreground color incrementally: `up'/`down'"))
  (define-key menu-bar-doremi-menu [doremi-fg+]
    '(menu-item "Frame Foreground..." doremi-fg+
      :help "Change frame foreground color incrementally: `up'/`down'"))
  (define-key menu-bar-doremi-menu [doremi-bg-color-name+]
    '(menu-item "Frame Background Name..." doremi-bg-color-name+
      :help "Change frame background color incrementally: `up'/`down'"))
  (define-key menu-bar-doremi-menu [doremi-bg+]
    '(menu-item "Frame Background..." doremi-bg+
      :help "Change frame background color incrementally: `up'/`down'"))
  (define-key menu-bar-doremi-menu [doremi-all-faces-fg+]
    '(menu-item "All Faces - Foreground..." doremi-all-faces-fg+
      :help "Change foreground color of all faces incrementally: `up'/`down'"))
  (define-key menu-bar-doremi-menu [doremi-all-faces-bg+]
    '(menu-item "All Faces - Background..." doremi-all-faces-bg+
      :help "Change background color of all faces incrementally: `up'/`down'"))
  (define-key menu-bar-doremi-menu [doremi-undo-last-face-change]
    '(menu-item "Undo Face Color Change" doremi-undo-last-face-change
      :enable (facep 'doremi-last-face) ; Actually, it's always non-nil.
      :help "Undo the last face color change by Do Re Mi"))
  (define-key menu-bar-doremi-menu [doremi-face-fg-color-name+]
    '(menu-item "Face Foreground Name..." doremi-face-fg-color-name+
      :help "Change foreground color name of a face incrementally: `up'/`down'"))
  (define-key menu-bar-doremi-menu [doremi-face-fg+]
    '(menu-item "Face Foreground..." doremi-face-fg+
      :help "Change foreground color of a face incrementally: `up'/`down'"))
  (define-key menu-bar-doremi-menu [doremi-face-bg-color-name+]
    '(menu-item "Face Background Name..." doremi-face-bg-color-name+
      :help "Change background color name of a face incrementally: `up'/`down'"))
  (define-key menu-bar-doremi-menu [doremi-face-bg+]
    '(menu-item "Face Background..." doremi-face-bg+
      :help "Change background color of a face incrementally: `up'/`down'"))
  (define-key menu-bar-doremi-menu [doremi-frame-vertically+]
    '(menu-item "Move Frame" doremi-frame-vertically+
      :help "Move frame incrementally: `up'/`down'/`left'/`right'"))
  (define-key menu-bar-doremi-menu [doremi-frame-height+]
    '(menu-item "Frame Size" doremi-frame-height+
      :help "Resize frame incrementally: `up'/`down'/`left'/`right'"))


 TO DO?

   1. Factor out more common stuff between foreground and background.
   2. Make it easy to turn on and off doremi-push-frame-config stuff.
   3. Integrate more with Customize.
