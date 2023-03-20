;;; 中英文自动替换

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

(provide 'replace-char)