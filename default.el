(load-theme 'solarized-dark t)
(blink-cursor-mode t)
;;(set-face-attribute 'default nil :height 108)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; For IRC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'erc)

(defun djcb-erc-start-or-switch ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (if (get-buffer "irc.freenode.net:6667") ;; ERC already active?

    (erc-track-switch-buffer 1) ;; yes: switch to last active
    (when (y-or-n-p "Start ERC? ") ;; no: maybe start ERC
      (erc :server "irc.freenode.net" :port 6667 :sahglie "foo" :full-name "Steven Hansen"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tramp (http://www.gnu.org/software/tramp)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'tramp)
(setq tramp-default-method "scp")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; UCB Scheme (http://inst.eecs.berkeley.edu/~instcd/inst-cd/mac/stk/index.html)
; http://www-inst.eecs.berkeley.edu/~scheme/precompiled/OSX/
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-to-list 'load-path "~/.emacs.d/vendor/STk/lisp")
;; (add-to-list 'load-path "/usr/local/lib/stk")
;; (add-to-list 'load-path "/usr/local/lib/stk/site-scheme")
;; (add-to-list 'load-path "/usr/local/lib/stk/slib")
;; (require 'stkdb)
(setq scheme-program-name "stk-simply")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; yasnippet
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/elpa/yasnippet-0.6.1/snippets")
(setq yas/use-menu 1)
(yas/load-directory "~/.emacs.d/vendor/snippets/yasnippets-rails")
(keyboard-translate ?\C-i ?\H-i)
(global-set-key [?\H-i] 'yas/expand)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Travserselisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-file "~/.emacs.d/vendor/traverselisp.el")
(setq traverse-use-avfs t)
(global-set-key (kbd "<f12> f") 'traverse-deep-rfind)
(global-set-key (kbd "<f12> u") 'traverse-build-tags-in-project)
(global-set-key (kbd "C-c t") 'traverse-dired-search-regexp-in-anything-at-point)
(global-set-key (kbd "C-c C-z") 'traverse-dired-browse-archive)
(add-to-list 'traverse-ignore-files ".ledger-cache")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DSVN: SVN for Emacs (more effcient than PSVN)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'svn-status "dsvn" "Run `svn status'." t)
(autoload 'svn-update "dsvn" "Run `svn update'." t)
(require 'vc-svn)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flyspell
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; python-mode (https://launchpad.net/python-mode )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; NOTE: don't change the order of these declarations or ipython wont
;; work correctly
(setq py-shell-name "ipython3")
(setq py-load-pymacs-p nil)

(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(autoload 'python-mode "python-mode" "Python Mode." t)
(setq ipython-command "~/.pythonbrew/pythons/Python-3.2.3/bin/ipython3")
(setq py-python-command "~/.pythonbrew/pythons/Python-3.2.3/bin/ipython3")

(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(setq py-python-command-args '("--colors=linux"))
(require 'ipython)


; (setenv "PYMACS_PYTHON" "~/.pythonbrew/pythons/Python-2.7.2/bin/python")
; (autoload 'pymacs-apply "pymacs")
; (autoload 'pymacs-call "pymacs")
; (autoload 'pymacs-eval "pymacs" nil t)
; (autoload 'pymacs-exec "pymacs" nil t)
; (autoload 'pymacs-load "pymacs" nil t)
; (require 'pymacs)
; (pymacs-load "ropemacs" "rope-")
; (setq ropemacs-enable-autoimport t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load java development tools
;;
;; place gjdb.el in (/Applications/Emacs.app/Contents/Resources/lisp) 
;; NOTE: gjdb ships with the gjdb.el emacs helper
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Having this enabled breaks ctags for ruby ...
;;
;; (add-to-list 'load-path "~/.emacs.d/vendor/gjdb/lisp/")
;; (require 'gjdb)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load ruby debugger
;; http://rubyforge.org/docman/?group_id=1900
;;
;; NOTE: on osx must install texlive (satisfies TeX requirement)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
;(require 'rdebug)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; browse-kill-ring 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(browse-kill-ring-default-keybindings)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; marker-visit.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/vendor")
(require 'marker-visit)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; shell-here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'shell-here)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Rinari (http://wikemacs.org/wiki/Rinari)
;;
;; Installation:
;; cd vendor/
;; git clone git://github.com/eschulte/rinari.git
;; cd rinari
;; git submodule init
;; git submodule update
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-to-list 'load-path "~/.emacs.d/vendor/rinari")
(require 'rinari)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Rspec (http://www.emacswiki.org/RspecMode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'rspec-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; auto-complete
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4/dict")
(ac-config-default)
(setq ac-auto-start 2)
(setq ac-ignore-case nil)
;;(add-to-list 'ac-sources 'ac-sources-yasnippet)
;;(define-key ac-menu-map "\C-n" 'ac-next)
;;(define-key ac-menu-map "\C-p" 'ac-previous)
(define-key ac-completing-map "\C-n" 'ac-next)
(define-key ac-completing-map "\C-p" 'ac-previous)

