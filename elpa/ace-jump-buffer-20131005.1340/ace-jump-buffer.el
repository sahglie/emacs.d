;;; ace-jump-buffer.el --- fast buffer switching extension to `ace-jump-mode'
;;
;; Copyright 2013 Justin Talbott
;;
;; Author: Justin Talbott <justin@waymondo.com>
;; URL: https://github.com/waymondo/ace-jump-buffer
;; Version: 20131005.1340
;; X-Original-Version: 0.1.1
;; Package-Requires: ((ace-jump-mode "1.0"))
;;
;;
;; Installation:
;;
;;   (require 'ace-jump-buffer)
;;   then bind `ace-jump-buffer' to something useful
;;

(require 'bs)
(require 'ace-jump-mode)

;; cache any initial `bs' settings
(defvar ajb-initial-bs-header-lines-length bs-header-lines-length)
(defvar ajb-initial-bs-max-window-height bs-max-window-height)
(defvar ajb-initial-bs-attributes-list bs-attributes-list)
(defvar ajb-initial-bs-configuration bs-current-configuration)

;; cache current ace jump mode scope
(defvar ajb-initial-ace-jump-mode-scope ace-jump-mode-scope)
(defvar ajb-initial-ace-jump-mode-gray-background ace-jump-mode-gray-background)

;; when `perspective' mode is found and loaded, add a `bs-configuration' for it
(when (require 'perspective nil 'noerror)
  (add-to-list 'bs-configurations
               '("persp" nil nil nil
                 (lambda (buf)
                   (with-current-buffer buf
                     (not (member buf (persp-buffers persp-curr)))))) nil))

(defvar ajb-bs-configuration
  (if (and (require 'perspective nil 'noerror) (not (eq persp-mode nil)))
      "persp"
    "all"))

;; settings for a barebones `bs' switcher
(defvar ajb-bs-header-lines-length 0)
(defvar ajb-bs-max-window-height 27)
(defvar ajb-bs-attributes-list (quote (("" 2 2 left " ")
                                       ("" 1 1 left bs--get-marked-string)
                                       ("" 1 1 left " ")
                                       ("Buffer" bs--get-name-length 10 left bs--get-name))))

(defadvice bs--show-header (around maybe-disable-bs-header)
  "Don't show the `bs' header when doing `ace-jump-buffer'"
  (if nil ad-do-it))

(defun ace-jump-buffer-turn-on ()
  (add-hook 'ace-jump-mode-end-hook 'ace-jump-buffer-hook)
  (ad-activate 'bs--show-header)
  (setq ace-jump-mode-scope 'window)
  (setq ace-jump-mode-gray-background nil)
  (setq bs-header-lines-length ajb-bs-header-lines-length)
  (setq bs-max-window-height ajb-bs-max-window-height)
  (setq bs-attributes-list ajb-bs-attributes-list))

(defun ace-jump-buffer-turn-off ()
  (remove-hook 'ace-jump-mode-end-hook 'ace-jump-buffer-hook)
  (ad-deactivate 'bs--show-header)
  (setq ace-jump-mode-scope ajb-initial-ace-jump-mode-scope)
  (setq ace-jump-mode-gray-background ajb-initial-ace-jump-mode-gray-background)
  (setq bs-header-lines-length ajb-initial-bs-header-lines-length)
  (setq bs-max-window-height ajb-initial-bs-max-window-height)
  (setq bs-attributes-list ajb-initial-bs-attributes-list))

(defun ace-jump-buffer-hook ()
  "On the end of ace jump, select the buffer at the current line."
  (when (string-match (buffer-name) "*buffer-selection*")
    (bs-select)
    (ace-jump-buffer-turn-off)))

;;;###autoload
(defun ace-jump-buffer ()
  "Quickly hop between buffers with `ace-jump-mode'"
  (interactive)
  (ace-jump-buffer-turn-on)
  (bs--show-with-configuration ajb-bs-configuration)
  (push-mark)
  (goto-char (point-min))
  (set (make-local-variable 'ace-jump-mode-scope) 'window)
  (call-interactively 'ace-jump-line-mode)
  (define-key overriding-local-map (kbd "C-g") 'ace-jump-buffer-exit)
  (define-key overriding-local-map [t] 'ace-jump-buffer-exit))

(defun ace-jump-buffer-exit ()
  (interactive)
  (if (string-match (buffer-name) "*buffer-selection*")
      (progn
        (when ace-jump-current-mode (ace-jump-done))
        (ace-jump-buffer-turn-off)
        (bs-kill)
        (kill-buffer "*buffer-selection*"))
    (let* ((ace-jump-mode nil)
           (original-func (key-binding (kbd "C-g"))))
      (call-interactively original-func))))

(provide 'ace-jump-buffer)
;;; ace-jump-buffer.el ends here
