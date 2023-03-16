(eval-when-compile (require 'cl))

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Customize ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 定义group onk-key,属于editing组
(defgroup one-key nil ;; nil表示不提供文档字符串k
  "One key."
  :group 'editing)


(defcustom one-key-popup-window t
  "首次启动 one-key-menu 时是否自动弹出窗口
Whether popup window when first time run `one-key-menu'."
  :type 'boolean
  :group 'one-key)

(defcustom one-key-buffer-name "*One-Key*"
  "one-key 弹出的窗口名称 The buffer name of popup help window."
  :type 'string
  :group 'one-key)

(defcustom one-key-template-buffer-name "*One-Key-Template*"
  "one-key-template 窗口的名称 The name of template buffer."
  :type 'string
  :group 'one-key)

(defcustom one-key-items-per-line nil
  "每一行的条目数量,如果为空则取决于 `window-width'.
Number of items in one line.
If nil, it is calculated by `window-width'."
  :type 'int
  :group 'one-key)

(defcustom one-key-help-window-max-height nil
  "The max height of popup help window."
  :type 'int
  :set (lambda (symbol value)
         (set symbol value)
         ;; Default is half height of frame.
         (unless value
           (set symbol (/ (frame-height) 2))))
  :group 'one-key)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Faces ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defface one-key-title
  '((t (:foreground "Gold")))
  "Face for highlighting title."
  :group 'one-key)

(defface one-key-keystroke
  '((t (:foreground "DarkRed")))
  "Face for highlighting keystroke."
  :group 'one-key)

(defface one-key-prompt
  '((t (:foreground "khaki3")))
  "Face for highlighting prompt."
  :group 'one-key)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Variable ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar one-key-help-window-configuration nil
  "The window configuration that record current window configuration before popup help window.")

(defvar one-key-menu-call-first-time t
  "The first time call function `one-key-menu'.")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Interactive Functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun one-key-show-template (keystroke title)
  "Show template code in buffer `one-key-template-buffer-name'.
KEYSTROKE is bind keymap that you want generate.
TITLE is title name that any string you like."

  ;; 交互式接口 需要输入keymap与tittle
  (interactive "sKeymap to One-Key (keystroke or keymap name): \nsTitle: ")
  (let ((keymap (one-key-read-keymap keystroke)))
    (with-current-buffer (get-buffer-create one-key-template-buffer-name)
      ;; Insert template.
      (erase-buffer)
      (insert (one-key-make-template keymap title))
      ;; Load `emacs-lisp' syntax highlight.
      (set-syntax-table emacs-lisp-mode-syntax-table)
      (lisp-mode-variables)
      (setq font-lock-mode t)
      (font-lock-fontify-buffer)
      ;; Pop to buffer.
      (switch-to-buffer (current-buffer))
      ;; Move to last argument position of function define.
      (backward-char 3))))

(defun one-key-insert-template (keystroke title)
  "Insert template code.
KEYSTROKE is bind keymap that you want generate.
TITLE is title name that any string you like."
  (interactive "sKeymap to One-Key (keystroke or keymap name): \nsTitle: ")
  (let ((keymap (one-key-read-keymap keystroke)))
    ;; Insert.
    (insert (one-key-make-template keymap title))
    ;; Move to last argument position of function define.
    (backward-char 3)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Utilities Functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun one-key-highlight (msg msg-regexp msg-face)
  "Highlight special `MSG' with regular expression `MSG-REGEXP'.
Will highlight this `MSG' with face `MSG-FACE'."
  (with-temp-buffer
    (insert msg)
    (goto-char (point-min))
    (while (re-search-forward msg-regexp nil t)
      (add-text-properties (match-beginning 0)
                           (match-end 0)
                           msg-face))
    (buffer-string)))

(defun one-key-highlight-prompt (prompt)
  "Highlight PROMPT information."
  (let ((msg (format "The keystroke menu of <%s> type '?' for help." prompt)))
    (message (one-key-highlight msg
                                " \\(<[^<>]*>\\|'[^']*'\\) " ;; 匹配 <> 或者 '' 包括的文本
                                '(face one-key-prompt)))))

(defun one-key-highlight-help (title keystroke)
  "Highlight TITLE help information with KEYSTROKE."
  (setq title (one-key-highlight (format "Here is a list of <%s> keystrokes. Type '?' for hide. Type 'q' for exit.\n\n" title)
                                 "\\(<[^<>]*>\\|'[^']*'\\)" ;; 匹配 <> 或者 '' 包裹的内容
                                 '(face one-key-title)))
  (setq keystroke (one-key-highlight keystroke
                                     "\\[\\([^\\[\\]\\)*\\]" ;; 匹配 [] 中的所有内容
                                     '(face one-key-keystroke)))
  (concat title keystroke))

(defun one-key-menu (title
                     info-alist
                     &optional
                     miss-match-exit-p
                     recursion-p
                     protect-function
                     alternate-function
                     execute-last-command-when-miss-match)
  "One key menu.
用于生成One key 菜单.
`title' 表示标题,可以是任意字符串.
`info-alist' 是一个特殊的列表,包含key,describe和command.
`MISS-MATCH-EXIT-P' 表示当keystroke不匹配时是否隐藏弹出窗口
`RECURSION-P' whether recursion execute self
when keystroke can't match in menu.
`PROTECT-FUNCTION' the protect function
that call in `unwind-protect'.
`ALTERNATE-FUNCTION' the alternate function execute at last.
`EXECUTE-LAST-COMMAND-WHEN-MISS-MATCH' whether execute
last command when it miss match in key alist."
  (let ((self (function
               (lambda ()
                 (one-key-menu
                  title info-alist miss-match-exit-p
                  recursion-p
                  protect-function
                  alternate-function
                  execute-last-command-when-miss-match))))
        (command-executed this-command)
        last-key)

    ;; 当首次调用该函数且 `one-key-popup-window'为 `non-nil'时
    ;; 弹出提示窗口
    ;;  (when (and one-key-menu-call-first-time
    ;;           one-key-popup-window)
    (when one-key-popup-window
      (one-key-help-window-toggle title info-alist))
    ;; Execute.
    (unwind-protect ;; 用于保证代码执行后能够在任何情况下正确地清理资源或恢复状态
        (let* ((event (read-event
                       ;; 只在第一次调用时显示帮助信息
                       ;; 不覆盖来自command 的message
                       (if one-key-menu-call-first-time
                           (progn
                             (one-key-highlight-prompt title)
                             (setq one-key-menu-call-first-time nil))
                         "")))
               (key (if (if (<= emacs-major-version 22)
                            (with-no-warnings
                              (char-valid-p event)) ;for compatibility Emacs 22
                          (characterp event))
                        ;; Transform to string when event is char.
                        (char-to-string event)
                      ;; Otherwise return vector.
                      (make-vector 1 event)))
               match-key)
          (cond
           ;; Match user keystrokes.
           ((catch 'match
              (when (stringp key) (setq key (read-kbd-macro key)))
              (cl-loop for ((k . desc) . command) in info-alist do
                       ;; Get match key.
                       (setq match-key k)
                       ;; Call function when match keystroke.
                       (when (one-key-match-keystroke key match-key)
                         ;; Close help window first.
                         (one-key-help-window-close)
                         ;; Set `one-key-menu-call-first-time' with "t" for recursion execute.
                         (setq one-key-menu-call-first-time t)
                         ;; Execute.
                         (call-interactively command)
                         (setq command-executed command)
                         ;; Set `one-key-menu-call-first-time' with "nil".
                         (setq one-key-menu-call-first-time nil)
                         (throw 'match t)))
              nil)
            ;; Handle last.
            (one-key-handle-last alternate-function self recursion-p))
           ;; Match build-in keystroke.
           ((one-key-match-keystroke key "q")
            ;; quit
            (keyboard-quit))
           ((one-key-match-keystroke key "?")
            ;; toggle help window
            (one-key-help-window-toggle title info-alist)
            (funcall self))
           ((one-key-match-keystroke key "C-n")
            ;; scroll up one line
            (one-key-help-window-scroll-up-line)
            (funcall self))
           ((one-key-match-keystroke key "C-p")
            ;; scroll down one line
            (one-key-help-window-scroll-down-line)
            (funcall self))
           ((or (one-key-match-keystroke key "C-j")
                (one-key-match-keystroke key [next]))
            ;; scroll up one screen
            (one-key-help-window-scroll-up)
            (funcall self))
           ((or (one-key-match-keystroke key "C-k")
                (one-key-match-keystroke key [prior]))
            ;; scroll down one screen
            (one-key-help-window-scroll-down)
            (funcall self))
           ;; Not match any keystrokes.
           (t
            ;; Close help window first.
            (one-key-help-window-close)
            ;; Quit when keystroke not match
            ;; and argument `miss-match-exit-p' is `non-nil'.
            (when miss-match-exit-p
              ;; Record last key.
              (setq last-key key)
              ;; Abort.
              (keyboard-quit))
            ;; Handle last.
            (one-key-handle-last alternate-function self recursion-p))))
      ;; Restore value of `one-key-call-first-time'.
      (setq one-key-menu-call-first-time t)
      ;; Close help window.
      (one-key-help-window-close)
      ;; Run protect function
      ;; when `protect-function' is valid function.
      (if (and protect-function
               (functionp protect-function))
          (call-interactively protect-function))
      ;; Execute last command when miss match
      ;; user key alist.
      (when (and execute-last-command-when-miss-match
                 last-key)
        ;; Execute command corresponding last input key.
        (one-key-execute-binding-command last-key))

      ;; Make sure this-command is the real command executed
      (setq this-command command-executed))))

;; 执行key绑定的command
(defun one-key-execute-binding-command (key)
  "Execute the command binding KEY."
  (let (;; Try to get function corresponding `KEY'.
        (function (key-binding key)))
    ;; Execute corresponding command, except `keyboard-quit'.
    (when (and (not (eq function 'keyboard-quit))
               (functionp function))
      ;; Make sure `last-command-event' equal `last-input-event'.
      (setq last-command-event last-input-event)
      ;; Run function.
      (call-interactively function))))

;; 检测是否相同
(defun one-key-match-keystroke (key match-key)
  "Return `non-nil' if `KEY' match `MATCH-KEY'.
Otherwise, return nil."
  (cond ((stringp match-key) (setq match-key (read-kbd-macro match-key)))
        ((vectorp match-key) nil)
        (t (signal 'wrong-type-argument (list 'array match-key))))
  (equal key match-key))

(defun one-key-read-keymap (keystroke)
  "读取keymap  Read keymap.
If KEYSTROKE is a name of keymap, use the keymap.
Otherwise it is interpreted as a key stroke."
  (let ((v (intern-soft keystroke)))
    (if (and (boundp v) (keymapp (symbol-value v)))
        (symbol-value v)
      (key-binding (read-kbd-macro keystroke)))))

(defun one-key-handle-last (alternate-function recursion-function recursion-p)
  "The last process when match user keystroke or not match.
ALTERNATE-FUNCTION is the alternate function to be execute.
RECURSION-FUNCTION is the recursion function to be execute
when option RECURSION-P is non-nil."
  ;; Execute alternate function.
  (when (and alternate-function
             (functionp alternate-function))
    (call-interactively alternate-function))
  ;; Recursion execute when argument
  ;; `recursion-p' is `non-nil'.
  (if recursion-p
      (funcall recursion-function)))

(defun one-key-help-window-exist-p ()
  "Return `non-nil' if `one-key' help window exist.
Otherwise, return nil."
  (and (get-buffer one-key-buffer-name)
       (window-live-p (get-buffer-window (get-buffer one-key-buffer-name)))))

(defun one-key-help-window-toggle (title info-alist)
  "Toggle the help window.
Argument TITLE is title name for help information.
Argument INFO-ALIST is help information as format ((key . describe) . command)."
  (if (one-key-help-window-exist-p)
      ;; Close help window.
      (one-key-help-window-close)
    ;; Open help window.
    (one-key-help-window-open title info-alist)))

(defun one-key-help-window-open (title info-alist)
  "Open the help window.
Argument TITLE is title name for help information.
Argument INFO-ALIST is help information as format ((key . describe) . command)."
  ;; 保存当前 window 配置
  (or one-key-help-window-configuration
      (setq one-key-help-window-configuration (current-window-configuration)))
  ;; Generate buffer information.
  ;;  (unless (get-buffer one-key-buffer-name)
  ;; (with-current-buffer
  ;;    (get-buffer-create one-key-buffer-name)
  ;; (goto-char (point-min))
  ;; (save-excursion
  ;;  (insert (one-key-highlight-help
  ;;         title
  ;;       (one-key-help-format info-alist))))))
  ;; Pop `one-key' buffer.
  ;; (pop-to-buffer one-key-buffer-name)
  ;;(set-buffer one-key-buffer-name)
  ;; 显示 posframe
  (let ((frame (
                posframe-show
                one-key-buffer-name
                :string (one-key-highlight-help
                         title
                         (one-key-help-format info-alist))
                :poshandler 'posframe-poshandler-frame-center
                :position (point)
                :background-color (face-attribute 'tooltip :background)
                :foreground-color (face-attribute 'tooltip :foreground)
                :internal-border-width 2
                :internal-border-color "gold")))))

(defun one-key-help-window-close ()
  "Close the help window."
  ;; Kill help buffer.
  (when (bufferp (get-buffer one-key-buffer-name))
    (posframe-hide one-key-buffer-name)
    (kill-buffer one-key-buffer-name))
  ;; Restore window layout if
  ;; `one-key-help-window-configuration' is valid value.
  (when (and one-key-help-window-configuration
             (boundp 'one-key-help-window-configuration))
    (set-window-configuration one-key-help-window-configuration)
    (setq one-key-help-window-configuration nil))
  ;; (posframe-delete one-key-buffer-name)
  )


(defun one-key-help-window-scroll-up ()
  "Scroll up one screen `one-key' help window."
  (if (one-key-help-window-exist-p)
      (ignore-errors
        (with-current-buffer one-key-buffer-name
          (scroll-up)))))

(defun one-key-help-window-scroll-down ()
  "Scroll down one screen `one-key' help window."
  (if (one-key-help-window-exist-p)
      (ignore-errors
        (with-current-buffer one-key-buffer-name
          (scroll-down)))))

(defun one-key-help-window-scroll-up-line ()
  "Scroll up one line `one-key' help window."
  (if (one-key-help-window-exist-p)
      (ignore-errors
        (with-current-buffer one-key-buffer-name
          (scroll-up 1)))))

(defun one-key-help-window-scroll-down-line ()
  "Scroll down one line `one-key' help window."
  (if (one-key-help-window-exist-p)
      (ignore-errors
        (with-current-buffer one-key-buffer-name
          (scroll-down 1)))))

;; 格式化输入,返回字符串
(defun one-key-help-format (info-alist)
  "Format `one-key' help information.
Argument INFO-ALIST is help information as format ((key . describe) . command)."
  (let* ((max-length (cl-loop for ((key . desc) . command) in info-alist
                              maximize (+ (string-width key) (string-width desc)))) ;; max-length 表示 按键加描述最长的字符串长度
         (current-length 0)
         ;; 表示每行可以放的条数
         ;; 如果指定了 `one-key-items-per-line' 则采用此值
         ;; 否则自动计算一个合适的值
         (items-per-line (or one-key-items-per-line
                             (floor (/ (- (window-width) 3)
                                       (+ max-length 4)))))
         keystroke-msg)
    (cl-loop for ((key . desc) . command) in info-alist
             for counter from 1  do ;; 从1开始遍历
             (push (format "[%s] %s " key desc) keystroke-msg) ;; 格式化描述到`keystroke-msg'
             (setq current-length (+ (string-width key) (string-width desc))) ;; 当前长度
             ;; 如果为本行最后一个则添加换行,否则插入填充字符串
             (push (if (zerop (% counter items-per-line))
                       "\n"
                     (make-string (- max-length current-length) ? ))
                   keystroke-msg))
    ;; 逆序连接字符串并返回
    (mapconcat 'identity (nreverse keystroke-msg) "")))

(defun one-key-make-template (keymap title)
  "Generate template code.
KEYMAP is keymap you want generate.
TITLE is title name that any string you like."
  (with-temp-buffer
    (let ((indent-tabs-mode t)
          (funcname (replace-regexp-in-string " " "-" title)))
      (insert (substitute-command-keys "\\<keymap>\\{keymap}"))
      ;; Remove header/footer
      (goto-char (point-min))
      (forward-line 3)
      (delete-region 1 (point))
      (goto-char (point-max))
      (backward-delete-char 1)
      ;; Insert.
      (goto-char (point-min))
      ;; Insert alist variable.
      (insert (format "(defvar one-key-menu-%s-alist nil\n\"The `one-key' menu alist for %s.\")\n\n"
                      funcname title)
              (format "(setq one-key-menu-%s-alist\n'(\n" funcname))
      ;; Insert (("key" . "desc") . command).
      (while (not (eobp))
        (unless (eq (point-at-bol) (point-at-eol))
          (cl-destructuring-bind (key cmd)
              (split-string (buffer-substring (point-at-bol) (point-at-eol)) "\t+")
            (delete-region (point-at-bol) (point-at-eol))
            (insert (format "((\"%s\" . \"%s\") . %s)"
                            (replace-regexp-in-string
                             "\\\"" "\\\\\""
                             (replace-regexp-in-string "\\\\" "\\\\\\\\" key))
                            (capitalize (replace-regexp-in-string "-" " " cmd))
                            cmd))
            (when (and cmd
                       (string-match " " (concat key cmd)))
              (forward-sexp -1)
              (insert ";; "))))
        (forward-line 1))
      (goto-char (point-max))
      (insert "))\n\n")
      ;; Insert function.
      (insert (format "(defun one-key-menu-%s ()\n\"The `one-key' menu for %s\"\n(interactive)\n(one-key-menu \"%s\" one-key-menu-%s-alist))\n"
                      funcname title title funcname))
      ;; Indent.
      (emacs-lisp-mode)
      (indent-region (point-min) (point-max))
      ;; Result.
      (buffer-string)
      )))


(cl-defmacro one-key-create-menu (title
                                  info-alist
                                  &optional
                                  miss-match-exit-p
                                  recursion-p
                                  protect-function
                                  alternate-function
                                  execute-last-command-when-miss-match)
  "根据tittle和info-alist生成对应的函数one-key-menu-[tittle]
用于提供使用接口"
  (let* ((one-key-function (intern (format "one-key-menu-%s" (downcase title)))))
    `(progn
       (defun ,one-key-function()
         (interactive)
         (one-key-menu
          ,title
          ,info-alist
          ,miss-match-exit-p
          ,recursion-p
          ,protect-function
          ,alternate-function
          ,execute-last-command-when-miss-match)
         ))))

(provide 'bytx-one-key)
