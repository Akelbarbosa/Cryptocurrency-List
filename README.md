# Cryptocurrency-List
Aplicacion que muestra un listado de cripto monedas y detalla los precios de las monedas seleccionadas, construida siguiendo la arquitectura VIPER. 
Consta de tres modulos cada uno
- CrptoCurrenctLis (Este es el inicio de la app, donde el usuario puede ingresar a la lista de monedas que tiene disponible)
- CurrencyList (Este modulo muestra la lista de cripto que tiene el usuario disponible)
- CurrencyDetail (Modulo que brinda informacion mas detallada de la moneda seleccionada)

cada uno con sus respectivos View, Presenter, Router, Interactor. ademas con un administrador de API que es el encargado de realizar las peticiones a la API, en este caso 
se utilizo la de COINGECKO para consultar el detalle de las monedas.



