;;; init-session,用于创建、管理session.
;;; 默认情况下的session文件存储在~/.config/emacs/session,可以在源码中修改


(require 'init-themes)

(defvar my-desktop-session-name-hist
  ""
  nil)

;; 保存session的目录
(defvar my-desktop-session-dir
  (concat (getenv "HOME") "/.config/emacs/session/")
  "*Directory to save desktop sessions in")

(setq now-desktop-session-name nil)

(defun my-desktop-save ()
  "Save desktop with a name."
  (interactive)
  (if  (null now-desktop-session-name)
      (setq now-desktop-session-name (my-desktop-get-session-name "Save session as: ")))
  ;;(bytx-kill-unused-buffers)
  (make-directory (concat my-desktop-session-dir now-desktop-session-name) t)
  (desktop-save (concat my-desktop-session-dir now-desktop-session-name) t))

(defun close-unused-buffers ()
  "关闭当前未在使用的 buffer。"
  (interactive)
  (mapc (lambda (buffer)
          (unless (or (get-buffer-window buffer)
                      (string-prefix-p "*" (buffer-name buffer)))
            (kill-buffer buffer)))
        (buffer-list)))

(defun bytx-kill-unused-buffers ()
  (interactive)
  (ignore-errors
    (save-excursion
      (dolist (buffer (buffer-list))
        (unless (get-buffer-window buffer 'visible)
          (kill-buffer buffer)))
                                        ;; (dolist (buf (buffer-list))
                                        ;  (set-buffer buf)
                                        ; (when (and (string-prefix-p "*" (buffer-name)) (string-suffix-p "*" (buffer-name)))
                                        ;  (kill-buffer buf))
      )))


(defun my-desktop-read ()
  "Read desktop with a name."
  (interactive)
  (if (null now-desktop-session-name)
      (setq now-desktop-session-name (my-desktop-get-session-name "Load session: ")))
  ;; (delete-other-windows)                ; 关闭其他窗口
  ;; (bytx-kill-unused-buffers)            ; 关闭不活跃的buffer
  (desktop-read (concat my-desktop-session-dir now-desktop-session-name))
  ;; 恢复session后重新加载一个随机主题，以防止出现记录主题与随机主题冲突问题
  ;; 如果采用固定主题可忽略 该内容来自于 init-themes
  (my-set-theme-by-time)
  )

;; 参数prompt表示提示用字符串
(defun my-desktop-get-session-name (prompt)
  (completing-read prompt (and (file-exists-p my-desktop-session-dir)
                               (directory-files my-desktop-session-dir))
                   nil nil nil my-desktop-session-name-hist))

;; 关闭时自动加载
(add-hook 'kill-emacs-hook #'my-desktop-save)
;; 启动后自动加载
(add-hook 'after-init-hook #'my-desktop-read)

(provide 'init-session)
