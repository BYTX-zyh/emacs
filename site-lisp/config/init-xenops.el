;;; xenops 数学公式渲染

;; require
(require 'xenops)


;; hook

(add-hook 'latex-mode-hook #'xenops-mode)
(add-hook 'LaTeX-mode-hook #'xenops-mode)
(add-hook 'org-mode-hook #'xenops-mode)

(setq xenops-font-height 300)
(setq xenops-font-height-code 150)
(setq xenops-math-image-scale-factor 1.8)
(setq xenops-cache-directory "~/.config/emacs/xenops/cache")


(provide 'init-xenops)
;;; init-xenops ends here
