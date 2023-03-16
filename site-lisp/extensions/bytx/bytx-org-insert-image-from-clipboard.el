(defun insert-image-from-clipboard ()
  "从剪切板插入图片到路径,并将其插入到当前位置.
Insert an image or GIF from the clipboard to the current point in org-mode."
  (interactive)
  (let ((image-file(read-file-name "Save image to: ")))
    (shell-command (concat "pngpaste " image-file))
    (if (file-exists-p image-file)
        (org-insert-link nil (concat "file:" image-file) "")
      (message "No image found in the clipboard."))))



(provide 'bytx-org-insert-image-from-clipboard)
