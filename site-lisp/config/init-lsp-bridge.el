(require 'lsp-bridge)
(global-lsp-bridge-mode) ; 全局启动
; (setq lsp-bridge-enable-log t) ; 打开调试日志，开发者才需要
;; todo:
;; 融合 `lsp-bridge' `find-function' 以及 `dumb-jump' 的智能跳转
;; (defun lsp-bridge-jump ()
;;   (interactive)
;;   (cond
;;    ((eq major-mode 'emacs-lisp-mode)
;;     (let ((symb (function-called-at-point)))
;;       (when symb
;;         (find-function symb))))
;;    (lsp-bridge-mode
;;     (lsp-bridge-find-def))
;;    (t
;;     (require 'dumb-jump)
;;     (dumb-jump-go))))

;; (defun lsp-bridge-jump-back ()
;;   (interactive)
;;   (cond
;;    (lsp-bridge-mode
;;     (lsp-bridge-find-def-return))
;;    (t
;;     (require 'dumb-jump)
;;     (dumb-jump-back))))

;; (setq lsp-bridge-get-single-lang-server-by-project
;;       (lambda (project-path filepath)
;;         ;; If typescript file include deno.land url, then use Deno LSP server.
;;         (save-excursion
;;           (when (string-equal (file-name-extension filepath) "ts")
;;             (dolist (buf (buffer-list))
;;               (when (string-equal (buffer-file-name buf) filepath)
;;                 (with-current-buffer buf
;;                   (goto-char (point-min))
;;                   (when (search-forward-regexp (regexp-quote "from \"https://deno.land") nil t)
;;                     (return "deno")))))))))

(setq lsp-bridge-enable-hover-diagnostic t) ; 光标移动到错误位置弹出诊断信息
;; lsp-bridge-org-babel-lang-list org-mode中代码块补全
;; (setq lsp-bridge-enable-debug t) ;; 允许调试
 (setq acm-enable-tabnine t) ;; 打开tabnine支持 ,需要执行lsp-bridge-install-tabnine以安装。
(setq acm-enable-doc t) ;; 自动弹出文档
(setq acm-enable-quick-access t);; 补全后显示索引，便于alt+num操作
(setq acm-snippet-insert-index 0) ;;  代码模板候选词在补全菜单中的显示位置
(setq acm-backend-yas-candidates-number 10) ;; yasnippet显示个数
; (setq lsp-bridge-enable-auto-format-code t) ;; 在停止输入代码1s后自动格式化当前buffer代码
(setq acm-backend-yas-candidates-number 5) ; snip 数量

(provide 'init-lsp-bridge)
