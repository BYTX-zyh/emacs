(require 'avy)
;; avy提示字符
(setq avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l ?q ?w ?e ?r ?t ?y ?u ?i ?o ?p))
;; 表示avy提示范围 nil为当前Windows,t为当前frame,all-frames为所有frame的所有Windows
(setq avy-all-windows t)
;; 提示时间等待
(setq avy-timeout-seconds 0.9)

(provide 'init-avy)
