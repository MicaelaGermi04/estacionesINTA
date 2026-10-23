#' Descargar y leer datos de una estación meteorológica
#'
#'Descarga el archivo CSV de una estación del INTA si no existe en la ruta
#'indicada y luego lo lee. Si el archivo ya existe, solo lo lee sin descargarlo.
#'
#'
#' @param id_estacion Un texto con el código de la estación, por ejemplo "NH0437".
#' @param ruta Un texto con la ruta donde se guarda el archivo CSV.
#'
#' @returns Un tibble con los datos diarios de la estación.
#' @export
#'
#' @examples
#' ruta <- tempfile(fileext = ".csv")
#' estacion <- leer_estacion("NH0437", ruta)
#' unlink(ruta)
#'
#'
leer_estacion <- function(id_estacion, ruta) {
  url <- paste0(
    "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/",
    id_estacion,
    ".csv"
  )

  if (!file.exists(ruta)) {
    cli::cli_inform("Descargando datos de la estaci\u00f3n {id_estacion}...")
    utils::download.file(url = url, destfile = ruta)
  } else {
    cli::cli_inform("El archivo {ruta} ya existe, se lee sin descargar.")
  }

  readr::read_csv(ruta)
}


