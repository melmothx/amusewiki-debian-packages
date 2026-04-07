TeX Live zaprasza

   TeX Live oferuje pełną instalację systemu TeX-a dla  różnych systemów
   operacyjnych: GNU/Unix, Macintosh, Windows i wielu innych. Znajdziemy tu
   programy do edycji, składu, przeglądania i drukowania dokumentów TeX-owych w wielu 
   językach oraz bogate kolekcje makr i fontów.
   
   Dystrybucja zawiera obszerną dokumentację TeX-a, a także dokumentacje
   towarzyszące poszczególnym pakietom oprogramowania.

   Infomacje licencyjne (w języku angielskim) można znaleźć w plikach
   tekstowych [1]LICENSE.TL oraz [2]LICENSE.CTAN.

Od czego zacząć

   Przed rozpoczęciem instalacji zalecamy wydrukować i przeczytać
   Przewodnik po TeX Live. Prowadzi on krok po kroku przez instalację,
   znajdziemy tam też opis głównego drzewa katalogów i dużo więcej.

   Gdy instalujemy z płytki DVD, wersje Przewodnika w kilku językach dostępne są
   w podkatalogu [3]texlive-doc.

   Po zainstalowaniu systemu, Przewodnik w języku angielskim w formacie
   [4]html i [5]pdf znajdziemy w [6]texmf-dist/doc/texlive/.  
   Inne wersje językowe Przewodnika, w tym polska dostępne są także w 
   [7]texmf-dist/doc/texlive.

   Dołączyliśmy również listę odnośników do [8]dokumentacji HTML i PDF
   programów i pakietów zawartych w instalacji.

   Jeśli instalujemy TeX Live z internetu, powyższe odnośniki nie działają. 
   W tym przypadku należy sięgnąć do dokumentacji tutaj: [9]dokumentacja TeX Live
   w internecie.

   Lista najważniejszych zmian w bieżącej edycji znajduje się na końcu dokumentacji 
   w rozdziale Historia.

Instalacja

   Skrypt instalacyjny nazywa się install-tl i umieszczony jest na najwyższym poziomie 
   drzewa katalogów. Można go uruchomić poleceniem perl instal-tl. W systemie Windows 
   można uruchomić dołączony skrypt install-tl-windows.bat. Dla Macs najlepiej instalować 
   przez [10]MacTeX który ma własny instalator (dostępny teraz również na płytce DVD obok texlive/).

   Skrypt instalacyjny install-tl ma dwa tryby pracy:

   -gui (domyślny dla Windows i Macs), który używajac interfejsu graficznego, 
    bez zbędnych zapytań instaluje cały system, ale pozwala również na wybranie 
    instalacji zaawansowanej.

   -no-gui (domyślny dla wszystkich innych systemów), który w trakcie instalacji 
    umożliwia wybór wszystkich dostępnych opcji za pomocą  prostego interfejsu tekstowego.

   Do dodawania/usuwania pakietów, aktualizacji z internetu oraz innych czynności 
   konfiguracjnych można użyć programu tlmgr (TeX Live Package Manager), który 
   tak jak program instalacyjny, ma dwa tryby pracy (graficzny oraz tekstowy).

   Szczegółowe informacje o [11]install-tl i [12]tlmgr uzyskamy uruchamiając je z linii poleceń 
   z parametrem --help. Więcej informacji można znaleźć w dokumentacji, o której była mowa powyżej.
   
Przydatne linki

   Na koniec kilka adresów stron internetowych, na których mozna znaleźć więcej informacji 
   o TeX-u. Nie są one dołączone do TeX Live:

     * [13]tug.org/begin.html - dla początkujących użytkowników TeX-a
       i/lub potrzebujących podstawowych o nim informacji.
     * [14]tug.org/interest.html - główna lista internetowych zasobów
       TeX-owych, systemów, pakietów, fontów i wielu innych, także
       dokumentacji.
     * [15]tug.org/ctan.html - jeden z adresów Comprehensive TeX Archive
       Network (CTAN), który zawiera światowe archiwa TeX-owe.
     * [16]tug.org/usergroups.html - lista grup użytkowników systemu TeX
       na całym świecie, wraz z danymi kontaktowymi. Gorąco zachęcamy do
       przyłączenia się do wybranej grupy użytkowników, a także
       wspomagania prac przy TeX Live oraz innych aktywności.

    Miłego TeX-owania!
     __________________________________________________________________

   [16]TeX Live home page.

References

   1. file:../LICENSE.TL
   2. file:../LICENSE.CTAN
   3. file:../texlive-doc
   4. file:../texmf-dist/doc/texlive/texlive-en/texlive-en.html
   5. file:../texmf-dist/doc/texlive/texlive-en/texlive-en.pdf
   6. file:../texmf-dist/doc/texlive/texlive-en
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
  17. https://tug.org/texlive/