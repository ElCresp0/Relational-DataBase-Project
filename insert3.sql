insert into Galaktyki VALUES('milkyway', 0)

INSERT INTO Ciala_niebieskie VALUES('slonce', 51, 50);
INSERT INTO Ciala_niebieskie VALUES('slonce2', 50, 50);
INSERT INTO Ciala_niebieskie VALUES('ksiezyc', 80, 50);
INSERT INTO Ciala_niebieskie VALUES('planet1', 50, 50);

INSERT INTO Gwiazdy VALUES('slonce', 'milkyway', 50);
INSERT INTO Gwiazdy VALUES('slonce2', 'milkyway', 4000);

insert into Planety VALUES('ksiezyc', 'slonce', 50);
insert into Planety VALUES('planet1', 'slonce2', 50);

insert into Ekspedycje VALUES('eksp1', '2021-12-14', 11);
insert into Ekspedycje VALUES('eksp2', '2021-12-14', 10);
insert into Ekspedycje VALUES('eksp3', '2021-12-14', 10);
insert into Ekspedycje VALUES('eksp4', '2016-12-14', 10);
insert into Ekspedycje VALUES('eksp5', '2016-12-14', 10);

insert into Astronauci VALUES(1,'Roy','Johnsrud','Norwegian');
insert into Astronauci VALUES(2,'Bjorn','Hassel','Norwegian');
insert into Astronauci VALUES(3,'Chet','Mckinney','USA');

insert into Pojazdy values('starship', 60000, 30);
insert into Pojazdy values('star_destroyer', 1000, 5);

insert into Cel values('eksp1','ksiezyc');
insert into Cel values('eksp1','planet1');
insert into Cel values('eksp2','ksiezyc');
insert into Cel values('eksp4','ksiezyc');
insert into Cel values('eksp3', 'planet1');
insert into Cel values('eksp5', 'planet1');

insert into Uczestnictwo values('eksp1',1);
insert into Uczestnictwo values('eksp1',2);
insert into Uczestnictwo values('eksp1',3);
insert into Uczestnictwo values('eksp2',1);
insert into Uczestnictwo values('eksp2',3);
insert into Uczestnictwo values('eksp3',NULL);
insert into Uczestnictwo values('eksp4',NULL);
insert into Uczestnictwo values('eksp5',2);

insert into Transport values('eksp1','starship');
insert into Transport values('eksp2','star_destroyer');
insert into Transport values('eksp3','starship');
insert into Transport values('eksp4','star_destroyer');
insert into Transport values('eksp5','star_destroyer');