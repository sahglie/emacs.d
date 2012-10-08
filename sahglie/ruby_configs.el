(add-hook 'ruby-mode-hook
          '(lambda ()
             (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
             (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
             (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
             (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
             (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
             (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
             
             (define-key ruby-mode-map (kbd "C-j") 'backward-char)
             
             (setq ruby-deep-arglist t)
             (setq ruby-deep-indent-paren nil)
             (setq c-tab-always-indent nil)
             
             (linum-mode t)
             (require 'ruby-compilation)))


(add-hook 'ruby-electric-mode-hook
          '(lambda ()
             (define-key ruby-mode-map (kbd "C-j") 'backward-char)
             (linum-mode t)))
