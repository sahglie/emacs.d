;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KEY MAPPINGS                                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar glie-keys-minor-mode-map (make-keymap) "glie-keys-minor-mode keymap")

;; POINT MOVEMENT
(define-key glie-keys-minor-mode-map (kbd "C-M-k") 'kill-word)
(define-key glie-keys-minor-mode-map (kbd "C-j")   'backward-char)
(define-key glie-keys-minor-mode-map (kbd "M-j")   'backward-word)
(define-key glie-keys-minor-mode-map (kbd "C-l")   'forward-char)
(define-key glie-keys-minor-mode-map (kbd "M-l")   'forward-word)
(define-key glie-keys-minor-mode-map (kbd "M-p")   'scroll-down)
(define-key glie-keys-minor-mode-map (kbd "M-n")   'scroll-up)
(define-key glie-keys-minor-mode-map (kbd "M-s")   'save-buffer)
(define-key glie-keys-minor-mode-map (kbd "C-S-l") 'recenter)
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

;; for some reason these bindings causes errors
;(define-key glie-keys-minor-mode-map (kbd "C-]")   'end-of-defun)
;(define-key glie-keys-minor-mode-map (kbd "C-[")   'beginning-of-defun)


;; WINDOW CONTROL
(define-key glie-keys-minor-mode-map (kbd "M-1") 'delete-window)
(define-key glie-keys-minor-mode-map (kbd "M-2") 'split-window-horizontally)
(define-key glie-keys-minor-mode-map (kbd "M-3") 'split-window-vertically)
(define-key glie-keys-minor-mode-map (kbd "C-o") 'other-window)

(define-key glie-keys-minor-mode-map (kbd "C-S-l") 'windmove-right)
(define-key glie-keys-minor-mode-map (kbd "C-S-j") 'windmove-left)
(define-key glie-keys-minor-mode-map (kbd "C-S-p") 'windmove-up)
(define-key glie-keys-minor-mode-map (kbd "C-S-n") 'windmove-down)

;; General aliases
(define-key glie-keys-minor-mode-map (kbd "C-x g") 'goto-line)
(define-key glie-keys-minor-mode-map (kbd "C-x ttl") 'toggle-truncate-lines)
(define-key glie-keys-minor-mode-map (kbd "M-5") 'query-replace-regexp)
(define-key glie-keys-minor-mode-map (kbd "C-S-w") 'er/expand-region)

;; Navigate the mark ring
(define-key glie-keys-minor-mode-map (kbd "C-c j") 'marker-visit-prev)
(define-key glie-keys-minor-mode-map (kbd "C-c l") 'marker-visit-next)

;; This breaks M-x (leaving this here as reminder to never try to define
;; custome bindings this way:
;; (define-key glie-keys-minor-mode-map (kbd "M-x rb") 'rename-buffer)

;; MODE SHORTCUTS
(define-key glie-keys-minor-mode-map (kbd "C-x cua") 'cua-mode)
(define-key glie-keys-minor-mode-map (kbd "C-x ; k") 'compile)
(define-key glie-keys-minor-mode-map (kbd "C-x fsm") 'flyspell-mode)
;(define-key glie-keys-minor-mode-map (kbd "C-x sh") 'named-shell-buffer)
(define-key glie-keys-minor-mode-map (kbd "C-x sh") 'shell-here)
(define-key glie-keys-minor-mode-map (kbd "C-x ln") 'linum-mode)
(define-key glie-keys-minor-mode-map (kbd "C-x ws") 'global-whitespace-newline-mode)
(define-key glie-keys-minor-mode-map (kbd "C-x C-M-f") 'rinari-find-file-in-project)

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

;; Only applies to emacs 23
(setq mac-command-modifier 'meta)


;; comint keys
; (require 'comint)
; (define-key comint-mode-map (kbd "M-n") 'comint-next-matching-input-from-input)
; (define-key comint-mode-map (kbd "M-p") 'comint-previous-matching-input-from-input)

;; Case Sensitive CTAGS searching
(set-default 'case-fold-search nil)

;; (global-set-key (kbd "C-c si") 'snippet-insert)

;; Magit
(defalias 'gs 'magit-status)

(add-hook 'minibuffer-setup-hook 'glie-minibuffer-setup-hook)
(add-hook 'text-mode-hook 'turn-off-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)
(setq visible-bell t)
(setq-default fill-column 9000)
