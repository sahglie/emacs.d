(add-hook 'paredit-mode-hook
          '(lambda ()
             (define-key paredit-mode-map (kbd "C-j")   'backward-char)))


