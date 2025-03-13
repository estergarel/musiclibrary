#SOURCE C:/Users/gabli/Desktop/BD/script04.sql;

/*##############################################################################*/

DROP DATABASE SpotifyDB;
CREATE DATABASE SpotifyDB;
USE SpotifyDB;

/*##############################################################################*/

CREATE TABLE tblBands(
    id_band INT PRIMARY KEY AUTO_INCREMENT,
    nume VARCHAR(200) NOT NULL,
	nr_membrii INT NOT NULL,
	an_fondare YEAR,	
	tara_origine VARCHAR(200) NOT NULL
);

CREATE TABLE tblCategories (
    id_categorie INT PRIMARY KEY AUTO_INCREMENT,
    categorie VARCHAR(200) NOT NULL
	
);

CREATE TABLE tblAlbums (
    id_album INT PRIMARY KEY AUTO_INCREMENT,
    titlu VARCHAR(200) NOT NULL,
    an_aparitie YEAR NOT NULL,
    id_band INT NOT NULL,
	durata TIME NOT NULL
);

CREATE TABLE tblSongs (
    id_melodie INT PRIMARY KEY AUTO_INCREMENT,
    id_categorie INT NOT NULL,
    id_album INT NOT NULL,
    titlu VARCHAR(200) NOT NULL,
    durata_melodie TIME NOT NULL
);

CREATE TABLE tblArtists(
    id_artist INT PRIMARY KEY AUTO_INCREMENT,
    id_band INT NOT NULL,
    nume_artist VARCHAR(200) NOT NULL,
    prenume_artist VARCHAR(200) NOT NULL,
    data_nasterii DATE NOT NULL,
	tara_origine VARCHAR(200) NOT NULL
);

CREATE TABLE tblComposers (
	id_compozitor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_melodie INT NOT NULL,
    id_band INT NOT NULL,
	nume_compozitor VARCHAR(200) NOT NULL,
    prenume_compozitor VARCHAR(200) NOT NULL
);

/*Albums <-> Bands*/

ALTER TABLE tblAlbums
ADD CONSTRAINT fk_album_band
FOREIGN KEY (id_band) REFERENCES tblBands(id_band) ON DELETE CASCADE ON UPDATE CASCADE;

/*Artists <-> Bands*/

ALTER TABLE tblArtists
ADD CONSTRAINT fk_artist_band
FOREIGN KEY (id_band) REFERENCES tblBands(id_band)ON DELETE CASCADE ON UPDATE CASCADE;

/*Composers <-> Bands*/
ALTER TABLE tblComposers
ADD CONSTRAINT fk_composer_band
FOREIGN KEY (id_band) REFERENCES tblBands(id_band) ON DELETE CASCADE ON UPDATE CASCADE;


/*Songs <-> Albums*/

ALTER TABLE tblSongs
ADD CONSTRAINT fk_song_album
FOREIGN KEY (id_album) REFERENCES tblAlbums(id_album) ON DELETE CASCADE ON UPDATE CASCADE;

/*Songs <-> Categories*/

ALTER TABLE tblSongs
ADD CONSTRAINT fk_song_category
FOREIGN KEY (id_categorie) REFERENCES tblCategories(id_categorie) ON DELETE CASCADE ON UPDATE CASCADE;


/*Composers <-> Songs*/
ALTER TABLE tblComposers
ADD CONSTRAINT fk_composer_song
FOREIGN KEY (id_melodie) REFERENCES tblSongs(id_melodie)ON DELETE CASCADE ON UPDATE CASCADE;


/*##############################################################################*/

/*Bands*/

INSERT INTO tblBands (nume, nr_membrii, an_fondare, tara_origine) VALUES ("AC/DC", 5, 1973, "Australia");
INSERT INTO tblBands (nume, nr_membrii, an_fondare, tara_origine) VALUES ("Metallica", 4, 1981, "SUA");
INSERT INTO tblBands (nume, nr_membrii, an_fondare, tara_origine) VALUES ("Queen", 4, 1970, "UK");
INSERT INTO tblBands (nume, nr_membrii, an_fondare, tara_origine) VALUES ("Pink Floyd", 5, 1965, "UK");
INSERT INTO tblBands (nume, nr_membrii, an_fondare, tara_origine) VALUES ("Led Zeppelin", 4, 1968, "UK");
INSERT INTO tblBands (nume, nr_membrii, an_fondare, tara_origine) VALUES ("The Rolling Stones", 5, 1962, "UK");
INSERT INTO tblBands (nume, nr_membrii, an_fondare, tara_origine) VALUES ("Nirvana", 3, 1987, "SUA");
INSERT INTO tblBands (nume, nr_membrii, an_fondare, tara_origine) VALUES ("The Eagles", 5, 1971, "SUA");
INSERT INTO tblBands (nume, nr_membrii, an_fondare, tara_origine) VALUES ("Aerosmith", 5, 1970, "SUA");
INSERT INTO tblBands (nume, nr_membrii, an_fondare, tara_origine) VALUES ("ABBA", 4, 1972, "Suedia");
INSERT INTO tblBands (nume, nr_membrii, an_fondare, tara_origine) VALUES ("Bee Gees", 3, 1958, "UK");
INSERT INTO tblBands (nume, nr_membrii, an_fondare, tara_origine) VALUES ("Coldplay", 4, 1996, "UK");
INSERT INTO tblBands (nume, nr_membrii, an_fondare, tara_origine) VALUES ("Daft Punk", 2, 1993, "Franta");
INSERT INTO tblBands (nume, nr_membrii, an_fondare, tara_origine) VALUES ("Eurythmics", 2, 1980, "UK");
INSERT INTO tblBands (nume, nr_membrii, an_fondare, tara_origine) VALUES ("Fleetwood Mac", 7, 1967, "UK");
INSERT INTO tblBands (nume, nr_membrii, an_fondare, tara_origine) VALUES ("Gorillaz", 4, 1998, "UK");
INSERT INTO tblBands (nume, nr_membrii, an_fondare, tara_origine) VALUES ("Imagine Dragons", 4, 2008, "SUA");
INSERT INTO tblBands (nume, nr_membrii, an_fondare, tara_origine) VALUES ("Journey", 5, 1973, "SUA");
INSERT INTO tblBands (nume, nr_membrii, an_fondare, tara_origine) VALUES ("Kraftwerk", 4, 1970, "Germania");
INSERT INTO tblBands (nume, nr_membrii, an_fondare, tara_origine) VALUES ("The Beatles", 4, 1960, "UK");

/*##############################################################################*/

/* Categories*/

INSERT INTO tblCategories (categorie) VALUES ("Pop");
INSERT INTO tblCategories (categorie) VALUES ("Disco");
INSERT INTO tblCategories (categorie) VALUES ("Rock/Pop");
INSERT INTO tblCategories (categorie) VALUES ("Electronic");
INSERT INTO tblCategories (categorie) VALUES ("New Wave");
INSERT INTO tblCategories (categorie) VALUES ("Rock");
INSERT INTO tblCategories (categorie) VALUES ("Virtual Band");
INSERT INTO tblCategories (categorie) VALUES ("Pop Rock");
INSERT INTO tblCategories (categorie) VALUES ("Soft Rock");
INSERT INTO tblCategories (categorie) VALUES ("Electronic/Experimental");


/*##############################################################################*/

/* Albums*/

/* AC/DC*/
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Back in Black", 1980, 1, "42:11");
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Highway to Hell", 1979, 1, "41:31");

/* Metallica*/
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Master of Puppets", 1986, 2, "54:47");
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("...And Justice for All", 1988, 2, "65:25");

/* Queen*/
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("A Night at the Opera", 1975, 3, "43:08");
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("The Game", 1980, 3, "35:39");

/* Pink Floyd*/
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("The Dark Side of the Moon", 1973, 4, "42:49");
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("The Wall", 1979, 4, "81:09");

/* Led Zeppelin*/
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Led Zeppelin IV", 1971, 5, "42:34");
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Physical Graffiti", 1975, 5, "82:15");

/* The Rolling Stones*/
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Sticky Fingers", 1971, 6, "46:25");
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Some Girls", 1978, 6, "40:45");

/* Nirvana*/
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Nevermind", 1991, 7, "42:38");
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("In Utero", 1993, 7, "41:23");

/*The Eagles*/
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Hotel California", 1976, 8, "43:28");
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Desperado", 1973, 8, "35:40");

/* Aerosmith*/
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Toys in the Attic", 1975, 9, "37:08");
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Pump", 1989, 9, "47:44");

/* ABBA*/
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Arrival", 1976, 10, "33:05");
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Super Trouper", 1980, 10, "41:57");

/* Bee Gees*/
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Saturday Night Fever", 1977, 11, "75:54");
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Spirits Having Flown", 1979, 11, "45:28");

/* Coldplay*/
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Parachutes", 2000, 12, "41:49");
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("A Rush of Blood to the Head", 2002, 12, "54:08");

/* Daft Punk*/
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Discovery", 2001, 13, "60:34");
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Random Access Memories", 2013, 13, "74:24");

/* Eurythmics*/
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Sweet Dreams (Are Made of This)", 1983, 14, "42:34");
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Touch", 1983, 14, "45:30");

/* Fleetwood Mac*/
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Rumours", 1977, 15, "39:43");
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Tusk", 1979, 15, "74:25");

/* Gorillaz*/
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Gorillaz", 2001, 16, "63:48");
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Demon Days", 2005, 16, "50:47");

/* Imagine Dragons*/
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Night Visions", 2012, 17, "44:06");
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Smoke + Mirrors", 2015, 17, "50:54");

/* Journey*/
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Escape", 1981, 18, "42:46");
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Frontiers", 1983, 18, "44:25");

/* Kraftwerk*/
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Autobahn", 1974, 19, "42:36");
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("The Man-Machine", 1978, 19, "36:19");

/* The Beatles*/
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Sgt. Pepper's Lonely Hearts Club Band", 1967, 20, "39:36");
INSERT INTO tblAlbums (titlu, an_aparitie, id_band, durata) VALUES ("Abbey Road", 1969, 20, "47:23");

/*##############################################################################*/


/* Artists*/

/* AC/DC*/
INSERT INTO tblArtists (id_band, nume_artist, prenume_artist, data_nasterii, tara_origine) VALUES (1, 'Angus', 'Young', ('1955-03-31'), 'Scotland');

/* Metallica*/
INSERT INTO tblArtists (id_band, nume_artist, prenume_artist, data_nasterii, tara_origine) VALUES (2, 'James', 'Hetfield', ('1963-08-03'), 'USA');

/* Queen*/
INSERT INTO tblArtists (id_band, nume_artist, prenume_artist, data_nasterii, tara_origine) VALUES (3, 'Freddie', 'Mercury', ('1946-09-05'), 'Zanzibar');

/* Pink Floyd*/
INSERT INTO tblArtists (id_band, nume_artist, prenume_artist, data_nasterii, tara_origine) VALUES (4, 'David', 'Gilmour', ('1946-03-06'), 'UK');

/* Led Zeppelin*/
INSERT INTO tblArtists (id_band, nume_artist, prenume_artist, data_nasterii, tara_origine) VALUES (5, 'Robert', 'Plant', '1948-08-20', 'UK');

/* The Rolling Stones*/
INSERT INTO tblArtists (id_band, nume_artist, prenume_artist, data_nasterii, tara_origine) VALUES (6, 'Mick', 'Jagger', ('1943-07-26'), 'UK');

/* Nirvana*/
INSERT INTO tblArtists (id_band, nume_artist, prenume_artist, data_nasterii, tara_origine) VALUES (7, 'Kurt', 'Cobain', ('1967-02-20'), 'USA');

/* The Eagles*/
INSERT INTO tblArtists (id_band, nume_artist, prenume_artist, data_nasterii, tara_origine) VALUES (8, 'Don', 'Henley', ('1947-07-22'), 'USA');

/* Aerosmith*/
INSERT INTO tblArtists (id_band, nume_artist, prenume_artist, data_nasterii, tara_origine) VALUES (9, 'Steven', 'Tyler', ('1948-03-26'), 'USA');

/* ABBA*/
INSERT INTO tblArtists (id_band, nume_artist, prenume_artist, data_nasterii, tara_origine) VALUES (10, 'Agnetha', 'Faltskog', ('1950-04-05'), 'Sweden');

/* Bee Gees*/
INSERT INTO tblArtists (id_band, nume_artist, prenume_artist, data_nasterii, tara_origine) VALUES (11, 'Barry', 'Gibb', ('1946-09-01'), 'UK');

/* Coldplay*/
INSERT INTO tblArtists (id_band, nume_artist, prenume_artist, data_nasterii, tara_origine) VALUES (12, 'Chris', 'Martin', ('1977-03-02'), 'UK');

/* Daft Punk*/
INSERT INTO tblArtists (id_band, nume_artist, prenume_artist, data_nasterii, tara_origine) VALUES (13, 'Thomas', 'Bangalter', ('1975-01-03'), 'France');

/* Eurythmics*/
INSERT INTO tblArtists (id_band, nume_artist, prenume_artist, data_nasterii, tara_origine) VALUES (14, 'Annie', 'Lennox', ('1954-12-25'), 'UK');

/* Fleetwood Mac*/
INSERT INTO tblArtists (id_band, nume_artist, prenume_artist, data_nasterii, tara_origine) VALUES (15, 'Stevie', 'Nicks', ('1948-05-26'), 'USA');

/* Gorillaz*/
INSERT INTO tblArtists (id_band, nume_artist, prenume_artist, data_nasterii, tara_origine) VALUES (16, 'Damon', 'Albarn', ('1968-03-23'), 'UK');

/* Imagine Dragons*/
INSERT INTO tblArtists (id_band, nume_artist, prenume_artist, data_nasterii, tara_origine) VALUES (17, 'Dan', 'Reynolds', ('1987-07-14'), 'USA');

/* Journey*/
INSERT INTO tblArtists (id_band, nume_artist, prenume_artist, data_nasterii, tara_origine) VALUES (18, 'Steve', 'Perry', ('1949-01-22'), 'USA');

/* Kraftwerk*/
INSERT INTO tblArtists (id_band, nume_artist, prenume_artist, data_nasterii, tara_origine) VALUES (19, 'Ralf', 'Hutter', ('1946-08-20'), 'Germany');

/* The Beatles*/
INSERT INTO tblArtists (id_band, nume_artist, prenume_artist, data_nasterii, tara_origine) VALUES (20, 'John', 'Lennon', ('1940-10-09'), 'UK');

/*##############################################################################*/


/* Songs*/

/* AC/DC*/
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (6, 1, "Back in Black", "4:15");
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (6, 2, "Highway to Hell", "3:28");

/* Metallica*/
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (6, 3, "Master of Puppets", "8:35");
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (6, 4, "...And Justice for All", "9:44");

/* Queen*/
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (1, 5, "Bohemian Rhapsody", "5:55");
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (1, 6, "Another One Bites the Dust", "3:35");

/* Pink Floyd*/
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (3, 7, "Time", "7:05");
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (3, 8, "Comfortably Numb", "6:23");

/* Led Zeppelin*/
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (6, 9, "Stairway to Heaven", "8:02");
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (6, 10, "Kashmir", "8:37");

/* The Rolling Stones*/
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (6, 11, "Brown Sugar", "3:50");
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (6, 12, "Miss You", "4:48");

/* Nirvana*/
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (6, 13, "Smells Like Teen Spirit", "5:01");
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (6, 14, "Heart-Shaped Box", "4:41");

/* The Eagles*/
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (6, 15, "Hotel California", "6:30");
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (6, 16, "Desperado", "3:37");

/* Aerosmith*/
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (8, 17, "Sweet Emotion", "4:34");
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (8, 18, "Love in an Elevator", "5:22");

/* ABBA*/
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (5, 19, "Dancing Queen", "3:51");
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (5, 20, "The Winner Takes It All", "4:55");

/* Bee Gees*/
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (9, 21, "Stayin' Alive", "4:45");
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (9, 22, "Tragedy", "5:03");

/* Coldplay*/
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (1, 23, "Yellow", "4:29");
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (1, 24, "Clocks", "5:07");

/* Daft Punk*/
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (10, 25, "One More Time", "5:20");
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (10, 26, "Get Lucky", "6:07");

/* Eurythmics*/
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (1, 27, "Sweet Dreams (Are Made of This)", "3:36");
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (1, 28, "Here Comes the Rain Again", "4:54");

/* Fleetwood Mac*/
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (9, 29, "Go Your Own Way", "3:38");
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (9, 30, "Tusk", "3:37");

/* Gorillaz*/
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (7, 31, "Clint Eastwood", "5:43");
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (7, 32, "Feel Good Inc.", "3:42");

/* Imagine Dragons*/
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (1, 33, "Radioactive", "3:06");
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (1, 34, "I Bet My Life", "3:13");

/* Journey*/
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (6, 35, "Don't Stop Believin'", "4:11");
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (6, 36, "Separate Ways (Worlds Apart)", "5:26");

/* Kraftwerk*/
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (2, 37, "Autobahn", "22:43");
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (2, 38, "The Robots", "7:42");

/* The Beatles*/
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (1, 39, "Lucy in the Sky with Diamonds", "3:28");
INSERT INTO tblSongs (id_categorie, id_album, titlu, durata_melodie) VALUES (1, 40, "Come Together", "4:20");

/*##############################################################################*/


/*Composers*/

/* AC/DC*/
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (1, 1, 'Young', 'Angus');
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (2, 1, 'Young', 'Angus');

/* Metallica*/
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (3, 2, 'Hetfield', 'James');
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (4, 2, 'Hetfield', 'James');

/* Queen*/
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (5, 3, 'Mercury', 'Freddie');
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (6, 3, 'Deacon', 'John');

/* Pink Floyd*/
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (7, 4, 'Waters', 'Roger');
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (8, 4, 'Gilmour', 'David');

/* Led Zeppelin*/
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (9, 5, 'Page', 'Jimmy');
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (10, 5, 'Page', 'Jimmy');

/* The Rolling Stones*/
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (11, 6, 'Jagger', 'Mick');
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (12, 6, 'Jagger', 'Mick');

/* Nirvana*/
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (13, 7, 'Cobain', 'Kurt');
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (14, 7, 'Cobain', 'Kurt');

/* The Eagles*/
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (15, 8, 'Frey', 'Glenn');
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (16, 8, 'Henley', 'Don');

/* Aerosmith*/
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (17, 9, 'Tyler', 'Steven');
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (18, 9, 'Tyler', 'Steven');

/* ABBA*/
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (19, 10, 'Andersson', 'Benny');
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (20, 10, 'Andersson', 'Benny');

/* Bee Gees*/
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (21, 11, 'Gibb', 'Barry');
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (22, 11, 'Gibb', 'Barry');

/* Coldplay*/
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (23, 12, 'Martin', 'Chris');
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (24, 12, 'Martin', 'Chris');

/* Daft Punk*/
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (25, 13, 'Bangalter', 'Thomas');
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (26, 13, 'Bangalter', 'Thomas');

/* Eurythmics*/
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (27, 14, 'Lennox', 'Annie');
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (28, 14, 'Lennox', 'Annie');

/* Fleetwood Mac*/
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (29, 15, 'Nicks', 'Stevie');
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (30, 15, 'Nicks', 'Stevie');

/* Gorillaz*/
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (31, 16, 'Albarn', 'Damon');
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (32, 16, 'Albarn', 'Damon');

/* Imagine Dragons*/
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (33, 17, 'Reynolds', 'Dan');
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (34, 17, 'Reynolds', 'Dan');

/* Journey*/
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (35, 18, 'Perry', 'Steve');
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (36, 18, 'Perry', 'Steve');

/* Kraftwerk*/
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (37, 19, 'Hutter', 'Ralf');
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (38, 19, 'Hutter', 'Ralf');

/* The Beatles*/
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (39, 20, 'Lennon', 'John');
INSERT INTO tblComposers (id_melodie, id_band, nume_compozitor, prenume_compozitor) VALUES (40, 20, 'Lennon', 'John');

/*##############################################################################*/


SELECT * FROM tblBands;
SELECT * FROM tblCategories;
SELECT * FROM tblAlbums;
SELECT * FROM tblComposers;
SELECT * FROM tblSongs;
SELECT * FROM tblArtists;