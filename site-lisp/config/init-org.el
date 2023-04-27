
;;; Require
(require 'bytx)

;;; Settings
(setq org-startup-truncated t) ;; 长行换行

;; font-lock hook
(add-hook 'org-mode-hook #'turn-on-font-lock)
;;(setq org-agenda-restore-windows-after-quit t)
;;(setq org-agenda-restore-windows-after-submit nil)
;;(add-hook 'org-mode-hook 'org-hide-block-all)

;;(setq org-startup-folded t)                  ; 默认全部折叠
(add-hook 'org-mode-hook #'visual-line-mode) ;; 为org添加长行折行

;; vaign,用于对齐表格
                                        ;(add-hook 'org-mode-hoobk #'valign-mode)

;; (require 'bytx-org-insert-image-from-clipboard) ;; 从剪切板复制图片


;; (require 'init-xenops) ;; 数学公式渲染

(require 'org)
(require 'posframe)

(defvar org-preview-image-link-posframe--tmp-buf " opilp-tmp-buf")

(defun org-preview-image-link-posframe (point)
  (interactive "d")
  (posframe-delete-all)
  (let* ((context
          (plist-get (car (cdr (org-element-lineage
                                (org-element-context)
                                '(link)
                                t))) ':raw-link))
         (point (save-excursion
                  (widen)
                  (goto-char (point-min))
                  (re-search-forward (concat "#\\+name:\s*" context) nil t)
                  (re-search-forward org-bracket-link-regexp nil t)))
         (path (save-excursion
                 (widen)
                 (goto-char point)
                 (let* ((element (org-element-context))
                        (path (expand-file-name (org-element-property :path element))))
                   (with-current-buffer
                       (get-buffer-create org-preview-image-link-posframe--tmp-buf)
                     (erase-buffer)
                     (insert-image (create-image path 'png nil :width 300))
                     (image-mode)))))))
  (when (posframe-workable-p)
    (posframe-show org-preview-image-link-posframe--tmp-buf
                   :position (point))))

(provide 'init-org)
