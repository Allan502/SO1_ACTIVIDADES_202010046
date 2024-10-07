# ACTIVIDAD 7

## CARACTERISTICAS DE COMPLETELY FAIR SCHEDULER (CFS)

1. Equidad: El CFS intenta garantizar que todos los procesos reciban una porción justa del tiempo de CPU, independientemente de su prioridad. Esto se logra mediante la idea de tiempo virtual. Cada proceso tiene un tiempo virtual que refleja cuánto tiempo de CPU ha utilizado en comparación con otros procesos.

2. Cola de ejecución basada en un árbol rojo-negro: El CFS utiliza una estructura de datos conocida como árbol rojo-negro para almacenar los procesos que están listos para ejecutarse. Esta estructura es eficiente, ya que permite realizar inserciones, eliminaciones y búsquedas en tiempo logarítmico (O(log n)).

3. Tiempo virtual: El tiempo virtual es una métrica que indica cuánto tiempo ha utilizado un proceso en comparación con otros. Los procesos que han usado menos tiempo de CPU tendrán un tiempo virtual menor, y el CFS prioriza la ejecución de los procesos con el menor tiempo virtual para equilibrar la equidad.

4. Justicia ponderada: Aunque la equidad es el objetivo principal, el CFS también tiene en cuenta las prioridades de los procesos. Los procesos con mayor prioridad recibirán más tiempo de CPU, pero siempre de manera proporcional para que los procesos con menor prioridad no se queden sin recursos.

5. Responsivo a cargas interactivas: El CFS está diseñado para manejar bien cargas de trabajo interactivas, como las que se encuentran en aplicaciones de escritorio. Los procesos que necesitan respuestas rápidas (como la interfaz gráfica de usuario) obtienen más atención, asegurando una experiencia de usuario fluida.

6. Preemisión y latencia mínima: El CFS permite la preemisión de procesos, lo que significa que puede interrumpir la ejecución de un proceso en cualquier momento para ejecutar otro más urgente. Además, el planificador intenta minimizar la latencia de programación, es decir, el tiempo que un proceso espera para ser ejecutado después de estar listo.

![Descripción de la imagen](/A7/imgs/image1.png)

![Descripción de la imagen](/A7/imgs/image2.png)

## FUNCIONAMIENTO DEL CFS

1. Asignación de tiempo de CPU: El CFS calcula cuánto tiempo ha estado un proceso ejecutándose y lo compara con otros procesos que están en la cola de ejecución. El proceso con menos tiempo de CPU acumulado es el siguiente en ejecutarse.

2. Selección del próximo proceso: Debido a la estructura del árbol rojo-negro, el CFS puede encontrar rápidamente el proceso con el menor tiempo virtual, que es el proceso que ha recibido menos tiempo de CPU, y lo selecciona para ejecutarlo.

3. Tiempo de ejecución dinámico: Si un proceso tiene una prioridad más alta, el CFS ajustará el tiempo de ejecución que recibe, dándole un "peso" mayor. Sin embargo, se asegura de que incluso los procesos con menor prioridad reciban su parte justa del tiempo de CPU.