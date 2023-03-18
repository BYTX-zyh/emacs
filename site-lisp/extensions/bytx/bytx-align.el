
(defun smart-align ()
  (interactive)
  (with-demoted-errors
      "Something wrong when align."
    (let ((align-start
           (save-excursion
             (backward-up-list)
             (point)
             ))
          (align-end
           (save-excursion
             (up-list)
             (point))))
      (align-regexp align-start align-end "\\(\\s-*\\)\\(=\\|:\\)" 1 1))))

(provide 'bytx-align)
