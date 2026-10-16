;; stretch-distance.lsp - Stretch a crossing selection by two picked points
;; Command: SDIST
(defun c:SDIST ( / ss p1 p2 )
  (setq ss (ssget "\nCrossing-select objects to stretch: "))
  (if ss
    (progn
      (setq p1 (getpoint "\nBase point: "))
      (setq p2 (getpoint p1 "\nDisplacement (second point): "))
      (if (and p1 p2)
        (command "_.STRETCH" ss "" p1 p2)
      )
    )
  )
  (princ)
)
