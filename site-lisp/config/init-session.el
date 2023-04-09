;;; init-session,用于创建、管理session.
;;; 默认情况下的session文件存储在~/.config/emacs/session,可以在源码中修改


(desktop-save-mode 1)
;; (setq desktop-restore-frames nil) ;; 关闭恢复frames

;; 保存session的目录
(defvar my-desktop-session-dir
  (concat (getenv "HOME") "/.config/emacs/plugtemp/session/")
  "*Directory to save desktop sessions in")


(defvar my-desktop-session-name-hist nil
  "Desktop session name history")

(defun my-desktop-save (&optional name)
  "Save desktop with a name."
  (interactive)
  (unless name
    (setq name (my-desktop-get-session-name "Save session as: ")))
  (make-directory (concat my-desktop-session-dir name) t)
  (desktop-save (concat my-desktop-session-dir name) t))

(defun my-desktop-read (&optional name)
  "Read desktop with a name."
  (interactive)
  (unless name
    (setq name (my-desktop-get-session-name "Load session: ")))
  (desktop-read (concat my-desktop-session-dir name)))

(defun my-desktop-get-session-name (prompt)
  (completing-read prompt (and (file-exists-p my-desktop-session-dir)
                               (directory-files my-desktop-session-dir))
                   nil nil nil my-desktop-session-name-hist))

;; 关闭时自动加载
(add-hook 'kill-emacs-hook #'my-desktop-save)
;; 启动后自动加载
(add-hook 'after-init-hook #'my-desktop-read)

(provide 'init-session)
