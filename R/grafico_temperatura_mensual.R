grafico_temperatura_mensual <- function(datos, colores = NULL, titulo = "Temperatura") {

  # Calcular el promedio mensual de temperatura
  resumen <- datos |>
    mutate(mes = month(ymd(fecha))) |>
    group_by(id, mes) |>
    summarise(
      temperatura_media_mensual = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      .groups = "drop"
    )

  # Contar la cantidad de estaciones
  cantidad_estaciones <- n_distinct(resumen$id)

  # Elegir colores aleatorios si no se indican suficientes
  if (is.null(colores) || length(colores) < cantidad_estaciones) {
    colores <- sample(colors(), cantidad_estaciones)
  }

  # Crear el gráfico
  grafico <- resumen |>
    ggplot(aes(mes, temperatura_media_mensual, color = id)) +
    geom_line() +
    scale_x_continuous(breaks = seq(1, 12, 1)) +
    scale_color_manual(values = colores) +
    labs(
      title = titulo,
      x = "Mes",
      y = "Temperatura promedio (°C)",
      color = "Estación"
    ) +
    theme_minimal()

  return(grafico)
}
