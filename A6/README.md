# ACTIVIDAD 6

## EJERCICIO 1

1. ¿Incluyendo el proceso inicial, cuantos procesos son creados por el siguiente programa? Razone su respuesta. 
![Descripción de la imagen](/A6/imgs/image.png)

    Cuando utilizamos fork lo que metematicamente vamos a obtener en numero de procesos representado por 2^n entonces al realizar 3 llamadas a fork lo que realizamos es: 2^3 por lo que tendremos 8 procesos incluyehdo el inicial por lo cual concluimos que tendremos 1 proceso padre y 7 hijos.

## EJERCICIO 2

2. Utilizando un sistema Linux, escriba un programa en C que cree un proceso hijo (fork)
que finalmente se convierta en un proceso zombie. Este proceso zombie debe
permanecer en el sistema durante al menos 60 segundos.
Los estados del proceso se pueden obtener del comando: ps -l

    [Codiog ejercicio 3](/A6/src/EJERCICIO2.c)


## EJERCICIO 3

3. Usando el siguiente código como referencia, completar el programa para que sea
ejecutable y responder las siguientes preguntas:  ¿Cuántos procesos únicos son creados?
• ¿Cuántos hilos únicos son creados?

    1. El numero total de procesos es 5 ya que que en el primer fork se crea un proceso hijo y posterior a eso en el segundo fork se crean 2 nuevos 1 extra por proceso padre y 1 por proceso hijo, despues de eso el proceso hijo1 ejecuta un fork y obtiene un proceso hijo dando como resultado 5 procesos.

    2. El numero total de hilos unicos es 1

    3. [Codiog ejercicio 3](/A6/src/EJERCICIO3.c)
