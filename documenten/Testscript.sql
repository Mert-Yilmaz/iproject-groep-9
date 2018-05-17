USE iproject9

-- Belangrijk:
-- Voor sommige scripts moeten de voorgaande records verwijderd en/of opnieuw ingevoerd worden!

/*
DELETE FROM VoorwerpInRubriek;
DELETE FROM Bestand;
DELETE FROM Bod;
DELETE FROM Feedback;
DELETE FROM Voorwerp;
DELETE FROM Verkoper;
DELETE FROM Rubriek;
DELETE FROM Gebruikerstelefoon;
DELETE FROM Gebruiker;
DELETE FROM Vraag;
*/

/* Gebruiker */
-- Email adres
	-- Negatief
	INSERT INTO Gebruiker -- Vragen wel in Vraag
	VALUES ('Gebruiker8','Gebruiker','8','Kastanjelaan 45',NULL,'6666 AC','Arnhem','Nederland','24-apr-2018','Gebruiker1@gmail.com','Hello1234',	5,'Poekie',		1);
	--Positief
	INSERT INTO Gebruiker -- Vragen wel in Vraag
	VALUES ('Gebruiker9','Gebruiker','9','Kastanjelaan 45',NULL,'6666 AC','Arnhem','Nederland','24-apr-2018','Gebruiker9@gmail.com','Hello1234',	5,'Poekie',		1);
-- Gebruikersnaam
	-- Negatief
	INSERT INTO Gebruiker -- Vragen wel in Vraag
	VALUES ('Gebruiker1','Gebruiker','10','Kastanjelaan 45',NULL,'6666 AC','Arnhem','Nederland','24-apr-2018','Gebruiker10@gmail.com','Hello1234',	5,'Poekie',		1);
	-- Positief
	INSERT INTO Gebruiker -- Vragen wel in Vraag
	VALUES ('Gebruiker11','Gebruiker','11','Kastanjelaan 45',NULL,'6666 AC','Arnhem','Nederland','24-apr-2018','Gebruiker11@gmail.com','Hello1234',	5,'Poekie',		1);
-- Wachtwoord
	-- Negatief
	INSERT INTO Gebruiker -- Vragen wel in Vraag
	VALUES ('Gebruiker12','Gebruiker','12','Kastanjelaan 45',NULL,'6666 AC','Arnhem','Nederland','24-apr-2018','Gebruiker12@gmail.com','pass',		5,'Poekie',		1);
	-- Positief
	INSERT INTO Gebruiker -- Vragen wel in Vraag
	VALUES ('Gebruiker13','Gebruiker','13','Kastanjelaan 45',NULL,'6666 AC','Arnhem','Nederland','24-apr-2018','Gebruiker13@gmail.com','Passw0rd',	5,'Poekie',		1);
-- Geboortedatum
	-- Negatief
	INSERT INTO Gebruiker -- Vragen wel in Vraag
	VALUES ('Gebruiker14','Gebruiker','14','Kastanjelaan 45',NULL,'6666 AC','Arnhem','Nederland','24-apr-2038','Gebruiker14@gmail.com','Passw0rd',		5,'Poekie',		1);
	-- Positief
	INSERT INTO Gebruiker -- Vragen wel in Vraag
	VALUES ('Gebruiker15','Gebruiker','15','Kastanjelaan 45',NULL,'6666 AC','Arnhem','Nederland','24-apr-2018','Gebruiker15@gmail.com','Passw0rd',		5,'Poekie',		1);

/* Verkoper */
-- Gebruiker is verkoper
	-- Negatief
	INSERT INTO Verkoper -- Gebruiker 4 moet in Gebruiker staan met verkoper = 0
	VALUES ('Gebruiker4', 'Rabobank', 1234567, 'Creditcard','1854-5688-9512-7256');
	-- Positief
	INSERT INTO Verkoper --Gebruiker 7 moet in Gebruiker staan met verkoper = 1, maar niet in Verkoper
	VALUES ('Gebruiker7','Rabobank',6576750,'Creditcard','3693-0284-5869-8732');
-- Kaartgebruik
	-- Negatief
	INSERT INTO Verkoper --Gebruiker 7 moet in Gebruiker staan met verkoper = 1, maar niet in Verkoper
	VALUES ('Gebruiker7', 'Rabobank', NULL, 'Creditcard', NULL);
	-- Positief
	INSERT INTO Verkoper --Gebruiker 7 moet in Gebruiker staan met verkoper = 1, maar niet in Verkoper
	VALUES ('Gebruiker7','Rabobank',6576750,'Creditcard','3693-0284-5869-8732');
-- Controleoptie
	-- Negatief
	INSERT INTO Verkoper --Gebruiker 7 moet in Gebruiker staan met verkoper = 1, maar niet in Verkoper
	VALUES ('Gebruiker7','Rabobank',6576750,'Email','3693-0284-5869-8732');
	-- Positief
	INSERT INTO Verkoper --Gebruiker 7 moet in Gebruiker staan met verkoper = 1, maar niet in Verkoper
	VALUES ('Gebruiker7','Rabobank',6576750,'Creditcard','3693-0284-5869-8732');

/* Voorwerp */
-- Eigen bod
	-- Negatief
	INSERT INTO Voorwerp -- Gebruikers wel in Gebruiker
	VALUES (0000000001,'BMW 340i',	'Mooie BMW',	50.00,	'IDeal/PayPal',	'Gewoon overmaken',	'Arnhem',	'Nederland',	7,	'15-may-1999',	'09:20:20.0000000',	null,	null,	'Gebruiker7',	'Gebruiker7',	'22-may-1999',	'20:20:21',	1,	150.00);
	-- Positief
	INSERT INTO Voorwerp -- Gebruikers wel in Gebruiker
	VALUES (0000000001,'BMW 340i',	'Mooie BMW',	50.00,	'IDeal/PayPal',	'Gewoon overmaken',	'Arnhem',	'Nederland',	7,	'15-may-1999',	'09:20:20.0000000',	null,	null,	'Gebruiker7',	'Gebruiker1',	'22-may-1999',	'20:20:21',	1,	150.00);
-- Looptijd
	-- Negatief
	INSERT INTO Voorwerp -- Gebruikers wel in Gebruiker
	VALUES (0000000001,'BMW 340i',	'Mooie BMW',	50.00,	'IDeal/PayPal',	'Gewoon overmaken',	'Arnhem',	'Nederland',	12,	'15-may-1999',	'09:20:20.0000000',	null,	null,	'Gebruiker7',	'Gebruiker1',	'22-may-1999',	'20:20:21',	1,	150.00);
	-- Positief
	INSERT INTO Voorwerp -- Gebruikers wel in Gebruiker
	VALUES (0000000001,'BMW 340i',	'Mooie BMW',	50.00,	'IDeal/PayPal',	'Gewoon overmaken',	'Arnhem',	'Nederland',	7,	'15-may-1999',	'09:20:20.0000000',	null,	null,	'Gebruiker7',	'Gebruiker1',	'22-may-1999',	'20:20:21',	1,	150.00);
-- Bieding hoger dan startprijs
	-- Negatief
	INSERT INTO Voorwerp -- Gebruikers wel in Gebruiker
	VALUES (0000000001,'BMW 340i',	'Mooie BMW',	50.00,	'IDeal/PayPal',	'Gewoon overmaken',	'Arnhem',	'Nederland',	7,	'15-may-1999',	'09:20:20.0000000',	null,	null,	'Gebruiker7',	'Gebruiker1',	'22-may-1999',	'20:20:21',	1,	10.00);
	-- Positief
	INSERT INTO Voorwerp -- Gebruikers wel in Gebruiker
	VALUES (0000000001,'BMW 340i',	'Mooie BMW',	50.00,	'IDeal/PayPal',	'Gewoon overmaken',	'Arnhem',	'Nederland',	7,	'15-may-1999',	'09:20:20.0000000',	null,	null,	'Gebruiker7',	'Gebruiker1',	'22-may-1999',	'20:20:21',	1,	150.00);
-- Looptijd begin en eind
	-- Negatief
	INSERT INTO Voorwerp -- Gebruikers wel in Gebruiker
	VALUES (0000000001,'BMW 340i',	'Mooie BMW',	50.00,	'IDeal/PayPal',	'Gewoon overmaken',	'Arnhem',	'Nederland',	7,	'15-may-2999',	'09:20:20.0000000',	null,	null,	'Gebruiker7',	'Gebruiker1',	'22-may-1999',	'20:20:21',	1,	150.00);
	-- Positief
	INSERT INTO Voorwerp -- Gebruikers wel in Gebruiker
	VALUES (0000000001,'BMW 340i',	'Mooie BMW',	50.00,	'IDeal/PayPal',	'Gewoon overmaken',	'Arnhem',	'Nederland',	7,	'15-may-1999',	'09:20:20.0000000',	null,	null,	'Gebruiker7',	'Gebruiker1',	'22-may-1999',	'20:20:21',	1,	150.00);

/* Feedback */
-- Feedbacksoort
	-- Negatief
	INSERT INTO Feedback -- Voorwerpnummer wel in voorwerp
	VALUES (0000000001, 'koper', 'matig','22-apr-2018','10:44:21.0000000','Matig!');
	-- Positief
	INSERT INTO Feedback -- Voorwerpnummer wel in voorwerp
	VALUES (0000000001,'koper','positief','22-apr-2018','10:44:21.0000000','Bedankt!');
-- Soort gebruiker
	-- Negatief
	INSERT INTO Feedback -- Voorwerpnummer wel in voorwerp
	VALUES (0000000001, 'seller', 'positief', '22-apr-2018','10:44:21.0000000','Bedankt!');
	-- Positief
	INSERT INTO Feedback -- Voorwerpnummer wel in voorwerp
	VALUES (0000000001,'koper','positief','22-apr-2018','10:44:21.0000000','Bedankt!');

/* Bod */
-- Minimale verhoging --> Constraint werkt nog niet
	-- Negatief
	-- Positief

/* Bestand */
-- Max. aantal afbeeldingen
	-- Negatief
	INSERT INTO Bestand -- Voorwerpnummer wel in Voorwerp
	VALUES ('C:\Img\001.jpg', 0000000001),
		   ('C:\Img\002.jpg', 0000000001),
		   ('C:\Img\003.jpg', 0000000001),
		   ('C:\Img\004.jpg', 0000000001),
		   ('C:\Img\005.jpg', 0000000001);
	-- Positief
	INSERT INTO Bestand -- Voorwerpnummer wel in voorwerp
	VALUES ('C:\Img\001.jpg', 0000000001),
		   ('C:\Img\002.jpg', 0000000001),
		   ('C:\Img\003.jpg', 0000000001);
-- Bestandtype
	-- Negatief
	INSERT INTO Bestand -- Voorwerpnummer wel in voorwerp
	VALUES ('C:\Img\001.gif', 0000000001);
	-- Positief
	INSERT INTO Bestand -- Voorwerpnummer wel in voorwerp
	VALUES ('C:\Img\001.jpg', 0000000001);