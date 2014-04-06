;; ruby-electric-mode Always gets called after ruby-mode is loaded so
;; configs go here instead of ruby-mode-hook

;; (add-hook 'ruby-mode-hook '(lambda ()))

(add-hook 'ruby-electric-mode-hook
          '(lambda ()
             (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
             (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
             (add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
             (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
             (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
             (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
             (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
             
             (define-key ruby-mode-map (kbd "C-j") 'backward-char)
             (define-key ruby-mode-map (kbd "C-x C-e") 'ruby-send-region)
             (define-key ruby-mode-map (kbd "M-m")   'recenter)
             ;; (define-key ruby-mode-map (kbd "C-m") 'recenter)
             
             (setq ruby-deep-arglist t)
             (setq ruby-deep-indent-paren nil)
             (setq c-tab-always-indent nil)
             
             (linum-mode t)
             (require 'ruby-compilation)))
