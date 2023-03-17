

(require 'doom-themes)


;; 定义亮色主题列表
(defvar my-light-themes-list
  '(
    doom-acario-light
    doom-1337
    doom-acario-light
    doom-ayu-light
    doom-ayu-mirage
    doom-badger
    doom-challenger-deep
    doom-city-lights
    doom-dracula
    doom-earl-grey
    doom-ephemeral
    doom-fairy-floss
    doom-feather-light
    doom-flatwhite
    doom-gruvbox-light
    doom-henna
    doom-homage-white
    doom-horizon
    doom-Iosvkem
    doom-lantern
    doom-laserwave
    doom-manegarm
    doom-material
    doom-meltbus
    doom-miramare
    doom-molokai
    doom-monokai-classic
    doom-monokai-machine
    doom-monokai-octagon
    doom-monokai-pro
    doom-monokai-ristretto
    doom-moonlight
    doom-nord
    doom-nord-aurora
    doom-nord-light
    doom-nova
    doom-oceanic-next
    doom-old-hope
    doom-one-light
    doom-tomorrow-day

   ;;  kaolin-dark
    ))

;; 定义暗色主题列表
(defvar my-dark-themes-list
  '(
    doom-ayu-dark
    doom-gruvbox
    doom-acario-dark
    doom-ayu-dark
    doom-dark+
    doom-feather-dark
    doom-material-dark
    doom-tomorrow-night
    ))

;; 随机选择一个主题名称
(setq my-random-light-theme (nth (random (length my-light-themes-list)) my-light-themes-list))
(setq my-random-dark-theme (nth (random (length my-dark-themes-list)) my-dark-themes-list))

;; 根据时间选择合适的主题
(defun my-set-theme-by-time ()
  "Set theme based on current time."
  (setq hour (string-to-number (substring (current-time-string) 11 13)))
  (cond ((and (>= hour 6) (< hour 18)) ; 6am-6pm
         (load-theme my-random-light-theme t))
        ((or (< hour 6) (>= hour 18)) ; 6pm-6am
         (load-theme my-random-dark-theme t))))


;; 启动后自动加载随机主题
(add-hook 'after-init-hook #'my-set-theme-by-time)

(provide 'init-themes)
