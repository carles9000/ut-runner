![alt text](https://i.postimg.cc/FzCp24dM/ut-runner.png)

Welcome to UT-Runner
====================

UT-Runner es un servidor web para harbour poder realizar rapidamente pruebas de concepto. Para arancarlo ejecutamos app.exe y el server se iniciará por defecto en el puerto 81. Si en la url esribimos localhost:81 deberia mostrarse la pagina principal.

El sistema esta basado en 2 partes

### 1.- Runner , que es un sistema de pruebas.

- En la carpeta /runner podemos poner nuestros ficheros html, prgs... 
- Si escribimos en la url localhost:81/runner nos apareceran los ficheros de prueba. Simplemente haciendo doble click, podemos ejecutar nuestro fichero
Hay varios ejemplos de test para poder ver las capacidades del sistema: uso de html, prgs, curl, materialize, bootstrap, tweb,...


### 2.- Server App, un sistema para rapidamente parametrizar una simple aplicacion.
- Los fuentes siempre iran en carpeta /html y tendremos que indicarlo al server.
- Deberemos indicar una ruta para ejecutar un fichero y tambien lo parametrizaremos.
- La manera de parametrizar será via fichero app.ini
- En la seccion [procs] pondremos una etiqueta que sera la carpeta contenedora de los fuentes y en ella añadiremos los fuentes que queremos procesar. Por ejemplo

**[procs]**
  
  prg = prg/proc1 prg/proc2 prg/proc3 prg/hello 

Esto indica al servidor cuando arranque que verifique y compruebe estos ficheros

- En la seccion [routes] indicaremos el nombre de la ruta y que queremos que se ejecute que podrá ser un fichero html o una función que hayamos cargado en uno de los ficheros. Por ejemplo

**[routes]**

  - / = hello
  - /p1 = proc1
  - /p1b = proc1b
   
Esto creará al arrancar el server estas routes y una vez levantado el server si ponemos en la url localhost:81/p1, localhost:81/p1b o simplemente localhost:81/ el servidor ya sabra que debe ejecutar

### 3.- Otros...
- En el fichero app.ini podemos parametrizar tambien:
  - port = 81		      // Numero de puerto 
  - showfiles = yes		// Si queremos mostrar los ficheros cuando escribamos localhost:81/runner 

- En la carpeta /html/flow hay un sencillo ejemplo de aplicación que se autentica, puede ir al menu principal y de alla a otros módulos, que si no estas autenticado te envia a la pantalla 
de login. Todo montado con rutas y sencillos ficheros. Para poder ejecutarlo simplementa descomenta del fichero app.ini todo lo comentado relativo al ejemplo flow y arranca el servidor para que cargue la nueva configuración. Este es el flujo de la app

![alt text](https://github.com/carles9000/ut-runner/blob/main/doc/flow.drawio.png)


Y la magia de todo es como rápidamente armamos un servidor y habilitando los puertos de nuestro router pueda ser visto desde internet. Todo con harbour y sin compilar nada !!!

Esto es todo ! 


Visita https://carles9000.github.io/ 

