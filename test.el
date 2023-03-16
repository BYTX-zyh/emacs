(require 'posframe)

;;; bytx-new funcion
(defcustom one-key-posframe-width-ratio 0.6
  "表示弹出窗口的宽度百分比"
  :type 'number
  :group 'one-key)

(defcustom one-key-posframe-height-ratio 0.6
  "表示弹出窗口的高度百分比"
  :type 'number
  :group 'one-key)

(defun one-key-posframe-show (buffer)
  "用于显示one-key界面"
  (let* ((posframe-height (round (* (frame-height) one-key-posframe-hediht-ratio))) ;; 实际高度
         (posframe-width (round (* (frame-width) one-key-posframe-width-ratio))) ;; 实际宽度
         (apply #'posframe-show
                (get-buffer buffer)
                :poshandler #'posframe-poshandler-frame-center
                (list
                 :max-height posframe-height
                 :min-height posframe-height
                 :min-width  posframe-width
                 :max-width  posframe-width
                 :border-width 2
                 :border-color "gray"
                 :accept-focus (equal buffer blink-search-input-buffer)
                 ))))
  )

(posframe-hide " *my-posframe-buffer*")
(posframe-hide "test")
