;;; olivetti

;;; Require
(require 'olivetti)

;;; Code

(dolist (hook (list
               'Info-mode-hook
               'rcirc-mode-hook
               ))
  (add-hook hook
            #'(lambda ()
                (olivetti-mode 1)
                (olivetti-set-width 120)
                )))

(dolist (hook (list
               'markdown-mode-hook
               'org-mode-hook
               ))
  (add-hook hook
            #'(lambda ()
                (when (buffer-file-name)
                  (unless (string-prefix-p "README" (file-name-base (buffer-file-name)))
                    (olivetti-mode 1)
                    (olivetti-set-width 120))))))


(defun auto-olivetti ()
  "检查当前是否为唯一窗口,根据其mode选择是否为其启动 olivetti"
  (when (eq (length (window-list)) 1)
      (olivetti-mode 1)
      (olivetti-set-width 120)
      ))

(add-hook 'window-configuration-change-hook #'auto-olivetti)
(dolist (hook (list
               'org-mode-hook
               'emacs-lisp-mode-hook
               'c-ts-mode-hook
               'c++-ts-mode-hook))
  (add-hook hook #'auto-olivetti))

(provide 'init-olivetti)
