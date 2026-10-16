;; stretch-axis.lsp - Stretch along the X or Y axis by a fixed distance
;; Command: SORTHO
(defun c:SORTHO ( / ss dist dir )
  (setq ss (ssget "\nCrossing-select objects to stretch: "))
  (if ss
    (progn
      (setq dist (getreal "\nDistance to stretch <10>: "))
      (if (null dist) (setq dist 10.0))
      (initget "X Y")
      (setq dir (getkword "\nDirection [X/Y] <X>: "))
      (if (null dir) (setq dir "X"))
      (if (= dir "X")
        (command "_.STRETCH" ss "" '(0 0 0) (list dist 0.0 0.0))
        (command "_.STRETCH" ss "" '(0 0 0) (list 0.0 dist 0.0))
      )
    )
  )
  (princ)
)
