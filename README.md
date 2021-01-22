# Table of Contents
[Spanish](#spanish)  
[English](#english)

---

<a name="spanish"/>

## Uso

Este repositorio contiene una serie de scripts que permiten replicar la experimentación descrita en la memoria.

Para hacer esto, basta con ejecutar primero `./setup.sh`, que usa los scripts `create_file.py` para generar una serie de ficheros de prueba, y `make_dockerfile.sh` para generar las dos imágenes necesarias. Una vez hecho eso, se ejecuta `sudo ./launch.sh`, que ejecuta la experimentación, y almacena los resultados en el directorio `unionfs_test_files` (El directorio que se comparte con el contenedor). Es importante tener en cuenta que, para evitar que el disco se llene con los contenedores parados, se ejecuta un `docker container prune -f`, que no pedirá confirmación al usuario, por tanto si se tienen contenedores parados que no se quiere eliminar, es necesario quitar esta línea del script.

---

## Usage

This repository contains several scripts that can replicate the experimentation described in the memory (In Spanish). The memory describes the planification and setup for testing the differences in storage performance between docker images when changing a number of parameters, such as size and number of files used, writing or reading, and, most importantly, the number of layers of the image (See https://docs.docker.com/storage/storagedriver/#images-and-layers), the layer where the tests are conducted, and the use of a shared directory with the host. I also tested the differences between several Docker storage drivers.

`./setup.sh` uses the scripts `create_file.py` to generate a set of test files, and `make_dockerfile.sh` to create two docker images with different number of layers. After that, `sudo ./launch.sh` will run the experiments, and store the results in the directory `unionfs_test_files` (Shared with the containers). It is important to note that, in order to prevent filling up the storage drive, `docker container prune -f` is executed periodically. This command does not ask for user confirmation, so if there are stopped containers in the system that need to be kept, it is necessary to remove that line from the script before execution.


<a name="english"/>
