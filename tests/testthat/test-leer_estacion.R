test_that("descarga una estacion y luego reutiliza el archivo", {
  ruta <- tempfile(fileext = ".csv")

  expect_message(
    datos <- leer_estacion("NH0437", ruta),
    "Descargando"
  )

  expect_true(file.exists(ruta))
  expect_true(
    all(c("id", "fecha", "temperatura_abrigo_150cm") %in%
          names(datos))
  )
  expect_true(all(datos$id == "NH0437"))

  expect_message(
    datos_releidos <- leer_estacion("NH0437", ruta),
    "ya existe"
  )

  expect_equal(datos_releidos, datos)

  unlink(ruta)
})
