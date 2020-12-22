# Table of Contents
[Spanish](#spanish)  
[English](#english)

---

<a name="spanish"/>
## Uso
Este repositorio contiene una serie de scripts que permiten replicar la experimentación descrita en la memoria.

Para hacer esto, basta con ejecutar primero `./setup.sh`, que usa los scripts `create_file.py` para generar una serie de ficheros de prueba, y `make_dockerfile.sh` para generar las dos imágenes necesarias. Una vez hecho eso, se ejecuta `sudo ./launch.sh`, que ejecuta la experimentación, y almacena los resultados en el directorio `unionfs_test_files`(El directorio que se comparte con el contenedor). Es importante tener en cuenta que, para evitar que el disco se llene con los contenedores parados, se ejecuta un `docker container prune -y`, que no pedirá confirmación al usuario, por tanto si se tienen contenedores parados que no se quiere eliminar, es necesario quitar esta línea del script.

---

<a name="english"/>
