/*
select (distinct), where, order by, count, avg, sum, in
in, as, (inner, left, right, full) join, union, group by, view, subqueries (np in)
*/

/*1.Prezes potrzebuje zestawienia nazw pojazd�w
oraz astronaut�w, kt�rzy polecieli na ksi�yc w ostatnich 5 latach.
Posortowanego od najmniejszego kosztu wyprawy. */
/*Poniewaz niniejsza baza danych nie uwzglednia ksiezycow, w prezentowanym przykladzie zalozono, ze ksiezyc to planeta*/

SELECT Transport.Nazwa_pojazdu, Astronauci.Nazwisko
from Ekspedycje
left join Transport on Transport.Tytul_eksp = Ekspedycje.Tytul
left join Uczestnictwo on Uczestnictwo.Tytul_eksp = Ekspedycje.Tytul
left join Astronauci on Uczestnictwo.Id_astr = Astronauci.ID
where Ekspedycje.Dataa > '2017-01-24'
	and Ekspedycje.Tytul in
		(SELECT Tytul_eksp
		from Cel
		where Cel.Nazwa_planety = 'ksiezyc')
order by Ekspedycje.Koszt asc;

/*2.2. Prezes potrzebuje zestawienia planet oraz gwiazd,
na kt�re dotar�y pojazdy bez astronaut�w. Zestawienie dotyczy gwiazd,
wok� kt�rych orbituj� planety o temperaturze mniejszej ni� 3700K.*/
/* Celem ekspedycji nie moze byc gwiazda, wiec uwzglednilem planety
orbitujace wokol gwiazd (rowniez wypisanych) o odpowiedniej temperaturze*/

SELECT Cel.Nazwa_planety, Planety.Orbita as gwiazda
from Ekspedycje
left join Cel on Cel.Tytul_eksp = Ekspedycje.Tytul
left join Planety on Cel.Nazwa_planety = Planety.Nazwa
left join Gwiazdy on Planety.Orbita = Gwiazdy.Nazwa
where Ekspedycje.Tytul in
	(SELECT Tytul_eksp
	from Uczestnictwo
	where Id_astr is NULL)
and Planety.Orbita in
	(SELECT Nazwa
	from Gwiazdy
	where Temperatura < 3700);

/*3. Prezes chce znale�� cel, w kt�rym uczestniczy� Ameryka�ski astronauta
w poje�dzie o mocy wi�kszej ni� 55 tysi�cy koni
oraz �adowno�ci wi�kszej ni� 20 ton.
Je�li jest wi�cej ni� jeden, to potrzebuje najdawniejszy.*/

SELECT top 1 Ekspedycje.Tytul
from Ekspedycje
right join Transport on Transport.Tytul_eksp = Ekspedycje.Tytul
left join Pojazdy on Pojazdy.Nazwa = Transport.Nazwa_pojazdu
left join Uczestnictwo on Uczestnictwo.Tytul_eksp = Ekspedycje.Tytul
where Pojazdy.Moc > 55000
	and Pojazdy.Ladownosc > 20
	and Uczestnictwo.Id_astr in
		(SELECT ID
		from Astronauci
		where Narodowosc = 'USA')
order by Ekspedycje.Dataa asc

/*4. Wska� ekspedycje, kt�re eksploruj� planety o masie i promieniu zbli�onym do Ziemi (5,97219�10^24 kg +/- 5*10^23 kg, 6371,008 km +/- 300 km) 
poszukiwanie planety podobnej do Ziemi,
na kt�r� mo�e zosta� przyznany bonus naukowy).*/

SELECT Tytul, Ciala_niebieskie.Nazwa
from Ekspedycje
inner join Cel on Cel.Tytul_eksp = Ekspedycje.Tytul
right join Planety on Planety.Nazwa = Cel.Nazwa_planety
join Ciala_niebieskie on Ciala_niebieskie.Nazwa = Planety.Nazwa
where Ciala_niebieskie.Masa > 40
	and Ciala_niebieskie.Masa < 60
	and Ciala_niebieskie.Promien > 20
	and Ciala_niebieskie.Promien < 70;

/*5. Wska� gwiazdy, kt�rych masa wynosi 8% masy S�o�ca
(1,59072x10^29 kg) lub mniej (potencjalny br�zowy karze�, posiadaj�cy du�� warto�� naukow�, kt�ra zostanie ch�tnie zakupiona przez naukowc�w).*/

SELECT Gwiazdy.Nazwa
from Gwiazdy
left join Ciala_niebieskie on Ciala_niebieskie.Nazwa = Gwiazdy.Nazwa
where Ciala_niebieskie.Masa <= 50;

/*6. Wska� pojazd z najwy�szym wsp�czynnikiem mocy do �adowno�ci (oszcz�dno�� energii z zachowaniem jak najwi�kszej �adowno�ci).*/

SELECT top 1 Nazwa
from Pojazdy
order by (Moc / Ladownosc) desc;



/*zapytania wlasne: */

/*7. Zliczaj (osobno dla kazdej misji) ilu norweskich astronautow eksplorowalo planete planet1
podczas misji o koszcie ponizej 100*/
SELECT count(Astronauci.ID) as iloscNorwegowNaTanichMisjach
from Ekspedycje
right join Cel on Cel.Tytul_eksp = Ekspedycje.Tytul
right join Uczestnictwo on Uczestnictwo.Tytul_eksp = Ekspedycje.Tytul
left join Astronauci on Astronauci.ID = Uczestnictwo.Id_astr
where Ekspedycje.Koszt < 100
and Cel.Nazwa_planety = 'planet1'
and Astronauci.Narodowosc = 'Norwegian'
group by Ekspedycje.Tytul;

/*8. Dla kazdej planety podaj calkowita ilosc astronautow, ktorzy ja odwiedzili*/
/* temp = view */
SELECT *
from temp;

SELECT Nazwa_planety, sum(iloscAstronautow) as sredniaIloscAstronautow
from temp
group by Nazwa_planety;