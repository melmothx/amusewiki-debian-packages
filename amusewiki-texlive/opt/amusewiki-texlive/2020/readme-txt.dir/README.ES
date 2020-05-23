Bienvenido a TeX Live

   La distribución del programa TeX Live ofrece un sistema completo de TeX
   para una variedad de plataformas de GNU y Unix, Macintosh, Windows,
   entre muchas otras. La distribución abarca programas para editar, para
   realizar composiciones tipográficas, para pre-visualizar, e imprimir
   documentos TeX en muchos diferentes idiomas, y cuenta con una inmensa
   colección de macros de TeX y librerías de fuentes.

   La distribución incluye documentación extensiva acerca de TeX, al igual
   que la documentación para los programas de los paquetes que están
   incluidos.

   Para más información acerca de la licencia, por favor vea los archivos
   [1]LICENSE.TL y [2]LICENSE.CTAN en el alto-nivel de la distribución.

  Dónde comenzar

   Recomendamos enfáticamente leer la Guía de TeX Live antes de comenzar
   con la instalación. Esta guía incluye instrucciones paso-a-paso, una
   descripción de los directorios en el alto-nivel, y mucho más.

   Si la instalación es a través de la imagen del DVD, tanto la Guía en
   Español como todas las traducciones, se encuentran en el subdirectorio
   de [3]texlive-doc

   Después de la instalación, las versiones en Español de la Guía se
   encuentran en la jerarquía de [4]texmf-dist/doc/texlive en ambos
   formatos [5]html y [6]pdf. Traducciones en otros idiomas se encuentran
   disponibles bajo [7]texmf-dist/doc/texlive.

   También proveemos una lista de [8]enlaces para la documentación en PDF
   y HTML de los paquetes y programas incluidos.

   Si está llevando a cabo la instalación a través del Internet, los
   enlaces que se mencionaron anteriormente no trabajarán. En ese caso,
   puede ver [9]la documentación de TeX Live en el Internet.

   Para ver la lista de los cambios más importantes de la versión de este
   año, vea la sección de la Historia del Lanzamiento que se encuentra al
   final de este documento.

  Instalación

   El programa (script) de instalación lleva el nombre install-tl y está
   en el nivel alto del árbol del directorio. Lo puedes invocar con
   perlinstall-tl. En Windows, se puede ejecutar el adjunto archivo batch
   (install-tl-windows.bat. En las Macs, probablemente es mejor instalarlo
   a través de [10]MacTeX, el cual tiene su propio instalador nativo (está
   también en el DVD, junto a texlive en el que estás ahora.)

   install-tl tiene dos modos de operación:

   -gui (estándar en Windows y Macs) el cual realiza una instalación
          sencilla estándar, mediante el uso de una interfaz gráfica, pero
          que no obstante permite muchas opciones avanzadas si se
          necesitan.

   -no-gui (estándar en todos los otros sistemas operativos) el cual
          provee todas las opciones que están disponibles, utilizando una
          interfaz gráfica simplificada de texto.

          Las actualizaciones post-instalación de los paquetes, al igual
          que otras configuraciones son llevadas a cabo con el programa
          (script) tlmgr (TeX Live Package Manager), el cual también opera
          en ambos modos: texto y GUI.

          Usted puede ejecutar la opción --help en la línea de comando
          para ambos: [11]install-tl y [12]tlmgr que brinda información
          más detallada acerca de estos programas. Vea los enlaces de la
          documentación encima para (mucha) más información.

  Enlaces

          Finalmente, unas cuantas páginas web, para referencia. Estas
          páginas no están incluidas en TeX Live:

          + [13]http://tug.org/begin.html - si eres principiante en TeX
            y/o quieres material de introducción.
          + [14]http://tug.org/interest.html - lista general en la web de
            recursos sobre TeX, incluyendo documentación, sistemas,
            paquetes, fuentes y más.
          + [15]http://tug.org/ctan.html - un punto de entrada en el
            Comprehensive TeX Archive Network (CTAN), el cual es un
            repositorio de todas las cosas relacionadas con TeX.
          + [16]http://tug.org/usergroups.html - lista de los grupos de
            usuarios de TeX alrededor del mundo, con información de
            contacto. Le exhortamos enfáticamente que se afilie con el
            grupo de usuarios de su preferencia, para así apoyar TeX Live
            y otras actividades de TeX.

    Feliz TeXing!
            ___________________________________________________________

          [17]Página de TeX Live en el web.

References

   1. file:../LICENSE.TL
   2. file:../LICENSE.CTAN
   3. file:../texlive-doc
   4. file:../texmf-dist/doc/texlive/texlive-es
   5. file:../texmf-dist/doc/texlive/texlive-es/texlive-es.html
   6. file:../texmf-dist/doc/texlive/texlive-es/texlive-es.pdf
   7. file:../texmf-dist/doc/texlive/
   8. file:../doc.html
   9. https://tug.org/texlive/doc.html
  10. https://tug.org/mactex/
  11. https://tug.org/texlive/doc/install-tl.html
  12. https://tug.org/texlive/tlmgr.html
  13. https://tug.org/begin.html
  14. https://tug.org/interest.html
  15. https://tug.org/ctan.html
  16. https://tug.org/usergroups.html
  17. https://tug.org/texlive
