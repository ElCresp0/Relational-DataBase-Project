create view temp as
	SELECT Cel.Nazwa_planety, Cel.Tytul_eksp, COUNT(Uczestnictwo.Id_astr) as iloscAstronautow
	from Cel
	left join Uczestnictwo on Cel.Tytul_eksp = Uczestnictwo.Tytul_eksp
	group by Cel.Nazwa_planety, Cel.Tytul_eksp;