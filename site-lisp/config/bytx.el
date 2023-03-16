(defun indent-buffer ()
  "Automatic format current buffer."
  (interactive)
  (if (derived-mode-p 'python-mode)
      (message "Don't indent python buffer, it will mess up the code syntax.")
    (save-excursion
      (indent-region (point-min) (point-max) nil)
      (delete-trailing-whitespace)
      (untabify (point-min) (point-max)))))

(defun indent-comment-buffer ()
  "Indent comment of buffer."
  (interactive)
  (indent-comment-region (point-min) (point-max)))

(defun indent-comment-region (start end)
  "Indent region."
  (interactive "r")
  (save-excursion
    (setq end (copy-marker end))
    (goto-char start)
    (while (< (point) end)
      (if (comment-search-forward end t)
          (comment-indent)
        (goto-char end)))))

;; 刷新并加载
(defun bytx-refresh-file ()
  "Automatic reload current file."
  (interactive)
  (cond ((eq major-mode 'emacs-lisp-mode)
         (indent-buffer)
         (indent-comment-buffer)
         (save-buffer)
         (load-file (buffer-file-name)))
        ((member major-mode '(lisp-mode c-mode perl-mode))
         (indent-buffer)
         (indent-comment-buffer)
         (save-buffer))
        ((member major-mode '(haskell-mode sh-mode))
         (indent-comment-buffer)
         (save-buffer))
        ((derived-mode-p 'scss-mode)
         (require 'css-sort)
         (css-sort))
        (t (message "Current mode is not supported, so not reload"))))


;; 字符串替换函数，用于检测当前光标所在的词是否为 previous,如果是则修改为next
(defun bytx-replace-char (previous next)
  "Replace Chinese period with English period in org-mode."
  (interactive)
  (if (equal (string (preceding-char)) previous)
      (progn
        (delete-backward-char 1)
        (insert next))))


;; 批量字符串替换,调用方法例如 (bytx-replace-char-list '(("（" . "(") ("）" ")"  )  ))
(defun bytx-replace-char-list (data)
 ; "替换中英文字符串"
  (dolist (item data)
   (let ((previous (car item))
          (next (cdr item)))
     (bytx-replace-char previous next))))

(provide 'bytx)
