(require 'projectile)
(require 'projectile-rails)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-switch-project-action 'projectile-dired)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
