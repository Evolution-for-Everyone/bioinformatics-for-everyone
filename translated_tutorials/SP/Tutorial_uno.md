
# Tutorial avanzado de ‘Codeml’

Por: Joseph Bielawski

------------------------------------------------------------------------

2022 Taller de evolución molecular en 'MBL'

------------------------------------------------------------------------

Sigue este link [link para ir a la página del taller](https://molevolworkshop.github.io/schedule/).

Sigue este link [link para ir a la página del taller](https://molevolworkshop.github.io/faculty-bielawski/).

## Descripción General

El objetivo de esta actividad es ayudarte a comprender cómo utilizar diferentes modelos de codones y cómo probar la selección utilizando PAML (específicamente el programa CODEML). Las actividades están diseñadas para desarrollar habilidades analíticas y son igualmente aplicables a análisis realizados con otros paquetes de software, como HyPhy. El tutorial está dividido en cuatro ejercicios: 1. Estimación de máxima verosimilitud (a mano) 2. Sensibilidad de ω 3. Pruebas de razón de verosimilitud (LRTs) para hipótesis alternativas sobre cambios temporales en la presión de selección 4. Prueba de sitios que evolucionan bajo selección positiva en el gen nef del VIH-2 NOTA: A partir de 2023, en el Taller de ‘Evolución Molecular’ SOLO realizaremos los ejercicios 1, 3 y 4. Esto incluye el paso opcional (No. 8) del ejercicio 4. En la siguiente sección (Acceso a los archivos) se describe cómo acceder y trabajar con los archivos necesarios para cada ejercicio. La forma de acceder a los archivos dependerá de si estás realizando los laboratorios dentro del taller o de manera independiente en casa. Ten en cuenta que ejecutar el programa implica modificar archivos de entrada y generar archivos de salida. Para una mejor organización, se recomienda: (i) Crear un directorio separado para cada ejercicio o análisis de datos reales que vayas a realizar. (ii) Registrar y guardar notas en texto simple sobre la motivación y detalles de cada análisis de datos reales dentro del directorio correspondiente. Este último punto actúa como un archivo "README" que será útil cuando hayas realizado múltiples análisis y necesites recordar detalles específicos. • Aquí están las diapositivas para la actividad de aprendizaje de PAML: 2024_slides • Aquí tienes una copia del capítulo del libro que acompaña estos ejercicios: Book_Chapter.pdf • Esta página contiene enlaces a documentos útiles y muchos recursos adicionales.

## Accessing the files

### **Si estás realizando el laboratorio DURANTE EL TALLER**:

En las máquinas virtuales del taller, hay un enlace simbólico en tu directorio personal llamado "moledata", que te llevará a los archivos de datos del curso. Allí encontrarás directorios para los distintos laboratorios (MSAlab, revbayes, PamlLab, etc.). Para ver la lista de laboratorios escribe:

`ls ~/moledata`

Para ver el contenido del laboratorio de PAML escribe:

`ls -1 ~/moledata/PamlLab`

Esto mostrará los directorios correspondientes a cada ejercicio:

`ex1` `ex2` `ex3` `ex4`

Los archivos ya están en la máquina virtual. Sin embargo, es recomendable ejecutar cada ejercicio en un directorio separado. El nombre del nuevo directorio depende de ti, pero escoge algo informativo (ejemplo… \~/PAML_ex1).

Para *copy* los archivos requeridos para el ejercicio 1 solo escribe:

`cp ~/moledata/PamlLab/ex1/* ~/PAML_ex1`

Ahora puedes realizar el ejercicio 1 dentro de `~/PAML_ex1`

### **2. Renombrando los archivos:**

Para cada ejercicio, debes renombrar el archivo de control eliminando el prefijo (exN). Puedes hacer esto usando el comando `cp`.

Ejemplo para el ejercicio 1:

`cp ex1_codeml.ctl codeml.ctl`

ADVERTENCIA: Ejecutar PAML dentro de un directorio sobrescribirá todos los archivos en él. Asegúrate de renombrar o mover los archivos que quieras conservar!

### **3. Si estás realizando el laboratorio INDEPENDIENTEMENTE del taller:**

Puedes descargar todos los archivos desde un archivo comprimido o individualmente según los necesites [aqui](https://bitbucket.org/EvoWorks/protocol-paml-lab-at-mbl-workshop/downloads/), o puedes descargar los archivos individualmente para cada ejercicio [aqui](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/PAML_Lab_files.html).

De cualquier manera, sigue siendo una *"mejor práctica" ejecutar cada ejercicio en un directorio de trabajo separado que crearáse (por ejemplo., `PAML_ex1`), y trabajar con copias de los archivos requeridos dentro de ese directorio.*

## Ejercicio 1

El objetivo de esta actividad es utilizar CODEML para evaluar la verosimilitud de las secuencias GstD1 para una variedad de valores de *ω*. Grafica los puntajes de log-verosimilitud contra los valores de *ω* y determina la estimación de máxima verosimilitud de *ω*. Verifica tu resultado ejecutando el algoritmo de "ascenso de colinas" de CODEML.

![Concept_figure1](https://github.com/user-attachments/assets/869cb3c5-5530-488f-8ebd-4f0e7cf027af)

1.  Encuentra los archivos de entrada para el Ejercicio 1 (**ex1_codeml.ctl, seqfile.txt**) y familiarízate con ellos. Presta especial atención al contenido del archivo de control modificado llamado **ex1_codeml.ctl**.

2.  Recuerda crear un directorio donde deseas almacenar tus resultados y coloca todos tus archivos dentro de él. Luego, abre una terminal y muévete al directorio que contiene tus archivos. Cuando estés listo para ejecutar CODEML, elimina el prefijo **ex1\_** (el archivo de control debe llamarse **codeml.ctl**). Ahora puedes ejecutar CODEML.

3.  Familiarízate con los resultados (consulta las anotaciones en [ex1_HelpFile.pdf](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise1/ex1_HelpFile.pdf)). Si no has editado el archivo de control, los resultados se escribirán en un archivo llamado **results.txt**. Identifica la línea dentro del archivo de resultados que proporciona el puntaje de verosimilitud para el conjunto de datos de ejemplo.

4.  *Ahora modifica y guarda* el archivo de control y vuelve a ejecutar CODEML CODEML para un valor fijo diferente de *ω*. La "guía rápida" del archivo de control podría ser útil aquí ([guía rápida](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise1/ex1_control_file_QuickGuide.pdf)). El objetivo es calcular la verosimilitud del conjunto de datos de ejemplo dado un valor fijo de *ω*. *Modifica el archivo de control de la siguiente manera:*

    -   Cambia el nombre de tu archivo de resultados (mediante outfile= en el archivo de control) o sobrescribirás tus resultados anteriores!

    -   Cambia el valor fijo de omega modificando el valor de omega= en el archivo de control. Los valores para este ejercicio están proporcionados como comentarios en la parte inferior del archivo de control de ejemplo que se te ha proporcionado.

5.  Repite el Paso 4 para cada valor de *ω* según los comentarios en el archivo de control de ejemplo (por ejemplo *ω*= 0.005, 0.01, 0.05, 0.1, 0.2, 0.4, 0.8, 1.6, 2.0).

6.  Usa tu hoja de cálculo o paquete estadístico favorito para graficar el puntaje de verosimilitud (eje y) contra el valor fijo de omega (eje x). Usa una escala logarítmica para el eje x (no transformes *ω*). Tu figura debería verse algo: [ex1 plot template.pdf](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise1/ex1_plot_template.pdf) (nota: los puntos de datos se han omitido intencionalmente en esta versión de la gráfica; debes generar los datos por tu cuenta).

```         
-   Para obtener ayuda sobre cómo graficar tus resultados, consulta los recursos adicionales [en esta página](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/Resources.html).
```

7.  A partir de tu gráfica, intenta responder la siguiente pregunta:

    -   *¿Cuál es el valor de ω que maximiza el puntaje de verosimilitud (es decir, el MLE)?*

8.  Ahora cambia el archivo de control para que CODEML utilice su algoritmo de ascenso de colinas para encontrar el MLE; establece `fix_omega=0` en el archivo de control. Compara el resultado con tu estimación del Paso 7.

    -   *¿Qué tan buena fue tu estimación del MLE?*

## Exercise 2

En este ejercicio investigarás la sensibilidad de *ω* con respecto a la razón de transición/transversión (kappa) y a las frecuencias de codón asumidas (*π's*). Después de recopilar los datos requeridos, determinarás qué supuestos producen los valores más grandes y más pequeños de S y qué efecto tienen en el valor de *ω*.

![Concept_figure2](https://github.com/user-attachments/assets/e185f81c-3b52-4486-b1ec-2b6ba7b055b0)

1.  Encuentra los archivos para el Ejercicio 2 (**ex2_codeml.ctl, seqfile.txt**) and familiarize yourself with them. It would be best to create a new directory for Exercise 2. When you are ready to run CODEML, delete the **ex2\_** prefix (the control file must be called **codeml.ctl**).

2.  Ejecuta CODEML usando la configuración en el archivo de control para el Ejercicio 2. Familiarízate con los resultados ([ex2 HelpFile.pdf](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise2/ex2_HelpFile.pdf)). Además de la puntuación de verosimilitud, debes identificar la parte del archivo de resultados que proporciona estimaciones de lo siguiente:

    -   o Número de sitios sinónimos o no sinónimos (S y N)

    -   o Tasas sinónimas y no sinónimas (dS y dN)

3.  Al igual que en el Ejercicio 1, necesitarás *change and save* los archivos de control y volver a ejecutar CODEML. La "guía rápida" del archivo de control puede ser útil aquí ([guía rápida](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise2/ex2_control_file_QuickGuide.pdf)).El objetivo es calcular la verosimilitud del conjunto de datos de ejemplo bajo diferentes supuestos de modelo. Para hacer esto, debes:

    -   *Cambiar* el nombre del archivo principal de resultados (a través de outfile= en el archivo de control) o sobrescribirás tus resultados anteriores.

    -   *Cambiar* los supuestos del modelo sobre las frecuencias de codón (mediante `CodonFreq=`) y kappa (mediante `kappa=` y `fix_kappa=`).

4.  Repetir el paso 3 para cada conjunto de supuestos sobre las frecuencias de codón y kappa dados como comentarios al final del archivo de control de ejemplo, y mostrados en la figura a continuación.

![Concept_figure2 2](https://github.com/user-attachments/assets/f5872c74-79fb-4d5c-b1b3-7f212b0dd7d2)

5.  En tu programa favorito de hojas de cálculo, crea una tabla similar a la **Tabla E2** en las diapositivas (ver [ex2 table template.pdf](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise2/ex2_table_template.pdf)) y complétala con tus resultados.

6.  Usa tu tabla para determinar:

    -   *¿Qué suposiciones generan los valores más grandes y más pequeños de S?*
    -   
        -   ¿Cuál es el efecto sobre ω?\*
    -   *Qué modelo elegirías?*

## Ejercicio 3

El objetivo de este ejercicio es utilizar tres pruebas de razón de verosimilitud (LRTs) para evaluar las siguientes posibilidades: (1) La tasa de mutación de Ldh-C ha aumentado en relación con Ldh-A. (2) Ocurrió un aumento de selección positiva para la divergencia funcional después del evento de duplicación que dio lugar a Ldh-C. (3) Hubo un cambio a largo plazo en las restricciones selectivas después del evento de duplicación que dio lugar a Ldh-C.

1.  Obtén los archivos para el Ejercicio 3 desde el sitio web del curso (**ex3_codeml.ctl, seqfile.txt, treeH0.txt, treeH1.txt, treeH2.txt, treeH3.txt**). Los archivos de árbol representan diferentes hipótesis denominadas H0, H1, H2 y H3 (sConsulta el diagrama a continuación, o descarga este archivo [genetree](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise3/LDH_gene_tree.pdf)). Estos conceptos evolutivos descritos anteriormente están cubiertos por estas cuatro hipótesis precisas:

    -   H0: Presión selectiva homogénea en todo el árbol (concepto = cualquier diferencia en las tasas se debe a cambios en la tasa de mutación).

    -   H1: Cambio episódico en la presión selectiva en Ldh-C (concepto = solo en la rama que sigue inmediatamente al evento de duplicación del gen).

    -   H2: Cambio a largo plazo en la presión selectiva solo en Ldh-C (concepto = Ldh-C tiene una nueva presión selectiva, en comparación con sus ancestros, mientras que Ldh-A sigue estando sujeto al nivel ancestral de presión selectiva).

    -   H3: Cambio a largo plazo en la selección tanto de Ldh-C como de Ldh-A (concepto = ambas líneas paralógicas experimentan presiones selectivas nuevas; es decir, diferentes entre ellas, y de sus ancestros).

![LDH_gene_tree](https://github.com/user-attachments/assets/fd5d3ebc-de43-41e1-ba1b-a0fc7bcfbf07)

2.  Ejecuta CODEML utilizando la configuración del archivo de control para el Ejercicio 3. Familiarízate con los resultados ([ex3_HelpFile.pdf](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise3/ex3_HelpFile.pdf)). Además del puntaje de verosimilitud, debes identificar las estimaciones específicas por rama del parámetro *ω*. (En la primera ejecución, los valores de *ω* para cada rama serán iguales. En ejecuciones posteriores, habrá diferencias entre algunas ramas).

3.  Al igual que en los ejercicios anteriores, deberás *modificar el archivo de control* y volver a ejecutar CODEML. Puede ser útil consultar la "Guía rápida" del archivo de control ([guía rápida](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise3/ex3_control_file_QuickGuide.pdf)).El objetivo es calcular la verosimilitud y estimar los parámetros *ω* bajo diferentes modelos que describen cómo cambia la presión de selección en distintas partes del árbol filogenético. Como la información relevante del modelo está contenida en el archivo del árbol, en cada análisis deberás especificar uno de los distintos archivos de árbol y modificar el archivo de control para que lea el archivo de árbol correspondiente.

    -   Como siempre, debes cambiar el nombre del archivo de resultados principales (mediante outfile= en el archivo de control), o de lo contrario sobrescribirás los resultados anteriores.

    -   *Modifica* los supuestos del modelo sobre los valores específicos de ω por rama cambiando los archivos de árbol (mediante `treefile=` and `model=`) dentro del archivo de control.

4.  Repite el Paso 3 para cada uno de los cuatro archivos de árbol que se te proporcionó. Nuevamente, lleva un registro de tus resultados utilizando una tabla similar a la **Tabla E3** mostrada en las diapositivas (ver [ex3 table template.pdf](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise3/ex3_table_template.pdf)). Además, realiza pruebas de razón de verosimilitud (LRT) para evaluar las siguientes hipótesis. Consulta las notas de la clase para obtener más detalles sobre las LRT. Utiliza 1 grado de libertad para calcular el valor- *P* para cada LRT. (Sugerencia: puedes usar una calculadora de Chi-Cuadrado para obtener elvalor- *P*: [Chi-Square calculator](https://homepage.divms.uiowa.edu/%7Embognar/applets/chisq.html))

```         
-   H0 vs. H1
-   H0 vs. H2
-   H2 vs. H3
```

5.  Usa tu tabla de resultados para responder las siguientes preguntas:

    -   *¿Qué modelo(s) son respaldados por los datos?*

    -   *¿Cuál es el escenario biológico que mejor explica la evolución de la familia de genes Ldh?*

    -   *¿Hay evidencia de selección positiva durante la evolución de Ldh?*

    -   *¿Existen escenarios en los que Ldh podría haber evolucionado por selección positiva, pero que serían indetectables mediante estas pruebas LRT?*

## Ejercicio 4

El objetivo de este ejercicio es utilizar una serie de pruebas de razón de verosimilitud (LRTs) para *detectar sitios* que evolucionan bajo selección positiva en el gen nef. Si encuentras evidencia significativa de selección positiva, identifica los sitios involucrados utilizando métodos empíricos de Bayes.

1.  Obtén todos los archivos para el Ejercicio 4 (**ex4_codeml.ctl.txt, ex4_seqfile.txt, treeM0.txt, treeM1.txt, treeM2.txt, treeM3.txt, treeM7.txt, treeM8.txt**). Cuando estés listo para ejecutar CODEML, recuerda eliminar el prefijo **ex4\_** (el archivo de control debe llamarse **codeml.ctl**).

2.  Si planeas ejecutar dos o más modelos al mismo tiempo, crea un directorio separado para cada ejecución y coloca una copia del archivo de secuencia, el archivo de control correspondiente y el archivo de árbol en cada directorio

![Models_figure_v2](https://github.com/user-attachments/assets/5158fe8e-3df3-4246-9c42-24c56eacc9e7)

3.  Como en los ejercicios anteriores, deberás *modificar el archivo de control* y volver a ejecutar CODEML varias veces. En este caso, ajustarás seis modelos de codones diferentes (M0, M1a, M2a, M3, M7 & M8) al conjunto de datos de ejemplo. La "guía rápida" del archivo de control puede ser útil aquí "[guía rápida](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise4/ex4_control_file_QuickGuide.pdf)".

    -   Si estás ejecutando los análisis secuencialmente en el mismo directorio, cambia el nombre del archivo de resultados principal (mediante outfile= en el archivo de control), o de lo contrario sobrescribirás tus resultados anteriores.

    -   Configura el archivo de árbol con `treefile=`. Se te proporcionaron archivos de árboles con las longitudes de rama de máxima verosimilitud (ML) pre-cargadas para cada modelo (por lo que deberás establecer un árbol diferente para cada modelo). Esto acelerará significativamente tu análisis, dándote más tiempo libre. Consulta el archivo de control de ejemplo para más detalles sobre los nombres de los archivos de árbol.

    -   Establece el modelo de codones con `NSsites=`.

    -   Corrige el valor de kappa en la estimación de ML con 'kappa=.' Nuevamente, esto ayudará a acelerar el análisis. Consulta el archivo de control para conocer el valor de kappa en cada modelo.

    -   o Para algunos modelos, también deberás establecer el número de categorías (ncatG) en la distribución de *ω*:

        -   para M3 establece `ncatG=3`

        -   para M7 establece `ncatG=10`

        -   para M8 establece `ncatG=10`

    -   Una vez que el análisis haya finalizado, cambia el nombre del archivo rst, ya que las siguientes ejecuciones lo sobrescribirán!

    -   Repite estos pasos para cada uno de los seis modelos de codones mencionados anteriormente.

4.  Lleva un registro de tus resultados ([ex4_HelpFile.pdf](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise4/ex4_HelpFile.pdf)) utilizando una tabla como la **Table E4** mostrada en las diapositivas (ver [ex4 table template.pdf](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise4/ex4_table_template.pdf)).

5.  Además, realiza las siguientes pruebas de razón de verosimilitud (Likelihood Ratio Tests, LRTs):

    -   M0 vs. M3 (4 grados de libertad)

    -   M1a vs. M2a (2 grados de libertad)

    -   M7 vs. M8 (2 grados de libertad)

6.  Por último, abre el archivo rst generado cuando ejecutaste el modelo M3 ([ex4_rst-HelpFile.pdf](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/exercise4/ex4_rst_HelpFile.pdf)). Localiza las columnas de probabilidades posteriores para cada sitio bajo las tres categorías de sitios de este modelo. Usa estos datos para generar una gráfica del gen nef similar a la mostrada a continuación (*tu gráfica se verá diferente a la mostrada en el ejemplo*).

![Posteriors_v3](https://github.com/user-attachments/assets/8d137e0b-2650-44cb-9910-9216e66f37d4)

7.  Como paso final, intenta sintetizar todos tus resultados e intenta una interpretación biológica del tipo que incluirías en un artículo de investigación. Las siguientes dos preguntas generales pueden ayudarte a comenzar. Te recomiendo encarecidamente que realices este último paso en colaboración con otros estudiantes del taller; ¡comenten y analicen juntos!

    -   *¿Qué conclusiones biológicas están bien respaldadas por estos datos?*

    -   *¿Qué aspectos de los resultados puedes interpretar según tu conocimiento previo sobre este sistema u otros similares?*

8.  OPCIONAL: Investiga cuánta computación adicional se requiere para estimar las longitudes de las ramas a partir de los datos. (Recuerda que en los archivos de árbol se proporcionaron estimaciones previas de los valores de máxima verosimilitud - MLEs).

    -   *Ejecuta nuevamente el modelo M0 como antes (lo hiciste en el paso 3). Pero esta vez observa que tan rápido le tomó al programa ejecutarlo.*

    -   *Ahora cambia el archivo de control para el modelo M0. Ajusta fix_blength = 0.El valor 0 indica que las longitudes de las ramas en el archivo de árbol serán ignoradas y serán estimadas por máxima verosimilitud (ML).*

    -   *Vuelve a ejecutar el modelo M0 con fix_blength = 0 y compara cuánto tiempo tarda en completarse.*

    -   *¿Cuál es el efecto del tamaño del árbol en las pruebas de hipótesis basadas en ML?*

    -   *¿Crees que las longitudes de rama tienen un gran impacto en la verosimilitud de los datos? ¿Y en las pruebas de hipótesis? ¿Cómo podrías usar fix_blength = 2 para comprobar esto?*

## SIGUIENTES PASOS...

Ahora que tienes algo de experiencia con los modelos de codones, quizás quieras probar un tutorial que cubra temas más avanzados. El tutorial avanzado se centra en la *detección de evolución adaptativa episódica* mediante el "Modelo de Rama-Sitio A".

![NextSteps_figure](https://github.com/user-attachments/assets/586b16a2-1092-4ec7-8795-ef92129bb0a2)

El tutorial también incluye **actividades adicionales** sobre

-   Identificación y etiquetado de ramas en árboles filogenéticos para su uso en modelos de codones de rama-sitio.
-   Detección de inestabilidades en las estimaciones de parámetros.
-   Realización de análisis de robustez.
-   Uso de agregación bootstrap suavizada (SBA) para corregir la incertidumbre e inestabilidad en las estimaciones de parámetros en modelos de codones.

Los protocolos para cada actividad están publicados en *Protocols in Bioinformatics* (UNIDAD 6.15). Esta unidad también presenta **recomendaciones sobre las “mejores prácticas” para llevar a cabo un estudio evolutivo a gran escala** sobre evolución adaptativa episódica utilizando PAML.

Puedes consultar el archivo PDF de **Protocolos de Bioinformática** UNIDAD 6.15 aquí: [UNIT 6.15](http://awarnach.mathstat.dal.ca/%7Ejoeb/PAML_lab/resources/UNIT6.15.pdf)

Los archivos necesarios para este “laboratorio avanzado” están disponibles en este repositorio de Bitbucket: [repository-link](https://bitbucket.org/EvoWorks/protocol-inference-of-episodic-selection/downloads)

