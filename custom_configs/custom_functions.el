(defun runner-open-with()
  "Open the current file in desktop. Works in Mac OS X, Linux."
  (interactive)
  (cond
   ((string-equal system-type "darwin") (shell-command "open ."))
   ((string-equal system-type "gnu/linux") (shell-command "xdg-open ."))))

(global-set-key (kbd "C-c o") 'runner-open-with) 
