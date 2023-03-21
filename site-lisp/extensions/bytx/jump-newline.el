(require 'treesit)

(defun jump-to-next-close-brace ()
  "跳转到下一个 }，并打开新行"
  (interactive)
  (let ((closing-pos (save-excursion
                       (search-forward "}" nil t))))
    (when closing-pos
      (goto-char closing-pos)
      (forward-char)
      (newline-and-indent))))


(provide 'jump-newline)
