;;; init-session,用于创建、管理session.
;;; 默认情况下的session文件存储在~/.config/emacs/session,可以在源码中修改


(require 'init-themes)

(setq desktop-load-locked-desktop t) ;; don't popup dialog ask user, load anyway
(setq desktop-restore-frames nil)    ;; don't restore any frame

(defvar my-desktop-session-name-hist
  ""
  nil)

;; 保存session的目录
(defvar my-desktop-session-dir
  (concat (getenv "HOME") "/.config/emacs/plugtemp/session/")
  "*Directory to save desktop sessions in")

(setq now-desktop-session-name nil)

(defun my-desktop-save ()
  "Save desktop with a name."
  (interactive)
  (if  (null now-desktop-session-name)
      (setq now-desktop-session-name (my-desktop-get-session-name "Save session as: ")))
  (make-directory (concat my-desktop-session-dir now-desktop-session-name) t)
  (desktop-save (concat my-desktop-session-dir now-desktop-session-name) t))


(defun kill-unused-buffers ()
  (interactive)
  (ignore-errors
    (save-excursion
      (dolist (buf (buffer-list))
        (set-buffer buf)
        (when (and (string-prefix-p "*" (buffer-name)) (string-suffix-p "*" (buffer-name)))
          (kill-buffer buf))
        ))))

(defun kill-unvisible-buffers ()
  "删除当前不可见的buffer,即删除除当前看到的buffer外的其他buffer"
  (interactive)
  (ignore-errors
    (save-excursion
      (dolist (buffer (buffer-list))
        (unless (or (get-buffer-window buffer 'visible) (string-prefix-p "*" (buffer-name)))
          (kill-buffer buffer)))
      )))


(defun emacs-session-save (&optional arg)
  "Save emacs session."
  (interactive "p")
  (ignore-errors
    (if (equal arg 4)
        ;; Kill all buffers if with prefix argument.
        (mapc 'kill-buffer (buffer-list))
      ;; Kill unused buffers.
      (kill-unused-buffers)
      ;; Save all buffers before exit.
      (auto-save-buffers))
    ;; Save session.
    (make-directory "~/.emacs.d/" t)
    (desktop-save "~/.emacs.d/")
    ;; Exit emacs.
    (kill-emacs)))

(defun my-desktop-read ()
  "Read desktop with a name."
  (interactive)
  (if (null now-desktop-session-name)
      (setq now-desktop-session-name (my-desktop-get-session-name "Load session: ")))
  ;; (delete-other-windows) ;; 关闭其他窗口
  ;; (kill-unused-buffers)            ;; 关闭不活跃的buffer
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
