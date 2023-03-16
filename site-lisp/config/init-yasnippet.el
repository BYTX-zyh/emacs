(require 'yasnippet)

;; yas-snippet-dirs为emacs中检测snip目录的值。
;; 当设置了yas-global-mode或交互式调用yas-reload-all时会检查该值并使用其目录内的snip。
(setq yas-snippet-dirs
      '("/Users/bytx/.config/emacs/snippets"                 ;; personal snippets
        ;; "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
        ;; "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
        ))

(yas-global-mode 1) ; 全局启用

(provide 'init-yasnippet)
