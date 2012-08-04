;; To modify the keybindings, use the ido-setup-hook.  For example:
(add-hook 'ido-setup-hook 'ido-my-keys)
(defun ido-my-keys ()
 "Add my keybindings for ido."
 (define-key ido-completion-map "C-l" 'ido-next-match)
 (define-key ido-completion-map "C-j" 'ido-prev-match) 
)

