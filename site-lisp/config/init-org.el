(require 'bytx)
(setq org-startup-truncated t) ;; 长行换行
;;(setq org-agenda-restore-windows-after-quit t)
;;(setq org-agenda-restore-windows-after-submit nil)
                                        ;(add-hook 'org-mode-hook 'org-hide-block-all)

                                        ;(setq org-startup-folded t)                  ; 默认全部折叠
(add-hook 'org-mode-hook #'visual-line-mode) ;; 为org添加长行折行

;; vaign,用于对齐表格
                                        ;(add-hook 'org-mode-hook #'valign-mode)

(require 'bytx-org-insert-image-from-clipboard) ;; 从剪切板复制图片

(require 'init-xenops) ;; 数学公式渲染
(add-hook 'org-mode-hook
          (lambda()
            ((run-with-idle-timer 2 nil (lambda() (xenops-dwim))))))

(setq org-latex-packages-alist
      '(("fontset=macnew,UTF8" "ctex" t)))

 (setq org-preview-latex-default-process 'imagemagick)

  (setq org-preview-latex-process-alist
  '(
    (dvisvgm
     :programs ("xelatex" "dvisvgm")
     :description "xdv > svg"
     :message "you need to install the programs: xelatex and dvisvgm."
     :image-input-type "xdv"
     :image-output-type "svg"
     :image-size-adjust (1.7 . 1.5)
     :latex-compiler ("xelatex --no-pdf -interaction nonstopmode -output-directory %o %f")
     :image-converter ("dvisvgm %f -n -b min -c %S -o %O"))
    (imagemagick
     :programs ("latex" "convert")
     :description "pdf > png"
     :message "you need to install the programs: xelatex and imagemagick."
     :image-input-type "pdf"
     :image-output-type "png"
     :image-size-adjust (1.0 . 1.0)
     :latex-compiler ("xelatex -interaction nonstopmode -output-directory %o %f")
     :image-converter
     ("convert -density %D -trim -antialias %f -quality 100 %O"))))


(provide 'init-org)
