This program emulates nerd-commenter.vim by Marty Grenfell.

It help you comment/uncomment multiple lines without selecting them.

`M-x evilnc-default-hotkeys` assigns hotkey `M-;` to `evilnc-comment-or-uncomment-lines`

`M-x evilnc-comment-or-uncomment-lines` comment or uncomment lines.

`M-x evilnc-quick-comment-or-uncomment-to-the-line` will comment/uncomment from current line to
the specified line number. The last digit(s) of line number is parameter of the command.

For example, `C-u 9 evilnc-quick-comment-or-uncomment-to-the-line` will comment code from
current line to line 99 if you current line is 91.

Check README for more use cases.

Though this program could be used *independently*, I highly recommend you use it with
evil (http://gitorious.org/evil)

Evil makes you take advantage of power of Vi to comment lines in shocking speed.
For example, you can press key `99,ci` to comment out 99 lines.
