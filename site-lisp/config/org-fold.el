(require 'cl)
(require 'org)

(defun org-fold-get-fold-info-file-name ()
  (concat (buffer-file-name) ".fold"))

(defun org-fold-save ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (let (foldstates)
      (unless (looking-at outline-regexp)
        (outline-next-visible-heading 1))
      (while (not (eobp))
        (push (if (some (lambda (o) (overlay-get o 'invisible))
                        (overlays-at (line-end-position)))
                  t)
              foldstates)
        (outline-next-visible-heading 1))
      (with-temp-file (org-fold-get-fold-info-file-name)
        (prin1 (nreverse foldstates) (current-buffer))))))

(defun org-fold-restore ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (let* ((foldfile (org-fold-get-fold-info-file-name))
           (foldstates
            (if (file-readable-p foldfile)
                (with-temp-buffer
                  (insert-file-contents foldfile)
                  (read (current-buffer))))))
      (when foldstates
        (show-all)
        (goto-char (point-min))
        (unless (looking-at outline-regexp)
          (outline-next-visible-heading 1))
        (while (and foldstates (not (eobp)))
          (if (pop foldstates)
              (hide-subtree))
          (outline-next-visible-heading 1))
        (message "Restored saved folding state")))))

(add-hook 'org-mode-hook 'org-fold-activate)

(defun org-fold-activate ()
  (org-fold-restore)
  (add-hook 'kill-buffer-hook 'org-fold-kill-buffer nil t))

(defun org-fold-kill-buffer ()
  ;; don't save folding info for unsaved buffers
  (unless (buffer-modified-p)
    (org-fold-save)))

(provide 'org-fold)
