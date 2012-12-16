(add-hook 'paredit-mode-hook
          '(lambda ()
             (linum-mode 1)
             (define-key paredit-mode-map (kbd "C-j")   'backward-char)))


