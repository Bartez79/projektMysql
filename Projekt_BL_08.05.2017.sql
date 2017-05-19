create database imprezy_nowa_1;
use imprezy_nowa_1;


create table rejestracja (
id_rejestracja int not null primary key auto_increment,
uzytkownik varchar(50),
haslo varchar(10)
);	
insert into rejestracja ( id_rejestracja, uzytkownik, haslo)
values
(null, 'Roman Kwaśny','Team1'),  
  (null, 'Józef Borowiec', 'Team2'),
  (null, 'Christian Prokop', 'h1'),
(null, 'Pawel Kędzior', '3WL'),
(null, 'Jacek Zawada', 'Lubie'),
(null, 'Radosław Surówka', 'dobry'),
(null, 'Piotr Dobrzanski', 'Team3'),
(null,'Daniel Janecki' ,'dobry1'),
(null,  'Michal Siuta', 'Team4'),
(null, 'Mariusz Krzywiel', 'MTB Team'),
(null, 'Martin Marz', 'pepik')
;
select * from rejestracja;
drop table rejestracja;

CREATE TABLE imprezy (
    id_imprezy INT not null primary key auto_increment,
    nazwa_imprezy varchar(50),
    typ_imprezy VARCHAR(50),
    czas_trwania_dni INT,
    data_imrpezy date,
    id_lokalizacja int,
    id_organizator int,
    id_uczestnik int,
    foreign key (id_uczestnik) references zawodnik(id_uczestnik),
    foreign key (id_lokalizacja) references lokalizacja(id_lokalizacja),
    foreign key (id_organizator) references organizator(id_organizator)
);
drop table imprezy;
	alter table imprezy modify data_imrpezy varchar(30);
INSERT INTO imprezy
	(id_imprezy,nazwa_imprezy, typ_imprezy, czas_trwania_dni ,data_imrpezy,id_uczestnik, id_lokalizacja, id_organizator)
VALUES
	(null, 'Enduro Trails', 'Enduro', 2 ,'2017-04-28',1,1,1),
	(null, 'Rowerowe Podhale', 'Enduro', 3,'2017-05-05',2,2,2),
	(null, 'Joy ride Kluszki', 'Maraton', 4,'2017-05-28',3,3,3),
	(null, 'EMTB', 'Maraton', 2,'2017-06-20',4,4,4),
	(null, 'Przesieka', 'Enduro onsite', 1,'2017-06-20',5,5,4),
	(null, 'Baligród', 'Enduro onsite', 1,'2017-09-16',6,6,4),
	(null, 'Joy Ride Zako', ' Maraton', 3,'2017-07-07',7, 2,2),
	(null, 'Rychlebskie Scieżki', 'Enduro', 2,'2017-08-02',8, 7,5),
	(null, 'Kouty', 'Enduro', 2,'2017-08-28',9,8,5 ),
	(null, 'DH Stożek', ' Zjazd', 2, '2017-06-20',10, 9, 6),
    (null, 'DH Góra Żar', 'Zjazd', 2, '2017-09-16',11,10,6)
;
select* from imprezy;
 drop table imprezy;
delete from imprezy;
CREATE TABLE lokalizacja (
    id_lokalizacja INT not null primary key auto_increment,
    miasto VARCHAR(50),
    kraj VARCHAR(30)
    
)
;

INSERT INTO lokalizacja
	(id_lokalizacja, miasto, kraj)
VALUES
	(null, 'Bielsko Biała', 'Polska' ),
	(null, 'Zakopane', 'Polska'),
	(null, 'Kluszkowce', 'Polska'),
	(null, 'Szklarska Poręba', 'Polska'),
	(null, 'Przesieka', 'Polska'),
	(null, 'Baligród', 'Polska'),
	(null, 'Czerna Voda','Czechy'),
	(null, 'Kouty', 'Słowacja'),
	(null, 'Wisła', 'Polska'),
    (null, 'Żywiec','Polska')
;
select * from lokalizacja;
truncate table lokalizacja;
drop table lokalizacja;


CREATE TABLE organizator (
    id_organizator INT not null primary key auto_increment,
    organizator VARCHAR(35)
    
)
;
select * from organizator;
select * from lokalizacja;

INSERT INTO organizator
	(id_organizator, organizator)
VALUES
    (null, '2B Enduro Team'),
	(null, 'SRP'),
	(null, 'Joy Ride'),
	(null, 'EMTB'),
	(null, 'Pepiki'),
	(null, 'sportaiment')
    ;
drop table organizator;


CREATE TABLE zawodnik (
    id_uczestnik INT not null primary key auto_increment,
    imie VARCHAR(35),
    nazwisko VARCHAR(35),
    zespol VARCHAR(35),
    id_rejestracja int,
    foreign key ( id_rejestracja) references rejestracja(id_rejestracja)
);
drop table zawodnik;
select * from zawodnik;
 insert into zawodnik
 (id_uczestnik, imie, nazwisko, zespol, id_rejestracja)
 values
  (null, 'Roman', 'Kwaśny', '2B Enduro Team', 1, 1),  
  (null, 'Józef', 'Borowiec', '2B Enduro Team', 2 ,2),
  (null, 'Christian','Prokop', 'ZTF', 3, 5),
(null, 'Pawel', 'Kędzior', '3WL', 4, 6),
(null, 'Jacek',' Zawada', 'Lubię Eduro', 5, 7),
(null, 'Radosław', 'Surówka', 'dobry team', 6, 3),
(null, 'Piotr', 'Dobrzanski', '2B Enduro Team', 7, 8),
(null,'Daniel' ,'Janecki' ,'Formicki-bike.pl', 8, 4),
(null,  'Michal', 'Siuta', '2B Enduro Team', 9,11),
(null, 'Mariusz', 'Krzywiel', 'MTB Olsztyn Team', 10,7),
(null, 'Martin', 'Marz', 'Sweat and Beers', 10,9)
;

drop table zawodnik;


create view zawodnicy as

select imie,nazwisko,zespoł from zawodnik
natural join rejestracja ;
select * from zawodnicy;

create table sezon2017 (
id_sezon int primary key not null auto_increment ,
id_uczestnik int,
id_imprezy int,
#Enduro_Trails int,
#Rowerowe_Podhale int,
#Joy_ride_Kluszki int,
#EMTB int,
#Przesieka int,
#Baligród int,
#Joy_Ride_Zako int,
#Rychlebskie_Sciezki int,
#Kouty int,
#DH_Stozek int,
#DH_Góra_Żar int,
#suma_wszystkich_punktow_zwyciezca int,
foreign key (id_uczestnik) references zawodnik(id_uczestnik),
foreign key (id_imprezy) references imprezy(id_imprezy)
);

drop table sezon2017_ibfk_2;

select * from sezon2017;
CREATE VIEW zapisani as
    SELECT 
        uzytkownik, haslo
    FROM
        rejestracja;
    
        
	select * from zapisani;
    
create view miasta as
select miasto, kraj 
from lokalizacja;