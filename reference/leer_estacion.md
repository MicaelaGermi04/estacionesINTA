# Descargar y leer datos de una estación meteorológica

Descarga el archivo CSV de una estación del INTA si no existe en la ruta
indicada y luego lo lee. Si el archivo ya existe, solo lo lee sin
descargarlo.

## Usage

``` r
leer_estacion(id_estacion, ruta)
```

## Arguments

- id_estacion:

  Un texto con el código de la estación, por ejemplo "NH0437".

- ruta:

  Un texto con la ruta donde se guarda el archivo CSV.

## Value

Un tibble con los datos diarios de la estación.

## Examples

``` r
ruta <- tempfile(fileext = ".csv")
estacion <- leer_estacion("NH0437", ruta)
#> Descargando datos de la estación NH0437...
#> Warning: One or more parsing issues, call `problems()` on your data frame for details,
#> e.g.:
#>   dat <- vroom(...)
#>   problems(dat)
#> Rows: 18929 Columns: 35
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ","
#> chr   (2): id, direccion_viento_1000cm
#> dbl  (22): temperatura_abrigo_150cm, temperatura_abrigo_150cm_maxima, temper...
#> lgl  (10): temperatura_suelo_10cm_media, temperatura_inte_5cm, temperatura_i...
#> date  (1): fecha
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
unlink(ruta)

```
