<table>
<tbody>
<tr>
<td><img width="100px" src="https://upload.wikimedia.org/wikipedia/commons/e/eb/Univalle.svg" alt="Univalle"> </td>
<td><img width="220px" src="https://i.ibb.co/6vdWxb4/PSI-LOGO.png" alt="PSI"></td>
</tr>
</tbody>
</table>

#  <center> <b>DSP:</b> Procesamiento Digital de Señales </center>

# DSP Univalle
Este es un repositorio el cual almacena los  Notebooks de los apuntes, resumenes y Scripts de la clase Procesamiento Digital de señales dictada por el Profesor Humberto  Loiaza  a los estudiantes de ingeniería electrónica de la universidad del Valle.

<b>Creado por:</b></br>
HUMBERTO LOAIZA CORREA Ph.D., M.Sc., Ing.</br>
<b>Correo:</b>humberto.loaiza@correounivalle.edu.co</br>

<b>Adaptado Por:</b></br>
Edwar Stiven Montaño Cely </br>
<b>Correo:</b> Edwar.montano@correounivalle.edu.co</br>

### I.	INTRODUCCIÓN

*   Las señales transportan **información** y necesitan **procesarse** para **extraer** parcial o completamente la información contenida en ellas de acuerdo con la **aplicación** de interés.

<center>
<table>
<tbody>
<tr>
<td><img width="220px" src="https://i.stack.imgur.com/YlsJf.gif" alt="image_01"> </td>
<td><img width="220px" src="https://www.radartutorial.eu/11.coherent/pic/coho-big.gif" alt="image_02"></td>
</tr>
</tbody>
</table>
</center>

*    Las señales pueden ser **modificadas** o **transformadas** intencionalmente o no. </br>

**Ejemplos:** </br>

-    **Multiplexación.** se combinan intencionalmente las señales para optimizar un canal.

<img width="400px" src="https://i.ibb.co/3Np54SX/mux-imagen.gif" alt="image_03">



-    **Extracción de Ruido.**  se remueve el ruido indeseado por procesamiento.

<center>
<table>
<tbody>
<tr>
<td><img width="350px" src="https://i.ibb.co/8P5rd8x/Capture.png" alt="image_04"> </td>
<td><img width="350px" src="http://terpconnect.umd.edu/~toh/spectrum/iFilterAnimation.gif" alt="image_05"></td>
</tr>
</tbody>
</table>
</center>

Al observar el amplio **panorama de aplicaciones** se puede comprender mejor la **necesidad** del DSP.


**Campos de aplicación:** </br>

1. Aplicaciones biomédicas</br>
2. Robótica
3. Procesamiento y transmisión de voz, texto e imágenes.
4. Televisión Digital y Telefonía Móvil
5. Sincronización y detección de fallas en motores
6. Análisis de vibraciones en máquinas y estructuras.
7. Integración de sistemas multi-sensoriales
8. Análisis de series de tiempo
9. Procesamiento de Señales Sísmicas y Espaciales
10. Radio Transmisión
11. ……

<img width="300px" src="https://gifimage.net/wp-content/uploads/2018/11/vital-signs-gif-7.gif" alt="image_06">

-   **Procesamiento de Señales Electrocardiográficas (ECG)** El corazón genera una señal eléctrica y cada segmento suministra información de diferentes partes.
<center>
<table>
<tbody>
<tr>
<td><img width="350px" src="https://www.aedsuperstore.com/resources/wp-content/uploads/sites/4/2016/03/1456943145_image5.gif" alt="image_07"> </td>
<td><img width="350px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBXHTqfWl6Sllj09K1AmDTf5suJWfLYTDPTtBymZEQ36d_7MPu&s" alt="image_08"></td>
</tr>
</tbody>
</table>
</center>

- [Animación del corazón.](https://library.med.utah.edu/kw/pharm/hyper_heart1.html)
- Un periodo representa un ciclo del proceso de circulación de la sangre desde el corazón a las arterias.
- Ruido: señal de 60 HZ, señales electromiográficas.


-   **Procesamiento de Señales Electroencefalográficas(EEG)** </br>

–    Señales generadas por la actividad eléctrica de millones de neuronas en el cerebro.</br>
–    Información en el tiempo y frecuencia utilizada para diagnosticar enfermedades del cerebro (epilepsia, desordenes del sueño, … )</br>
–    Presencia/Ausencia de componentes frecuencialeso los rangos de voltaje en personas pueden indicar problemas.</br>

<table>
<tbody>
<tr>
<td><img width="350px" src="https://bloggerblast.com/wp-content/uploads/EEG.jpg" alt="image_09"> </td>
<td><img width="350px" src="https://i.ytimg.com/vi/U1cEr0NAXS4/maxresdefault.jpg" alt="image_10"></td>
</tr>
</tbody>
</table>

-   **Procesamiento de Sonidos Musicales.** </br>
El sintetizador electrónico es un ejemplo de uso de técnicas modernas de DSP.

<table>
<tbody>
<tr>
<td><img width="350px" src="https://www.analog.com/-/media/analog/en/landing-pages/mp3demo_light_blue.gif?h=120&w=400&la=en&hash=B0F0730E14A8B7C04AA01AC5141E5D5FBB12F223" alt="image_11"> </td>
<td><img width="350px" src="https://www.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/19933/versions/1/screenshot.gif" alt="image_12"></td>
</tr>
</tbody>
</table>

Se generan artificialmente señales de vibración mecánicas similares a los instrumentos musicales para simular sonidos.</br>

<img width="400px" src="https://i.ibb.co/Jstf3VT/Capture.png" alt="image_06">


-   **Análisis de Señales.** </br>

Busca obtener mediciones sobre las propiedades de la señal.</br>

**Ejemplos:**</br>
       Análisis espectral</br>
       Reconocimiento de voz</br>
       Identificación del locutor</br>
       Detección de blancos</br>

-   **Filtrado de Señales.** </br>
Busca modificar la señal de entrada con el fin de configurarla en una forma más conveniente. </br>

**Ejemplos:**</br>
       Remoción de ruido</br>
       Separación de bandas de frecuencia</br>
       Modulación del espectro de la señal</br>

