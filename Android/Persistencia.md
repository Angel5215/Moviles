# Persistencia de datos

Cuando estamos utilizando nuestro dispositivo móvil, en ocasiones, deseamos que algunos datos dentro de una aplicación puedan ser guardados, aún cuando nosotros cerremos la aplicación o apaguemos el dispositivo. A esto se le conoce como *Persistencia de datos*.

La persistencia de datos puede lograrse de diferentes maneras:

1. Haciendo uso de la clase SharedPreferences.
2. Guardando archivos en la memoria interna del dispositivo.
3. Guardando archivos en una memoria externa.
3. Guardar la información en una base de datos.

Con esto surge la cuestión: ¿Cuándo utilizar cada uno de esos métodos? A continuación analizaremos cada uno de los métodos para persistencia de datos y se hará notar en qué casos es mejor usar uno que otro.

## La clase SharedPreferences

Si lo que se pretende es almacenar una cantidad limitada de datos, como por ejemplo, información personal, opciones de presentación, entre otros, es preferible el uso de la clase SharedPreferences.
Las preferencias compartidas o *shared preferences* se almacenarán en una forma de clave-valor, lo que quiere decir que cada una de ellas tendrá un identificador único con el cual acceder (ejemplo: "nombre") y dicho identificador tendrá un valor asociado (ejemplo: "Juan").
*¿Y dónde se guarda toda esa información?* La respuesta es sencilla; es en archivos XML.

*¿Cómo se manejan estas preferencias compartidas?*
Gracias al lenguaje de programación utilizado, podemos hacer uso de *Colecciones*. En una aplicación, podemos manejar varias colecciones de preferencias, y estas tendrán identificador único.
Si queremos obtener una referencia a una colección, tendremos que utilizar el método `getSharedPreferences()`, el cual recibe 2 argumentos: El identificador de la colección (En forma de cadena) y un modo de acceso.
El modo de acceso nos sirve para indicar qué aplicaciones pueden tener acceso a la colección de preferencias. Generalmente existen 3 modos de acceso:
* `MODE_PRIVATE`. Nos indica que sólo la misma aplicación tendrá acceso a las preferencias.
* `MODE_WORLD_READABLE`. Nos indica que todas las aplicaciones pueden leer estas preferencias, sin embargo, sólo la principal podrá modificarlas.
* `MODE_WORLD_WRITABLE`. Nos indica que todas las aplicaciones pueden leer y modificar estas preferencias.


Sin embargo, a pesar de que existen diferentes modos de acceso, es muy común utilizar `MODE_PRIVATE` debido a la seguridad que le da a nuestras preferencias para poder ser modificadas. De hecho, a partir de la API 17 (Android 4.2), las otras dos opciones quedaron obsoletas.


Hagamos un ejemplo práctico para ver su funcionamiento.

El diseño de la aplicación tiene la siguiente forma:

![alt text](PersistenciaShared.JPG)

Lo que queremos hacer es verificar si hay algún dato(en este caso una cadena) guardada en nuestra aplicación por medio de un SharedPreference. Eso lo podemos conocer presionando el botón *Verificar*. Si hay algo guardado, lo mostrará en un Toast, en caso contrario, nos mandará un mensaje indicando que no se tiene algún dato guardado.

El código Java es el siguiente:

```java

package com.example.rodrigo.persistenciashaared;

import android.content.Context;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    EditText et1;
    Button btnIngresar;
    Button btnVerificar;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        et1 = (EditText) findViewById(R.id.txtDato);
        btnIngresar = (Button) findViewById(R.id.btnIngresar);
        btnVerificar = (Button) findViewById(R.id.btnVerificar);

        btnIngresar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String dato = et1.getText().toString();
                SharedPreferences sp = getSharedPreferences("datosingresados",Context.MODE_PRIVATE);
                SharedPreferences.Editor editor = sp.edit();
                editor.putString("dato", dato);
                editor.commit();
            }
        });

        btnVerificar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                SharedPreferences sp = getSharedPreferences("datosingresados", Context.MODE_PRIVATE);
                String valorguardado = sp.getString("dato", "No guardaste nada");
                Toast.makeText(getApplicationContext(),"Dato guardado: "+valorguardado, Toast.LENGTH_LONG).show();
            }
        });
    }


}

```

Puede apreciarse en el código, que la funcionalidad de la aplicación recae en los dos botones.
En el botón *Ingresar* se tienen las siguientes operaciones:
1. Guardamos la cadena ingresada en el EditText en una variable de tipo String llamada *dato*.
2. Se crea una referencia a un objeto de la clase SharedPreferences y ejecutamos el método `getSharedPreferences()`, que recibe como argumento *"datosingresados"* (nombre de la colección) y será en modo privado.
3. Mencionamos que queremos editar nuestra colección, por lo que llamamos a `SharedPreferences.Editor` y creamos un objeto. Hacemos uso del método `edit()` del objeto SharedPreferences.
4. Ingresamos la cadena que queremos guardar con el método `putString()`, que recibe la llave de un objeto dentro de nuestra colección, junto con el valor asociado. Nota: existen métodos para ingresar cualquier tipo de dato, como puede ser `putInt()`, `putDouble()`, etc.
5. Guardamos los cambios con el método `commit()` del editor.

Para el botón *Verificar* se observan las siguientes acciones:
1. Accedemos a la colección llamada *datos ingresados* con el método `getSharedPreferences()`.
2. Verificamos si existe algún valor guardado en la colección con el método `getString()`. Observamos que en el primer argumento contiene la cadena "dato", esta es la posible clave de algún valor guardado, si existe, nos devolverá el valor y se guarda en la variable *valor guardado*, en caso de que no exista, nos devolverá la cadena ingresada como segundo parametro (En este caso se ingresó "No guardaste nada").
3. Lanzamos un Toast para que nos verifique si existe o no algún dato guardado.

### Probando la aplicación

Si al iniciar la aplicación presionamos el botón *Verificar*, nos arrojará un mensaje indicando que no se ha guardado nada, así como se muestra en la siguiente imagen:

![alt text](sinGuardar.JPG)

Si ahora, ingresamos una cadena en el EditText, presionamos el botón *Ingresar*, y seguidamente volvemos a presionar el botón *Verificar*, ahora el Toast nos devolverá un mensaje con la cadena guardada en nuestros *SharedPreferences*.
Véase la siguiente imagen:

![alt text](conGuardar.JPG)

Incluso al cerrar la aplicación y volver a abrirla, si ahora volvemos a presionar el botón de *Verificar*, podremos ver que nuestro dato seguirá guardado.

## Almacenamiento en la memoria interna del dispositivo

Existirán ocasiones en que, al momento de estar utilizando una aplicación, queramos guardar información en forma de un archivo para poder volver a utilizarlo en un futuro. Tal es el caso de los documentos de texto, en donde nosotros podemos escribir y posteriormente abrir ese archivo de nuevo para seguir editando.
Los archivos que se crean deben almacenarse en alguna memoria, y en este caso, veremos cómo utilizar la memoria interna de nuesto dispositivo Android.
Debemos de tener en cuenta las limitaciones que tiene el dispositivo en cuanto a su memoria, por lo que en la memoria interna es recomendable no guardar archivos de gran tamaño.
Si lo que deseamos es escribir datos en un archivo, Android nos ofrece el método `openFileOutput()`, el cual recibirá como parámetros el nombre del archivo en el cual queremos escribir y el modo de acceso con el que queremos acceder al fichero. Para los métodos de acceso tenemos:
* `MODE_PRIVATE`: Para tener acceso privado, es decir, únicamente desde nuestra aplicación (Crea el archivo o lo sobreescribe si ya existe).
* `MODE_APPEND`: Para poder añadir datos a un archivo existente.
* `MODE_WORLD_READABLE`: Para que otras aplicaciones puedan leer el archivo. 
* `MODE_WORLD_WRITABLE`: Para que otras aplicaciones puedan escribir sobre el archivo. 
Los últimos dos han sido declarados como obsoletos en la API 17.

El método anterior nos devolverá una referencia al flujo de salida asociado al archivo, por lo que ya podremos utilizar los métodos para manipulación de archivos como se hace en el lenguaje Java.

Para que esto quede más claro, hagamos un ejemplo. Haremos una aplicación que pueda guardar un texto ingresado en un archivo, además de poder ingresar el nombre de un archivo para ver su contenido.

El diseño de la aplicación tendrá la siguiente forma:

![alt text](MemoriaInterna.JPG)

El archivo *activity_main.xml* debe de contener lo que se muestra a continuación:

```xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity"
    android:orientation="vertical">

    <EditText
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:hint="Ingresa el archivo que deseas abrir"
        android:id="@+id/txtAbrir"/>
    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="horizontal"
        android:gravity="center">

        <Button
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="abrir notas"
            android:layout_gravity="center"
            android:id="@+id/btnAbrir"/>
        <Button
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="Guardar nota"
            android:layout_gravity="center"
            android:id="@+id/btnGuardar"/>
    </LinearLayout>
    <EditText
        android:layout_width="match_parent"
        android:layout_height="458dp"
        android:background="#ffffbf"
        android:ems="10"
        android:inputType="textMultiLine"
        android:id="@+id/txtNota"/>



</LinearLayout>
```

El código Java es el siguiente:

```java
package com.example.rodrigo.memoriainterna;

import android.app.Activity;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class MainActivity extends AppCompatActivity {

    EditText et1, et2;
    Button boton1, boton2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        et1 = (EditText)findViewById(R.id.txtAbrir);
        et2 = (EditText)findViewById(R.id.txtNota);
        boton1 = (Button)findViewById(R.id.btnAbrir);
        boton2 = (Button)findViewById(R.id.btnGuardar);


        boton1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String archivo = et1.getText().toString();
                String[] archivos = fileList();
                if(existeArchivo(archivos, archivo)){
                    try{
                        InputStreamReader arch = new InputStreamReader(openFileInput(archivo));
                        BufferedReader br = new BufferedReader(arch);
                        String linea = br.readLine();
                        String texto = "";
                        while(linea != null){
                            texto = texto + linea + "\n";
                            linea = br.readLine();
                        }
                        br.close();
                        arch.close();
                        et2.setText(texto);
                    }catch (IOException e){}
                }
            }
        });

        boton2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                try{
                    OutputStreamWriter archivo = new OutputStreamWriter(openFileOutput("notas.txt", Activity.MODE_PRIVATE));
                    archivo.write(et2.getText().toString());
                    archivo.flush();
                    archivo.close();
                }catch(IOException e){}
                Toast.makeText(getApplicationContext(), "El texto fue grabado", Toast.LENGTH_SHORT).show();

            }
        });

    }

    private boolean existeArchivo(String[] archivos, String busqueda){
        for(int i = 0; i < archivos.length; i++){
            if(busqueda.equals(archivos[i]))
                return true;
        }
        return false;
    }

}


```

El código del *MainActivity.java* es muy sencillo de entender, sólo es necesario entender la lógica que se encuentra dentro de los eventos de los botones.

El primer botón (*boton1*) servirá para poder leer el contenido del archivo que nosotros ingresemos en el EditText de la parte superior. Mediante flujos y con el método `openFileOutput()`. Con el método `fileList()` guardamos un arreglo que almacena los archivos guardados por la aplicación y es lo que usaremos para abrir el archivo.
Tendremos que verificar si el archivo que ingresamos existe, ya que en caso contrario podría marcarnos un error en la aplicación; para eso se creó el método `existeArchivo()` que recorre el arreglo de archivos y verifica si existe alguno con el mismo nombre.
Si encuentra alguna coincidencia, empezará a guardar el contenido del archivo en una variable y finalmente mostrará todo el texto en el EditText que tiene por nombre "et2" (El que está en la parte inferior).

Para el segundo botón (*boton2*) se seguirá una lógica muy similar, sólo que en vez de leer un archivo, se escribirá en él con la ayuda de flujos en Java. En dicho flujo nosotros le dimos el nombre de "notas.txt", y si no existe el archivo en la memoria interna, se va a crear automáticamente. En caso de que ya exista un archivo con el mismo nombre, lo va a sobreescribir.
Ya que hayamos cerrado el flujo podremos enviar un mensaje con un Toast indicando al usuario que no hubo problema escribiendo en el archivo y que ya se encuentra en la memoria interna.

Aquí se muestran unas fotos con el funcionamiento de la aplicación.

*Guardando texto con el botón 'Guardar Nota' en un archivo notas.txt*
![alt text](MemoriaInternaGuardar.JPG)

