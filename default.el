(add-to-list 'custom-theme-load-path "~/.emacs.d/vendor/color-themes")

(load-theme 'blackboard t)
(blink-cursor-mode t)
(menu-bar-mode)
(set-face-attribute 'default nil :height 110)

;; Enable copy and pasting from clipboard
(setq x-select-enable-clipboard t)

(set-face-attribute  'mode-line
                 nil 
                 :foreground "black"
                 :background "green" 
                 :box '(:line-width 1 :style released-button)
)

(set-face-attribute  'mode-line-inactive
                 nil 
                 :foreground "black"
                 :background "light gray"
                 :box '(:line-width 1 :style released-button)
)

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
      (erc :server "irc.freenode.net"
           :port 6667
           :sahglie "foo"
           :full-name "Steven Hansen"))))


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
;; (setq scheme-program-name "stk-simply")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; yasnippet
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/elpa/yasnippet-20131031.628/snippets")
(setq yas/use-menu 1)
(yas/load-directory "~/.emacs.d/vendor/snippets/yasnippets-rails")
;;(keyboard-translate ?\C-i ?\H-i)
(global-set-key [?\H-i] 'yas/expand)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Travserselisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-file "~/.emacs.d/vendor/traverselisp.el")
(setq traverse-use-avfs t)
;; (global-set-key (kbd "<f12> u") 'traverse-build-tags-in-project)
;; (global-set-key (kbd "C-c t") 'traverse-dired-search-regexp-in-anything-at-point)
;; (global-set-key (kbd "C-c C-z") 'traverse-dired-browse-archive)
(add-to-list 'traverse-ignore-files ".ledger-cache")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DSVN: SVN for Emacs (more effcient than PSVN)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (autoload 'svn-status "dsvn" "Run `svn status'." t)
;; (autoload 'svn-update "dsvn" "Run `svn update'." t)
(load-file "~/.emacs.d/vendor/psvn/psvn.el")
(require 'vc-svn)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flyspell
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; make sure to install ispell: `brew install ispell'
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; python-mode (https://launchpad.net/python-mode )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; NOTE: don't change the order of these declarations or ipython wont
;; work correctly
;;(setq py-shell-name "ipython3")
;;(setq py-load-pymacs-p nil)

;;(require 'python-mode)
;;(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;;(autoload 'python-mode "python-mode" "Python Mode." t)
;;(setq py-python-command "/usr/local/bin/python3")
;;(add-to-list 'interpreter-mode-alist '("python" . python-mode))
;;(setq py-python-command-args '("--colors=linux"))
;;(require 'ipython)


; (setq py-python-command "/usr/local/bin/python3")
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
(add-to-list 'load-path "~/.emacs.d/vendor/rdebug")
(require 'rdebug)

;; (autoload 'rubydb "rubydb3x" "Ruby debugger" t)
;; (add-hook 'ruby-mode-hook 'turn-on-font-lock)
;; (autoload 'rdebug "rdebug" "Ruby debugging support." t)
(global-set-key [f9] 'gud-step)
(global-set-key [f10] 'gud-next)
(global-set-key [f11] 'gud-cont)
(global-set-key "\C-c\C-d" 'rdebug)

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
(setq shell-here-open-buffer-function 'switch-to-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Rinari (http://wikemacs.org/wiki/Rinari)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
(define-key ac-completing-map "\C-n" 'ac-next)
(define-key ac-completing-map "\C-p" 'ac-previous)
;;(add-to-list 'ac-sources 'ac-sources-yasnippet)
;;(define-key ac-menu-map "\C-n" 'ac-next)
;;(define-key ac-menu-map "\C-p" 'ac-previous)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; helm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'helm-config)

(defun yari-helm (&optional rehash)
  (interactive (list current-prefix-arg))
  (when current-prefix-arg (yari-ruby-obarray rehash))
  (helm 'yari-anything-source-ri-pages (yari-symbol-at-point)))

(define-key 'help-command "R" 'yari-helm)

(helm-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Multiple-cursors (https://github.com/magnars/multiple-cursors.el)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'multiple-cursors)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Bundler w/rails
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'bundler)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Powerline
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'powerline)
;; (require 'cl)

;; (setq powerline-arrow-shape 'arrow)   ;; the default
;;(setq powerline-arrow-shape 'curve)   ;; give your mode-line curves
;;(setq powerline-arrow-shape 'arrow14)
;; best for small fonts

;; ;; You can change the mode-line color using the standard method:

;; (custom-set-faces
;;  '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
;;  '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))

;; ;;Additionally, you can modify directly in powerline.el:

;; (setq powerline-color1 "grey22")
;; (setq powerline-color2 "grey40")


