#' Gráfico de temperatura promedio mensual
#'
#'Grafica el promedio mensual de la temperatura de abrigo a 150 cm
#'para una o más estaciones, con una línea por estación.
#'
#'
#' @param datos Un data frame con las columnas id, fecha y temperatura_abrigo_150cm.
#' @param colores Un vector de colores, uno por estación. Si es NULL o no
#'   alcanzan para todas las estaciones, se eligen colores al azar.
#' @param titulo Un texto con el título del gráfico. Por defecto "Temperatura".
#'
#' @returns Un gráfico de ggplot2.
#' @export
#'
#' @examples
#' grafico_temperatura_mensual(estacion_nh0437, colores = "blue")
grafico_temperatura_mensual <- function(datos, colores = NULL, titulo = "Temperatura") {

  # Calcular el promedio mensual de temperatura
  resumen <- datos |>
    dplyr::mutate(mes = lubridate::month(lubridate::ymd(fecha))) |>
    dplyr::group_by(id, mes) |>
    dplyr::summarise(
      temperatura_media_mensual = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      .groups = "drop"
    )

  # Contar la cantidad de estaciones
  cantidad_estaciones <- dplyr::n_distinct(resumen$id)

  # Elegir colores aleatorios si no se indican suficientes
  if (is.null(colores) || length(colores) < cantidad_estaciones) {
    colores <- sample(grDevices::colors(), cantidad_estaciones)
  }

  # Crear el gráfico
  grafico <- resumen |>
    ggplot2::ggplot(ggplot2::aes(mes, temperatura_media_mensual, color = id)) +
    ggplot2::geom_line() +
    ggplot2::scale_x_continuous(breaks = seq(1, 12, 1)) +
    ggplot2::scale_color_manual(values = colores) +
    ggplot2::labs(
      title = titulo,
      x = "Mes",
      y = "Temperatura promedio (\u00b0C)",
      color = "Estacion"
    ) +
    ggplot2::theme_minimal()

  return(grafico)
}
