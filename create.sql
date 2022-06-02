/* comment */
/*CREATE DATABASE StarDB;*/
CREATE TABLE Ciala_niebieskie(
	Nazwa VARCHAR(20) PRIMARY KEY,
	Masa INT NOT NULL,
	Promien INT NOT NULL,
	CHECK (Masa>0),
	CHECK (Masa<100000000000000000000000000000000000), /*jednostka - kg (10^35)*/
	CHECK (Promien>0),
	CHECK (Promien<100000000)/* jednostka - km */
);
CREATE TABLE Galaktyki(
	Nazwa VARCHAR(20) PRIMARY KEY,
	Odleglosc INT NOT NULL,
	CHECK (Odleglosc>=0),
	CHECK (Odleglosc<10000000000)/* jednostka - km */
);
CREATE TABLE Gwiazdy(
	Nazwa VARCHAR(20) FOREIGN KEY REFERENCES Ciala_niebieskie (Nazwa) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Nazwa_galaktyki VARCHAR(20) REFERENCES Galaktyki (Nazwa) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Temperatura INT NOT NULL,
	CHECK (Temperatura>0),
	CHECK (Temperatura<210000),/* jednostka - Kelviny */
	PRIMARY KEY(Nazwa)
);
CREATE TABLE Planety(
	Nazwa VARCHAR(20) FOREIGN KEY REFERENCES Ciala_niebieskie (Nazwa) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Orbita VARCHAR(20) REFERENCES Gwiazdy (Nazwa) NOT NULL, /* CASCADE -> bledy bo gwiazdy i planety maja ref do Ciala_niebieskie */
	Okres_orbity INT NOT NULL,
	CHECK(Okres_orbity>0),
	CHECK(Okres_orbity<10000),/* jednostka - lata */
	PRIMARY KEY(Nazwa)
);
CREATE TABLE Ekspedycje(
	Tytul VARCHAR(20) PRIMARY KEY,
	Dataa DATE NOT NULL,
	Koszt INT NOT NULL,
	CHECK (Koszt>=0),
	CHECK (Koszt<10000000000)/* jednostka - USD */
);
CREATE TABLE Astronauci(
	ID INT PRIMARY KEY,
	Imie VARCHAR(20) NOT NULL,
	Nazwisko VARCHAR(20) NOT NULL,
	Narodowosc VARCHAR(20) NOT NULL,
	CHECK (ID>=0),
	CHECK (ID<101),
);
CREATE TABLE Pojazdy(
	Nazwa VARCHAR(20) PRIMARY KEY,
	Moc INT NOT NULL,/* sila (thrust) wyrazona w kN */
	Ladownosc INT NOT NULL,/* maksymalna liczba zalogantow w pojezdzie */
	CHECK (Moc>0),
	CHECK (Moc<=100000),
	CHECK (Ladownosc>=0),
	CHECK (Ladownosc<=50)
);
CREATE TABLE Cel(
	Tytul_eksp VARCHAR(20) FOREIGN KEY REFERENCES Ekspedycje (Tytul) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Nazwa_planety VARCHAR(20) FOREIGN KEY REFERENCES Planety (Nazwa) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE Uczestnictwo(
	Tytul_eksp VARCHAR(20) FOREIGN KEY REFERENCES Ekspedycje (Tytul) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Id_astr INT FOREIGN KEY REFERENCES Astronauci (ID) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE Transport(
	Tytul_eksp VARCHAR(20) FOREIGN KEY REFERENCES Ekspedycje (Tytul) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Nazwa_pojazdu VARCHAR(20) FOREIGN KEY REFERENCES Pojazdy (Nazwa) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL
);
/* https://www.w3schools.com/sql/default.asp */