;; FUNCTION DEFINITIONS
;; (defun named-shell-buffer (id)
;;   "Create a new shell with buffer name shell-ID"
;;   (interactive "sIdentify the shell: ")
;;    (save-excursion
;;      (shell)
;;      (set-buffer "*shell*")
;;      (rename-buffer (concat "shell-" id))))


 (setq shell-prompt-function
  (lambda nil " $ "))
