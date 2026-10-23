# Gráfico de temperatura promedio mensual

Grafica el promedio mensual de la temperatura de abrigo a 150 cm para
una o más estaciones, con una línea por estación.

## Usage

``` r
grafico_temperatura_mensual(datos, colores = NULL, titulo = "Temperatura")
```

## Arguments

- datos:

  Un data frame con las columnas id, fecha y temperatura_abrigo_150cm.

- colores:

  Un vector de colores, uno por estación. Si es NULL o no alcanzan para
  todas las estaciones, se eligen colores al azar.

- titulo:

  Un texto con el título del gráfico. Por defecto "Temperatura".

## Value

Un gráfico de ggplot2.

## Examples

``` r
grafico_temperatura_mensual(estacion_nh0437, colores = "blue")
```
