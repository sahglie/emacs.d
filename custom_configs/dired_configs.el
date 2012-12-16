(setq dired-dwim-target t) ; copy file or dir from pane1 to pane2
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'top)
(setq dired-omit-files "^\\...+$")

(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")))

(add-hook 'dired-mode-hook
          (lambda ()
            (dired-omit-mode 1)            
            (define-key dired-mode-map (kbd "C-.") 'dired-omit-mode)
            (define-key dired-mode-map [C-right] 'dired-view-file)
            (define-key dired-mode-map [C-left] 'View-quit)
            (define-key dired-mode-map [right] 'dired-advertised-find-file)
            (define-key dired-mode-map [left] 'dired-up-directory)
            (define-key dired-mode-map (kbd "u") 'dired-up-directory)))

