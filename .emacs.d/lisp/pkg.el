(provide 'pkg)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

; list the packages you want
(setq package-list '(
                     neotree
                     js2-mode
                     lua-mode
                     protobuf-mode
		     php-mode
                     auto-complete
		     auto-complete-clang
		     fuzzy
		     popup
		     pos-tip
		     yasnippet
                     ))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
