(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (add-to-list 'package-archives
;;              '("elpa" . "http://tromey.com/elpa/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages 
  '(
    auto-complete
    auto-dictionary
    browse-kill-ring
    dired+
    dsvn
    elisp-slime-nav
    find-file-in-project
    findr
    flymake
    flymake-haml
    flymake-ruby
    flymake-sass
    fuzzy
    fuzzy-match
    haml-mode
    htmlize
    httpcode
    idle-highlight-mode
    ido-ubiquitous
    inf-ruby
    inflections
    ipython
    jump
    less
    less-css-mode
    magit
    mode-compile
    openwith
    paredit
    popup
    project
    pymacs
    python-mode
    rinari
    ruby-mode
    ruby-compilation
    rspec-mode
    rvm
    sass-mode
    scpaste
    scratch
    shell-here
    smex
    solarized-theme
    starter-kit
    starter-kit-bindings
    starter-kit-eshell
    starter-kit-js
    starter-kit-lisp
    starter-kit-ruby
    yaml-mode
    yasnippet
    yasnippet-bundle
    )
 "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
 (when (not (package-installed-p p))
   (package-install p)))

(load-file "~/.emacs.d/default.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector [solarized-bg red green yellow blue magenta cyan solarized-fg])
 '(custom-safe-themes (quote ("501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "72cc9ae08503b8e977801c6d6ec17043b55313cda34bcf0e6921f2f04cf2da56" default)))
 '(fci-rule-color "#073642"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
