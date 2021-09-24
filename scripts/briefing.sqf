player createDiaryRecord ["Diary",["TECHNICZNE","<font size='15' face='PuristaMedium'>
<font color='#FFFFFF' size='20' face='PuristaBold'>Opcje indywidualne:</font><br/>
<font color='#AAAAAA'>Znaki taktyczne na mapie: </font>
<font face='PuristaBold'><execute expression='[1] execVM ""scripts\markers.sqf""'>ON</execute></font> <font color='#AAAAAA'>/ </font>
<font face='PuristaBold'><execute expression='[0] execVM ""scripts\markers.sqf""'>OFF</execute></font><br/>
<font color='#AAAAAA'>Użyj tylko w wypadku zniknięcia munduru: </font>
<font face='PuristaBold'><execute expression='execVM ""scripts\EQ.sqf""'>CLICK</execute></font><br/>
<br/>
</font>
<font color='#AAAAAA' size='15' face='PuristaMedium'>
<font color='#FFFFFF' face='PuristaBold' size='20'>Informacje:</font><br/>
> Zadania zostaną podsumowane na koniec misji.<br/>
> Za przeciwnika odpowiada: UPS 2.2.0 + ASR AI.<br/>
> Ekwipunek zrobiony za pomocą unitgear:<br/>
 - Celowniki oraz elementy ubioru są losowe.<br/>
> Misja zakończy się sama:<br/>
 - gdy wszyscy gracze wycofają się na oznaczoną pozycję,<br/>
 - gdy przy życiu pozostanie tylko 1 gracz.<br/>
> Po wejściu w strefę zieloną wyświetli się tekst.<br/>
<br/>
1. Misja zakończy się ekranem podsumowującym całą misję, także dla spektatorów. Będzie z niego można wyjść klikając przycisk ""KONIEC"" lub naciskając dwukrotnie klawisz ESC na klawiaturze.<br/>
<br/>
2. W misji został wykorzystany skrypt ograniczający pole działania graczy, wycinek mapy odpowiada strefie po której może poruszać się gracz. Na granicy wyznaczonego terenu gracz może napotkać ""niewidzialne"" ściany. Skrypt działa tylko na jednostki naziemne, nie działa na lotnictwo.<br/>
<br/>
<font color='#FFFFFF' face='PuristaBold' size='20'>Zaawansowane ustawienia medyczne:</font><br/>
> Slot medyka: <font color='#FFFFFF' face='PuristaBold'>Brak</font><br/>
> Aktywne dla: <font color='#FFFFFF' face='PuristaBold'>Tylko dla graczy</font><br/>
> Akt. zaawansowane rany: <font color='#FFFFFF' face='PuristaBold'>Tak</font><br/>
> Obrażenia od kolizji: <font color='#FFFFFF' face='PuristaBold'>Tak</font><br/>
> Ust. apteczek osobistych: <font color='#FFFFFF' face='PuristaBold'>Wszyscy</font><br/>
> Usuń apteczkę po użyciu: <font color='#FFFFFF' face='PuristaBold'>Tak</font><br/>
> Warunek apteczek: <font color='#FFFFFF' face='PuristaBold'>Po stabilizacji</font><br/>
> Ogr. apteczek osobistych: <font color='#FFFFFF' face='PuristaBold'>Wszędzie</font><br/>
> Ust. zestawu chirurg: <font color='#FFFFFF' face='PuristaBold'>Wszyscy</font><br/>
> Usuń zest. chir. po użyciu: <font color='#FFFFFF' face='PuristaBold'>Tak</font><br/>
> Ogr. zestawu chirurg.: <font color='#FFFFFF' face='PuristaBold'>Wszędzie</font><br/>
> Warunek zestawu chir.: <font color='#FFFFFF' face='PuristaBold'>Po stabilizacji</font><br/>
> Lecz hitpoint: <font color='#FFFFFF' face='PuristaBold'>Nie</font><br/>
> Zwalczanie bólu: <font color='#FFFFFF' face='PuristaBold'>Tak</font><br/>
</font>"]];

player createDiaryRecord ["Diary",["ODPRAWA","<font color='#AAAAAA' size='15' face='PuristaMedium'>
<font color='#FFFFFF' size='20' face='PuristaBold'>SYTUACJA</font><br/>
Jest środek nocy 30 Czerwca. Po dniu pełnym chaosu położenie linii przeciwnika jest niejasne. 
Kilka pododdziałów zostało wyznaczonych do przeprowadzenia nocnego patrolu w celu zlokalizowania aktualnych pozycji nieprzyjaciela.
Wasz pluton spędził ostatnią godzinę przekraczając pola i lasy podchodząc pod miejscowość Khobi od zachodu.
</br>
Byliście już blisko wyznaczonej granicy patrolu, gdy nagle zespół zwiadowczy zameldował o zlokalizowaniu baterii przeciwlotniczej przeciwnika przy farmie tuż obok drogi E20.
Po krótkiej obserwacji wykryto, że znajduje się tam także element zabezpieczający. 
Nim zwiadowcy zdążyli nadać następny komunikat, jedna z drużyn przeciwnika wsiadła na pokład BTRa i odjechała w kierunku północnym drogą E20. 
Poinformowaliście dowódcę kompanii o zaistniałej sytuacji. 
Dostaliście zielone światło, aby spróbować wykorzystać okazję. 
<br/> 
<br/>
<font color='#FFFFFF' size='20' face='PuristaBold'>SIŁY NIEPRZYJACIELA</font><br/>
<img image='pictures\icons\aiFlag.jpg' width='27' height='15'/> Donowiańskie Siły Lądowe.
<br/>
<br/>
<font color='#f0ad4e'><marker name='zsu_bat_mrk'>Uszczuplona bateria przeciwlotnicza</marker></font> składająca się z trzech ZSU-23-4. 
Ochronę stanowią załogi oraz element zabezpieczający, złożony z conajmniej <font color='#f0ad4e'><marker name='btr_sec_mrk'>jednej drużyny zmotoryzowanej</marker></font> wraz z pojazdem BTR-80. 
Łut szczęścia sprawił, że <font color='#f0ad4e'><marker name='btr_north_mrk'>część oddziału odjechał drogą na północ</marker></font>, więc nie będą obecni w pierwszych kilku minutach walki. 
Można się spodziewać, że zawrócą jak tylko atak się rozpocznie. 
Jeżeli akcja się przedłuży możemy zostać wciągnięci w walkę z innymi oddziałami przeciwnika z okolicy. 
<br/>
<br/>
Wiemy, że w rejonie działań operują jednostki 81 Dywizji Strzelców Zmotoryzowanych, Armii Południe.
<br/>
<br/>
<img image='pictures\aiSoldier.jpg' width='367' height='186'/>
<br/>
<br/>
<font color='#FFFFFF' size='20' face='PuristaBold'>SIŁY WŁASNE</font><br/>
<img image='pictures\icons\playersFlag.jpg' width='27' height='15'/> Armia Gorgasu.
<br/>
<br/>
Jesteście częścią 90 Batalionu Rozpoznawczego. 
<br/>
<font color='#f0ad4e'><marker name='1_plt_mrk'>1 Pluton</marker></font>, 70% stanu osobowego. 
<font color='#f0ad4e'><marker name='recon_team_mrk'>Zespół zwiadowczy</marker></font> wycofał się na bezpieczną odległość i oczekuje na dalsze wytyczne. 
Przypuszczalnie jedna wyrzutnia M3 MAAWS nie wystarczy więc możliwe, że trzeba będzie użyć ręcznych granatników ppanc. 
Należy także zwrócić uwagę na zabezpieczenie drogi na wypadek ewentualnego powrotu <font color='#f0ad4e'><marker name='btr_north_mrk'>drużyny zmotoryzownej</marker></font> z północy. 
Jesteście wyposażeni w karabinki AKMS, noktowizory AN/PVS-7B, RPG-75 oraz jedna wyrzutnie M3 MAAWS.
<br/>
<br/>
<img image='pictures\playersSoldier.jpg' width='367' height='186'/>
<br/>
<br/>
<font color='#FFFFFF' size='20' face='PuristaBold'>MISJA</font><br/>
Zniszczyć jak największą liczbę samobieżnych zestawów przeciwlotniczych ZSU-23-4 przeciwnika przy ograniczeniu strat własnych do minimum. 
Wsparcie lotnicze oraz artyleryjskie jest niedostępne, są w trakcie relokacji lub przydzielone do innych zadań, więc jesteśmy zdani na siebie. 
<br/>
<br/>
<font color='#FFFFFF' size='20' face='PuristaBold'>WYKONANIE</font><br/>
Używając osłon terenowych w postaci drzew oraz ukształtowania terenu, podejść pod rozpoznane pozycje przeciwnika na odległość pozwalającą użyć wyrzutni. 
Upewnijcie się, że ruszacie się tak szybko jak to tylko możliwe. 
Wasz pluton nie jest przeznaczony do bezpośredniej walki z przeciwnikiem, więc nie wdawajcie się w niepotrzebną wymianę ognia. 
Zniszczyć działa przeciwlotnicze i wycofać się na zachód, do <font color='#f0ad4e'><marker name='rp_alpha_mrk'>punktu zbornego ALPHA</marker></font>.
</font>"]];

player createDiaryRecord ["Diary",["KONTEKST OPERACYJNY","<font color='#AAAAAA' size='15' face='PuristaMedium'>
</font>"]];

player createDiaryRecord ["Diary",["ZARYS FABULARNY","<font color='#AAAAAA' size='15' face='PuristaMedium'>
Gorgas, podobnie jak Atropia jest małym, ale bardzo niezależnym państwem na delikatnym i niebezpiecznym obszarze, ale bez zasobów węglowodorów jakimi włada sąsiednia Atropia. 
Podstawową siłą kraju jest jego położenie geograficzne - Morze Czarne porty i granica lądowa z Kemalią sprawiają, że jest to logiczna trasa rurociągu i regionalne ujście do świata zewnętrznego. 
Do tej pory pozostawał w stanie „zamrożonego konfliktu” z Donowią w związku z próbami zablokowania przez Donowię członkostwa Gorgasu w NATO i UE, 
a także donowskie wsparcie dla Zabzimka i Południowego Ostremka - dwa oderwane regiony poprzednio będące częścią Republiki. 
Konflikt rozgrzewa ponownie po zaprzysiężeniu nowego przeydenta Gorgasu - Mikaszila Hrawego, który już na wstępie zaznaczył, 
że jego głównym celem będzie dążenie do zjednoczenia kraju oraz jeszcze bliższa niż dotąd współpraca z zachodem. 
<br/>
<br/>
Eskalacja przez lata nabiera tempa, aby w 2015 roku osiągnąć punkt kulminacyjny, kiedy dochodzi do naruszenia zawieszenia broni przez separatystów z Południowego Ostremka. 
W wyniku ostrzału wschodniej części miasta Gori został poważnie uszkodzony szpital, zginęło 17 osób oraz 34 zostało rannych. 
Opinia publiczna domagała się zdecydowanej reakcji ze strony rządu na ataki separatystów, 
to też tydzień później zostaje wprowadzony w życie plan przywrócenia porządku i bezpieczeństwa w zbuntowanych regionach. 
Armia Gorgasu została zmobilizowana do definitywnego rozwiązania kwestii spornych regionów.
Donowia odbiera to jako bezpośrednie zagrożenie dla swojego bezpieczeństwa narodowego 
i niezwłocznie rozmieszcza swoje siły wzdłuż granicy z Gorgasem pod pretekstem prowadzenia ćwiczeń wojskowych.
<br/>
<br/>
Gdy wojska Gorgasu zbliżały się coraz bliżej do stolicy Południowego Ostremka, stało się jasne, że separatyści przegrywają. 
Donowia niezwłocznie zaczęła przerzucać swoje wojska, sprzęt i amunicję przez granicę, 
praktycznie równocześnie został także ogłoszony alarm i przerwano przeprowadzane ćwiczenia wojskowe wzdłuż granicy. 
</font>"]];

// player createDiaryRecord ["Diary",["Kontekst operacyjny","<font color='#AAAAAA' size='15' face='PuristaMedium'>
// Gorgas, podobnie jak Atropia jest małym, ale bardzo niezależnym państwem na delikatnym i niebezpiecznym obszarze, ale bez zasobów węglowodorów jakimi włada Atropia. 
// Podstawową siłą kraju jest jego położenie geograficzne - Morze Czarne porty i granica lądowa z Kemalią sprawiają, że jest to logiczna trasa rurociągu i regionalne ujście do świata zewnętrznego. 
// Gorgas pozostaje jednym z najmniejszych i najsłabiej rozwiniętych gospodarczo narodów w regione. 
// Do tej pory pozostawał w stanie „zamrożonego konfliktu” z Donowią w związku z próbami zablokowania przez Donowię członkostwa Gorgasu w NATO i UE, 
// a także donowskie wsparcie dla Zabzimka i Południowego Ostremka - dwa oderwane regiony poprzednio będące częścią Republiki. 
// Konflikt rozgrzewa ponownie po zaprzysiężeniu nowego przeydenta Gorgas - Mikaszila Hrawego, który już na wstępie zaznaczył, 
// że jego głównym celem będzie dążenie do zjednoczenia kraju oraz jeszcze bliższa niż dotąd współpraca z zachodem. 
// <br/>
// <br/>
// Eskalacja nabiera tempa w 2015 roku, kiedy dochodzi do naruszenia zawieszenia broni przez separatystów z Południowego Ostremka. 
// W wyniku ostrzału południowej części miasta Gori został poważnie uszkodzony szpital, zginęło 17 osób oraz 34 zostało rannych. 
// Opinia publiczna domagała się zdecydowanej reakcji ze strony rządu na ataki separatystów, 
// to też tydzień później zostaje wprowadzony w życie plan przywrócenia porządku i bezpieczeństwa w zbuntowanych regionach. 
// Armia Gorgasu została zmobilizowana do definitywnego rozwiązania kwestii spornych regionów.
// Donowia od razu odbiera to jako bezpośrednie zagrożenie dla swojego bezpieczeństwa narodowego 
// i niezwłocznie rozmieszcza swoje siły wzdłuż granicy z Gorgasem pod pretekstem prowadzenia ćwiczeń wojskowych.
// <br/>
// <br/>
// Gdy wojska Gorgasu zbliżały się coraz bliżej do stolicy Południowego Ostremka, stało się jasne, że separatyści przegrywają. 
// Donowia niezwłocznie zaczęła przerzucać swoje wojska, sprzęt i amunicję przez granicę, 
// praktycznie równocześnie został także ogłoszony alarm i przerwano przeprowadzane ćwiczenia wojskowe wzdłuż granicy. 
// </font>"]];


[true, 'task1', ["1. Zaatakować i zniszczyć wrogą baterię AAA.","Zniszczyć","Zniszczyć"], objNull, 'CREATED', 2, false, 'a', false] call BIS_fnc_taskCreate;
[true, ['task2','task1'], ["1-A. Zachować sprawność bojową na poziomie conajmniej 75%.","Sprawność bojowa","Sprawność bojowa"], objNull, 'CREATED', 0, false, 'b', false] call BIS_fnc_taskCreate;
[true, ['task3','task1'], ["1-B. Przeprowadzenie akcji nie powinno zająć dłużej niż 60 minut.","Czas operacyjny","Czas operacyjny"], objNull, 'CREATED', 0, false, 'c', false] call BIS_fnc_taskCreate;
[true, 'task4', ["2. Wycofać się na zachód, do punktu zbornego ALPHA.","Wycofanie","Wycofanie"], objNull, 'CREATED', 1, false, 'd', false] call BIS_fnc_taskCreate;