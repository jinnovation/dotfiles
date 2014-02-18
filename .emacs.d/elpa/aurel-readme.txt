The package provides an interface for searching, getting information
and downloading packages from the Arch User Repository (AUR)
<https://aur.archlinux.org/>.

To manually install the package, add the following to your init-file:

  (add-to-list 'load-path "/path/to/aurel-dir")
  (autoload 'aurel-package-info "aurel" nil t)
  (autoload 'aurel-package-search "aurel" nil t)
  (autoload 'aurel-maintainer-search "aurel" nil t)

Also set a directory where downloaded packages will be put:

  (setq aurel-download-directory "~/aur")

To search for packages, use `aurel-package-search' or
`aurel-maintainer-search' commands.  If you know the name of a
package, use `aurel-package-info' command.

Information about the packages is represented in a list-like buffer
similar to a buffer containing emacs packages.  To get more info
about a package, press "RET" on a package line.  To download a
package, press "d" (don't forget to set `aurel-download-directory'
before).

For full description, see <http://github.com/alezost/aurel>.
