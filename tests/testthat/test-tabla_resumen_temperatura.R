test_that("calcula correctamente el promedio y el desvio", {
  datos <- data.frame(
    id = c("A", "A", "A"),
    temperatura_abrigo_150cm = c(10, 20, 30)
  )

  resultado <- tabla_resumen_temperatura(datos)

  expect_equal(
    names(resultado),
    c("id", "estadistico", "valor")
  )
  expect_equal(nrow(resultado), 2)
  expect_equal(resultado$valor, c(20, 10))
})

test_that("ignora temperaturas faltantes", {
  datos <- data.frame(
    id = c("A", "A", "A"),
    temperatura_abrigo_150cm = c(10, 20, NA)
  )

  resultado <- tabla_resumen_temperatura(datos)

  expect_equal(resultado$valor[1], 15)
  expect_equal(resultado$valor[2], sqrt(50))
})
