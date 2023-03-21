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

(provide 'init-olivetti)
