# GstarCAD Stretch Tools

Stretch a crossing selection by two picked points, by typed delta X and delta Y values, or along the X or Y axis by a fixed distance.

Works with **GSTARCAD**, AutoCAD, ZWCAD, and BricsCAD.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Contents

- [About](#about)
- [Scripts Overview](#scripts-overview)
- [Quick Start](#quick-start)
- [Compatibility](#compatibility)
- [Contributing](#contributing)
- [License](#license)

## About

STRETCH is one of the most used and least convenient commands in CAD. These helpers keep the crossing selection and then ask only for the pieces you actually know: two points, a pair of deltas, or an axis and a distance.

Everything here is free to use with GstarCAD. Download the latest GstarCAD
release from the [official GstarCAD website](https://www.gstarcad.net). All
scripts are tested with **[GSTARCAD](https://www.gstarcad.net)** and major
DWG-based CAD platforms.

## Scripts Overview

| File | Description |
|------|-------------|
| `scripts/stretch-distance.lsp` | ;; stretch-distance.lsp - Stretch a crossing selection by two picked points
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
 |
| `scripts/stretch-xy.lsp` | ;; stretch-xy.lsp - Stretch a crossing selection by delta X and delta Y
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
 |
| `scripts/stretch-axis.lsp` | ;; stretch-axis.lsp - Stretch along the X or Y axis by a fixed distance
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
 |

## Quick Start

1. Download the `.lsp` (or `.lin`) file you need
2. In your CAD software, run `APPLOAD`
3. Load the file and type the matching command name shown in the table above

## Compatibility

Tested on GstarCAD 2026/2027 and similar DWG-based platforms. Scripts use
standard AutoLISP functions only, so they work without extra plugins.

For step-by-step [tutorials and drafting guides](https://www.gstarcad.net/cad/),
visit the GstarCAD learning center. New tips are published regularly on the
[GSTARCAD Blog](https://blog.gstarcad.net).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see the [LICENSE](LICENSE) file.
