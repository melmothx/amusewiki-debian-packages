
Добро пожаловать в систему TeX Live

   Дистрибутив TeX Live предлагает полную систему TeX для ряда платформ,
   включая варианты GNU, UNIX, MacOSX, Windows. В него входят программы
   для редактирования, вёрстки, просмотра и печати документов в TeXе на
   многих языках, а также большая коллекция макросов и библиотек шрифтов.

   В дистрибутив также входит обширная общая документация о TeXе и
   документация о программах, включённых в дистрибутив.

   Лицензия на программы и документы содержится в файлах: [1]LICENSE.TL и
   [2]LICENSE.CTAN.

  С чего начать

   Мы настоятельно рекомендуем вам прочесть руководство TeX Live Guide до
   начала установки. Оно включат описание структуры директорий, описание
   установки и многое другое.

   Если вы устанавливаете с DVD, английская версия руководства
   пользователя и переводы на другие языки находится в директории
   [3]texlive-doc.

   После установки системы английская версия руководства находится в в
   директории [4]texmf-dist/doc/texlive/texlive-en в форматах [5]html и
   [6]pdf Переводы на другие языки находятся в директориях
   [7]texmf-dist/doc/texlive. В частности, русский перевод находится в
   директории [8]texmf-dist/doc/texlive/texlive-ru.

   Мы также включили список [9]ссылок на документацию в форматах PDF и
   HTML к имеющимся пакетам и программам.

   Если вы устанавливаете дистрибутив по сети, эти ссылки работать не
   будут. В этом случае вы можете найти [10]документацию на сети.

   Список наиболее важных изменений в текущей версии находится в разделе
   "Изменения" в конце документа.

  Установка

   Скрипт установки программы называется install-tl и находится в
   корневой папке. Вы можете вызвать его командой perl install-tl. Под
   Windows вы можете вместо этого просто запустить
   install-tl-windows.bat. На Маках вы, скорее всего, захотите
   использовать [11]MacTeX, у которого есть собственная программа
   установки (на DVD она тоже есть, рядом с директорией texlive, где вы
   сейчас).

   install-tl работает в двух режимах:

   -gui (по умолчанию под Windows и Mac) по умолчанию проводит простую
          установку используя графический режим, но вместе с тем
          предоставляет дополнительные возможности по настройке.

   -no-gui (по умолчанию в других случаях) даёт доступ ко всем
          настраиваемым параметрам используя упрощённый текстовой режим..

   Действия после установки и настройка системы производятся программой
   tlmgr (TeX Live Package Manager), который также работает и в
   графическом, и в текстовом режимах.

   И программа [12]install-tl, и программа [13]tlmgr выводят справку о
   своей работе при вызове с опцией --help. Ещё более подробная
   информация доступна по ссылкам выше.

  Ссылки

   Наконец, несколько интересных ссылок, не включённых в TeX Live:
     * [14]tug.org/begin.html — материал для новичков
     * [15]interest.html — общий список ресурсов для TeXa, включая
       документацию, системы, пакеты, шрифты и многое другое.
     * [16]tug.org/ctan.html — Comprehensive TeX Archive Network (CTAN),
       общий архив для всего, что имеет отношение к TeXу.
     * [17]tug.org/usergroups.html — список групп пользователей TeXа, с
       контактной информацией. Мы настоятельно рекомендуем вам вступить в
       одну из групп, для поддержки TeX Live и другой связанной с TeXом
       деятельности.

    Happy TeX'ing!
     _________________________________________________________________

   [18]Страница TeX Live

Ссылки

   1. file://localhost/home/boris/oldscratch/LICENSE.TL
   2. file://localhost/home/boris/oldscratch/LICENSE.CTAN
   3. file://localhost/home/boris/oldscratch/texlive-doc
   4. file://localhost/home/boris/oldscratch/texmf-dist/doc/texlive/texlive-en
   5. file://localhost/home/boris/oldscratch/texmf-dist/doc/texlive/texlive-en/texlive-en.html
   6. file://localhost/home/boris/oldscratch/texmf-dist/doc/texlive/texlive-en/texlive-en.pdf
   7. file://localhost/home/boris/oldscratch/texmf-dist/doc/texlive
   8. file://localhost/home/boris/oldscratch/texmf-dist/doc/texlive/texlive-ru
   9. file://localhost/home/boris/oldscratch/doc.html
  10. https://tug.org/texlive/doc.html
  11. https://tug.org/mactex/
  12. https://tug.org/texlive/doc/install-tl.html
  13. https://tug.org/texlive/tlmgr.html
  14. https://tug.org/begin.html
  15. https://tug.org/interest.html
  16. https://tug.org/ctan.html
  17. https://tug.org/usergroups.html
  18. https://tug.org/tex-live/
