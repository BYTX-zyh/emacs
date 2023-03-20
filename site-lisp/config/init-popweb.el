;;; popweb
(require 'popweb-latex)
(add-hook 'latex-mode-hook #'popweb-latex-mode)

(require 'popweb-dict) 
(provide 'init-popweb)