#' Cesium.js For R
#'
#' An experimental package to use Cesium.js for R. Please note that
#' the main purpose of this package is for proof of concept.
#' @examples
#' d <-
#'  structure(list(lon = c(137.21020562, 140.405278, 140.82869485,
#' 140.20085084, 132.85377785, 136.22478304, 130.66498178, 140.2225687,
#' 137.05374989, 138.98236607, 132.7848637, 142.84828882, 134.8255947,
#' 140.31643991, 136.77023006, 141.35995307, 133.99389788, 130.43129727,
#' 139.33775283, 133.36560611, 130.75375968, 135.44124934, 136.37943046,
#' 140.92647311, 131.29815374, 138.04313001, 129.61203901, 135.86833171,
#' 138.91749196, 131.43071646, 133.81262682, 126.66890218, 135.50570007,
#' 130.11390568, 139.34459374, 136.13489927, 132.5602251, 138.32740632,
#' 139.81619411, 134.24010153, 139.56237131, 133.84950553, 137.26500976,
#' 135.50944934, 140.09985437, 131.57160692, 138.60840695), lat = c(35.03694116,
#' 39.75276687, 40.78369203, 35.51650146, 33.62560801, 35.85026611,
#' 33.52691417, 37.38196068, 35.78093618, 36.50757015, 34.60695988,
#' 43.47015288, 35.04043545, 36.31045325, 36.77157034, 39.59646468,
#' 34.24597058, 31.02990909, 35.41713846, 33.42441214, 32.61862835,
#' 35.25564109, 34.51861565, 38.4496475, 32.19530094, 36.13635398,
#' 33.23181134, 34.31910832, 37.52388359, 33.20271253, 34.9041813,
#' 25.77298373, 34.62484624, 33.28837322, 35.99978377, 35.21889353,
#' 35.07679336, 35.02007404, 36.692685, 33.92137685, 35.07700755,
#' 35.36295381, 36.63939172, 33.91314908, 38.45069141, 34.20132842,
#' 35.61553602), value = c(5092, 4639, 3470, 4633, 5038.66666666667,
#' 5235.33333333333, 4090.83333333333, 4922.33333333333, 4804.66666666667,
#' 4839, 5313.33333333333, NA, 4881, 4805.66666666667, 6543, 4315.66666666667,
#' 5478.33333333333, 5237.66666666667, 5003.75, 5428.33333333333,
#' 4577, 5456, 4986.66666666667, 5063, 4534.66666666667, 5252, 4075.66666666667,
#' 5619, 4799.66666666667, 5377, 4618.66666666667, 4174, 4114.33333333333,
#' 4702.66666666667, 5238.66666666667, 4651.33333333333, 4539, 4790.83333333333,
#' 5797.33333333333, 4477.33333333333, 5247, 5380, 5634.66666666667,
#' 4501, 5697, 5852.33333333333, 5056.66666666667)), class = c("tbl_df",
#' "tbl", "data.frame"), row.names = c(NA, -47L), .Names = c("lon",
#' "lat", "value"))
#'
#' cesium_bar(d)
#'
#' @param x data.frame with columns named \code{lon}, \code{lat}, and \code{value}
#' @param width width
#' @param height height
#'
#' @export
cesium_bar <- function(x, width = NULL, height = NULL) {

  # rescale for the case when the values are too small to show
  x$value <- scales::rescale(x$value, to = c(0, 10e+5))

  # create widget
  htmlwidgets::createWidget(
    name = 'cesium',
    x,
    width = width,
    height = height,
    package = 'RCesiumBarChart'
  )
}

#' Shiny bindings for cesium
#'
#' Output and render functions for using cesium within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a cesium
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name cesium-shiny
#'
#' @export
cesiumOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'cesium', width, height, package = 'RCesiumBarChart')
}

#' @rdname cesium-shiny
#' @export
renderCesium <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, cesiumOutput, env, quoted = TRUE)
}
