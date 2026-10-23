leer_estacion <- function(id_estacion, ruta) {
  url <- paste0(
    "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/",
    id_estacion,
    ".csv"
  )

  if (!file.exists(ruta)) {
    cli::cli_inform("Descargando datos de la estación {id_estacion}...")
    download.file(url = url, destfile = ruta)
  } else {
    cli::cli_inform("El archivo {ruta} ya existe, se lee sin descargar.")
  }

  readr::read_csv(ruta)
}


