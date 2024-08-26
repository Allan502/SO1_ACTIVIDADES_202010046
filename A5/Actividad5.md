# Actividad 5

## Tipos de Kernel y sus diferencias

1. Monolitico
   - El kernel monolítico es un diseño en el que todos los componentes del sistema operativo, como la gestión de memoria, los drivers de dispositivo, el sistema de archivos, y el manejo de interrupciones, se ejecutan en un único espacio de memoria (modo kernel). 
   - Ventajas
     - Desempeño rápido, ya que la comunicación entre los componentes se realiza mediante llamadas directas de función.
     - Menos sobrecarga en la comunicación interna.
   - Desventajas
     - Mayor complejidad y riesgo de errores, ya que un fallo en cualquier parte del kernel puede colapsar el sistema completo. 
   - Ejemplos
     - Linux, Unix.
2. Microkernel
   - En el diseño de microkernel, se minimiza el tamaño del kernel manteniendo solo las funcionalidades esenciales, como la comunicación entre procesos y la gestión de memoria. Los demás servicios, como controladores de dispositivos y sistemas de archivos, se ejecutan en el espacio de usuario. 
   - Ventajas
     - Mayor estabilidad y seguridad, ya que los servicios se ejecutan en modo usuario, reduciendo el riesgo de fallos catastróficos.
     - Fácil de extender y mantener.
   - Desventajas
     - Desempeño más lento debido a la mayor sobrecarga en la comunicación entre componentes.
   - Ejemplos
     - Minix, QNX.
3. Kernel hibrido
   - Un kernel híbrido combina características de los kernels monolíticos y microkernels. Mantiene algunos servicios importantes, como el manejo de controladores y subsistemas en el espacio del kernel, mientras otros se manejan en el espacio de usuario.
   - Ventajas
     - Intenta balancear el desempeño y la modularidad.
   - Desventajas
     - Puede ser más complejo de diseñar y optimizar.componentes.
   - Ejemplos
     -  Windows NT, MacOS X.
4. Exokernel
   - Exokernel es un tipo de kernel extremadamente minimalista que proporciona solo la gestión de recursos básicos, dejando la mayor parte de la abstracción y gestión del hardware al software de aplicación.
   - Ventajas
     - Altamente eficiente, permite a las aplicaciones manejar directamente el hardware según sus necesidades.
   - Desventajas
     -Mayor complejidad para los desarrolladores de aplicaciones, ya que necesitan manejar más detalles del hardware.

## User vs Kernel Mode

- **User mode:**  En el modo usuario, las aplicaciones se ejecutan con privilegios limitados y no tienen acceso directo al hardware o a áreas críticas de la memoria. Este aislamiento protege al sistema operativo y otros programas de posibles fallos y vulnerabilidades. Entre sus ventajas se pueden mencionar: Aumenta la seguridad y estabilidad del sistema. Facilita el manejo de errores sin comprometer el sistema operativo. Y entre sus desventajas se pueden mencionar: Las aplicaciones no pueden ejecutar operaciones privilegiadas como acceder directamente a hardware, lo cual requiere pasar por el sistema operativo.

- **Kernel mode:** En el modo kernel, el código se ejecuta con todos los privilegios, permitiendo acceso directo a hardware, memoria, y otros recursos críticos del sistema. El kernel del sistema operativo siempre se ejecuta en este modo. Entre sus ventajas podemos mencionar: Permite al sistema operativo realizar tareas críticas y de bajo nivel, como la gestión de memoria y control de dispositivos. Y entre sus desventajas podemos mencionar: Un error en el modo kernel puede comprometer todo el sistema, dado que tiene acceso completo a todos los recursos.

## Interrupciones vs traps

- **Interrupciones**:
    Las interrupciones son señales enviadas al procesador por dispositivos externos (como el teclado o el disco duro) o por el propio hardware para notificar que necesitan atención inmediata. El procesador detiene la ejecución del código actual para atender la interrupción, ejecutando el manejador correspondiente.

  - Tipos: Interrupciones de hardware: Originadas por dispositivos externos (por    ejemplo, presionar una tecla).
    Interrupciones de software: Originadas por instrucciones especiales en el código (por ejemplo, llamadas al sistema).
    Ejemplo: Un disco duro que termina de leer datos y notifica al procesador que los   datos están listos para ser procesados.

- **Traps (Excepciones):**

    Descripción: Las traps son interrupciones causadas por errores en el código o por eventos excepcionales, como dividir por cero o intentar acceder a una dirección de memoria no válida. A diferencia de las interrupciones, las traps son generadas por el propio procesador en respuesta a una condición anómala durante la ejecución de un programa.
  - Ejemplo: Un intento de dividir un número por cero, lo cual generará una excepción de división por cero y hará que el procesador invoque un manejador para esta excepción.
