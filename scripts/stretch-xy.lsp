;; stretch-xy.lsp - Stretch a crossing selection by delta X and delta Y
;; Command: SXY
(defun c:SXY ( / ss dx dy )
  (setq ss (ssget "\nCrossing-select objects to stretch: "))
  (if ss
    (progn
      (setq dx (getreal "\nDelta X <0>: "))
      (if (null dx) (setq dx 0.0))
      (setq dy (getreal "\nDelta Y <0>: "))
      (if (null dy) (setq dy 0.0))
      (command "_.STRETCH" ss "" '(0 0 0) (list dx dy 0.0))
    )
  )
  (princ)
)
