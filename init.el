(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (add-to-list 'package-archives
;;              '("elpa" . "http://tromey.com/elpa/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packages to be installed on startup (if they are missing)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar starter-kit-core-packages
  '(starter-kit
    starter-kit-bindings
    starter-kit-eshell
    starter-kit-js
    starter-kit-lisp
    starter-kit-ruby))

(defvar python-packages
  '(pymacs
    python-mode
    ipython))

(defvar ruby-packages
  '(haml-mode
    htmlize
    inf-ruby
    less
    less-css-mode
    rinari
    rspec-mode
    ruby-compilation
    ruby-mode
    rvm
    sass-mode
    yaml-mode
    yari
    yasnippet
    yasnippet-bundle))

(defvar misc-packages 
  '(auto-complete
    auto-dictionary
    anything
    anything-complete
    anything-config
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
    htmlize
    httpcode
    idle-highlight-mode
    ido-ubiquitous
    inflections
    jump
    magit
    mode-compile
    openwith
    paredit
    popup
    project
    scpaste
    scratch
    shell-here
    smex
    solarized-theme))

(defvar my-packages `())
(append my-packages starter-kit-core-packages)
(append my-packages ruby-packages)
(append my-packages python-packages)
(append my-packages misc-packages)

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
