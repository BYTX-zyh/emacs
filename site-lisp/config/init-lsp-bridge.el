(require 'lsp-bridge)
(global-lsp-bridge-mode) ; 全局启动
; (setq lsp-bridge-enable-log t) ; 打开调试日志，开发者才需要


;;; config
(setq lsp-bridge-c-lsp-server "clangd") ;; c服务器
(setq lsp-bridge-enable-hover-diagnostic t) ; 光标移动到错误位置弹出诊断信息
(setq lsp-bridge-enable-diagnostics t) ;; 代码诊断
;; lsp-bridge-org-babel-lang-list org-mode中代码块补全
 (setq acm-enable-tabnine t) ;; 打开tabnine支持 ,需要执行lsp-bridge-install-tabnine以安装。
(setq acm-enable-doc nil) ;; 自动弹出文档
(setq acm-enable-quick-access t);; 补全后显示索引，便于alt+num操作
(setq acm-snippet-insert-index 0) ;;  代码模板候选词在补全菜单中的显示位置
(setq acm-backend-yas-candidates-number 10) ;; yasnippet显示个数
(setq lsp-bridge-auto-format-code-idle 5) ;; 自动格式化的等待时间
(setq lsp-bridge-enable-auto-format-code t) ;; 在停止输入代码后自动格式化当前buffer代码
(setq lsp-bridge-enable-signature-help t) ;; 支持函数参数显示

(provide 'init-lsp-bridge)
