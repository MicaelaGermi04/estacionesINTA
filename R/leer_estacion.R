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
  if (!is.character(id_estacion) || length(id_estacion) != 1 ||
      is.na(id_estacion) || !nzchar(trimws(id_estacion))) {
    cli::cli_abort("id_estacion debe ser un texto no vacio con un unico codigo de estacion.")
  }

  if (!is.character(ruta) || length(ruta) != 1 ||
      is.na(ruta) || !nzchar(trimws(ruta))) {
    cli::cli_abort("ruta debe ser un texto no vacio con una unica ruta de archivo.")
  }

  if (!dir.exists(dirname(ruta))) {
    cli::cli_abort("La carpeta de destino no existe. Crea la carpeta antes de descargar.")
  }

  if (dir.exists(ruta)) {
    cli::cli_abort("ruta debe indicar un archivo CSV, no una carpeta.")
  }
  url <- paste0(
    "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/",
    id_estacion,
    ".csv"
  )

  if (!file.exists(ruta)) {
    cli::cli_inform("Descargando datos de la estaci\u00f3n {id_estacion}...")
    estado <- utils::download.file(url = url, destfile = ruta)
    if (estado != 0) {
      cli::cli_abort("No se pudo descargar la estacion {id_estacion}. Revisa el codigo, la conexion y los permisos de la carpeta.")
    }
  } else {
    cli::cli_inform("El archivo {ruta} ya existe, se lee sin descargar.")
  }

  readr::read_csv(ruta)
}


