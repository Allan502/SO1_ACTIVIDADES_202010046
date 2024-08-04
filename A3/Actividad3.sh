# PRIMERA PARTE
sudo useradd  usuario1
sudo useradd -m usuario2
sudo useradd -m usuario3

sudo passwd usuario1
sudo passwd usuario2
sudo passwd usuario3

id usuario1
id usuario2
id usuario3

sudo userdel usuario3
sudo userdel -r usuario3

# SEGUNDA PARTE
sudo groupadd grupo1
sudo groupadd grupo2

sudo usermod -aG grupo1 usuario1
sudo usermod -aG grupo2 usuario2

cat /etc/group | grep grupo1
cat /etc/group | grep grupo2

sudo groupdel grupo2

# TERCERA PARTE

su - usuario1
touch /home/usuario/file1.txt
echo "Primera linea archivo1 directorio1" > /home/usuario1/file1.txt
mkdir /home/usuario1/directorio1
touch /home/usuario1/directorio1/file2.txt

ls -l /home/usuario1
ls -ld /home/usuario1

chmod 640 /home/usuario1/file1.txt

chmod u+x /home/usuario1/directorio1/file2.txt  
ls -l /home/usuario1/directorio1 

chown :grupo1 directorio1/file2.txt
ls -l /home/usuario1/directorio1/file2.txt

chmod 740 /home/usuario1/directorio1
ls -ld directorio1

cat /home/usuario1/file1.txt
    cat: /home/usuario1/file1.txt: Permiso denegado
cat /home/usuario1/directorio1/file2.txt
    cat: /home/usuario1/directorio1/file2.txt: Permiso denegado

ls -l /home/usuario1/file1.txt
ls -l /home/usuario1/directorio1/file2.txt
ls -ld /home/usuario1/directorio1



