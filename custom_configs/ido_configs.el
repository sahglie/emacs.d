;; To modify the keybindings, use the ido-setup-hook.  For example:
;; (add-hook 'ido-setup-hook 'ido-my-custom-configs)

;; (defun ido-my-custom-configs ()
;;   "Add my keybindings for ido."
;;   (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
;;   (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))


(custom-set-variables
 '(ido-auto-merge-work-directories-length nil)
 '(ido-create-new-buffer (quote always))
 '(ido-enable-flex-matching t)
 '(ido-max-prospects 30)
 '(ido-mode (quote both) nil (ido)))

(require 'flx-ido)
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(flx-ido-mode 1)
(setq flx-ido-use-faces nil)
