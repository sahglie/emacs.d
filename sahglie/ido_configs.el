;; To modify the keybindings, use the ido-setup-hook.  For example:
(add-hook 'ido-setup-hook 'ido-my-custom-configs)

(defun ido-my-custom-configs ()
  "Add my keybindings for ido."
  ;; (define-key ido-completion-map "C-l" 'ido-next-match)
  ;; (define-key ido-completion-map "C-j" 'ido-prev-match)
(custom-set-variables
 '(ido-auto-merge-work-directories-length nil)
 '(ido-create-new-buffer (quote always))
 '(ido-enable-flex-matching t)
 '(ido-max-prospects 20)
 '(ido-mode (quote both) nil (ido))))

