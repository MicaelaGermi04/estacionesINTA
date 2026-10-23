# Tabla resumen de temperatura

Calcula el promedio y el desvío estándar de la temperatura de abrigo a
150 cm para cada estación presente en los datos.

## Usage

``` r
tabla_resumen_temperatura(datos)
```

## Arguments

- datos:

  Un data frame con las columnas id y temperatura_abrigo_150cm.

## Value

Un tibble con las columnas id, estadistico y valor, con dos filas por
estación (promedio y desvío estándar).

## Examples

``` r
tabla_resumen_temperatura(estacion_nh0437)
#> # A tibble: 2 × 3
#>   id     estadistico          valor
#>   <chr>  <chr>                <dbl>
#> 1 NH0437 promedio_temperatura 20.2 
#> 2 NH0437 desvio_estandar       5.77
```
