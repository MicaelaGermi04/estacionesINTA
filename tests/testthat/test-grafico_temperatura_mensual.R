test_that("crea un grafico con los promedios mensuales", {
  datos <- data.frame(
    id = c("A", "A", "A"),
    fecha = c("2020-01-01", "2020-01-02", "2020-02-01"),
    temperatura_abrigo_150cm = c(10, 20, 30)
  )

  grafico <- grafico_temperatura_mensual(
    datos,
    colores = "blue",
    titulo = "Prueba"
  )

  expect_true("ggplot" %in% class(grafico))
  expect_equal(grafico$labels$title, "Prueba")
  expect_equal(grafico$data$mes, c(1, 2))
  expect_equal(
    grafico$data$temperatura_media_mensual,
    c(15, 30)
  )
})

test_that("crea un grafico cuando no se indican colores", {
  grafico <- grafico_temperatura_mensual(estacion_nh0437)

  expect_true("ggplot" %in% class(grafico))
  expect_equal(nrow(grafico$data), 12)
})
