(add-to-list 'load-path "~/.emacs.d/vendor/rhtml")
(require 'rhtml-mode)

(add-hook 'rspec-mode-hook '(lambda ()
                              (setq rspec-use-rake-flag nil)))
