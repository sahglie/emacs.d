;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Rinari and IDO (http://www.emacswiki.org/emacs/InteractivelyDoThings)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(add-to-list 'load-path "~/.emacs.d/vendor/rhtml")
;(require 'rinari)
;(require 'rhtml-mode)
;(add-hook 'rhtml-mode-hook (lambda () (rinari-launch)))
;(define-key rinari-minor-mode-map (kbd "C-x rws") 'rinari-web-server)

;; Shortcuts for opening dired mode to common directories in a rails app
;(defun rinari-dired-to (name)
;  (dired (concat (rinari-root) name)))

;(defun rinari-dired-to-root () (interactive) (rinari-dired-to ""))
;(defun rinari-dired-to-app ()  (interactive) (rinari-dired-to "app"))
;(defun rinari-dired-to-controllers () (interactive) (rinari-dired-to "app/controllers/"))
;(defun rinari-dired-to-models () (interactive) (rinari-dired-to "app/models/"))
;(defun rinari-dired-to-views () (interactive) (rinari-dired-to "app/views/"))
;(defun rinari-dired-to-helpers () (interactive) (rinari-dired-to "app/helpers/"))
;(defun rinari-dired-to-config () (interactive) (rinari-dired-to "config"))
;(defun rinari-dired-to-db () (interactive) (rinari-dired-to "db"))
;(defun rinari-dired-to-lib () (interactive) (rinari-dired-to "lib"))
;(defun rinari-dired-to-log () (interactive) (rinari-dired-to "log"))
;(defun rinari-dired-to-specs () (interactive) (rinari-dired-to "spec/"))
;(defun rinari-dired-to-public () (interactive) (rinari-dired-to "public"))
;(defun rinari-dired-to-javascripts () (interactive) (rinari-dired-to "public/javascripts/"))
;(defun rinari-dired-to-stylesheets () (interactive) (rinari-dired-to "public/stylesheets/"))
;(defun rinari-dired-to-vendor () (interactive) (rinari-dired-to "vendor"))

;(define-key glie-keys-minor-mode-map (kbd "C-c ; j r") 'rinari-dired-to-root)
;(define-key glie-keys-minor-mode-map (kbd "C-c ; j a") 'rinari-dired-to-app)
;(define-key glie-keys-minor-mode-map (kbd "C-c ; j c") 'rinari-dired-to-controllers)
;(define-key glie-keys-minor-mode-map (kbd "C-c ; j m") 'rinari-dired-to-models)
;(define-key glie-keys-minor-mode-map (kbd "C-c ; j v") 'rinari-dired-to-views)
;(define-key glie-keys-minor-mode-map (kbd "C-c ; j h") 'rinari-dired-to-helpers)
;(define-key glie-keys-minor-mode-map (kbd "C-c ; j n") 'rinari-dired-to-config)
;(define-key glie-keys-minor-mode-map (kbd "C-c ; j o") 'rinari-dired-to-log)
;(define-key glie-keys-minor-mode-map (kbd "C-c ; j l") 'rinari-dired-to-lib)
;(define-key glie-keys-minor-mode-map (kbd "C-c ; j p") 'rinari-dired-to-public)
;(define-key glie-keys-minor-mode-map (kbd "C-c ; j e") 'rinari-dired-to-vendor)
;(define-key glie-keys-minor-mode-map (kbd "C-c ; j s") 'rinari-dired-to-specs)
;(define-key glie-keys-minor-mode-map (kbd "C-c ; j y") 'rinari-dired-to-stylesheets)
;(define-key glie-keys-minor-mode-map (kbd "C-c ; j j") 'rinari-dired-to-javascripts)


;; (add-hook 'rinari-minor-mode-hook
;;           '(lambda ()
;;              (unless (or (equal 'dired-mode major-mode)
;;                          (equal 'shell-mode major-mode))
;;                (whitespace-mode "whitespace"))
;;              (setq whitespace-line-column 79)
;;              (setq whitespace-style
;;                    ;'(tabs newline space-mark tab-mark newline-mark lines)
;;                    '(newline lines))))
