# Leer los datos originales
estacion_nh0437 <- readr::read_csv(
  "data_raw/estacion_nh0437.csv"
)

# Incorporar los datos al paquete
usethis::use_data(estacion_nh0437)
