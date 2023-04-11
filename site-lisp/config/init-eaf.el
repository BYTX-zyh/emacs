;;; init-eaf.el --- eaf config

;;; Require
(require 'eaf)
(require 'eaf-org-previewer)
(require 'eaf-git)
(require 'eaf-pdf-viewer)
;;; Code:

(add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))
(add-to-list 'TeX-view-program-list '("eaf" eaf-pdf-synctex-forward-view))
(add-to-list 'TeX-view-program-selection '(output-pdf "eaf"))


(provide 'init-eaf)

;;; init-eaf.el ends here
