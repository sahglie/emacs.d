;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KEY MAPPINGS                                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar glie-keys-minor-mode-map (make-keymap) "glie-keys-minor-mode keymap")

;; POINT MOVEMENT
(define-key glie-keys-minor-mode-map (kbd "C-\\") 'indent-for-tab-command)
(define-key glie-keys-minor-mode-map (kbd "C-M-k") 'kill-word)
(define-key glie-keys-minor-mode-map (kbd "C-j")   'backward-char)
(define-key glie-keys-minor-mode-map (kbd "M-j")   'backward-word)
(define-key glie-keys-minor-mode-map (kbd "C-l")   'forward-char)
(define-key glie-keys-minor-mode-map (kbd "M-l")   'forward-word)
(define-key glie-keys-minor-mode-map (kbd "M-p")   'scroll-down)
(define-key glie-keys-minor-mode-map (kbd "M-n")   'scroll-up)
(define-key glie-keys-minor-mode-map (kbd "M-m")   'recenter)
(define-key glie-keys-minor-mode-map (kbd "M-]")   'end-of-buffer)
(define-key glie-keys-minor-mode-map (kbd "M-[")   'beginning-of-buffer)
(define-key glie-keys-minor-mode-map (kbd "C-M-j") 'backward-sexp)
(define-key glie-keys-minor-mode-map (kbd "C-M-l") 'forward-sexp)

(define-key glie-keys-minor-mode-map (kbd "C-S-c C-S-c") 'mc/edit-lines)
(define-key glie-keys-minor-mode-map (kbd "C-S-c C-e") 'mc/edit-ends-of-lines)
(define-key glie-keys-minor-mode-map (kbd "C-S-c C-a") 'mc/edit-beginnings-of-lines)
(define-key glie-keys-minor-mode-map (kbd "C->") 'mc/mark-next-like-this)
(define-key glie-keys-minor-mode-map (kbd "C-<") 'mc/mark-previous-like-this)
(define-key glie-keys-minor-mode-map (kbd "C-c C-<") 'mc/mark-all-like-this)
(define-key glie-keys-minor-mode-map (kbd "H-SPC") 'set-rectangular-region-anchor)

;; For some reason these bindings causes errors
(define-key glie-keys-minor-mode-map (kbd "C-M-]")   'end-of-defun)
(define-key glie-keys-minor-mode-map (kbd "C-M-[")   'beginning-of-defun)


;; WINDOW CONTROL
(define-key glie-keys-minor-mode-map (kbd "C-1") 'delete-window)
(define-key glie-keys-minor-mode-map (kbd "C-2") 'split-window-vertically)
(define-key glie-keys-minor-mode-map (kbd "C-3") 'split-window-horizontally)
(define-key glie-keys-minor-mode-map (kbd "C-o") 'other-window)

(define-key glie-keys-minor-mode-map (kbd "C-S-l") 'windmove-right)
(define-key glie-keys-minor-mode-map (kbd "C-S-j") 'windmove-left)
(define-key glie-keys-minor-mode-map (kbd "C-S-p") 'windmove-up)
(define-key glie-keys-minor-mode-map (kbd "C-S-n") 'windmove-down)

;; General aliases
(define-key glie-keys-minor-mode-map (kbd "C-x g") 'goto-line)
(define-key glie-keys-minor-mode-map (kbd "M-5") 'query-replace-regexp)
(define-key glie-keys-minor-mode-map (kbd "C-S-w") 'er/expand-region)

;; Navigate the mark ring
(define-key glie-keys-minor-mode-map (kbd "C-c j") 'marker-visit-prev)
(define-key glie-keys-minor-mode-map (kbd "C-c l") 'marker-visit-next)

;; MODE SHORTCUTS
(define-key glie-keys-minor-mode-map (kbd "C-x cua") 'cua-mode)
(define-key glie-keys-minor-mode-map (kbd "C-x ; k") 'compile)
(define-key glie-keys-minor-mode-map (kbd "C-x fsm") 'flyspell-mode)
;(define-key glie-keys-minor-mode-map (kbd "C-x sh") 'named-shell-buffer)
(define-key glie-keys-minor-mode-map (kbd "C-x sh") 'shell-here)
(define-key glie-keys-minor-mode-map (kbd "C-x ln") 'linum-mode)
(define-key glie-keys-minor-mode-map (kbd "C-x ws") 'global-whitespace-newline-mode)

;;(define-key glie-keys-minor-mode-map (kbd "C-S-p") 'projectile-find-file)
;;(define-key glie-keys-minor-mode-map (kbd "C-S-b") 'projectile-switch-to-buffer)

(define-key glie-keys-minor-mode-map (kbd "C-S-f") 'ffip)
(define-key glie-keys-minor-mode-map (kbd "M-f") 'traverse-deep-rfind)
(define-key glie-keys-minor-mode-map (kbd "C-x b") 'ido-switch-buffer)
(define-key glie-keys-minor-mode-map (kbd "C-x j") 'ido-switch-buffer)
(define-key glie-keys-minor-mode-map (kbd "C-c ,s") 'rspec-verify-single)
(define-key glie-keys-minor-mode-map (kbd "C-/") 'hippie-expand)

;; Ropemacs
(define-key glie-keys-minor-mode-map (kbd "C-c g") 'rope-goto-definition)


(define-minor-mode glie-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " glie-keys" 'glie-minor-mode-map)

(glie-keys-minor-mode 1)

(defun glie-minibuffer-setup-hook ()
  (glie-keys-minor-mode 0))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Need to refactor following bindings as they are not part of glie keys mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq mac-command-modifier 'meta)
(setq x-select-enable-clipboard t)

;; Case Sensitive CTAGS searching
(set-default 'case-fold-search nil)

;; (global-set-key (kbd "C-c si") 'snippet-insert)

;; Random Aliases
(defalias 'plp 'package-list-packages)
(defalias 'gs 'magit-status)
(defalias 'dw 'downcase-word)
(defalias 'uw 'upcase-word)
(defalias 'rb 'rename-buffer)
(defalias 'lm 'linum-mode)
(defalias 'bi 'bundle-install)
(defalias 'ttl 'toggle-truncate-lines)
(defalias 'tm 'menu-bar-mode)
;; (defalias 'sw 'helm-swap-windows)

(add-hook 'minibuffer-setup-hook 'glie-minibuffer-setup-hook)
(add-hook 'text-mode-hook 'turn-off-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)
(setq visible-bell t)
(setq-default fill-column 9000)
