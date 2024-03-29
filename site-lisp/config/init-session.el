;;; init-session.el ---用于创建、管理session.

;;; Require
(require 'auto-save)
(require 'basic-toolkit)

;;; Code:

(setq desktop-load-locked-desktop t) ; don't popup dialog ask user, load anyway
;; 如果下行内容生效则只会保留最后光标所在的窗口,其余都关闭
;; 如果不设置则会完整恢复原来的布局
;; (setq desktop-restore-frames nil)    ; don't restore any frame


(defun emacs-session-restore ()
  "Restore emacs session."
  (interactive)
  (ignore-errors
    ;; Kill other windows.
    (delete-other-windows)
    ;; Kill unused buffers.
    (kill-unused-buffers)
    ;; Restore session.
    (desktop-read "~/.config/emacs")
    ))

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
    (make-directory "~/.config/emacs" t)
    (desktop-save "~/.config/emacs")
    ;; Exit emacs.
    (kill-emacs)))


(provide 'init-session)

;;; init-session ends here
