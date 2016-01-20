Cesium.js for R
===============

Note that this package is mainly for the proof of concept. Do not expect everything works fine!

## Installation

```r
devtools::install_github("yutannihilation")
```

## Usage

```r
d <- data.frame(
  lon = c(137.21020562, 140.405278, 140.82869485, 140.20085084, 132.85377785, 136.22478304),
  lat = c(35.03694116, 39.75276687, 40.78369203, 35.51650146, 33.62560801, 35.85026611),
  value = c(5092, 4639, 3470, 4633, 5038.66666666667, 5235.33333333333)
)

cesium(d)
```

![](screenshot.png)
