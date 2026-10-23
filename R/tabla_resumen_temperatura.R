#' Tabla resumen de temperatura
#'
#'Calcula el promedio y el desvío estándar de la temperatura de abrigo
#'a 150 cm para cada estación presente en los datos.
#'
#' @param datos Un data frame con las columnas id y temperatura_abrigo_150cm.
#'
#' @returns Un tibble con las columnas id, estadistico y valor, con dos filas
#'   por estación (promedio y desvío estándar).
#' @export
#'
#' @examples
#' tabla_resumen_temperatura(estacion_nh0437)
tabla_resumen_temperatura <- function(datos) {

  datos |>
    dplyr::group_by(id) |>
    dplyr::summarise(
      promedio_temperatura = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      desvio_estandar = stats::sd(temperatura_abrigo_150cm, na.rm = TRUE)
    ) |>
    tidyr::pivot_longer(
      cols = c(promedio_temperatura, desvio_estandar),
      names_to = "estadistico",
      values_to = "valor"
    )
}
