# Actividad 2 Scripting


Aquí se describen los pasos a seguir para completar la tarea o proyecto.

### Paso 1: Creacion de url a consultar

Aca se declara e inicializan las variables que contienen el nombre del usuario de github, y la url por defecto de github ademas de la concatenacion de ambas

```bash
# Lineas 1-3
 gitUser=$(git config user.name)
 githubLink="https://api.github.com/users/"
 apiLink="$githubLink$gitUser"
```

### Paso 2: Consulta a url y creacion de archivo

Se consulta el link de la API se busca a traves de JQ las llaves id y created_at, el retorno de estas se envian a las variables correspondientes

```bash
# Lineas 4-5
 curl -s $apiLink | userId=$(jq '.id')
 curl -s $apiLink | created=$(jq '.created_at')
```

### Paso 3: Creacion del mensaje y la fecha

Se crea el mensaje que se mostrara en consola y que se escribira en el archivo, ademas obtenemos la fecha que nos servira para la creacion de la carpeta.

```bash
# Lineas 6-7
 saludo="Hola $gitUser, Id: $userId, Fecha de creacion de cuenta: $created"
 dateName=$(date '+%m-%d-%Y:%H:%M:%S')
```

### Paso 4: Creacion de carpeta, retorno por consola y escritura en archivo

Creamos una carpeta con el nombre de la fecha obtenida, retornamos por consola el mensaje correspondiente y escribimos este en el archivo saludos.log

```bash
# Lineas 8-9
 mkdir -p "/tmp/$dateName"
 echo $saludo
 echo $saludo > "/tmp/$dateName/saludos.log"
```

### Paso 5: Configuracion de crontab

Significado "*":

```plaintext
* * * * * ruta_del_comando_a_ejecutar
- - - - -
| | | | |
| | | | +---- Día de la semana (0 - 7) (Domingo es 0 o 7)
| | | +------ Mes (1 - 12)
| | +-------- Día del mes (1 - 31)
| +---------- Hora (0 - 23)
+------------ Minuto (0 - 59)
```
Abrimos el archivo crontab con el editor de nuestro gusto y anadimos el comando al final.
```bash
 # Abrimos el archivo crontab
 crontab -e
 # Agregamos esta linea al final del archivo
 */5 * * * * /home/allestgg/Documentos/code/Scripting/actividad2.sh```

