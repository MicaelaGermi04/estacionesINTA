tabla_resumen_temperatura <- function(datos) {

  datos |>
    dplyr::group_by(id) |>
    dplyr::summarise(
      promedio_temperatura = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      desvio_estandar = sd(temperatura_abrigo_150cm, na.rm = TRUE)
    ) |>
    tidyr::pivot_longer(
      cols = c(promedio_temperatura, desvio_estandar),
      names_to = "estadistico",
      values_to = "valor"
    )
}
