# ACTIVIDAD 3 - CONTROL DE ACCESOS

## Primera Parte: Gestion de Usuarios
### Paso 1: Creación de Usuarios: 

Para crear usuarios realizamos el siguiente comando

```bash
sudo useradd  usuario1
sudo useradd -m usuario2
sudo useradd -m usuario3
```

### Paso 2: Asignacion de contrasenas 

Para cambiar la contrasena de un usuario realizamos el siguiente comando, nos pedira la contrasena del usuario actual y la nueva contrasena para nuestro usuario

```bash
 sudo passwd usuario1
 sudo passwd usuario2
 sudo passwd usuario3
```

### Paso 3: Informacion de usuarios

Para mostrar informacion de los usuario utilizando id realizamos el siguiente comando

```bash
 id usuario1
 id usuario2
 id usuario3
```

### Paso 4: Eliminacion de usuario 3 sin directorio principal

Para realizar la eliminacion del usuario utilizamos el siguiente comando

```bash
 # Eliminar usuario sin directorio principal
 sudo userdel usuario3
 # Eliminar usuario con directorio principal
 sudo userdel -r usuario3
```

## Segunda Parte: Gestion de Grupos
### Paso 1: Creacion de grupos
Para la creacion de grupos utilizamos el siguiente comando

```bash
 sudo groupadd grupo1
 sudo groupadd grupo2
```

### Paso 2: Adicion de usuarios a grupos
Para la adicion de los usuarios "usuario1" y "usuario2" a los grupos "grupo1" y "grupo2" respectivamente utilizamos los siguientes comandos:

```bash
 sudo usermod -aG grupo1 usuario1
 sudo usermod -aG grupo2 usuario2
```

### Paso 3: Verificacion de usuarios en grupos
Para verificar que nuestros usuarios fueron agregados a los grupos correspondientes ejecutamos los siguientes comandos:

```bash
 #Primera forma
 cat /etc/group

 #Segunda forma
 cat /etc/group | grep grupo1
 cat /etc/group | grep grupo2
```
### Paso 4: Eliminacion de grupo
Para eliminar un grupo realizamos el siguiente comando

```bash
 sudo groupdel grupo2
```


## Tercera Parte: Gestion de Permisos
### Paso 1: Creación de Archivos y Directorios

Como `usuario1`, crea un archivo llamado `archivo1.txt` en su directorio principal y escribe algo en él. Luego, crea un directorio llamado `directorio1` y dentro de ese directorio, un archivo llamado `archivo2.txt`.

```bash
su - usuario1
touch /home/usuario1/archivo1.txt
echo "Primera linea archivo1 directorio1" > /home/usuario1/archivo1.txt
mkdir /home/usuario1/directorio1
touch /home/usuario1/directorio1/archivo2.txt
```

### Paso 2: Verificar Permisos

Verifica los permisos del archivo y directorio usando el comando `ls -l` y `ls -ld` respectivamente.

```bash
ls -l /home/usuario1
ls -ld /home/usuario1/directorio1
```

### Paso 3: Modificar Permisos usando `chmod` con Modo Numérico

Cambia los permisos del `archivo1.txt` para que sólo `usuario1` pueda leer y escribir (permisos `rw-`), el grupo pueda leer (permisos `r--`) y nadie más pueda hacer nada.

```bash
chmod 640 /home/usuario1/archivo1.txt
```

### Paso 4: Modificar Permisos usando `chmod` con Modo Simbólico

Agrega permiso de ejecución al propietario del `archivo2.txt`.

```bash
chmod u+x /home/usuario1/directorio1/archivo2.txt
ls -l /home/usuario1/directorio1/archivo2.txt
```

### Paso 5: Cambiar el Grupo Propietario

Cambia el grupo propietario de `archivo2.txt` a `grupo1`.

```bash
chown :grupo1 /home/usuario1/directorio1/archivo2.txt
ls -l /home/usuario1/directorio1/archivo2.txt
```

### Paso 6: Configurar Permisos de Directorio

Cambia los permisos del `directorio1` para que sólo el propietario pueda entrar (permisos `rwx`), el grupo pueda listar contenidos pero no entrar (permisos `r--`), y otros no puedan hacer nada.

```bash
chmod 740 /home/usuario1/directorio1
ls -ld /home/usuario1/directorio1
```

### Paso 7: Comprobación de Acceso

Intenta acceder al `archivo1.txt` y `directorio1/archivo2.txt` como `usuario2`. Nota cómo el permiso de directorio afecta el acceso a los archivos dentro de él.

```bash
cat /home/usuario1/archivo1.txt
cat /home/usuario1/directorio1/archivo2.txt
```

### Paso 8: Verificación Final

Verifica los permisos y propietario de los archivos y directorio nuevamente con `ls -l` y `ls -ld`.

```bash
ls -l /home/usuario1/archivo1.txt
ls -l /home/usuario1/directorio1/archivo2.txt
ls -ld /home/usuario1/directorio1
```

### Preguntas

1. ¿Por qué es importante gestionar correctamente los usuarios y permisos en un sistema operativo?
   - Es importante debido a que existen archivos que son para un uso especifico del sistema o de otros usuarios, con lo cual sino se restringe el acceso podemos revelar informacion delicada para el sistema u otro usuario.

2. ¿Qué otros comandos o técnicas conocen para gestionar permisos en Linux?
   -  En la elaboracion de esta actividad se encontro que para cambiar de grupo un archivo o directorio se cuenta ademas de ***chown*** tambien existe ***chgrp*** para cambiar el grupo propietario de un archivo/carpeta. 
   -  Setuid (s): Permite a un archivo ejecutable funcionar con los permisos del propietario del archivo en lugar de los del usuario que lo ejecuta. `Establecer: chmod u+s archivo`

   - Setgid (s): Hace que los archivos creados en un directorio hereden el grupo del directorio en lugar del grupo del usuario que los crea.`Establecer en directorios: chmod g+s directorio`

   - Sticky Bit (t): Solo el propietario del archivo o el root pueden eliminar o renombrar archivos dentro de un directorio. Establecer: `chmod +t directorio`