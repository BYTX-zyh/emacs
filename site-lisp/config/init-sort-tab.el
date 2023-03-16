(require 'sort-tab)

(sort-tab-mode 1)

;; 切换tab
(global-set-key (kbd "s-1") 'sort-tab-select-visible-tab)
(global-set-key (kbd "s-2") 'sort-tab-select-visible-tab)
(global-set-key (kbd "s-3") 'sort-tab-select-visible-tab)
(global-set-key (kbd "s-4") 'sort-tab-select-visible-tab)
(global-set-key (kbd "s-5") 'sort-tab-select-visible-tab)
(global-set-key (kbd "s-6") 'sort-tab-select-visible-tab)
(global-set-key (kbd "s-7") 'sort-tab-select-visible-tab)
(global-set-key (kbd "s-8") 'sort-tab-select-visible-tab)
(global-set-key (kbd "s-9") 'sort-tab-select-visible-tab)
(global-set-key (kbd "s-0") 'sort-tab-select-visible-tab)


(global-set-key (kbd "s-Q") 'sort-tab-close-all-tabs)
(global-set-key (kbd "s-q") 'sort-tab-close-mode-tabs)
(global-set-key (kbd "C-;") 'sort-tab-close-current-tab)

(provide 'init-sort-tab)
