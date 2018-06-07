﻿USE iproject9

DELETE FROM Illustraties;
DELETE FROM Items;
DELETE FROM Categorieen;
DELETE FROM Users;
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

INSERT INTO Vraag
VALUES	(5,'Hoe heette je eerste huisdier?'),
		(1,'Welk gerecht kon je als eerste koken?'),
		(4,'In welke plaats ben je geboren?'),
		(2,'Wat is je moeders tweede naam?'),
		(3,'Welke bijnaam had je als kind?');

INSERT INTO Gebruiker
(gebruikersnaam,voornaam,achternaam,adresregel1,adresregel2,postcode,plaatsnaam,land,geboortedatum,mailbox,wachtwoord,vraag,antwoordtekst,verkoper, code, actief)
VALUES	('Gebruiker1','Gebruiker','1',		'Kastanjelaan 45',NULL,'6666 AC','Arnhem','Nederland','24-apr-2018','Gebruiker1@gmail.com','Hello1234',							5,'Poekie',	1, '5751ec3e9a4feab575962e78e006250d', 1),
		('Gebruiker2','Gebruiker','2',		'Kastanjelaan 44',NULL,'6666 AC','Arnhem','Nederland','24-apr-2018','Gebruiker2@gmail.com','123Welkom',							4,'Elst',	1, '82161242827b703e6acf9c726942a1e4', 1),
		('Gebruiker3','Gebruiker','3',		'Krokuslaan 101', NULL,'6666 AS','Arnhem','Nederland','24-apr-2018','Gebruiker3@gmail.com','Welkom123',							5,'Doekie',	1, 'c0e190d8267e36708f955d7ab048990d', 1),
		('Gebruiker4','Gebruiker','4',		'Kastanjelaan 43',NULL,'6666 AC','Arnhem','Nederland','24-apr-2018','Gebruiker4@gmail.com','AFSDJFJSDai2',						5,'Zoekie',	0, '07c5807d0d927dcd0980f86024e5208b', 1),
		('Gebruiker5','Gebruiker','5',		'Kastanjelaan 42',NULL,'6666 AC','Arnhem','Nederland','24-apr-2018','Gebruiker5@gmail.com','SSSSS1234',							1,'Ei',		1, '2afe4567e1bf64d32a5527244d104cea', 1),
		('Gebruiker6','Gebruiker','6',		'Kastanjelaan 41',NULL,'6666 AC','Arnhem','Nederland','24-apr-2018','Gebruiker6@gmail.com','10ooo0004',							5,'Wookiee',0, '02a32ad2669e6fe298e607fe7cc0e1a0', 1),
		('Gebruiker7','Gebruiker','7',		'Kastanjelaan 40',NULL,'6666 AC','Arnhem','Nederland','24-apr-2018','Gebruiker7@gmail.com','Ikbeneenkoe1',						5,'Loekie',	1, 'fb89705ae6d743bf1e848c206e16a1d7', 1),
		('Gebruiker8','Gebruiker','8',		'Kastanjelaan 39',NULL,'6666 AC','Arnhem','Nederland','24-apr-2018','Gebruiker8@gmail.com','wachtw00rd',						5,'Joekie',	0, '01386bd6d8e091c2ab4c7c7de644d37b', 1),
		('Admin',	  'Admin',    'Admin',	'Kastanjelaan 46',NULL,'6666 AC','Arnhem','Nederland','24-apr-2018','Admin@Admin.com',	   'e64b78fc3bc91bcbc7dc232ba8ec59e0',	5,'Roekie',	1, 'df877f3865752637daa540ea9cbc474f', 1);  /*Wachtwoord: Admin123*/

INSERT INTO Gebruikerstelefoon
(volgnr,gebruiker,telefoon)
VALUES	(1,'Gebruiker1','026-7152867'),
		(2,'Gebruiker2','026-1600923'),
		(3,'Gebruiker3','026-5928310'),
		(4,'Gebruiker4','026-1111111'),
		(5,'Gebruiker5','026-2222222'),
		(6,'Gebruiker6','026-3333333'),
		(7,'Gebruiker7','026-4444444'),
		(8,'Gebruiker8','026-5555555'),
		(9,'Admin',		'026-6666666');


INSERT INTO Rubriek(rubrieknummer, rubrieknaam, rubriek)
VALUES
 (-1,		'Root',								NULL),
 -- 1 --
 (1,		'Verzamelen',						-1),
	(32,		'Poppen',							1),
	(34,		'Reclamevoorwerpen',				1),
		(35,		'Overige reclamevoorwerpen',		34),
		(8861,		'Reclameborden',					34),
		(10960,		'Harley Davidson',					34),
		(35692,		'Drankmerken overige',				34),
			(34748,		'Flessen',							35692 ),
			(34749,		'Glazen',							35692 ),
			(34755,		'Overige drankmerken',				35692 ),
			(100540,	'Reclameborden',					35692 ),
		(62848,		'Coca-Cola',						34),
			(62852,		'Flesjes',							62848 ),
			(62856,		'Blikjes',							62848 ),
			(62857,		'Glazen',							62848 ),
			(62862,		'Reclameborden',					62848 ),
			(38,		'Overige Coca-Cola',				62848 ),
		(157550,	'McDonalds',						34),
	(137,		'Disneyana',						1),
		(138,		'Overige Disneyana',				137 ),
		(142,		'Pluche',							137 ),
		(143,		'Speldjes en buttons',				137 ),
		(439,		'Beanies',							137 ),
		(1375,		'Beeldjes',							137 ),
		(8593,		'Figuurtjes',						137 ),
		(8595,		'Huishoudelijke artikelen',			137 ),
		(8596,		'Kleding',							137 ),
		(8598,		'Munten',							137 ),
		(8600,		'Posters',							137 ),
		(8602,		'Speelgoed',						137 ),
		(8603,		'Horloges en klokken',				137 ),
		(13846,		'Sneeuwkogels',						137 ),
		(35860,		'Telefoons',						137 ),
		(35862,		'Stickers en briefpapier',			137 ),
	(417,		'Transport',						1),
		(40837,		'Taxi''s',							417 ),
		(62896,		'Nummerborden',						417 ),
		(420,		'Fietsen',							417 ),
		(423,		'Scheepvaart',						417 ),
		(8743,		'Landkaarten',						417 ),
		(8892,		'Ruimtevaart',						417 ),
		(8893,		'Overige transport',				417 ),
		(14049,		'Luchtvaart',						417 ),
		(25797,		'Motoren',							417 ),
		(34775,		'Bussen',							417 ),
		(34777,		'Vrachtvervoer',					417 ),
		(35522,		'Auto''s',							417 ),
		(35535,		'Treinen',							417 ),
	(868,		'Ruilkaartspellen',					1),
		(218,		'Magic The Gathering',				868 ),
			(8664,		'Booster Packs',					218 ),
			(8665,		'Losse kaarten - in print',			218 ),
			(8666,		'Losse kaarten - out of print',		218 ),
			(8667,		'Verzamelingen',					218 ),
			(8668,		'Overige Magic The Gathering',		218 ),
			(19110,		'Dozen',							218 ),
			(19114,		'Complete sets',					218 ),
			(19115,		'Starter decks',					218 ),
			(49196,		'Decks - type I',					218 ),
			(100517,	'Decks - type II',					218 ),
			(119357,	'Foil cards',						218 ),
			(141763,	'Accessoires',						218 ),
		(219,		'Overige ruilkaartspellen',			868 ),
		(39246,		'Dragonball Z',						868 ),
		(60225,		'Lord of the Rings',				868 ),
			(50288,		'Booster Packs',					60225 ),
			(50289,		'Foil cards',						60225 ),
			(50290,		'Losse kaarten',					60225 ),
			(50291,		'Promokaarten',						60225 ),
			(50292,		'Starter decks',					60225 ),
			(50293,		'Verzamelingen',					60225 ),
			(33052,		'Overige Lord of the Rings',		60225 ),
		(60238,		'Pokémon',							868 ),
			(2611,		'Engels/Amerikaans',				60238 ),
			(4301,		'Overige Pokémon',					60238 ),
			(4698,		'Japanse kaarten',					60238 ),
		(60241,		'Yu-Gi-Oh!',						868 ),
			(31394,		'Dozen',							60241 ),
			(31396,		'Booster Packs',					60241 ),
			(35521,		'Overige Yu-Gi-Oh!',				60241 ),
			(52176,		'Verzamelingen',					60241 ),
			(52178,		'Starter decks',					60241 ),
			(77544,		'Losse kaarten',					60241 ),
			(104051,	'Accessoires',						60241 ),
		(60805,		'Star Wars',						868 ),
		(60807,		'Star Trek',						868 ),
		(69789,		'Duel Masters',						868 ),
		(73570,		'Harry Potter',						868 ),
		(112489,	'Neopets',							868 ),
	(984,		'Muziek- en speeldozen',			1),
	(1414,		'Koningshuizen',					1),
	(7474,		'Antieke apparaten',				1),
		(931,		'Radio''s en zenders',				7474 ),
		(985,		'Telefoon',							7474 ),
		(8875,		'Overige antieke apparaten',		7474 ),
		(26512,		'Grammofoons',						7474 ),
		(59222,		'TV en video',						7474 ),
		(412,		'Instrumenten',						7474 ),
	(8605,		'Poppetjes en figuurtjes',			1),
		(2605,		'Pokémon',							8605 ),
		(8617,		'Smurfen',							8605 ),
		(8621,		'Overige poppetjes',				8605 ),
		(9820,		'Actiefiguren',						8605 ),
			(9975,		'GI Joe',							9820 ),
			(9983,		'Overige actiefiguren',				9820 ),
			(27294,		'Dragon',							9820 ),
			(28703,		'M.A.S.K',							9820 ),
			(77533,		'Masters of the Universe',			9820 ),
		(18648,		'Muppet Show',						8605 ),
		(39235,		'Sporters',							8605 ),
		(39269,		'Verrassingseieren',				8605 ),
		(60212,		'Spongebob',						8605 ),
		(81424,		'Looney Tunes',						8605 ),
		(96812,		'Kuifje',							8605 ),
		(100538,	'Suske en Wiske',					8605 ),
		(100539,	'Volk van Laaf',					8605 ),
	(8673,		'Ruilkaarten en albums',			1),
	(8710,		'Overige verzamelobjecten',			1),
		(151,		'Pez',								8710 ),
		(159,		'Overige verzamelen',				8710 ),
		(3628,		'Sleutelhangers',					8710 ),
		(8751,		'Pennen',							8710 ),
		(10914,		'Just the Right Shoe',				8710 ),
		(26612,		'Dierenobjecten',					8710 ),
		(34424,		'Viewmaster',						8710 ),
		(38323,		'Spinners',							8710 ),
	(8715,		'Spaarpotten en geldartikelen',		1),
	(8733,		'Bierartikelen',					1),
		(565,		'Bierviltjes',						8733 ),
		(8735,		'Bieretiketten',					8733 ),
		(8736,		'Bierflessen',						8733 ),
		(8737,		'Bierglazen',						8733 ),
		(8740,		'Overige bierartikelen',			8733 ),
		(19825,		'Spiegels',							8733 ),
		(34742,		'Bierblikjes',						8733 ),
		(93130,		'Bierpullen',						8733 ),
	(8780,		'Diddl',							1),
		(8784,		'(Post ), kaarten',					8780 ),
		(8789,		'Verzamelfiguren en knuffels',		8780 ),
		(8792,		'Briefpapier',						8780 ),
		(8796,		'Overige Diddl',					8780 ),
		(34976,		'Mokken',							8780 ),
		(35499,		'Kleding en accessoires',			8780 ),
		(100511,	'Blokbladen',						8780 ),
			(8781,		'A4 blokbladen',					100511 ),
			(8782,		'A5 blokbladen',					100511 ),
			(8783,		'A6 blokbladen',					100511 ),
		(100536,	'Stickers',							8780 ),
	(8820,		'Mineralen en fossielen',			1),
	(8878,		'Telefoonkaarten',					1),
		(1463,		'Overige telefoonkaarten',			8878 ),
		(8886,		'Motieven',							8878 ),
		(8887,		'Nederland',						8878 ),
		(35544,		'Azië',								8878 ),
		(35545,		'Afrika',							8878 ),
		(35546,		'Amerika',							8878 ),
		(35547,		'Australië',						8878 ),
		(35548,		'Europa',							8878 ),
	(8991,		'Ansichtkaarten en foto''s',		1),
		(127,		'Overige ansichtkaarten',			8991 ),
		(4096,		'Australië en Oceanië',				8991 ),
		(4929,		'Risque',							8991 ),
		(8998,		'Oorlogen',							8991 ),
			(921,		'Tweede Wereldoorlog',				8998 ),
			(60662,		'Voor 1914',						8998 ),
			(60663,		'Eerste Wereldoorlog',				8998 ),
			(60664,		'Na 1945',							8998 ),
			(67679,		'Interbellum',						8998 ),
		(9002,		'Dieren',							8991 ),
		(9013,		'Auto''s en transport',				8991 ),
			(926,		'Overige auto''s en transport',		9013 ),
			(9014,		'Auto''s',							9013 ),
			(9018,		'Vliegtuigen',						9013 ),
			(9019,		'Schepen',							9013 ),
			(33450,		'Motoren',							9013 ),
			(82280,		'Vrachtwagens',						9013 ),
		(9033,		'Azië',								8991 ),
			(20253,		'China',							9033 ),
			(20259,		'Japan',							9033 ),
			(20264,		'Zuidoost-Azië',					9033 ),
			(69733,		'Overig Azië',						9033 ),
			(86695,		'Midden-Oosten',					9033 ),
			(98796,		'India',							9033 ),
			(136689,	'Israel',							9033 ),
		(13998,		'Koningshuizen',					8991 ),
		(21530,		'Amerika',							8991 ),
			(924,		'Verenigde Staten',					21530 ),
			(33402,		'Canada',							21530 ),
			(33403,		'Overig Amerika',					21530 ),
			(33404,		'Midden-Amerika',					21530 ),
			(33405,		'Zuid-Amerika',						21530 ),
		(29484,		'Mensen en gezichten',				8991 ),
		(33388,		'Europa',							8991 ),
			(9031,		'Overig Europa',					33388 ),
			(33356,		'Duitsland',						33388 ),
			(33389,		'Joegoslavië (voormalig ),',		33388 ),
			(33390,		'Letland',							33388 ),
			(33391,		'België',							33388 ),
			(33392,		'Denemarken',						33388 ),
			(33393,		'Finland',							33388 ),
			(33394,		'Frankrijk',						33388 ),
			(33395,		'Griekenland',						33388 ),
			(33396,		'Groot-Brittannië',					33388 ),
			(33397,		'Italië',							33388 ),
			(33398,		'Monaco',							33388 ),
			(34629,		'Noorwegen',						33388 ),
			(34631,		'Polen',							33388 ),
			(34632,		'Rusland',							33388 ),
			(34633,		'San Marino',						33388 ),
			(34634,		'Zweden',							33388 ),
			(34636,		'Spanje',							33388 ),
			(34637,		'Vaticaanstad',						33388 ),
			(35475,		'Ierland',							33388 ),
			(35476,		'Liechtenstein',					33388 ),
			(35477,		'Luxemburg',						33388 ),
			(35478,		'Portugal',							33388 ),
			(37357,		'Andorra',							33388 ),
			(37358,		'Bosnië-Herzegovina',				33388 ),
			(37359,		'Bulgarije',						33388 ),
			(37360,		'IJsland',							33388 ),
			(37361,		'Kroatië',							33388 ),
			(37362,		'Malta',							33388 ),
			(37363,		'Macedonië',						33388 ),
			(37364,		'Roemenië',							33388 ),
			(37365,		'Servië',							33388 ),
			(37366,		'Slovenië',							33388 ),
			(37367,		'Turkije',							33388 ),
			(49170,		'Hongarije',						33388 ),
			(81415,		'Slowakije',						33388 ),
			(81416,		'Tsjechië',							33388 ),
			(107697,	'Oostenrijk',						33388 ),
			(107706,	'Zwitserland',						33388 ),
			(148095,	'Estland',							33388 ),
			(148096,	'Litouwen',							33388 ),
		(33400,		'Afrika',							8991 ),
			(128404,	'Zuid-Afrika',						33400 ),
			(128405,	'Overige Afrika',					33400 ),
		(33406,		'Thema''s',							8991 ),
		(33416,		'Artiesten en beroemdheden',		8991 ),
			(916,		'Overige artiesten',				33416 ),
			(14890,		'Acteurs',							33416 ),
			(53590,		'Actrices',							33416 ),
			(112459,	'Historische figuren',				33416 ),
			(112460,	'Muzikanten',						33416 ),
		(33421,		'Fotomontage en kunst',				8991 ),
		(33444,		'Advertenties en reclame',			8991 ),
		(33448,		'Sport',							8991 ),
		(34628,		'Nederland',						8991 ),
			(100506,	'Noord-Holland',					34628 ),
			(100507,	'Zuid-Holland',						34628 ),
			(100509,	'Utrecht',							34628 ),
			(128428,	'Drenthe',							34628 ),
			(128429,	'Flevoland',						34628 ),
			(128430,	'Friesland',						34628 ),
			(128431,	'Gelderland',						34628 ),
			(128432,	'Groningen',						34628 ),
			(128433,	'Limburg',							34628 ),
			(128445,	'Overijssel',						34628 ),
			(128446,	'Zeeland',							34628 ),
			(160044,	'Noord-Brabant',					34628 ), 
		(35486,		'Verzamelingen',					8991 ),
	(9832,		'Rookartikelen, Zippo''s',			1),
		(8870,		'Zippo''s',							9832 ),
		(8874,		'Overige rookartikelen',			9832 ),
		(9830,		'Overige aanstekers',				9832 ),
		(34760,		'Lucifersdoosjes',					9832 ),
	(13518,		'Jokers en speelkaarten',			1),
	(13926,		'Chocolade-artikelen',				1),
	(15502,		'Militaria',						1),		-- Subcat. checken
		(4716,		'Tweede Wereldoorlog',				15502 ),
		(13976,		'Voor 1940',						15502 ),
		(28716,		'Na 1945',							15502 ),
		(42381,		'Overige militaria',				15502 ),
	(18828,		'Posters, affiches en kaartjes',	1),
		(125,		'1980 - heden',						18828 ),
		(35042,		'Voor 1900',						18828 ),
		(61107,		'1901 - 1950',						18828 ),
		(61108,		'1951 - 1980',						18828 ),
	(25804,		'Kleding en textiel',				1),
	(30736,		'Sigarenbandjes',					1),
	(39189,		'Magie en mystiek',					1),
	(39226,		'Elfenfiguurtjes',					1),
	(39271,		'Verzamelingen en partijen',		1),
	(47499,		'Speldjes en buttons',				1),
		(8830,		'Pins',								47499 ),
		(47500,		'Speldjes',							47499 ),
		(49174,		'Buttons',							47499 ),
		(52145,		'Overige speldjes en buttons',		47499 ),
	(75718,		'Fanartikelen',						1),
		(9980,		'Transformers',						75718 ),
		(13658,		'Stripfiguren',						75718 ),
		(29495,		'Star Wars',						75718 ),
			(154,		'Overige Star Wars',				29495 ),
			(27659,		'Vintage (1977 - 1989 ),',			29495 ),
			(37887,		'Episode 1',						29495 ),
			(37888,		'Episode 2',						29495 ),
			(37889,		'Episode 3',						29495 ),
			(37890,		'POTF 2  (1989 - 1999 ),',			29495 ),
		(29798,		'Harry Potter',						75718 ),
		(29799,		'Lord of the Rings',				75718 ),
		(100552,	'Overige fanartikelen',				75718 ),
	(84885,		'Parfum',							1),
		(602,		'Overige parfum',					84885 ),
		(60821,		'Grote flessen',					84885 ),
		(84883,		'Miniaturen',						84885 ),
		(148101,	'Kaartjes en proefmonsters',		84885 ),
	(135057,	'Efteling',							1),

-- 2 --
 (160,		'Computers',						-1),
	(162,		'Overige computers',				160 ),
	(193,		'Services',							160 ),
	(3676,		'Randapparatuur',					160 ),
		(175,		'Overige randapparatuur',			3676 ),
		(1245,		'Printers',							3676 ),
		(3694,		'Monitors',							3676 ),
		(8081,		'Scanners',							3676 ),
		(12838,		'Microfoons',						3676 ),
		(23154,		'Muizen',							3676 ),
		(28844,		'Toetsenborden (met draad ),',		3676 ),
		(30965,		'Toetsenborden (draadloos ),',		3676 ),
		(47606,		'USB-sticks',						3676 ),
		(78921,		'Gamepads',							3676 ),
		(78932,		'Joysticks',						3676 ),
		(79439,		'Headsets',							3676 ),
		(79444,		'Speakers',							3676 ),
		(79455,		'Webcams',							3676 ),
	(3691,		'Modems',							160 ),
		(8060,		'Overige modems',					3691 ),
		(32225,		'Analoog',							3691 ),
		(32226,		'ADSL',								3691 ),
		(32228,		'ISDN',								3691 ),
	(3707,		'Laptops en onderdelen',			160 ),
		(18546,		'Onderdelen en accessoires',		3707 ),
		(28837,		'Laptops',							3707 ),
	(3736,		'PC''s',							160 ),
	(4599,		'Apple, Macintosh',					160 ),
	(8086,		'Retrocomputers',					160 ),
		(3542,		'Commodore',						8086 ),
		(8101,		'Overige retrocomputers',			8086 ),
		(8141,		'Amiga',							8086 ),
		(72500,		'MSX',								8086 ),
	(9662,		'Partijen en groothandel',			160 ),
	(18793,		'Software',							160 ),
		(182,		'Overige software',					18793 ),
		(3783,		'Educatief',						18793 ),
		(3805,		'Antivirus en beveiliging',			18793 ),
		(4291,		'Internet',							18793 ),
		(11226,		'Besturingssystemen',				18793 ),
		(41853,		'Office en zakelijk',				18793 ),
		(41859,		'Grafisch en multimedia',			18793 ),
		(41870,		'Kinderen',							18793 ),
	(32202,		'Kabels en netwerk',				160 ),
		(3666,		'Overige kabels en netwerken',		32202 ),
		(18552,		'Netwerkkaarten',					32202 ),
		(26793,		'Switches en hubs',					32202 ),
		(32898,		'Draadloos en WiFi',				32202 ),
		(79463,		'Bluetooth',						32202 ),
		(87645,		'Kabels en verbindingen',			32202 ),
		(131855,	'Stroomvoorziening en -adapters',	32202 ),
		(132075,	'Routers',							32202 ),
	(38851,		'PC onderdelen',					160 ),
		(165,		'Harddisks',						38851 ),
		(1480,		'Geheugen',							38851 ),
		(4613,		'Moederborden',						38851 ),
		(8045,		'Grafische kaarten',				38851 ),
		(26762,		'CD-, DVD-drives en -writers',		38851 ),
		(26788,		'Controllers',						38851 ),
		(38846,		'Koeling',							38851 ),
		(38856,		'Voedingskabels',					38851 ),
		(38866,		'Overige PC-onderdelen',			38851 ),
		(47799,		'Geluidskaarten',					38851 ),
		(78769,		'Processoren',						38851 ),
			(164,		'Overige processoren',				78769 ),
			(14291,		'Intel',							78769 ),
			(15918,		'AMD',								78769 ),
		(131992,	'Behuizingen en kasten',			38851 ),
	(38951,		'PDA''s en accessoires',			160 ),
		(38329,		'Overige PDA''s en accessoires',	38951 ),
		(38331,		'PDA''s en handhelds',				38951 ),
		(38918,		'Accu''s en batterijen',			38951 ),
		(77361,		'Software',							38951 ),
		(111415,	'Houders',							38951 ),
	(106261,	'Verbruiksartikelen',				160 ),
		(9973,	'Overige verbruiksartikelen',			106261 ),
		(15537,	'Inktpatronen',							106261 ),
		(30939,	'CD-R(W ), en DVD-R(W ),',				106261 ),
		(40522,	'Printerpapier',						106261 ),
	(132103,	'Servers en toebehoren',			160 ),
 
-- 3 --
 (220,		'Speelgoed en spellen',				-1),
	(120,		'Creatief speelgoed',				220 ),
	(226,		'Poppen',							220 ),
		(10525,		'Barbie',							226 ),
			(19995,		'Overige Barbie',					10525 ),
			(33305,		'Barbiepoppen',						10525 ),
			(33317,		'Accessoires',						10525 ),
			(42737,		'Kleding',							10525 ),
		(12547,		'Poppenhuizen en toebehoren',		226 ),
		(12549,		'Poppenkleding en -artikelen',		226 ),
		(22146,		'Overige poppen',					226 ),
		(23685,		'Moderne poppen',					226 ),
		(25734,		'Antieke poppen',					226 ),
		(136916,	'Poppenkasten en handpoppen',		226 ),
	(233,		'Gezelschapsspellen',				220 ),
		(2550,		'Overige gezelschapspellen',		233 ),
		(9177,		'Kennis- en vraagspellen',			233 ),
		(9178,		'Bordspellen',						233 ),
		(19085,		'Poker',							233 ),
		(22152,		'Partyspellen',						233 ),
		(22417,		'Kaartspellen',						233 ),
		(40852,		'Schaakspellen',					233 ),
		(40860,		'Casinospellen',					233 ),
	(234,		'Overig speelgoed',					220 ),
	(386,		'Beren en knuffels',				220 ),
		(117,		'Overige beren en knuffels',		386 ),
		(9348,		'Cherished Teddies',				386 ),
		(36539,		'Forever Friends',					386 ),
		(55007,		'Knuffels',							386 ),
		(70806,		'Teddyberen',						386 ),
	(2543,		'Rollenspellen',					220 ),
		(1183,		'Overige rollenspellen',			2543 ),
		(2547,		'Sciencefiction',					2543 ),
		(44109,		'Dungeons & Dragons',				2543 ),
		(44111,		'Fantasy',							2543 ),
		(113038,	'Live rollenspel',					2543 ),
	(2601,		'Steiff',							220 ),
	(9185,		'Verzamelingen en partijen',		220 ),
	(11731,		'Educatief speelgoed',				220 ),
	(13315,		'Lego en Duplo',					220 ),
		(15514,		'Partijen en losse onderdelen',		13315 ),
		(19005,		'Mindstorms',						13315 ),
		(19006,		'Sets en overige lego',				13315 ),
		(19012,		'Bionicle',							13315 ),
		(84939,		'Duplo, primo, baby',				13315 ),
		(100134,	'Technic',							13315 ),
	(16486,		'Wargames',							220 ),
		(9822,		'Overige wargames',					16486 ),
		(31398,		'Warhammer',						16486 ),
		(91596,		'Star Wars',						16486 ),
		(123860,	'Tin',								16486 ),
	(18993,		'Constructief speelgoed',			220 ),
		(9165,		'Overig constructief speelgoed',	18993 ),
		(21254,		'K''NEX',							18993 ),
		(28811,		'Meccano',							18993 ),
		(100079,	'Fischertechnik',					18993 ),
		(100083,	'Magnetisch speelgoed',				18993 ),
		(136860,	'Werktuigen',						18993 ),
	(19016,		'Klassiek speelgoed',				220 ),
		(30,		'Overig klassiek speelgoed',		19016 ),
		(2005,		'Tinnen speelgoed',					19016 ),
		(2570,		'Knikkers',							19016 ),
		(2663,		'Jojo''s',							19016 ),
		(19024,		'Hobbelpaarden',					19016 ),
		(25934,		'Blikken speelgoed',				19016 ),
		(25961,		'Vliegers',							19016 ),
	(19071,		'Elektronisch speelgoed',			220 ),
		(1082,		'Elektronische huisdieren',			19071 ),
		(22132,		'Overig elektronisch speelgoed',	19071 ),
		(84912,		'Radiografisch bestuurd',			19071 ),
		(84918,		'Racebanen',						19071 ),
	(19854,		'Playmobil',						220 ),
		(2575,		'Overig Playmobil',					19854 ),
		(19858,		'Natuur',							19854 ),
		(28813,		'Avontuur',							19854 ),
		(28820,		'Stadsleven',						19854 ),
		(84977,		'Trein',							19854 ),
	(22133,		'Houten speelgoed',					220 ),
	(22138,		'Voertuigen',						220 ),
		(9173,		'Auto''s',							22138 ),
		(22140,		'Driewielers',						22138 ),
		(22142,		'Steps',							22138 ),
		(22144,		'Overige voertuigen',				22138 ),
		(84935,		'Skelters',							22138 ),
		(136883,	'Kinderfietsen',					22138 ),
		(136889,	'Tractors',							22138 ),
	(22157,		'Puzzels',							220 ),
	(25930,		'Scoubidou',						220 ),
	(25956,		'Muziekinstrumenten',				220 ),
	(25960,		'Buitenspeelgoed',					220 ),
		(19017,		'Frisbees en boemerangs',			25960 ),
		(22148,		'Overige buitenspeelgoed',			25960 ),
		(25962,		'Rolschaatsen',						25960 ),
		(25964,		'Speeltuin',						25960 ),
		(84987,		'Tenten, kastelen en hutten',		25960 ),
		(136933,	'Strand- en waterspeelgoed',		25960 ),
	(27668,		'Schrijf- en schoolgerei',			220 ),
	(40842,		'Peuter- en kleuterspeelgoed',		220 ),
	(40863,		'Dobbelstenen',						220 ),
	(100123,	'Fisher Price',						220 ),
	(112024,	'Actiefiguren',						220 ),
		(246,		'Overige actiefiguren',				112024 ),
		(2662,		'Robots en futuristisch',			112024 ),
		(112034,	'Star Wars',						112024 ),
			(2474,		'POTF 2  (1989 - 1999 ),',			112034 ),
			(2475,		'Vintage (1977 - 1989 ),',			112034 ),
			(2476,		'Episode 1',						112034 ),
			(9824,		'Overige Star Wars',				112034 ),
			(28712,		'Episode 2',						112034 ),
			(111998,	'Episode 3',						112034 ),
		(156076,	'Transformers',						112024 ),
			(753,		'Overige transformers',				156076 ),
			(2485,		'Beast wars en machine wars',		156076 ),
			(4696,		'G1 en G2',							156076 ),
	(115806,	'Jongleerballen en diabolo''s',		220 ),
 
-- 4 -- 
 (260,		'Postzegels',						-1),
	(264,		'Overige postzegels',				260 ),
	(4742,		'Europa',							260 ),		-- Subcat. checken
		(3490,		'Ierland',							4742 ),
		(3493,		'Spanje en kolonies',				4742 ),
		(3497,		'Faeröer',							4742 ),
		(3499,		'Verenigd Koninkrijk',				4742 ),
			(3498,		'Gebruikt',							3499 ),
			(128350,	'Postfris en ongebruikt',			3499 ),
		(7886,		'Monaco',							4742 ),
		(7887,		'Roemenie',							4742 ),
		(7888,		'Overige Europese landen',			4742 ),
		(7890,		'Turkije en Cyprus',				4742 ),
		(7891,		'Hongarije',						4742 ),
		(7892,		'Vaticaanstad',						4742 ),
		(7903,		'Europa CEPT',						4742 ),
			(105263,	'Overig tot 1975',					7903 ),
			(128351,	'Postfris',							7903 ),
			(160043,	'Overig vanaf 1975',				7903 ),
		(25791,		'Oostenrijk',						4742 ),
			(47160,		'Gebruikt',							25791 ),
			(128318,	'Postfris en ongebruikt',			25791 ),
		(25793,		'Zwitserland',						4742 ),
			(17771,		'Gebruikt',							25793 ),
			(128348,	'Postfris en ongebruikt',			25793 ),
		(35282,		'Albanie',							4742 ),
		(35288,		'Bulgarije',						4742 ),
		(35289,		'Denemarken',						4742 ),
		(35291,		'Griekenland',						4742 ),
		(35293,		'Luxemburg',						4742 ),
		(35295,		'Noorwegen',						4742 ),
		(40407,		'IJsland',							4742 ),
		(40408,		'Italië',							4742 ),
		(40411,		'Liechtenstein',					4742 ),
		(40416,		'Malta',							4742 ),
		(40417,		'Polen',							4742 ),
		(40419,		'Portugal en kolonies',				4742 ),
		(40422,		'Rusland en gebieden',				4742 ),
			(40424,		'Sovjet-Unie',						40422 ),
			(40425,		'Rusland',							40422 ),
		(47164,		'Groenland',						4742 ),
		(47171,		'Zweden',							4742 ),
		(65174,		'Britse Gemenebest',				4742 ),
		(128312,	'Finland',							4742 ),
			(35290,		'Overig Finland',					128312 ),
			(47170,		'Åland',							128312 ),
		(157688,	'Tsjechoslowakije',					4742 ),
	(4743,		'Midden- en Zuid-Amerika',			260 ),
	(4752,		'Thematische postzegels',			260 ),		-- Subcat. checken
		(697,		'Post en communicatie',				4752 ),
		(703,		'Overige thema''s',					4752 ),
		(3491,		'Flora',							4752 ),
		(3515,		'Verenigde Naties',					4752 ),
		(4750,		'Geschiedenis',						4752 ),
		(4756,		'Wetenschap en techniek',			4752 ),
		(7896,		'Kunst en cultuur',					4752 ),
		(22782,		'Disney',							4752 ),
		(30261,		'Architectuur',						4752 ),
		(36684,		'Sport',							4752 ),
			(4754,		'Overige sporten',					36684 ),
			(36685,		'Autosport',						36684 ),
			(36686,		'Basketbal',						36684 ),
			(36687,		'Boksen',							36684 ),
			(36689,		'Voetbal',							36684 ),
			(36693,		'Olympische Spelen',				36684 ),
			(36694,		'Wielrennen',						36684 ),
			(36699,		'Tennis',							36684 ),
			(36701,		'Volleybal',						36684 ),
			(128380,	'Honkbal',							36684 ),
			(136692,	'Schaken',							36684 ),
		(36702,		'Fauna',							4752 ),
			(17797,		'Overige fauna',					36702 ),
			(36703,		'Apen',								36702 ),
			(36707,		'Dinosauriërs',						36702 ),
			(36708,		'Olifanten',						36702 ),
			(36711,		'Vissen',							36702 ),
			(36718,		'Honden',							36702 ),
			(36720,		'Insecten',							36702 ),
			(36721,		'Katten',							36702 ),
			(36725,		'Papegaaien',						36702 ),
			(36726,		'Paarden',							36702 ),
			(36728,		'Reptielen en amfibieën',			36702 ),
			(36732,		'Vlinders',							36702 ),
			(36733,		'Vogels',							36702 ),
			(96443,		'WNF',								36702 ),
		(36735,		'Verkeer en transport',				4752 ),
			(4757,		'Overige verkeer en transport',		36735 ),
			(36736,		'Auto''s',							36735 ),
			(36738,		'Treinen',							36735 ),
			(36739,		'Vliegtuigen',						36735 ),
			(36744,		'Schepen',							36735 ),
		(36743,		'Ruimtevaart',						4752 ),
		(70098,		'Koningshuizen',					4752 ),
		(128375,	'Jaar van het Kind',				4752 ),
		(128376,	'Rode Kruis',						4752 ),
		(128378,	'Scouting',							4752 ),
	(7825,		'Duitsland',						260 ),		-- Subcat. checken
		(7849,		'Bundespost (D-mark periode ),',	7825 ),
			(7870,		'BRD 1948 - 1959',					7849 ),
			(7872,		'BRD 1960 - 1979',					7849 ),
			(7874,		'BRD 1980 - 1989',					7849 ),
			(7875,		'BRD 1990 - heden',					7849 ),
		(7876,		'Bundespost (Euro periode ),',		7825 ),
		(35263,		'Oud-duitse staten',				7825 ),
		(40313,		'Duitse gebieden',					7825 ),
		(47681,		'Brieven en postwaardestukken',		7825 ),
		(87044,		'Duitse Rijk',						7825 ),
		(88766,		'DDR',								7825 ),
			(7854,		'Gebruikt',							88766 ),
			(128316,	'Postfris en ongebruikt',			88766 ),
		(105293,	'Berlijn',							7825 ),
			(7864,		'Gebruikt',							105293 ),
			(128314,	'Postfris en ongebruikt',			105293 ),
		(107116,	'Overig Duitsland',					7825 ),
	(7901,		'Zegels zonder frankeerwaarde',		260 ),
	(7914,		'Verzamelingen en partijen',		260 ),
		(544,		'Overige verzamelingen',			7914 ),
		(7919,		'Europa',							7914 ),
		(7921,		'Wereld',							7914 ),
		(105265,	'Nederland',						7914 ),
		(128391,	'Nederland-Overzee',				7914 ),
	(32135,		'Caraïben',							260 ),
	(32136,		'Azië',								260 ),		-- Subcat. checken
		(693,		'Overig Azië',						32136 ),
		(32137,		'China',							32136 ),
		(32138,		'Japan',							32136 ),
		(35309,		'India',							32136 ),
		(35310,		'Indonesië',						32136 ),
		(35311,		'Israël',							32136 ),
		(35312,		'Cambodja',							32136 ),
		(35313,		'Korea',							32136 ),
		(35314,		'Vietnam',							32136 ),
		(35315,		'Thailand',							32136 ),
		(91577,		'Nepal',							32136 ),
		(91578,		'Filipijnen',						32136 ),
		(91579,		'Taiwan',							32136 ),
		(123786,	'Bhutan',							32136 ),
		(123788,	'Laos',								32136 ),
		(123789,	'Mongolië',							32136 ),
		(123790,	'Midden-Oosten',					32136 ),
	(35303,		'Afrika',							260 ),
		(692,		'Overig Afrika',					35303 ),
		(35305,		'Zuid-Afrika',						35303 ),
	(35322,		'Accessoires',						260 ),
		(702,		'Overige accessoires',				35322 ),
		(82970,		'Albums',							35322 ),
		(82983,		'Catalogi',							35322 ),
		(82988,		'Filatelistische literatuur',		35322 ),
	(40396,		'België',							260 ),
		(4744,		'Overige België',					40396 ),
		(22937,		'België gewone Post',				40396 ),
		(22948,		'FDC'' s en maximum kaarten',		40396 ),
	(40398,		'Frankrijk',						260 ),
		(7881,		'(Semi ), modern 1945 - heden',		40398 ),
		(40399,		'Klassiek tot 1945',				40398 ),
		(40400,		'Frankrijk Overige',				40398 ),
	(40413,		'Nederland',						260 ),		-- Subcat. checken
		(698,		'Plaatfouten',						40413 ),
		(22959,		'Port',								40413 ),
		(22960,		'Overige Nederland',				40413 ),
		(105246,	'FDC (Eerstedag ),',				40413 ),
			(22953,		'FDC E450 -  heden',				105246 ),
			(105247,	'FDC E1 -  E149',					105246 ),
			(105248,	'FDC E150 - E249',					105246 ),
			(105249,	'FDC E250 - E349',					105246 ),
			(128298,	'FDC E350 - E449',					105246 ),
		(105250,	'Postzegelboekjes',					40413 ),
			(22954,		'PB16 - PB30',						105250 ),
			(105251,	'PB 1 - PB15',						105250 ),
			(128299,	'PB31 - PB45',						105250 ),
			(128300,	'PB45 - heden',						105250 ),
		(105255,	'Brieven en postwaardestukken',		40413 ),
			(7902,		'Brieven',							105255 ),
			(22955,		'Overige brieven',					105255 ),
			(105256,	'Luchtpostfilatelie',				105255 ),
			(105257,	'Briefkaarten',						105255 ),
			(135021,	'Gemengde frankering',				105255 ),
		(128270,	'Postfris en ongebruikt',			40413 ),
			(128271,	'Eerste emissie 1852',				128270 ),
			(128272,	'1864 - 1899',						128270 ),
			(128273,	'1900 - 1919',						128270 ),
			(128274,	'1920 - 1929',						128270 ),
			(128275,	'1930 - 1939',						128270 ),
			(128276,	'1940 - 1949',						128270 ),
			(128277,	'1950 - 1959',						128270 ),
			(128278,	'1960 - 1969',						128270 ),
			(128279,	'1970 - 1979',						128270 ),
			(128280,	'1980 - 1989',						128270 ),
			(128281,	'1990 - 1999',						128270 ),
			(128282,	'2000 - heden',						128270 ),
		(128283,	'Gebruikt',							40413 ),
			(22951,		'Eerste emissie 1852',				128283 ),
			(22952,		'1980 - 1989',						128283 ),
			(22961,		'1950 - 1959',						128283 ),
			(47166,		'1920 - 1929',						128283 ),
			(57146,		'1990 - 1999',						128283 ),
			(57147,		'1960 - 1969',						128283 ),
			(105243,	'1864 - 1899',						128283 ),
			(105244,	'1900 - 1919',						128283 ),
			(105245,	'2000 - heden',						128283 ),
			(105252,	'1970 - 1979',						128283 ),
			(105253,	'1930 - 1939',						128283 ),
			(105254,	'1940 - 1949',						128283 ),
		(128301,	'Luchtpost',						40413 ),
	(40414,		'Nederland-Overzee',				260 ),
		(47173,		'Aruba',							40414 ),
		(128302,	'Suriname',							40414 ),
			(695,		'Voor 1975',						128302 ),
			(128303,	'1975 - heden',						128302 ),
		(128304,	'Nederlands Indië',					40414 ),
			(128305,	'Postfris en ongebruikt',			128304 ),
			(135222,	'Gebruikt',							128304 ),
		(128306,	'Nederlandse Antillen',				40414 ),
			(3496,		'Voor 1975',						128306 ),
			(128307,	'1975 - heden',						128306 ),
		(128308,	'Curaçao',							40414 ),
			(128309,	'Postfris en ongebruikt',			128308 ),
			(128310,	'Gebruikt',							128308 ),
		(136691,	'Nederlands Nieuw-Guinea',			40414 ),
	(128352,	'Antarctica',						260 ),
	(128384,	'Noord-Amerika',					260 ),
		(262,		'USA',								128384 ),
		(3478,		'Canada',							128384 ),
	(128385,	'Oceanië',							260 ),
		(3467,		'Overig Oceanië',					128385 ),
		(3468,		'Australië',						128385 ),
		(70089,		'Nieuw-Zeeland',					128385 ),
	(128389,	'Perfins',							260 ),
	(128390,	'Stadspost',						260 ),

-- 5 --
 (267,		'Boeken en strips',					-1),
	(63,		'Stripboeken',						267 ),		-- Subcat. checken
		(80,		'Verzamelstrips',					63 ),
		(1374,		'Disney',							63 ),
			(8588,		'Vanaf 1990',						1374 ),
			(88844,		'Voor 1960',						1374 ),
			(88845,		'1960 - 1969',						1374 ),
			(88846,		'1970 - 1979',						1374 ),
			(88847,		'1980 - 1989',						1374 ),
		(3952,		'Overige stripboeken',				63 ),
		(3956,		'Tom Poes en Olivier B. Bommel',	63 ),
		(3972,		'Overige Nederlandse strips',		63 ),
		(8534,		'Asterix',							63 ),
		(8541,		'Garfield',							63 ),
		(8557,		'Kuifje',							63 ),
		(8569,		'Overige Belgische strips',			63 ),
		(12171,		'Bessy',							63 ),
		(12172,		'Jerom',							63 ),
		(12174,		'Lucky Luke',						63 ),
		(17090,		'Harde kaft',						63 ),
		(24395,		'Overige Franse strips',			63 ),
		(28658,		'Verzamelingen en partijen',		63 ),
		(34178,		'Guust Flater',						63 ),
		(48382,		'Nero',								63 ),
		(48411,		'Michel Vaillant',					63 ),
		(65766,		'Rode Ridder',						63 ),
		(65767,		'Urbanus',							63 ),
		(77836,		'Blueberry',						63 ),
		(77837,		'Bollie en Billie',					63 ),
		(77845,		'Smurfen',							63 ),
		(77850,		'Zeldzame stripboeken',				63 ),
		(97100,		'Kiekeboe',							63 ),
		(127797,	'Jan Jans en de Kinderen',			63 ),
		(127798,	'Kapitein Rob',						63 ),
		(127799,	'Suske en Wiske',					63 ),
			(14483,		'Huidige albums',					127799 ),
			(127800,	'Oude albums',						127799 ),
		(134665,	'Roodbaard',						63 ),
		(134666,	'Storm',							63 ),
		(134667,	'Trigië',							63 ),
	(268,		'Overige boeken',					267 ),
	(270,		'Literatuur - buitenland',			267 ),
	(607,		'Tijdschriften en kranten',			267 ),
		(280,		'Overige tijdschriften',			607 ),
		(608,		'Natuur en buitenleven',			607 ),
		(609,		'Kinderen en jeugd',				607 ),
		(612,		'Actualiteit en politiek',			607 ),
		(1137,		'Business',							607 ),
		(1138,		'Antiek en verzamelen',				607 ),
		(1139,		'Eten en drinken',					607 ),
		(1140,		'Hobby',							607 ),
		(1141,		'Wonen, huis en tuin',				607 ),
		(1145,		'Film en tv',						607 ),
		(1147,		'Wetenschap',						607 ),
		(1148,		'Sciencefiction en fantasy',		607 ),
		(1150,		'Reizen en ontspanning',			607 ),
		(2242,		'Roddelbladen',						607 ),
		(2243,		'Computers en IT',					607 ),
		(13992,		'Kranten',							607 ),
		(21701,		'Mannentijdschriften',				607 ),
		(25682,		'Lifestyle en mode',				607 ),
		(29240,		'Architectuur en decoratie',		607 ),
		(29241,		'Kunst en cultuur',					607 ),
		(62287,		'Modelbouw',						607 ),
		(64790,		'Muziek',							607 ),
		(64802,		'Transport en verkeer',				607 ),
			(9812,		'Overig transport en verkeer',		64802 ),
			(21533,		'Motoren',							64802 ),
			(46329,		'Auto''s',							64802 ),
			(64803,		'Vliegtuigen',						64802 ),
			(64804,		'Treinen',							64802 ),
			(78604,		'Kamperen',							64802 ),
			(101065,	'Boten',							64802 ),
		(72344,		'Dieren',							607 ),
		(72345,		'Religie',							607 ),
		(78618,		'Filatelie',						607 ),
		(78633,		'Financiën',						607 ),
		(91177,		'Literair',							607 ),
		(91178,		'Gezondheid en medisch',			607 ),
		(101066,	'Fotografie',						607 ),
		(101067,	'Games',							607 ),
		(101071,	'Vrouwentijdschriften',				607 ),
		(105967,	'Sport',							607 ),
			(614,		'Overige sport',					105967 ),
			(24365,		'Paardrijsport',					105967 ),
			(44688,		'Duiken',							105967 ),
			(78600,		'Motorsport',						105967 ),
			(78628,		'Fitness',							105967 ),
			(105970,	'Voetbal',							105967 ),
			(105971,	'Golf',								105967 ),
			(105973,	'Vechtsporten',						105967 ),
			(105976,	'Tennis',							105967 ),
			(116597,	'Wielrennen',						105967 ),
	(900,		'Comics',							267 ),		-- Subcat. checken
		(64,		'Overige comics',					900 ),
		(8556,		'Tarzan',							900 ),
		(8575,		'Manga',							900 ),
		(17076,		'Batman',							900 ),
		(17082,		'Spider-Man',						900 ),
		(17084,		'Superman',							900 ),
		(17085,		'X-men',							900 ),
		(32754,		'Fantastische Vier',				900 ),
		(32757,		'Hulk',								900 ),
		(32768,		'Wonder Woman',						900 ),
		(35762,		'GI Joe',							900 ),
		(64755,		'Amerikaanse stripboeken',			900 ),
		(127793,	'Sciencefiction',					900 ),
		(127794,	'Fantasy',							900 ),
	(1093,		'Jeugd- en kinderboeken',			267 ),
		(1103,		'Tieners van 12 jaar en ouder',		1093 ),
		(17157,		'Kinderen van 6 tot 9 jaar',		1093 ),
		(17163,		'Baby, peuter en kleuter',			1093 ),
		(127735,	'Kinderen van 10 tot 12 jaar',		1093 ),
	(1105,		'Studie- en theorieboeken',			267 ),
	(1106,		'Bedrijfskunde en management',		267 ),
	(1107,		'Computers en internet',			267 ),
	(1115,		'Psychologie en zelfhulp',			267 ),
	(2230,		'Poëzie en gedichten',				267 ),
	(2234,		'Films en tv-series',				267 ),
	(7689,		'Reisboeken en -gidsen',			267 ),
	(14027,		'Motoren',							267 ),
	(19464,		'Gezondheid en voeding',			267 ),
	(19466,		'Sport',							267 ),
	(21687,		'Encyclopedieën',					267 ),
	(23212,		'Detectives',						267 ),
	(27322,		'Kunst en cultuur',					267 ),
	(27324,		'Geschiedenis',						267 ),
	(27329,		'Atlassen',							267 ),
	(29224,		'Romans',							267 ),		-- Subcat. checken
		(377,		'2000 - heden',						29224 ),
		(130256,	'Tot 1939',							29224 ),
		(130257,	'1940 - 1969',						29224 ),
		(130258,	'1970 - 1989',						29224 ),
		(140677,	'1990 - 1999',						29224 ),
	(29301,		'Economie en marketing',			267 ),
	(29792,		'Luisterboeken',					267 ),
	(32675,		'Thrillers',						267 ),
	(32676,		'Sciencefiction en fantasy',		267 ),
	(32680,		'Esoterie en spiritualiteit',		267 ),
	(35123,		'Boekenweekgeschenk',				267 ),
	(42525,		'Binnenhuisarchitectuur',			267 ),
	(46339,		'Gezondheid en medisch',			267 ),
	(64192,		'Politiek',							267 ),
	(64193,		'Dieren en natuur',					267 ),
	(64727,		'Wetenschap',						267 ),
	(78570,		'Design',							267 ),
	(87604,		'Oorlog',							267 ),
	(89343,		'Auto''s',							267 ),
	(98991,		'Verzamelingen en partijen',		267 ),
	(101026,	'Foto en kunst',					267 ),
	(101030,	'Religie',							267 ),
	(121624,	'Hobby''s en techniek',				267 ),
	(121639,	'Muziek',							267 ),
	(127801,	'Verhalen',							267 ),
	(131188,	'Literatuur - Nederland',			267 ),
		(17214,		'1990 - heden',						131188 ),
		(127737,	'Tot 1939',							131188 ),
		(127739,	'1940 - 1969',						131188 ),
		(127740,	'1970 - 1989',						131188 ),
	(157347,	'Kookboeken en huishouding',		267 ),

-- 6 --
 (281,		'Sieraden en horloges',				-1),
	(488,		'Kralen',							281 ),
	(9295,		'Onderdelen en accessoires',		281 ),
	(9301,		'Verzamelingen en partijen',		281 ),
	(9319,		'Bijoux',							281 ),
		(9321,		'Ringen',							9319 ),
		(11006,		'Hangers',							9319 ),
		(85583,		'Armbanden',						9319 ),
		(85590,		'Colliers',							9319 ),
		(85593,		'Oorsieraden',						9319 ),
	(10705,		'Parels',							281 ),
	(10975,		'Armbanden',						281 ),		-- Subcat. checken
		(37481,		'Goud - puur',						10975 ),
		(50637,		'Gewone armbanden',					10975 ),
		(92699,		'Overige armbanden',				10975 ),
		(115851,	'Zilver',							10975 ),
		(133575,	'Goud - verguld',					10975 ),
	(10985,		'Oorsieraden',						281 ),		-- Subcat. checken
		(37503,		'Goud - puur',						10985 ),
		(9322,		'Gewone oorsieraden',				10985 ),
		(86043,		'Overige oorsieraden',				10985 ),
		(115861,	'Zilver',							10985 ),
		(133591,	'Goud - verguld',					10985 ),
	(10994,		'Hangers',							281 ),
		(13419,		'Gewone hangers',					10994 ),
		(23698,		'Goud - puur',						10994 ),
		(26989,		'Zilver',							10994 ),
		(92758,		'Overige hangers',					10994 ),
		(133571,	'Goud - verguld',					10994 ),
	(11007,		'Broches',							281 ),
	(11015,		'Overige sieraden',					281 ),
	(23724,		'Pennen',							281 ),
	(26088,		'Horloges',							281 ),
		(9284,		'Overige horloges',					26088 ),
		(10682,		'Verzamelaarshorloges',				26088 ),
		(66227,		'Kinderhorloges',					26088 ),
		(85525,		'Zakhorloges',						26088 ),
		(85553,		'Onderdelen en accessoires',		26088 ),
		(91060,		'Dameshorloges',					26088 ),
			(17330,		'Overige dameshorloges',			91060 ),
			(91061,		'Quartz',							91060 ),
			(91062,		'Mechanisch',						91060 ),
			(130429,	'Chronografen',						91060 ),
		(91064,		'Herenhorloges',					26088 ),
			(14328,		'Overige herenhorloges',			91064 ),
			(55216,		'Chronografen',						91064 ),
			(91065,		'Quartz',							91064 ),
			(91066,		'Mechanisch',						91064 ),
		(91068,		'Sporthorloges',					26088 ),
			(9291,		'Overige sporthorloges',			91068 ),
			(91069,		'Quartz',							91068 ),
			(91070,		'Mechanisch',						91068 ),
			(91071,		'Chronografen',						91068 ),
	(26109,		'Piercings',						281 ),
		(55378,		'Overige piercings',				26109 ),
		(85627,		'Navelpiercings',					26109 ),
		(85652,		'Tepelpiercings',					26109 ),
		(85672,		'Wenkbrauwpiercings',				26109 ),
		(85691,		'Neuspiercings',					26109 ),
		(85702,		'Tongpiercings',					26109 ),
	(33131,		'Antieke sieraden',					281 ),
	(43048,		'Bedels',							281 ),
		(3833,		'Overige bedels',					43048 ),
		(43049,		'Dieren',							43048 ),
		(43050,		'Steentjes en parels',				43048 ),
		(43051,		'Figuurtjes',						43048 ),
		(43052,		'Hartjes, liefde',					43048 ),
		(43053,		'Seizoensgebonden',					43048 ),
		(43054,		'Letters',							43048 ),
		(43055,		'Muziek',							43048 ),
		(43056,		'Vlaggen',							43048 ),
		(43057,		'Hobby''s',							43048 ),
		(43058,		'Religieus',						43048 ),
		(43059,		'Sport',							43048 ),
	(66229,		'Kindersieraden',					281 ),
	(67725,		'Ringen',							281 ),
		(92920,		'Overige ringen',					67725 ),
		(123345,	'Gewone ringen',					67725 ),
		(133599,	'Goud - verguld',					67725 ),
		(23704,		'Goud - puur',						67725 ),
		(23775,		'Zilver',							67725 ),
	(68883,		'Edelstenen',						281 ),
	(92771,		'Colliers',							281 ),
		(92791,		'Overige colliers',					92771 ),
		(123317,	'Gewone colliers',					92771 ),
		(133541,	'Goud - puur',						92771 ),
		(133587,	'Goud - verguld',					92771 ),
		(133618,	'Zilver',							92771 );

INSERT INTO Rubriek(rubrieknummer, rubrieknaam, rubriek)
VALUES
-- 7 --
 (293,		'Consumentenelektronica',			-1),
	(294,		'Overige foto, beeld en geluid',	293 ),
	(625,		'Fotografie',						293 ),
		(3327,		'Digitale compactcamera''s',		625 ),
		(8274,		'Analoge spiegelreflexcamera''s',	625 ),
		(8297,		'Accessoires (digitaal ),',			625 ),
			(14803,		'Geheugenkaarten',					8297 ),
			(27760,		'Overige accessoires',				8297 ),
			(32935,		'Batterijen en accu''s',			8297 ),
			(151220,	'Lenzen',							8297 ),
		(11272,		'Accessoires (analoog ),',			625 ),
			(706,		'Overige analoge fotografie',		11272 ),
			(3323,		'Lenzen',							11272 ),
			(3326,		'Fotografica',						11272 ),
			(10584,		'Filters',							11272 ),
			(23937,		'Batterijen en accu''s',			11272 ),
			(32948,		'Fotoalbums en fotolijsten',		11272 ),
		(26066,		'Analoge compactcamera''s',			625 ),
		(43453,		'Digitale spiegelreflexcamera''s',	625 ),
	(3287,		'Beeld',							293 ),
		(298,		'Overig beeld',						3287 ),
		(12941,		'Satelliet- en kabelontvangers',	3287 ),
			(4693,		'Overige ontvangers',				12941 ),
			(29741,		'TV-ontvangers',					12941 ),
			(77745,		'Accessoires',						12941 ),
			(77746,		'LNB''s',							12941 ),
			(77756,		'Schotels',							12941 ),
			(85417,		'Kaarten',							12941 ),
		(19721,		'Projectors',						3287 ),
		(26043,		'Camcorders en filmcamera''s',		3287 ),
		(32852,		'Home cinema en DVD-spelers',		3287 ),
		(66201,		'TV''s',							3287 ),
	(3294,		'Rekenmachines',					293 ),
	(12065,		'Elektronica-onderdelen',			293 ),
	(14969,		'Geluid',							293 ),
		(1500,		'Radiobenodigdheden',				14969 ),
		(10615,		'Luidsprekers',						14969 ),
		(19605,		'CD-spelers',						14969 ),
		(19632,		'Cassettespelers',					14969 ),
		(19671,		'Radio''s en wekkerradio''s',		14969 ),
		(28939,		'Handleidingen',					14969 ),
		(30154,		'Disco- en karaoke-apparatuur',		14969 ),
		(73839,		'MP3-spelers en portables',			14969 ),
			(8265,		'Overige portable spelers',			73839 ),
			(8267,		'Overige MP3-spelers',				73839 ),
			(67839,		'Apple iPod MP3-spelers',			73839 ),
			(86529,		'Apple iPod accessoires',			73839 ),
			(101875,	'Creative MP3-spelers',				73839 ),
			(101876,	'iRiver MP3-spelers',				73839 ),
			(101877,	'Philips MP3-spelers',				73839 ),
			(101879,	'Sony MP3-spelers',					73839 ),
		(81741,		'Overig geluid',					14969 ),
		(86804,		'Hifi- en stereosets',				14969 ),
		(113420,	'Grammofoons',						14969 ),
		(140937,	'Koptelefoons',						14969 ),
	(28179,		'Verrekijkers en telescopen',		293 ),
	(124709,	'Microscopen',						293 ),
	(139835,	'GPS ontvangers',					293 ),

-- 8 --
 (353,		'Kunst, antiek en design',			-1),
	(550,		'Beeldende kunst',					353 ),
		(551,		'Overige beeldende kunst',			550 ),
		(7463,		'Grafische kunst',					550 ),
			(7464,		'Etsen en gravures',				7463 ),
			(26501,		'Tekeningen',						7463 ),
			(30602,		'Overige grafische kunst',			7463 ),
			(30612,		'Zeefdrukken',						7463 ),
			(78356,		'Litho''s en steendrukken',			7463 ),
		(20150,		'Beeldhouwkunst',					550 ),
		(28667,		'Digitale kunst en fotografie',		550 ),
		(40688,		'Schilderkunst',					550 ),
			(7468,		'Antieke schilderijen',				40688 ),
			(20136,		'Olieverf',							40688 ),
			(27489,		'Overige schilderkunst',			40688 ),
			(58859,		'Aquarel',							40688 ),
			(60440,		'Gouache',							40688 ),
			(67036,		'Acryl op doek',					40688 ),
			(135735,	'Pop Art',							40688 ),
	(1211,		'Kunstvoorwerpen',					353 ),
		(7488,		'Beeldjes en miniaturen',			1211 ),
		(16531,		'Blikken, brons en tin',			1211 ),
		(16533,		'Overige kunstvoorwerpen',			1211 ),
		(19398,		'Zilverwerk',						1211 ),
	(2218,		'Kleding en textiel',				353 ),
	(4174,		'Overige kunst, antiek, design',	353 ),
	(7390,		'Antiquarische boeken',				353 ),
		(7398,		'Religie',							7390 ),
		(7406,		'Geografie en etnografie',			7390 ),
		(7410,		'Geschiedenis',						7390 ),
		(7420,		'Kunst en cultuur',					7390 ),
		(7427,		'Wetenschap en geneeskunde',		7390 ),
		(7435,		'Literatuur',						7390 ),
		(7444,		'Sociale wetenschappen',			7390 ),
		(7451,		'Techniek, verkeer en economie',	7390 ),
		(7456,		'Overig antiquariaat',				7390 ),
		(22421,		'Antieke boeken',					7390 ),
			(269,		'1940 - heden',						22421 ),
			(29223,		'1900 - 1939',						22421 ),
			(72616,		'Voor 1899',						22421 ),
		(22423,		'Bibliofilie en boekkunst',			7390 ),
		(23056,		'Huis, tuin en hobby',				7390 ),
		(23062,		'Kinderboeken',						7390 ),
		(35400,		'Sport en spel',					7390 ),
		(37958,		'Landkaarten',						7390 ),
		(44556,		'Catalogi',							7390 ),
		(58812,		'Tijdschriften',					7390 ),
		(92956,		'Kranten',							7390 ),
	(7478,		'Glas en kristal',					353 ),
		(2205,		'Antiek',							7478 ),
		(4773,		'Glas in lood en Tiffany',			7478 ),
		(7479,		'Flessen',							7478 ),
		(7484,		'Overig glas en kristal',			7478 ),
		(107589,	'Swarovski',						7478 ),
		(136649,	'Art nouveau',						7478 ),
		(136650,	'Design',							7478 ),
		(138769,	'Jugendstil',						7478 ),
		(138778,	'Art deco',							7478 ),
	(7485,		'Etnische kunst',					353 ),
	(7491,		'Antieke meubels',					353 ),
	(19355,		'Antieke gebruiksvoorwerpen',		353 ),
	(19386,		'Wandborden en tegels',				353 ),
	(21583,		'Antieke instrumenten',				353 ),
	(25757,		'Design',							353 ),
		(25763,		'1980-1989',						25757 ),
		(25764,		'1990-1999',						25757 ),
		(138767,	'1890-1919, Jugendstil',			25757 ),
		(138776,	'1920-1949, Art déco',				25757 ),
		(138785,	'1950-1959',						25757 ),
		(138794,	'1960-1969',						25757 ),
		(138803,	'1970-1979',						25757 ),
		(138812,	'Vanaf 2000',						25757 ),
	(25785,		'Religieuze kunst',					353 ),
	(30617,		'Antieke lampen',					353 ),
	(30629,		'Kleden en tapijten',				353 ),
	(37082,		'Archeologie',						353 ),
		(355,		'Overige archeologie',				37082 ),
		(19449,		'Stenen tijdperk',					37082 ),
		(19450,		'Brons- en ijzertijd',				37082 ),
		(19451,		'Keltisch',							37082 ),
		(19452,		'Griekenland',						37082 ),
		(19453,		'Romeinse tijd',					37082 ),
		(19454,		'Middeleeuwen',						37082 ),
		(19455,		'16e en 17e eeuw',					37082 ),
		(21618,		'Midden-Oosten',					37082 ),
		(37084,		'Egypte',							37082 ),
		(37085,		'China',							37082 ),
		(73466,		'Japan',							37082 ),
	(37528,		'Kunstenaarsbenodigdheden',			353 ),
		(34425,		'Overige benodigdheden',			37528 ),
		(37530,		'Krijt, stiften en pennen',			37528 ),
		(54823,		'Houtbewerking',					37528 ),
		(54824,		'Verf',								37528 ),
		(54846,		'Doeken',							37528 ),
		(54864,		'Papier',							37528 ),
		(54882,		'Penselen',							37528 ),
		(54907,		'Steenbewerking',					37528 ),
	(37532,		'Aanstormend talent',				353 ),
	(37556,		'Verzamelingen en partijen',		353 ),
	(42680,		'Aziatische kunst',					353 ),
	(60913,		'Keramiek',							353 ),
		(2761,		'Overig aardewerk',					60913 ),
		(2769,		'Gouda',							60913 ),
		(16528,		'Overig keramiek',					60913 ),
		(19380,		'Delfts blauw',						60913 ),
		(19389,		'Antiek keramiek',					60913 ),
	(64140,		'Klokken en uurwerken',				353 ),
	(64319,		'Porselein',						353 ),
	(66854,		'Blikken',							353 ),

-- 9 --
 (888,		'Sport, fietsen en vakantie',		-1),
	(202,		'Sportverzamelartikelen',			888 ),
		(788,		'Olympische spelen',				202 ),
		(9206,		'Overige sportverzamelartikelen',	202 ),
	(1305,		'Tickets en toegangskaarten',		888 ),
		(1307,		'Overige tickets',					1305 ),
		(8497,		'Vliegtickets',						1305 ),
		(16078,		'Boottickets',						1305 ),
		(34856,		'Sportwedstrijden',					1305 ),
		(37352,		'Treintickets',						1305 ),
		(44730,		'Film en circus',					1305 ),
		(68837,		'Pretparken en themaparken',		1305 ),
		(74474,		'Beurzen en evenementen',			1305 ),
		(88839,		'Bustickets',						1305 ),
	(1492,		'Hengelsport',						888 ),
		(384,		'Overige hengelsport',				1492 ),
		(1494,		'Hengelonderdelen',					1492 ),
		(14357,		'Aas',								1492 ),
		(42806,		'Toebehoren',						1492 ),
		(65973,		'Kleding',							1492 ),
		(81443,		'Hengels',							1492 ),
	(2912,		'Rugby',							888 ),
	(4388,		'Hockey',							888 ),
	(8503,		'Vakantie- en reisbenodigdheden',	888 ),
		(8507,		'Rugzakken',						8503 ),
		(8516,		'Overige reisbenodigdheden',		8503 ),
		(19295,		'Kampeerartikelen en tenten',		8503 ),
		(26124,		'Beautycases',						8503 ),
		(59251,		'Trekking en survival',				8503 ),
		(62841,		'Plunjezakken',						8503 ),
		(74462,		'Stekkers en stroomadapters',		8503 ),
		(74463,		'Strandaccessoires',				8503 ),
		(157967,	'Koffers en reistassen',			8503 ),
		(157969,	'Kinderkoffers',					8503 ),
		(157989,	'Koffersloten',						8503 ),
		(157991,	'Naamplaatjes',						8503 ),
	(9192,		'Fietsen en fietssport',			888 ),
		(9194,		'Racefietsen',						9192 ),
		(22171,		'Fiets- en wielrenkleding',			9192 ),
			(18677,		'Overige fietskleding',				22171 ),
			(44629,		'Broeken',							22171 ),
			(44646,		'Shirts',							22171 ),
			(85045,		'Arm- en beenkleding',				22171 ),
			(85046,		'Handschoenen',						22171 ),
			(85059,		'Brillen',							22171 ),
			(85068,		'Sokken',							22171 ),
			(85076,		'Schoenen',							22171 ),
			(85078,		'Windjacks',						22171 ),
			(115794,	'Regenkleding',						22171 ),
		(27922,		'Accessoires en onderdelen',		9192 ),
			(77583,		'Banden, spaken en wielen',			27922 ),
			(77591,		'Fietsverlichting',					27922 ),
			(77606,		'Zadels',							27922 ),
			(81660,		'Fietsenrekken en -dragers',		27922 ),
			(81674,		'Pedalen en cranks',				27922 ),
			(85126,		'Fietscomputers',					27922 ),
			(85131,		'Fietssloten',						27922 ),
		(30744,		'Mountainbikes',					9192 ),
		(30751,		'Stadsfietsen',						9192 ),
			(30752,		'Damesfietsen',						30751 ),
			(30753,		'Herenfietsen',						30751 ),
		(33503,		'Overige fietsen',					9192 ),
		(74470,		'Vouwfietsen',						9192 ),
		(81663,		'Kinderfietsen',					9192 ),
		(125354,	'Minibikes',						9192 ),
	(9202,		'Watersporten',						888 ),
	(10511,		'Skating en rolschaatsen',			888 ),
		(44626,		'Skates',							10511 ),
		(66048,		'Toebehoren en onderdelen',			10511 ),
		(66051,		'Overige skating',					10511 ),
		(77595,		'Bescherming',						10511 ),
	(10514,		'Paardensport',						888 ),
		(13379,		'Overige paardensport',				10514 ),
		(22177,		'Zadels en toebehoren',				10514 ),
		(22182,		'Toebehoren',						10514 ),
		(27031,		'Laarzen en schoenen',				10514 ),
		(29056,		'Tuig',								10514 ),
		(42810,		'Dameskleding',						10514 ),
		(62992,		'Herenkleding',						10514 ),
		(62997,		'Kinderkleding',					10514 ),
		(85275,		'Dekens en bekleding',				10514 ),
		(87443,		'Petten, hoeden en helmen',			10514 ),
	(10518,		'Duiksport',						888 ),
		(22563,		'Logboeken en stempels',			10518 ),
		(32511,		'Lood en gordels',					10518 ),
		(32516,		'Kleding en schoenen',				10518 ),
		(32522,		'Instrumenten',						10518 ),
		(32529,		'Luchtflessen',						10518 ),
		(32537,		'Onderwatercamera''s',				10518 ),
		(44652,		'Ademapparatuur',					10518 ),
		(44671,		'Duikcomputers',					10518 ),
		(44676,		'Duiklampen',						10518 ),
		(44695,		'Overige duiksport',				10518 ),
	(13331,		'Voetbal',							888 ),
		(33465,		'Overige voetbal',					13331 ),
		(33466,		'Voetbalplaatjes en foto''s',		13331 ),
		(33468,		'Vlaggen',							13331 ),
		(33469,		'Programma''s',						13331 ),
		(33471,		'Toegangskaarten',					13331 ),
		(40864,		'Schoenen',							13331 ),
		(68752,		'Kleding',							13331 ),
			(33485,		'Shirts',							68752 ),
			(62904,		'Trainingspakken',					68752 ),
			(70855,		'Broeken',							68752 ),
			(81478,		'Sokken en scheenbeschermers',		68752 ),
			(81494,		'Overige kleding',					68752 ),
			(100147,	'Jacks',							68752 ),
		(70848,		'Ballen',							13331 ),
		(126455,	'Magazines en (jaar ),boeken',		13331 ),
	(13334,		'Golf',								888 ),
		(18923,		'Overige golf',						13334 ),
		(18925,		'Kleding',							13334 ),
		(42807,		'Clubs',							13334 ),
		(81587,		'Tees',								13334 ),
		(81590,		'Golftassen',						13334 ),
		(81595,		'Vervoer',							13334 ),
		(100187,	'Ballen',							13334 ),
	(13340,		'Tennis',							888 ),
		(2917,		'Overige tennis',					13340 ),
		(20870,		'Ballen',							13340 ),
		(40878,		'Rackets',							13340 ),
		(56766,		'Schoenen',							13340 ),
		(70898,		'Kleding',							13340 ),
		(81623,		'Toebehoren',						13340 ),
	(13347,		'Overige sporten',					888 ),
	(13361,		'Fitness en training',				888 ),
		(13362,		'Overige fitness',					13361 ),
		(19963,		'Apparaten',						13361 ),
		(19971,		'Toebehoren',						13361 ),
		(27917,		'Kleding',							13361 ),
		(59411,		'Vitaminen en energie',				13361 ),
		(59423,		'Schoenen',							13361 ),
	(13364,		'Vlieg- en luchtsport',				888 ),
	(13368,		'Funsport',							888 ),
	(13389,		'Skiën en langlaufen',				888 ),
	(13394,		'Snowboarden',						888 ),
	(20835,		'Boog- en schietsport',				888 ),
	(20852,		'IJshockey',						888 ),
	(21209,		'Biljarten, pool en snooker',		888 ),
	(21214,		'American football',				888 ),
	(21225,		'Schaatsen',						888 ),
	(24369,		'Formule 1 en racesport',			888 ),
	(26143,		'Vechtsporten',						888 ),
	(26328,		'Darts',							888 ),
	(30100,		'Boksen',							888 ),
	(30760,		'Triathlon',						888 ),
	(31365,		'Badminton',						888 ),
	(32542,		'Dans en ballet',					888 ),
	(33482,		'Basketbal',						888 ),
	(33497,		'Tafeltennis',						888 ),
	(40876,		'Squash',							888 ),
	(56801,		'Hardlopen en jogging',				888 ),
		(2913,		'Overige hardlopen',				56801 ),
		(44610,		'Kleding',							56801 ),
		(44613,		'Schoenen',							56801 ),
		(56802,		'Toebehoren',						56801 ),
	(66112,		'Bergbeklimmen',					888 ),
	(68787,		'Handbal',							888 ),
	(70918,		'Nordic walking',					888 ),
	(81616,		'Honkbal',							888 ),
	(81625,		'Polsbandjes',						888 ),
	(81627,		'Volleybal',						888 ),
	(85346,		'Turnen en gymnastiek',				888 ),
	(88937,		'Jeu de boules en petanque',		888 ),
	(100287,	'Bowling',							888 ),
	(113754,	'Sportartikelen',					888 ),
		(17725,		'Overige sportartikelen',			113754 ),
		(26148,		'Sporttassen',						113754 ),
		(59901,		'Oorkondes, bekers en medailles',	113754 ),
	(119232,	'Atletiek',							888 ),
	(159045,	'Geocaching',						888 ),
	(160939,	'Vakantiereizen',					888 ),
		(3254,		'Bed & Breakfasts',					160939 ),
		(8514,		'Wintersport',						160939 ),
		(13327,		'Overige vakantie',					160939 ),
		(19875,		'Vakantiehuisjes',					160939 ),
		(25612,		'Hotels',							160939 ),
		(34514,		'Korte reizen en trips',			160939 ),
		(34573,		'Arrangementen',					160939 ),
		(34578,		'Sportieve vakanties',				160939 ),
		(37355,		'Carpooling',						160939 ),
		(46032,		'Timesharing',						160939 ),
		(56700,		'Vakantietegoedbonnen',				160939 ),
		(98977,		'Appartementen',					160939 ),
		(126454,	'Campings en vakantieparken',		160939 ),
		(132396,	'Cruises',							160939 ),
		(141749,	'Groepsreizen',						160939 ),
		(148122,	'Lastminutereizen',					160939 ),

-- 10 --
 (1188,		'Modelbouw en miniaturen',			-1),
	(222,		'Auto''s en vrachtwagens',			1188 ),
		(223,		'Overige auto''s',					222 ),
		(1038,		'Dinky toys',						222 ),
		(1174,		'Matchbox',							222 ),
		(2505,		'Majorette',						222 ),
		(2515,		'Solido',							222 ),
		(9090,		'Bburago',							222 ),
		(9097,		'Herpa',							222 ),
		(9107,		'Hot wheels',						222 ),
		(9108,		'Minichamps',						222 ),
		(9114,		'Norev',							222 ),
		(9125,		'Siku',								222 ),
		(13296,		'Schuco',							222 ),
		(31122,		'Tamiya',							222 ),
		(56353,		'Tekno',							222 ),
		(56358,		'Cararama',							222 ),
		(68399,		'IXO',								222 ),
		(74294,		'Conrad',							222 ),
		(81111,		'Corgi',							222 ),
		(81118,		'Maisto',							222 ),
		(87316,		'Britains',							222 ),
		(91591,		'Spark',							222 ),
		(99897,		'Revell',							222 ),
		(128243,	'Vanguards',						222 ),
		(134977,	'Lion Toys',						222 ),
	(9035,		'Treinen',							1188 ),
		(9047,		'Brochures e.d.',					9035 ),
		(9053,		'Spoor H0',							9035 ),
			(9056,		'Roco',								9053 ),
			(9060,		'Fleischmann',						9053 ),
			(27657,		'Overig Spoor H0',					9053 ),
			(33219,		'Märklin',							9053 ),
			(128244,	'Preiser',							9053 ),
		(13292,		'Spoor N',							9035 ),
			(9040,		'Overig Spoor N',					13292 ),
			(130265,	'Arnold',							13292 ),
			(130269,	'Fleischmann',						13292 ),
			(130285,	'Minitrix',							13292 ),
			(130287,	'Roco',								13292 ),
		(17032,		'Overige treinen',					9035 ),
		(31091,		'Spoor 0',							9035 ),
	(9141,		'Bouwpakketten',					1188 ),
	(9153,		'Radiobestuurd',					1188 ),
	(12214,		'Motorfietsen',						1188 ),
	(15510,		'Vliegtuigen',						1188 ),
	(19844,		'Racebaan en slotcars',				1188 ),
	(30675,		'Gebouwen',							1188 ),
	(81157,		'Overige modelbouw',				1188 ),
	(100017,	'Boten',							1188 ),

-- 11 --
 (8423,		'Hobby''s en handwerken',			-1),
	(3103,		'Breien',							8423 ),
		(23537,		'Overig breien',					3103 ),
		(36589,		'Breiwol',							3103 ),
		(126448,	'Naalden en toebehoren',			3103 ),
	(3116,		'Naaien en naaimachines',			8423 ),
		(27544,		'Overig naaien en naaimachines',	3116 ),
		(68568,		'Stoffen',							3116 ),
		(111919,	'Fournituren',						3116 ),
		(111936,	'Patronen',							3116 ),
	(25850,		'Knutselen',						8423 ),
		(121,		'Overig knutselen',					25850 ),
		(19758,		'Hout',								25850 ),
		(85732,		'Metaal',							25850 ),
		(111801,	'Papier en karton',					25850 ),
		(127915,	'Pakketten',						25850 ),
	(26500,		'Overige hobby''s',					8423 ),
	(30471,		'Schilderen',						8423 ),
		(25852,		'Overig schilderen',				30471 ),
		(28110,		'Benodigdheden',					30471 ),
		(124517,	'Verf',								30471 ),
	(30489,		'Servetten',						8423 ),
	(111806,	'Kaarten maken',					8423 ),
	(111827,	'Stempelen',						8423 ),
	(111837,	'Sieradenhobby',					8423 ),
		(25856,		'Overige sieradenhobby''s',			111837 ),
		(83894,		'Kettingen',						111837 ),
		(111843,	'Bedels en hangers',				111837 ),
		(111846,	'Gereedschappen',					111837 ),
		(153953,	'Kralen',							111837 ),
			(3088,		'Overige kralen',					153953 ),
			(153954,	'Steen, edelsteen en mineralen',	153953 ),
			(153955,	'Glas en kristal',					153953 ),
			(153956,	'Hout',								153953 ),
			(153957,	'Kunststof',						153953 ),
			(153958,	'Metaal',							153953 ),
	(111848,	'Scrapping en 3D',					8423 ),
		(3114,		'Overig scrapping',					111848 ),
		(31731,		'Lijm en tape',						111848 ),
		(33977,		'Albums',							111848 ),
		(33978,		'Die-cuts en stanzen',				111848 ),
		(34002,		'Jolees, stickers en rub-ons',		111848 ),
		(48756,		'Sets',								111848 ),
		(75571,		'Mallen en sjablonen',				111848 ),
		(83986,		'Scharen, mesjes en pincetten',		111848 ),
		(111800,	'Stof',								111848 ),
		(111804,	'Charms en frames',					111848 ),
		(111820,	'Ideeënboeken en -folders',			111848 ),
		(111832,	'Glimmers en glinsters',			111848 ),
		(111889,	'Gereedschappen',					111848 ),
		(111893,	'Linten en fibers',					111848 ),
		(114914,	'Knopen en kralen',					111848 ),
		(122658,	'Beschermhoezen',					111848 ),
		(122659,	'Eyelets, brads en snaps',			111848 ),
		(151982,	'Papier en knipvellen',				111848 ),
		(153946,	'Stempels',							111848 ),
	(111925,	'Knopen',							8423 ),
	(111994,	'Goochelen',						8423 ),
	(127909,	'Borduren en haken',				8423 ),
		(4837,		'Overig borduren, breien, haken',	127909 ),
		(27541,		'Garen',							127909 ),
		(36595,		'Katoen',							127909 ),
		(36598,		'Zijde',							127909 ),
		(36599,		'Wol',								127909 ),
		(98642,		'Nylon',							127909 ),
		(111941,	'Pakketten',						127909 ),
		(111943,	'Patronen',							127909 ),

-- 12 --
 (9800,		'Auto''s, motoren en boten',		-1),
	(424,		'Overige auto''s, motoren, boten',	9800 ),
	(1293,		'Boten en vaartuigen',				9800 ),
		(14385,		'Waterski''s',						1293 ),
		(36623,		'Overige boten en vaartuigen',		1293 ),
		(39317,		'Jetski''s',						1293 ),
		(47526,		'Kano''s en kajaks',				1293 ),
		(48329,		'Motorboten en jachten',			1293 ),
		(81634,		'Sloepen en reddingsboten',			1293 ),
		(81636,		'Rubberboten',						1293 ),
		(85365,		'Surfplanken',						1293 ),
		(119201,	'Roeiboten',						1293 ),
		(132148,	'Zeilboten',						1293 ),
		(132169,	'Beroepsscheepvaart',				1293 ),
		(136054,	'Woonboten',						1293 ),
	(9801,		'Auto''s',							9800 ),
		(9834,		'Alfa Romeo',						9801 ),
		(9835,		'Audi',								9801 ),
		(9837,		'BMW',								9801 ),
		(9843,		'Fiat',								9801 ),
		(9844,		'Ford',								9801 ),
		(9855,		'Mercedes',							9801 ),
		(9858,		'Opel',								9801 ),
		(9859,		'Peugeot',							9801 ),
		(9860,		'Porsche',							9801 ),
		(9861,		'Renault',							9801 ),
		(9872,		'Volvo',							9801 ),
		(9873,		'Volkswagen',						9801 ),
		(9883,		'Overige auto''s',					9801 ),
		(18174,		'Citroën',							9801 ),
		(18179,		'Daewoo',							9801 ),
		(18180,		'Ferrari',							9801 ),
		(18183,		'Hyundai',							9801 ),
		(18185,		'Jaguar',							9801 ),
		(18186,		'Lancia',							9801 ),
		(18187,		'Maserati',							9801 ),
		(18206,		'Honda',							9801 ),
		(18211,		'Mazda',							9801 ),
		(18230,		'Mitsubishi',						9801 ),
		(18238,		'Nissan',							9801 ),
		(18262,		'Rover',							9801 ),
		(18263,		'Saab',								9801 ),
		(18270,		'Seat',								9801 ),
		(18275,		'Skoda',							9801 ),
		(18276,		'Smart',							9801 ),
		(18277,		'Subaru',							9801 ),
		(18283,		'Suzuki',							9801 ),
		(18290,		'Toyota',							9801 ),
		(29750,		'Oldtimers en klassiekers',			9801 ),
		(29757,		'MG',								9801 ),
		(30164,		'Daihatsu',							9801 ),
		(38708,		'Mini',								9801 ),
		(50541,		'Kia',								9801 ),
		(121977,	'Rolls Royce',						9801 ),
		(150034,	'Amerikaanse auto''s',				9801 ),
	(9804,		'Motoren',							9800 ),
		(16911,		'Tot 600 cc',						9804 ),
		(16918,		'600 tot 1000 cc',					9804 ),
		(16925,		'Zwaarder dan 1000 cc',				9804 ),
	(9884,		'Autoaccessoires en onderdelen',	9800 ),
		(1256,		'Overige accessoires',				9884 ),
		(14761,		'Tuning, styling en interieur',		9884 ),
			(14767,		'Overige tuning, styling, int.',	14761 ),
			(30172,		'Sportstoelen en gordels',			14761 ),
			(33707,		'Lampen, LEDs en neon',				14761 ),
			(40181,		'Motor- en chiptuning',				14761 ),
			(40189,		'Ophanging, vering en remmen',		14761 ),
			(40193,		'Interieur en accessoires',			14761 ),
			(40200,		'Spoilers en bumpers',				14761 ),
			(40223,		'Matten',							14761 ),
			(44166,		'Folie en stickers',				14761 ),
			(44176,		'Spiegels',							14761 ),
			(44204,		'Sportuitlaten en luchtfilters',	14761 ),
			(53870,		'Drempels en lijsten',				14761 ),
			(56528,		'Chroom en emblemen',				14761 ),
			(57349,		'Stickers en logo''s',				14761 ),
			(73001,		'Sturen, poken en pedalen',			14761 ),
		(14768,		'Carrosserie',						9884 ),
			(14769,		'Overige carrosserie',				14768 ),
			(64879,		'Plaatwerk',						14768 ),
			(64909,		'Grilles',							14768 ),
			(65072,		'Bumpers',							14768 ),
			(65101,		'Deuren',							14768 ),
		(14770,		'Velgen en banden',					9884 ),
			(9888,		'Standaard velgen',					14770 ),
			(9891,		'Banden',							14770 ),
			(14771,		'Overige velgen en banden',			14770 ),
			(28648,		'Lichtmetalen velgen',				14770 ),
			(40278,		'Sneeuwkettingen',					14770 ),
			(65272,		'Wieldoppen',						14770 ),
		(18323,		'Oldtimers',						9884 ),
			(9903,		'Overige oldtimers',				18323 ),
			(76013,		'Interieur en accessoires',			18323 ),
			(76022,		'Carrosserie',						18323 ),
			(76045,		'Velgen en banden',					18323 ),
			(76052,		'Onderdelen en onderhoud',			18323 ),
		(30167,		'Onderhoud',						9884 ),
			(10434,		'Overig onderhoud',					30167 ),
			(30168,		'Autowax en reiniging',				30167 ),
			(30892,		'Smeermiddelen',					30167 ),
		(63318,		'Onderdelen',						9884 ),
			(9895,		'Overige onderdelen',				63318 ),
			(28642,		'Verlichting',						63318 ),
			(33559,		'Remmen',							63318 ),
			(38726,		'Elektronica',						63318 ),
			(53934,		'Stuur en bediening',				63318 ),
			(61013,		'Aandrijving',						63318 ),
			(61154,		'Transmissie',						63318 ),
			(61409,		'Uitlaatsystemen',					63318 ),
			(61920,		'Vering en demping',				63318 ),
			(61939,		'Ruitenwissers en antennes',		63318 ),
			(63705,		'Motors en motoronderdelen',		63318 ),
			(64880,		'Spiegels',							63318 ),
			(65056,		'Sloten',							63318 ),
		(82099,		'Accessoires en toebehoren',		9884 ),
			(9887,		'Overige accessoires',				82099 ),
			(23022,		'Interieur',						82099 ),
			(30896,		'Gereedschap',						82099 ),
			(38788,		'Trekhaken',						82099 ),
			(40217,		'Dakdragers',						82099 ),
			(53938,		'Autostoelen en bekleding',			82099 ),
			(57354,		'Skiboxen',							82099 ),
			(57356,		'Fietsdragers',						82099 ),
			(61959,		'Alarm en veiligheid',				82099 ),
	(9939,		'Scooters en brommers',				9800 ),
	(13353,		'Bootkleding',						9800 ),
	(14233,		'Brochures en documentatie',		9800 ),
		(14235,		'Tijdschriften en jaarboeken',		14233 ),
		(18332,		'Handleidingen',					14233 ),
		(18369,		'Brochures en folders',				14233 ),
			(18370,		'Italiaanse merken',				18369 ),
			(18373,		'Franse merken',					18369 ),
			(18379,		'Aziatische merken',				18369 ),
			(18384,		'Duitse merken',					18369 ),
			(18391,		'Engelse merken',					18369 ),
			(18405,		'Overige merken',					18369 ),
			(64862,		'Amerikaanse merken',				18369 ),
		(85811,		'Overige brochures',				14233 ),
	(14258,		'Auto audio, video en navigatie',	9800 ),
		(14259,		'Autoradio''s met cd en mp3',		14258 ),
		(14260,		'Autoradio''s met cassette',		14258 ),
		(14261,		'Autoradio''s met minidisc',		14258 ),
		(14263,		'Cd-spelers en -wisselaars',		14258 ),
		(14264,		'Equalizers',						14258 ),
		(14274,		'Overig audio, video, navigatie',	14258 ),
		(21641,		'Speakers',							14258 ),
		(21647,		'Versterkers',						14258 ),
		(27445,		'Bekabeling',						14258 ),
		(38754,		'Antennes',							14258 ),
		(38759,		'Handsfree kits',					14258 ),
		(38771,		'Subwoofers',						14258 ),
		(38774,		'Dvd-spelers',						14258 ),
		(38775,		'TFT-schermen',						14258 ),
		(38776,		'Navigatiesystemen en GPS',			14258 ),
			(21646,		'Overige navigatiesystemen',		38776 ),
			(38777,		'Becker',							38776 ),
			(38778,		'Blaupunkt',						38776 ),
			(38779,		'Garmin',							38776 ),
			(38780,		'VDO',								38776 ),
			(45618,		'Pioneer',							38776 ),
			(57296,		'Cd''s en software',				38776 ),
			(61009,		'Kenwood',							38776 ),
			(61011,		'Philips',							38776 ),
			(115612,	'Navigatie-accessoires',			38776 ),
			(136051,	'Leadtek',							38776 ),
			(136052,	'TomTom',							38776 ),
		(60999,		'Houders',							14258 ),
	(14780,		'Motoronderdelen en -access.',		9800 ),	----------------
		(21665,		'Banden en velgen',					14780 ),
		(25632,		'Overige accessoires',				14780 ),
		(25641,		'Accessoires en gereedschappen',	14780 ),
		(25642,		'Beschermhoezen',					14780 ),
		(30234,		'Koffers en bagage',				14780 ),
		(49769,		'Uitlaatsystemen',					14780 ),
		(49790,		'Remmen',							14780 ),
		(49810,		'Voetsteunen',						14780 ),
		(49824,		'Instrumenten en assen',			14780 ),
		(49831,		'Kettingen en koppelingen',			14780 ),
		(49845,		'Sturen, schakel- en handgrepen',	14780 ),
		(49866,		'Verlichting en lampen',			14780 ),
		(49879,		'Motor en versnelling',				14780 ),
		(49892,		'Zittingen',						14780 ),
		(49899,		'Spiegels',							14780 ),
		(49912,		'Tanks',							14780 ),
		(49925,		'Stickers en bekleding',			14780 ),
		(76119,		'Elektronica en ontstekingen',		14780 ),
		(86380,		'Kaders en veringen',				14780 ),
	(14784,		'Motorkleding en helmen',			9800 ),
		(14785,		'Helmen en toebehoren',				14784 ),
		(14788,		'Overige motorkleding',				14784 ),
		(30208,		'Dameskleding',						14784 ),
		(30222,		'Herenkleding',						14784 ),
		(40300,		'Handschoenen',						14784 ),
		(44333,		'Laarzen en schoenen',				14784 ),
		(54013,		'Kinderkleding',					14784 ),
		(82458,		'Beschermers',						14784 ),
	(18449,		'Quads en trikes',					9800 ),
	(25634,		'Scooter- en brommeronderdelen',	9800 ),
	(36629,		'Bootonderdelen en -accessoires',	9800 ),
		(13355,		'Verf en onderhoud',				36629 ),
		(13358,		'Overige bootaccessoires',			36629 ),
		(36635,		'Verlichting en elektronica',		36629 ),
		(36637,		'Motoren en schroeven',				36629 ),
		(36645,		'Radio en communicatie',			36629 ),
		(36646,		'Navigatiebenodigdheden',			36629 ),
		(36647,		'Kaarten en tabellen',				36629 ),
		(36648,		'Kompassen',						36629 ),
		(36653,		'Masten, gieken en zeilen',			36629 ),
		(36655,		'Lieren',							36629 ),
		(81645,		'Ankers en kettingen',				36629 ),
		(81646,		'Touwen',							36629 ),
		(81647,		'Reddingsvesten',					36629 ),
		(115777,	'Riemen en peddels',				36629 ),
	(44794,		'Caravans en vouwwagens',			9800 ),
		(14256,		'Overige caravans en vouwwagens',	44794 ),
		(32633,		'Caravans',							44794 ),
		(44793,		'Vouwwagens',						44794 ),
		(134639,	'Stacaravans',						44794 ),
	(46159,		'Transportvoertuigen',				9800 ),
		(14450,		'Bestelauto''s',					46159 ),
		(18307,		'Overige transportvoertuigen',		46159 ),
		(28572,		'Aanhangwagens',					46159 ),
		(44795,		'Campers en motorhomes',			46159 ),
		(45642,		'Bussen',							46159 ),
		(45644,		'Vrachtwagens en opleggers',		46159 ),
		(60991,		'Markt- en verkoopkramen',			46159 ),
	(47627,		'Transportvoertuigaccessoires',		9800 ),
	(49759,		'Caravan-accessoires',				9800 ),
	(76127,		'Motorsport, enduro en cross',		9800 ),
	(82446,		'Quadonderdelen',					9800 ),

-- 13 --
 (11116,	'Munten en bankbiljetten',			-1),
	(3444,		'Waardepapieren, aandelen',			11116 ),
	(4733,		'Antieke en Middeleeuwse munten',	11116 ),
		(3365,		'Rome: Republiek',					4733 ),
		(4734,		'Rome',								4733 ),
		(4735,		'Rome: Provincie',					4733 ),
		(4737,		'Perzisch, Indisch, Azië',			4733 ),
		(4738,		'Grieks',							4733 ),
		(4739,		'Arabische wereld',					4733 ),
		(4740,		'Chinees',							4733 ),
		(4741,		'Keltisch',							4733 ),
		(7939,		'Overige antieke munten',			4733 ),
		(18466,		'Middeleeuws',						4733 ),
		(58533,		'Reproducties',						4733 ),
	(7972,		'Misslagen en proefdrukken',		11116 ),
	(7975,		'Euromunten en -biljetten',			11116 ),
		(7976,		'Overige euromunten',				7975 ),
		(19516,		'Herdenkingseuromunten',			7975 ),
		(28671,		'Duitsland',						7975 ),
		(35422,		'Oostenrijk',						7975 ),
		(35428,		'Frankrijk',						7975 ),
		(35434,		'Monaco',							7975 ),
		(35438,		'Nederland',						7975 ),
		(35444,		'San Marino',						7975 ),
		(35448,		'Spanje',							7975 ),
		(35453,		'Vaticaan',							7975 ),
		(37124,		'België',							7975 ),
		(37130,		'Finland',							7975 ),
		(37137,		'Griekenland',						7975 ),
		(37143,		'Ierland',							7975 ),
		(37149,		'Italië',							7975 ),
		(37155,		'Luxemburg',						7975 ),
		(37162,		'Portugal',							7975 ),
		(45990,		'Malta',							7975 ),
		(68587,		'Slovenië',							7975 ),
		(68589,		'Cyprus',							7975 ),
		(168471,	'Slowakije',						7975 ),
	(7990,		'Wereldwijde munten',				11116 ),
		(257,		'Overige wereldwijde munten',		7990 ),
		(7994,		'Zilveren en gouden munten',		7990 ),
		(40711,		'Azië',								7990 ),
			(534,		'Overig Azië',						40711 ),
			(4184,		'Israel',							40711 ),
			(4185,		'Korea',							40711 ),
			(40712,		'China',							40711 ),
			(40713,		'India',							40711 ),
			(40714,		'Japan',							40711 ),
			(40717,		'Thailand',							40711 ),
			(45137,		'Hong Kong',						40711 ),
			(45139,		'Filipijnen',						40711 ),
			(58532,		'Midden-Oosten',					40711 ),
		(42723,		'USA',								7990 ),
			(786,		'Overige USA',						42723 ),
			(42724,		'Bullion-Munten',					42723 ),
			(42725,		'Herdenkingsmunten',				42723 ),
			(42726,		'Goud en platina',					42723 ),
			(42727,		'Munten per stuk',					42723 ),
			(42728,		'Muntsets',							42723 ),
		(45145,		'Latijns Amerika',					7990 ),
			(7992,		'Mexico',							45145 ),
			(7993,		'Overige Latijns Amerika',			45145 ),
			(18483,		'Caraïben',							45145 ),
		(45991,		'Australië en Oceanië',				7990 ),
		(45997,		'Canada',							7990 ),
		(127144,	'Afrika',							7990 ),
			(533,		'Overige Afrika',					127144 ),
			(7991,		'Egypte en Arabische Staten',		127144 ),
			(127145,	'Zuid-Afrika',						127144 ),
	(7999,		'Verzamelingen en partijen',		11116 ),
	(12822,		'Biljetten Buitenland',				11116 ),
		(8008,		'Azië',								12822 ),
		(12821,		'Afrika',							12822 ),
		(12823,		'Australië',						12822 ),
		(12824,		'Oceanië',							12822 ),
		(34461,		'Europa (niet-Euro ),',				12822 ),
		(45338,		'Noord- en Zuid-Amerika',			12822 ),
	(18492,		'Penningen',						11116 ),
		(7953,		'Overige penningen',				18492 ),
		(18504,		'Herinneringspenningen',			18492 ),
		(58535,		'Europenningen',					18492 ),
	(18755,		'Medailles',						11116 ),
	(28683,		'Nederlandse niet-euromunten',		11116 ),
		(22825,		'1815 - 1840 Willem I',				28683 ),
		(22826,		'1840 - 1849 Willem II',			28683 ),
		(22827,		'1849 - 1890 Willem III',			28683 ),
		(22829,		'Nederlands Indië',					28683 ),
		(22835,		'Muntsets',							28683 ),
		(22838,		'Zilveren en gouden munten',		28683 ),
		(22839,		'Overige Nederlandse munten',		28683 ),
		(34291,		'Provinciale munten',				28683 ),
		(81848,		'Nederlandse Antillen',				28683 ),
		(81849,		'Aruba',							28683 ),
		(105224,	'1890 - 1948 Wilhelmina',			28683 ),
			(22836,		'Halve gulden',						105224 ),
			(105225,	'0.5 cent',							105224 ),
			(105226,	'1 cent',							105224 ),
			(105227,	'2.5 cent',							105224 ),
			(105228,	'5 cent',							105224 ),
			(105229,	'10 cent',							105224 ),
			(105230,	'25 cent',							105224 ),
			(105231,	'Gulden',							105224 ),
			(105232,	'Rijksdaalder',						105224 ),
			(105233,	'Vijf gulden',						105224 ),
			(105234,	'Tien gulden',						105224 ),
		(128245,	'1948 - 1980 Juliana',				28683 ),
			(22832,		'Overige Juliana',					128245 ),
			(128246,	'1 cent',							128245 ),
			(128247,	'5 cent',							128245 ),
			(128248,	'25 cent',							128245 ),
			(128249,	'Gulden',							128245 ),
			(128250,	'Rijksdaalder',						128245 ),
			(128251,	'Vijf gulden',						128245 ),
			(128252,	'Tien gulden',						128245 ),
			(128253,	'Sets en pakketten',				128245 ),
			(130425,	'10 cent',							128245 ),
		(128254,	'1980 - 2002 Beatrix',				28683 ),
			(22833,		'Overige Beatrix',					128254 ),
			(128255,	'5 cent',							128254 ),
			(128256,	'10 cent',							128254 ),
			(128257,	'25 cent',							128254 ),
			(128258,	'Gulden',							128254 ),
			(128259,	'Rijksdaalder',						128254 ),
			(128260,	'Vijf gulden',						128254 ),
			(128261,	'Tien gulden',						128254 ),
			(128262,	'Sets en pakketten',				128254 ),
	(34470,		'Nederlandse bankbiljetten',		11116 ),
	(34939,		'Edelmetalen',						11116 ),
	(40718,		'Muntaccessoires',					11116 ),
	(45148,		'Europese niet-euromunten',			11116 ),
		(540,		'Duitsland',						45148 ),
		(3394,		'Verenigd Koninkrijk',				45148 ),
		(4941,		'Overige Europese niet-Euro',		45148 ),
		(7977,		'Bulgarije',						45148 ),
		(7985,		'Polen',							45148 ),
		(7988,		'Zweden',							45148 ),
		(18478,		'Litouwen',							45148 ),
		(18479,		'Tsjechoslowakije',					45148 ),
		(18480,		'Turkije',							45148 ),
		(26517,		'Denemarken',						45148 ),
		(26523,		'Noorwegen',						45148 ),
		(28675,		'Finland',							45148 ),
		(28677,		'Frankrijk',						45148 ),
		(28679,		'Griekenland',						45148 ),
		(28681,		'Italië',							45148 ),
		(28687,		'Spanje',							45148 ),
		(30684,		'België',							45148 ),
		(31134,		'Ierland',							45148 ),
		(31135,		'Monaco',							45148 ),
		(31136,		'Portugal',							45148 ),
		(31137,		'San Marino',						45148 ),
		(31138,		'Vaticaan',							45148 ),
		(32475,		'Luxemburg',						45148 ),
		(32476,		'Rusland',							45148 ),
		(35416,		'Oostenrijk',						45148 ),
		(35427,		'Albanië',							45148 ),
		(35433,		'Joegoslavië',						45148 ),
		(35443,		'Roemenië',							45148 ),
		(40710,		'Andorra',							45148 ),
		(45153,		'Hongarije',						45148 ),
		(68583,		'IJsland',							45148 ),
		(68584,		'Kroatië',							45148 ),
		(68585,		'Servië',							45148 ),
		(68586,		'Slowakije',						45148 ),
		(68588,		'Tsjechië',							45148 ),
		(77526,		'Bosnië-Herzegovina',				45148 ),
		(77527,		'Macedonië',						45148 ),
		(77528,		'Oekraïne',							45148 ),
		(91057,		'Zwitserland',						45148 ),
		(148091,	'Estland',							45148 ),
		(148092,	'Letland',							45148 ),
		(148094,	'Slovenië',							45148 ),
		(158626,	'Malta',							45148 ),
		(158628,	'Cyprus',							45148 ),
	(46004,		'Overige munten en biljetten',		11116 ),
	(179197,	'Virtueel geld',					11116 ),
		(179170,	'Valuta',							179197 ),
		(179171,	'Miners',							179197 ),
		(179172,	'Mining-contracten',				179197 );

INSERT INTO Rubriek(rubrieknummer, rubrieknaam, rubriek)
VALUES
-- 14 --
 (11232,	'Film en DVD',						-1),
	(196,		'Fanartikelen en merchandise',		11232 ),
		(57,		'Film objecten',					196 ),
			(197,		'Overige filmobjecten',				57),
			(2323,		'Posters',							57 ),
			(53591,		'Ansichtkaarten',					57 ),
		(1424,		'TV objecten',						196 ),
			(201,		'Overige TV-objecten',				1424 ),
			(82286,		'Postcards',						1424 ),
		(2312,		'Overige fanartikelen',				196 ),
		(18823,		'Foto''s',							196 ),
			(200,		'Recente films',					18823 ),
			(18824,		'Oude films',						18823 ),
			(18826,		'Overige foto''s',					18823 ),
			(18854,		'Tv en series',						18823 ),
	(1508,		'VHS-videos',						11232 ),
		(4347,		'Documentaire en educatief',		1508 ),
		(4352,		'Horror en griezel',				1508 ),
		(4361,		'Sport en fitness',					1508 ),
		(16663,		'Actie en avontuur',				1508 ),
			(4341,		'Overige actie en avontuur',		16663 ),
			(4355,		'Vechtsporten',						16663 ),
			(4365,		'Oorlog en militair',				16663 ),
			(4366,		'Westerns',							16663 ),
			(35066,		'Actie',							16663 ),
			(35067,		'Avontuur',							16663 ),
			(35071,		'Superhelden',						16663 ),
			(35072,		'Rampen',							16663 ),
			(60914,		'Historisch',						16663 ),
			(60915,		'Romantiek',						16663 ),
		(16665,		'Comedy en humor',					1508 ),
		(16672,		'Tekenfilms en animatie',			1508 ),
		(16674,		'Thriller en misdaad',				1508 ),
		(16675,		'Sciencefiction en fantasy',		1508 ),
		(16679,		'Overige video''s',					1508 ),
		(20049,		'Tv-series en -programma''s',		1508 ),
		(35076,		'Kinder- en familiefilms',			1508 ),
			(4344,		'Overige Kinder- & familiefilms',	35076 ),
			(60919,		'Avontuur',							35076 ),
			(60920,		'Komedie',							35076 ),
			(60921,		'Educatief',						35076 ),
			(60922,		'Fantasie en sprookjes',			35076 ),
			(72410,		'Actie',							35076 ),
			(72411,		'Klassiekers',						35076 ),
			(109043,	'Mysterie',							35076 ),
			(127809,	'Bekende tv-figuren',				35076 ),
		(58997,		'VHS-boxen en verzamelvideos',		1508 ),
		(80026,		'Cult',								1508 ),
		(121863,	'Musical',							1508 ),
	(2288,		'Film DVD''s',						11232 ),
		(617,		'Overige DVD''s',					2288 ),
		(7746,		'Musical en Opera',					2288 ),
		(22411,		'DVD-boxsets en verzamel-DVD''s',	2288 ),
		(35015,		'Komedie en humor',					2288 ),
			(35016,		'Brits',							35015 ),
			(35018,		'Slapstick',						35015 ),
			(41534,		'Actie',							35015 ),
			(41535,		'Romantiek',						35015 ),
			(41537,		'Cabaret',							35015 ),
			(60880,		'Overige comedy en humor',			35015 ),
			(90726,		'Tiener',							35015 ),
			(93599,		'Familie',							35015 ),
			(96972,		'Zwarte humor',						35015 ),
			(134676,	'Drama',							35015 ),
		(41520,		'Actie en avontuur',				2288 ),
			(2289,		'Overige actie en avontuur',		41520 ),
			(2302,		'Vechtsporten',						41520 ),
			(2310,		'Oorlog en militair',				41520 ),
			(4178,		'Westerns',							41520 ),
			(7736,		'Historisch',						41520 ),
			(12593,		'Superhelden',						41520 ),
			(32642,		'Avontuur',							41520 ),
			(41522,		'Rampen',							41520 ),
			(60868,		'Actie',							41520 ),
			(60870,		'Romantiek',						41520 ),
		(41523,		'Tekenfilms en animatie',			2288 ),
			(2290,		'Overige tekenfilms en animatie',	41523 ),
			(2291,		'Tekenfilms',						41523 ),
			(35014,		'Disney',							41523 ),
			(41525,		'Computer geanimeerd',				41523 ),
			(43839,		'Animatie',							41523 ),
			(87074,		'Bekende tv-figuren',				41523 ),
			(134675,	'Actie',							41523 ),
		(41526,		'Kinder- en familiefilms',			2288 ),
			(2292,		'Overige kinder- en familiefilm',	41526 ),
			(41527,		'Avontuur',							41526 ),
			(41528,		'Komedie',							41526 ),
			(41529,		'Educatief',						41526 ),
			(41530,		'Fantasie en sprookjes',			41526 ),
			(72407,		'Actie',							41526 ),
			(72408,		'Klassiekers',						41526 ),
			(98819,		'Kleuter- en peuterfilms',			41526 ),
			(109023,	'Mysterie',							41526 ),
			(127802,	'Bekende tv-figuren',				41526 ),
		(41539,		'Thriller en misdaad',				2288 ),
			(2305,		'Mysterie',							41539 ),
			(35009,		'Politie en detective',				41539 ),
			(41540,		'Misdaad',							41539 ),
			(41541,		'Spionage',							41539 ),
			(63831,		'Overige thrillers en midaad',		41539 ),
			(100497,	'Advocatuur',						41539 ),
			(100498,	'Gangster en maffia',				41539 ),
			(109024,	'Psychologisch',					41539 ),
			(127804,	'Politiek',							41539 ),
		(41543,		'Documentaires & educatie',			2288 ),
			(2295,		'Overige documentaire',				41543 ),
			(41544,		'Biografie',						41543 ),
			(41546,		'Historie',							41543 ),
			(41547,		'Natuur',							41543 ),
			(41548,		'Wetenschap en techniek',			41543 ),
			(41594,		'Reizen',							41543 ),
			(42843,		'Oorlog en militair',				41543 ),
			(91395,		'Misdaad',							41543 ),
			(109025,	'Religie',							41543 ),
		(41550,		'Speelfilm en drama',				2288 ),
			(2296,		'Overige speelfilms en drama',		41550 ),
			(41551,		'Politiek',							41550 ),
			(42845,		'Oorlog en militair',				41550 ),
			(60882,		'Historisch',						41550 ),
			(75534,		'Familie',							41550 ),
			(82283,		'Tiener',							41550 ),
			(103398,	'Romantiek',						41550 ),
		(41558,		'Horror en griezel',				2288 ),
			(2299,		'Overige horror en griezel',		41558 ),
			(35026,		'Tiener',							41558 ),
			(41559,		'Monsters',							41558 ),
			(41560,		'Occult en bovennatuurlijk',		41558 ),
			(60893,		'Cult',								41558 ),
			(90724,		'Klassiek',							41558 ),
			(100495,	'Vampiers',							41558 ),
			(100496,	'Weerwolf',							41558 ),
		(41571,		'Sciencefiction en fantasy',		2288 ),
			(2298,		'Fantasy',							41571 ),
			(2307,		'Overige sciencefiction',			41571 ),
			(41572,		'Buitenaardse wezens',				41571 ),
			(41573,		'Futuristisch',						41571 ),
			(41574,		'Robots',							41571 ),
			(41575,		'Ruimteavontuur',					41571 ),
		(63830,		'Sport en fitness',					2288 ),
		(80025,		'Cult',								2288 ),
		(113179,	'Bollywood',						2288 ),
		(136207,	'Art House',						2288 ),
	(35064,		'Andere formaten',					11232 ),
		(7755,		'Laserdisks',						35064 ),
			(381,		'NTSC',								7755 ),
			(7756,		'PAL',								7755 ),
		(17805,		'Overige andere formaten',			35064 ),
		(27342,		'Video-CD',							35064 ),
		(52552,		'Film',								35064 ),
			(1476,		'8 mm',								52552 ),
			(1477,		'16 mm',							52552 ),
	(41584,		'TV series en programma''s DVD''s',	11232 ),
		(41587,		'Cabaret en komedie',				41584 ),
		(41588,		'Drama',							41584 ),
		(41589,		'Sciencefiction en fantasy',		41584 ),
		(41590,		'Overige series en programma''s',	41584 ),
		(58965,		'Kook- en klusprogramma''s',		41584 ),
		(60892,		'Misdaad, gangster en maffia',		41584 ),
		(60902,		'Kinderen en familie',				41584 ),
		(60903,		'Soaps',							41584 ),
		(72409,		'Actie en avontuur',				41584 ),
		(80024,		'Reality TV',						41584 ),
		(83737,		'Oorlog en militair',				41584 ),
		(101392,	'Amusement en spelshows',			41584 ),
		(127805,	'Wetenschap',						41584 ),
		(127806,	'Sport en fitness',					41584 ),
		(127807,	'Detectives en krimi''s',			41584 ),
		(127808,	'Documentaires en natuur',			41584 ),
	(58974,		'Partijen en groothandel',			11232 ),
	(115539,	'Benodigdheden en opslag',			11232 ),

-- 15 -- 
 (11233,	'Muziek en -instrumenten',			-1),
	(619,		'Muziekinstrumenten',				11233 ),
		(308,		'Overige muziekinstrumenten',		619 ),
		(7794,		'Keyboards, synths, piano''s',		619 ),
		(7798,		'Strijk- en snaarinstrumenten',		619 ),
		(12810,		'Bladmuziek en muziekboeken',		619 ),
		(21758,		'Blaasinstrumenten',				619 ),
		(21762,		'Gitaren en versterkers',			619 ),
			(46638,		'Akoestische gitaren',				21762 ),
			(46645,		'Elektrische gitaren',				21762 ),
			(46652,		'Versterkers',						21762 ),
			(46666,		'Effecten',							21762 ),
			(46675,		'Gitaaraccessoires',				21762 ),
			(87485,		'Basgitaren',						21762 ),
		(21767,		'Slagwerk en drums',				619 ),
		(148735,	'Accordeons',						619 ),
	(1071,		'Vinyl en platen',					11233 ),
		(7782,		'Verzamelalbums',					1071 ),
		(20800,		'LP''s en Maxi''s (12'''' , 10'''' ),',1071 ),
			(306,		'Overige LP''s',					20800 ),
			(1072,		'Kindermuziek',						20800 ),
			(1074,		'Country',							20800 ),
			(1076,		'Religieus, New Age en Gospel',		20800 ),
			(1081,		'Filmmuziek en soundtracks',		20800 ),
			(1580,		'Blues',							20800 ),
			(1581,		'Dance',							20800 ),
			(1582,		'Disco',							20800 ),
			(1583,		'Kerstmis en Sinterklaas',			20800 ),
			(1584,		'Instrumentaal',					20800 ),
			(1597,		'Techno',							20800 ),
			(1598,		'Easy Listening',					20800 ),
			(1599,		'Wereldmuziek',						20800 ),
			(2028,		'Big Band',							20800 ),
			(2257,		'Cabaret en komedie',				20800 ),
			(2264,		'Gesproken woord',					20800 ),
			(12805,		'Chansons',							20800 ),
			(43670,		'Klassiek en opera',				20800 ),
			(43688,		'Trance',							20800 ),
			(43689,		'Jazz',								20800 ),
			(43695,		'Pop',								20800 ),
			(43700,		'R&B en Soul',						20800 ),
			(43704,		'Soul',								20800 ),
			(43707,		'Rock',								20800 ),
			(58614,		'Verzamelalbums',					20800 ),
			(58616,		'Volksmuziek',						20800 ),
			(58620,		'Indie en Britpop',					20800 ),
			(58627,		'Reggae en ska',					20800 ),
			(58635,		'Breakz en crossover',				20800 ),
			(58640,		'Garage',							20800 ),
			(58641,		'Hardcore',							20800 ),
			(58642,		'House',							20800 ),
			(64863,		'Rap en hiphop',					20800 ),
			(68065,		'Metal',							20800 ),
			(75552,		'Club en Lounge',					20800 ),
			(91486,		'Avant-garde en experimenteel',		20800 ),
			(135020,	'Nederlandstalig',					20800 ),
		(20801,		'Singles (7'''' ),',				1071 ),
			(2265,		'Overige 7'''' singles',			20801 ),
			(14596,		'Nederlandstalig',					20801 ),
			(20809,		'Jazz, blues en soul',				20801 ),
			(27422,		'Disco',							20801 ),
			(45540,		'Rock',								20801 ),
			(45551,		'Grunge en garage',					20801 ),
			(58670,		'Pop',								20801 ),
		(43708,		'Vinyl beperkte oplagen',			1071 ),
	(21733,		'CD-singles en maxi''s',			11233 ),
		(14601,		'Nederlandstalig',					21733 ),
		(17550,		'Overige CD-singels',				21733 ),
		(21735,		'Dance en house',					21733 ),
		(22883,		'Rock',								21733 ),
		(64869,		'Pop',								21733 ),
			(58648,		'Pop jaren 80',					64869 ),
			(64870,		'Pop jaren 60 en 70',				64869 ),
			(64871,		'Pop jaren 90',					64869 ),
			(64872,		'Pop 2000 - heden',					64869 ),
	(21770,		'Studio- en live-apparatuur',		11233 ),
		(12909,		'PA- en podiumapparatuur',			21770 ),
		(18605,		'DJ-apparatuur',					21770 ),
		(21771,		'Overige apparatuur',				21770 ),
		(46957,		'Studio- en opnameapparatuur',		21770 ),
		(96635,		'Zang- en studiomicrofoons',		21770 ),
	(23260,		'Muziek- en concertvideo''s',		11233 ),
	(25915,		'Overige muziekformaten',			11233 ),
		(1603,		'Cassettes',						25915 ),
		(7788,		'Minidisc',							25915 ),
		(23293,		'Overige formaten',					25915 ),
	(27577,		'CD- en vinylaccessoires',			11233 ),
		(27578,		'Reiniging en reparatie',			27577 ),
		(27579,		'Overige accessoires',				27577 ),
		(81377,		'Opbergsystemen cd''s',				27577 ),
		(111999,	'Opbergsystemen vinyl',				27577 ),
	(34814,		'Concert- en festivalkaartjes',		11233 ),
	(52046,		'Verzamelingen en groothandel',		11233 ),
	(52473,		'Accessoires en opslag',			11233 ),
	(58677,		'Overige muziek en instrumenten',	11233 ),
	(104612,	'CD''s',							11233 ),
		(307,		'Overige CD''s',					104612 ),
		(1052,		'Country',							104612 ),
		(1560,		'Cabaret en komedie',				104612 ),
		(1564,		'Instrumentaal',					104612 ),
		(1578,		'Easy Listening',					104612 ),
		(2247,		'Religieus, New Age en Gospel',		104612 ),
		(2250,		'Indie en Britpop',					104612 ),
		(14604,		'Nederlandstalig',					104612 ),
		(19479,		'Dance',							104612 ),
			(1577,		'Techno en industrial',				19479 ),
			(2249,		'House',							19479 ),
			(7766,		'Trance en hardhouse',				19479 ),
			(7769,		'Drum & bass en jungle',			19479 ),
			(7770,		'Electronica',						19479 ),
			(21725,		'Garage',							19479 ),
			(22520,		'Chillout en ambient',				19479 ),
			(23931,		'Overige dance',					19479 ),
			(68057,		'Progressive house',				19479 ),
			(87346,		'Disco',							19479 ),
			(96573,		'Hardcore, gabber en rave',			19479 ),
			(98886,		'Old skool',						19479 ),
			(112016,	'Big Beat',							19479 ),
			(112017,	'Breakbeat',						19479 ),
		(19481,		'Klassiek',							104612 ),
			(1051,		'Overig klassiek',					19481 ),
			(40723,		'Barok en oude muziek',				19481 ),
			(43585,		'Orkesten',							19481 ),
			(68053,		'Koormuziek',						19481 ),
			(81338,		'Kamermuziek en ensembles',			19481 ),
			(81341,		'Opera en vocaal',					19481 ),
			(91475,		'Ballet en dans',					19481 ),
			(101533,	'Orgelmuziek',						19481 ),
		(19483,		'Rock',								104612 ),
			(1055,		'Hardrock',							19483 ),
			(1572,		'Alternative Rock',					19483 ),
			(1575,		'Soft Rock',						19483 ),
			(2252,		'Punkrock',							19483 ),
			(9992,		'Glamrock',							19483 ),
			(14732,		'Classic Rock',						19483 ),
			(21726,		'Gothic',							19483 ),
			(21731,		'Rock ''n'' Roll',					19483 ),
			(37184,		'Progressive',						19483 ),
			(43652,		'Overige rock',						19483 ),
			(43657,		'Grunge',							19483 ),
			(58609,		'Garage',							19483 ),
			(98890,		'Folk Rock',						19483 ),
			(98891,		'Rockabilly',						19483 ),
			(136690,	'New Wave',							19483 ),
		(19485,		'Wereldmuziek',						104612 ),
			(1565,		'Latin',							19485 ),
			(1579,		'Overige wereldmuziek',				19485 ),
			(28764,		'Afrikaans',						19485 ),
			(30685,		'Arabisch',							19485 ),
			(37186,		'Oost-Europees',					19485 ),
			(43668,		'Indisch',							19485 ),
		(20799,		'Karaoke',							104612 ),
		(21727,		'Pop',								104612 ),
			(1562,		'Pop jaren ''80',					21727 ),
			(25890,		'Pop jaren ''90',					21727 ),
			(25892,		'Pop jaren ''60',					21727 ),
			(25893,		'Pop jaren ''70',					21727 ),
			(154024,	'Pop 2000 - heden',					21727 ),
		(25894,		'Reggae en Ska',					104612 ),
		(25898,		'Verzamelalbums',					104612 ),
		(26718,		'Filmmuziek en soundtracks',		104612 ),
			(1058,		'Films',							26718 ),
			(43663,		'TV',								26718 ),
			(81354,		'Musicals',							26718 ),
		(34317,		'Metal',							104612 ),
			(1574,		'Heavy Metal',						34317 ),
			(21730,		'Nu Metal',							34317 ),
			(33288,		'Death Metal',						34317 ),
			(33290,		'Speed en Thrash Metal',			34317 ),
			(68062,		'Overige Metal',					34317 ),
		(43619,		'Jazz, Big Band en Blues',			104612 ),
			(1559,		'Blues',							43619 ),
			(28760,		'Jazz',								43619 ),
			(28761,		'Big Band',							43619 ),
		(43639,		'R&B en soul',						104612 ),
			(1570,		'Overige R&B en Soul',				43639 ),
			(26716,		'Funk',								43639 ),
			(43642,		'Motown',							43639 ),
			(58600,		'Northern Soul',					43639 ),
			(65806,		'Soul',								43639 ),
			(65809,		'R&B',								43639 ),
			(75550,		'Mainstream',						43639 ),
		(46010,		'Folk',								104612 ),
		(52043,		'Special interest',					104612 ),
		(52044,		'Verzamelingen',					104612 ),
		(54951,		'Kerstmis en Sinterklaas',			104612 ),
		(62835,		'Rap en hiphop',					104612 ),
			(1569,		'Overige rap en hiphop',			62835 ),
			(43645,		'Freestyle',						62835 ),
			(43646,		'Gangsta',							62835 ),
			(43647,		'Hip Hop',							62835 ),
			(43648,		'Old School',						62835 ),
			(58601,		'East Coast',						62835 ),
			(58602,		'West Coast',						62835 ),
		(68593,		'Kindermuziek',						104612 ),
		(74427,		'Beperkte oplagen',					104612 ),
		(75549,		'Lounge en downtempo',				104612 ),
		(91474,		'Avant-garde en experimenteel',		104612 ),
	(154051,	'DVD''s',							11233 ),
		(23275,		'Concerten en events',				154051 ),
			(2303,		'Overige concerten',				23275 ),
			(28748,		'Karaoke',							23275 ),
			(41567,		'Jazz',								23275 ),
			(41570,		'Rap en hiphop',					23275 ),
			(58966,		'Dance',							23275 ),
			(60896,		'R&B en soul',						23275 ),
			(83761,		'Country',							23275 ),
			(91396,		'Blues',							23275 ),
			(91397,		'Reggae en ska',					23275 ),
			(98823,		'Metal',							23275 ),
			(101382,	'Easy Listening',					23275 ),
			(109026,	'New Age/spiritueel',				23275 ),
			(128263,	'Dans - klassiek',					23275 ),
			(128264,	'Nederlandstalig',					23275 ),
			(154052,	'Klassiek',							23275 ),
			(154053,	'Pop',								23275 ),
			(154054,	'Rock',								23275 ),
		(23277,		'Overige DVD''s',					154051 ),
		(63842,		'Videoclips',						154051 ),
	(157499,	'Fanartikelen en merchandise',		11233 ),
		(210,		'Rock & Roll',						157499 ),
		(432,		'Beatles',							157499 ),
		(433,		'Elvis',							157499 ),
		(2334,		'Popsterren en idolen',				157499 ),
		(21756,		'Overige verzamelobjecten',			157499 ),
		(33012,		'Hardrock, metal',					157499 ),
		(52058,		'Posters',							157499 ),
		(52064,		'Gesigneerde artikelen',			157499 ),
		(52065,		'Bands en groepen',					157499 ),
		(59177,		'Kleding en sieraden',				157499 ),
 
-- 16 -- 
 (11450,	'Kleding en mode',					-1),
	(312,		'Overige kleding',					11450 ),
	(315,		'Kinderkleding - overige',			11450 ),
	(3029,		'Grote maten',						11450 ),
		(12995,		'Avondkleding en bruidskleding',	3029 ),
		(13019,		'Broeken en jeans',					3029 ),
		(13027,		'Blouses en hemden',				3029 ),
		(13035,		'Truien',							3029 ),
		(13051,		'Jassen en jasjes',					3029 ),
		(24052,		'Rokken en jurken',					3029 ),
		(31065,		'Shirts',							3029 ),
		(151439,	'Overige grote maten',				3029 ),
	(3038,		'Kinderkleding- jongens',			11450 ),
		(1067,		'Overige jongenskleding',			3038 ),
		(51919,		'Zwemkleding',						3038 ),
		(51959,		'Sportkleding',						3038 ),
		(70222,		'Maat 92',							3038 ),
			(70224,		'Blouses en overhemden',			70222 ),
			(70226,		'Broeken',							70222 ),
			(70228,		'Jassen en jasjes',					70222 ),
			(70230,		'Jeans',							70222 ),
			(70232,		'Overige maat 92',					70222 ),
			(70234,		'Truien',							70222 ),
			(107476,	'Nachtkleding',						70222 ),
			(128195,	'Shirts',							70222 ),
			(136626,	'Vesten',							70222 ),
			(156791,	'Setjes',							70222 ),
		(98323,		'Maat 98/104',						3038 ),
			(8476,		'Overige maat 98/104',				98323 ),
			(70238,		'Shirts',							98323 ),
			(70244,		'Jeans',							98323 ),
			(77449,		'Broeken',							98323 ),
			(77462,		'Jassen en jasjes',					98323 ),
			(77466,		'Truien',							98323 ),
			(77473,		'Blouses en overhemden',			98323 ),
			(84545,		'Nachtkleding',						98323 ),
			(136628,	'Vesten',							98323 ),
			(156792,	'Setjes',							98323 ),
		(98325,		'Maat 110/116',						3038 ),
			(49091,		'Overige maat 110/116',				98325 ),
			(51921,		'Broeken',							98325 ),
			(51934,		'Jassen en jasjes',					98325 ),
			(51961,		'Shirts',							98325 ),
			(51993,		'Truien',							98325 ),
			(52002,		'Blouses en overhemden',			98325 ),
			(77476,		'Jeans',							98325 ),
			(84546,		'Nachtkleding',						98325 ),
			(136629,	'Vesten',							98325 ),
			(156793,	'Setjes',							98325 ),
		(98327,		'Maat 122/128',						3038 ),
			(49104,		'Overige maat 122/128',				98327 ),
			(51923,		'Broeken',							98327 ),
			(51936,		'Jassen en jasjes',					98327 ),
			(51949,		'Truien',							98327 ),
			(51972,		'Shirts',							98327 ),
			(52006,		'Blouses en overhemden',			98327 ),
			(74287,		'Nachtkleding',						98327 ),
			(77478,		'Jeans',							98327 ),
			(136630,	'Vesten',							98327 ),
			(156795,	'Setjes',							98327 ),
		(98329,		'Maat 134/140',						3038 ),
			(49122,		'Overige maat 134/140',				98329 ),
			(51925,		'Broeken',							98329 ),
			(51938,		'Jassen en jasjes',					98329 ),
			(51951,		'Truien',							98329 ),
			(51970,		'Shirts',							98329 ),
			(52008,		'Blouses en overhemden',			98329 ),
			(77480,		'Jeans',							98329 ),
			(84547,		'Nachtkleding',						98329 ),
			(136631,	'Vesten',							98329 ),
			(156796,	'Setjes',							98329 ),
		(98331,		'Maat 146',							3038 ),
			(24137,		'Truien',							98331 ),
			(49135,		'Overige maat 146',					98331 ),
			(51927,		'Broeken',							98331 ),
			(51940,		'Jassen en jasjes',					98331 ),
			(51968,		'Shirts',							98331 ),
			(52010,		'Blouses en overhemden',			98331 ),
			(77482,		'Jeans',							98331 ),
			(98332,		'Setjes',							98331 ),
			(136632,	'Nachtkleding',						98331 ),
			(136633,	'Vesten',							98331 ),
		(98333,		'Maat 152/158',						3038 ),
			(13213,		'Jassen en jasjes',					98333 ),
			(13219,		'Blouses en overhemden',			98333 ),
			(13225,		'Broeken',							98333 ),
			(13231,		'Truien',							98333 ),
			(49137,		'Overige maat 152/158',				98333 ),
			(77483,		'Jeans',							98333 ),
			(84548,		'Nachtkleding',						98333 ),
			(128208,	'Shirts',							98333 ),
			(136634,	'Vesten',							98333 ),
			(156797,	'Setjes',							98333 ),
		(98372,		'Maat 164',							3038 ),
			(49149,		'Broeken',							98372 ),
			(49150,		'Jassen en jasjes',					98372 ),
			(49151,		'Truien',							98372 ),
			(49153,		'Blouses en overhemden',			98372 ),
			(49155,		'Overige maat 164',					98372 ),
			(77485,		'Jeans',							98372 ),
			(84549,		'Nachtkleding',						98372 ),
			(128212,	'Shirts',							98372 ),
			(136635,	'Vesten',							98372 ),
			(156798,	'Setjes',							98372 ),
		(98374,		'Maat 170/176',						3038 ),
			(13214,		'Jassen en jasjes',					98374 ),
			(13220,		'Blouses en overhemden',			98374 ),
			(13226,		'Broeken',							98374 ),
			(13232,		'Truien',							98374 ),
			(49159,		'Overige maat 170/176',				98374 ),
			(77486,		'Jeans',							98374 ),
			(84550,		'Nachtkleding',						98374 ),
			(128213,	'Shirts',							98374 ),
			(136636,	'Vesten',							98374 ),
			(156799,	'Setjes',							98374 ),
		(99748,		'Communiekleding',					3038 ),
		(128962,	'Feest- en carnavalskleding',		3038 ),
		(153564,	'Sokken',							3038 ),
	(3051,		'Kinderkleding- meisjes',			11450 ),
		(1068,		'Overige meisjeskleding',			3051 ),
		(23528,		'Feest- en carnavalskleding',		3051 ),
		(40686,		'Communiekleding',					3051 ),
		(51567,		'Zwemkleding',						3051 ),
		(51584,		'Sportkleding',						3051 ),
		(74069,		'Maat 92',							3051 ),
			(70227,		'Rokken en jurken',					74069 ),
			(74071,		'Blouses',							74069 ),
			(74073,		'Broeken',							74069 ),
			(74074,		'Jassen en jasjes',					74069 ),
			(74076,		'Jeans',							74069 ),
			(74078,		'Overige maat 92',					74069 ),
			(74080,		'Truien',							74069 ),
			(107479,	'Nachtkleding',						74069 ),
			(128218,	'Shirts',							74069 ),
			(136627,	'Vesten',							74069 ),
			(156802,	'Setjes',							74069 ),
		(98376,		'Maat 98/104',						3051 ),
			(74085,		'Shirt',							98376 ),
			(74090,		'Jeans',							98376 ),
			(74096,		'Overige maat 98/104',				98376 ),
			(77379,		'Broeken',							98376 ),
			(77387,		'Jassen en jasjes',					98376 ),
			(77424,		'Rokken en jurken',					98376 ),
			(77432,		'Truien',							98376 ),
			(77458,		'Blouses',							98376 ),
			(107480,	'Nachtkleding',						98376 ),
			(136639,	'Vesten',							98376 ),
			(156803,	'Setjes',							98376 ),
		(98378,		'Maat 110/116',						3051 ),
			(3071,		'Blouses',							98378 ),
			(48334,		'Overige maat 110/116',				98378 ),
			(51569,		'Broeken',							98378 ),
			(51596,		'Jassen en jasjes',					98378 ),
			(51603,		'Rokken en jurken',					98378 ),
			(51618,		'Truien',							98378 ),
			(51702,		'Shirts',							98378 ),
			(74288,		'Nachtkleding',						98378 ),
			(77412,		'Jeans',							98378 ),
			(136640,	'Vesten',							98378 ),
			(156805,	'Setjes',							98378 ),
		(98380,		'Maat 122/128',						3051 ),
			(15643,		'Nachtkleding',						98380 ),
			(48348,		'Blouses',							98380 ),
			(48350,		'Overige maat 122/128',				98380 ),
			(51571,		'Broeken',							98380 ),
			(51598,		'Jassen en jasjes',					98380 ),
			(51605,		'Rokken en jurken',					98380 ),
			(51620,		'Truien',							98380 ),
			(51706,		'Shirts',							98380 ),
			(77414,		'Jeans',							98380 ),
			(136641,	'Vesten',							98380 ),
			(156806,	'Setjes',							98380 ),
		(98382,		'Maat 134/140',						3051 ),
			(48369,		'Blouses',							98382 ),
			(48371,		'Overige maat 134/140',				98382 ),
			(51573,		'Broeken',							98382 ),
			(51600,		'Jassen en jasjes',					98382 ),
			(51607,		'Rokken en jurken',					98382 ),
			(51622,		'Truien',							98382 ),
			(51710,		'Shirts',							98382 ),
			(77416,		'Jeans',							98382 ),
			(99736,		'Nachtkleding',						98382 ),
			(136642,	'Vesten',							98382 ),
			(156807,	'Setjes',							98382 ),
		(98384,		'Maat 146',							3051 ),
			(49046,		'Blouses',							98384 ),
			(49048,		'Overige maat 146',					98384 ),
			(51575,		'Broeken',							98384 ),
			(51602,		'Jassen en jasjes',					98384 ),
			(51609,		'Rokken en jurken',					98384 ),
			(51610,		'Truien',							98384 ),
			(51714,		'Shirts',							98384 ),
			(77418,		'Jeans',							98384 ),
			(98385,		'Setjes',							98384 ),
			(99737,		'Nachtkleding',						98384 ),
			(136643,	'Vesten',							98384 ),
		(98386,		'Maat 152/158',						3051 ),
			(13242,		'Jassen en jasjes',					98386 ),
			(13246,		'Truien',							98386 ),
			(13250,		'Blouses',							98386 ),
			(13254,		'Rokken en jurken',					98386 ),
			(13258,		'Broeken',							98386 ),
			(49051,		'Overige maat 152/158',				98386 ),
			(77419,		'Jeans',							98386 ),
			(99738,		'Nachtkleding',						98386 ),
			(128231,	'Shirts',							98386 ),
			(136644,	'Vesten',							98386 ),
			(156808,	'Setjes',							98386 ),
		(98388,		'Maat 164',							3051 ),
			(49065,		'Broeken',							98388 ),
			(49066,		'Jassen en jasjes',					98388 ),
			(49067,		'Rokken en jurken',					98388 ),
			(49068,		'Truien',							98388 ),
			(49071,		'Blouses',							98388 ),
			(49073,		'Overige maat 164',					98388 ),
			(77421,		'Jeans',							98388 ),
			(99739,		'Nachtkleding',						98388 ),
			(128235,	'Shirts',							98388 ),
			(136645,	'Vesten',							98388 ),
			(156809,	'Setjes',							98388 ),
		(98390,		'Maat 170/176',						3051 ),
			(13243,		'Jassen en jasjes',					98390 ),
			(13247,		'Truien',							98390 ),
			(13251,		'Blouses',							98390 ),
			(13255,		'Rokken en jurken',					98390 ),
			(13259,		'Broeken',							98390 ),
			(49078,		'Overige maat 170/176',				98390 ),
			(77422,		'Jeans',							98390 ),
			(99740,		'Nachtkleding',						98390 ),
			(128236,	'Shirts',							98390 ),
			(136646,	'Vesten',							98390 ),
			(156810,	'Setjes',							98390 ),
		(153797,	'Sokken',							3051 ),
	(9816,		'Dameskleding',						11450 ),
		(314,		'Overige dameskleding',				9816 ),
		(3020,		'Zwangerschapskleding',				9816 ),
		(12090,		'Broeken',							9816 ),
			(31021,		'Maat 32-34 (XXS/XS ),',			12090 ),
			(31022,		'Maat 36 (S ),',					12090 ),
			(31023,		'Maat 40-42 (L ),',					12090 ),
			(31024,		'Maat 44-46 (XL ),',				12090 ),
			(31027,		'Overige broeken',					12090 ),
			(127927,	'Maat 38 (M ),',					12090 ),
		(12989,		'Avondkleding',						9816 ),
			(31298,		'Overige avondkleding',				12989 ),
			(54274,		'Maat 32-34 (XXS/XS ),',			12989 ),
			(54280,		'Maat 36 (S ),',					12989 ),
			(54286,		'Maat 44-46 (XL ),',				12989 ),
			(54295,		'Maat 40-42 (L ),',					12989 ),
			(127925,	'Maat 38 (M ),',					12989 ),
		(12997,		'Combinaties en mantelpakken',		9816 ),
			(3010,		'Maat 40-42 (L ),',					12997 ),
			(12998,		'Maat 32-34 (XXS/XS ),',			12997 ),
			(12999,		'Maat 36 (S ),',					12997 ),
			(25918,		'Maat 44-46 (XL ),',				12997 ),
			(31300,		'Overige combinaties',				12997 ),
			(127930,	'Maat 38 (M ),',					12997 ),
		(13016,		'Jeans',							9816 ),
			(54364,		'W27 en kleiner',					13016 ),
			(54365,		'W28',								13016 ),
			(54366,		'W29',								13016 ),
			(54367,		'W30',								13016 ),
			(54368,		'W31',								13016 ),
			(54369,		'W32',								13016 ),
			(54370,		'W33-W35',							13016 ),
			(54371,		'W36-W38',							13016 ),
		(13021,		'Blouses',							9816 ),
			(31304,		'Overige blouses',					13021 ),
			(54314,		'Maat 32-34 (XXS/XS ),',			13021 ),
			(54322,		'Maat 36 (S ),',					13021 ),
			(54330,		'Maat 44-46 (XL ),',				13021 ),
			(54342,		'Maat 40-42 (L ),',					13021 ),
			(127926,	'Maat 38 (M ),',					13021 ),
		(13029,		'Truien',							9816 ),
			(31306,		'Overige truien',					13029 ),
			(54510,		'Maat 32-34 (XXS/XS ),',			13029 ),
			(54515,		'Maat 36 (S ),',					13029 ),
			(54520,		'Maat 40-42 (L ),',					13029 ),
			(54521,		'Maat 44-46 (XL ),',				13029 ),
			(127934,	'Maat 38 (M ),',					13029 ),
		(13045,		'Jasjes en blazers',				9816 ),
			(31308,		'Overige jasjes en blazers',		13045 ),
			(54346,		'Maat 32-34 (XXS/XS ),',			13045 ),
			(54349,		'Maat 36 (S ),',					13045 ),
			(54352,		'Maat 40-42 (L ),',					13045 ),
			(54355,		'Maat 44-46 (XL ),',				13045 ),
			(127929,	'Maat 38 (M ),',					13045 ),
		(13493,		'Rokken',							9816 ),
			(31302,		'Overige rokken',					13493 ),
			(54535,		'Maat 32-34 (XXS/XS ),',			13493 ),
			(54536,		'Maat 36 (S ),',					13493 ),
			(54537,		'Maat 40-42 (L ),',					13493 ),
			(54538,		'Maat 44-46 (XL ),',				13493 ),
			(127935,	'Maat 38 (M ),',					13493 ),
		(15720,		'Bruidskleding',					9816 ),
			(46515,		'Overige bruidskleding',			15720 ),
			(127928,	'Maat 38 (M ),',					15720 ),
			(130208,	'Maat 32-34 (XXS/XS ),',			15720 ),
			(130211,	'Maat 36 (S ),',					15720 ),
			(130212,	'Maat 40-42 (L ),',					15720 ),
			(130213,	'Maat 44-46 (XL ),',				15720 ),
		(19736,		'Tops',								9816 ),
			(31305,		'Overige tops',						19736 ),
			(54559,		'Maat 32-34 (XXS/XS ),',			19736 ),
			(54560,		'Maat 36 (S ),',					19736 ),
			(54561,		'Maat 40-42 (L ),',					19736 ),
			(54562,		'Maat 44-46 (XL ),',				19736 ),
			(84368,		'Maat 38 (M ),',					19736 ),
		(24046,		'Jurken',							9816 ),
			(31301,		'Overige jurken',					24046 ),
			(54492,		'Maat 32-34 (XXS/XS ),',			24046 ),
			(54495,		'Maat 36 (S ),',					24046 ),
			(54498,		'Maat 40-42 (L ),',					24046 ),
			(54501,		'Maat 44-46 (XL ),',				24046 ),
			(127932,	'Maat 38 (M ),',					24046 ),
		(31058,		'T-shirts',							9816 ),
			(39061,		'Overige T-shirts',					31058 ),
			(84396,		'Maat 32-34 (XXS/XS ),',			31058 ),
			(84402,		'Maat 36 (S ),',					31058 ),
			(84408,		'Maat 40-42 (L ),',					31058 ),
			(84414,		'Maat 44-46 (XL ),',				31058 ),
			(127936,	'Maat 38 (M ),',					31058 ),
		(33092,		'Jassen',							9816 ),
			(33093,		'Maat 32-34 (XXS/XS ),',			33092 ),
			(33094,		'Maat 36 (S ),',					33092 ),
			(33095,		'Maat 40-42 (L ),',					33092 ),
			(33096,		'Maat 44-46 (XL ),',				33092 ),
			(33100,		'Overige jassen',					33092 ),
			(127931,	'Maat 38 (M ),',					33092 ),
		(44450,		'Badjassen',						9816 ),
		(45838,		'Sokken',							9816 ),
		(53159,		'Shirts lange mouw',				9816 ),
			(31063,		'Overige shirts lange mouw',		53159 ),
			(84399,		'Maat 32-34 (XXS/XS ),',			53159 ),
			(84405,		'Maat 36-38 (S/M ),',				53159 ),
			(84411,		'Maat 40-42 (L ),',					53159 ),
			(84417,		'Maat 44-46 (XL ),',				53159 ),
		(98304,		'Merkkleding',						9816 ),
			(98305,		'Maat 32-34 (XXS/XS ),',			98304 ),
			(98306,		'Maat 36 (S ),',					98304 ),
			(98307,		'Maat 40-42 (L ),',					98304 ),
			(98308,		'Maat 44-46 (XL ),',				98304 ),
			(98309,		'Overige merkkleding',				98304 ),
			(127933,	'Maat 38 (M ),',					98304 ),
	(9817,		'Herenkleding',						11450 ),
		(313,		'Overige herenkleding',				9817 ),
		(8464,		'Merkkleding',						9817 ),
		(13126,		'Truien',							9817 ),
		(13135,		'Pantalons',						9817 ),
		(24071,		'Jeans',							9817 ),
		(32309,		'Kostuums, pakken en smokings',		9817 ),
			(32331,		'Overige maten',					32309 ),
			(54593,		'Maat 44-45',						32309 ),
			(54596,		'Maat 48-49',						32309 ),
			(54599,		'Maat 56-57',						32309 ),
			(54611,		'Maat 52-53',						32309 ),
			(80701,		'Maat 46-47',						32309 ),
			(80706,		'Maat 50-51',						32309 ),
			(80711,		'Maat 58-59',						32309 ),
			(80716,		'Maat 54-55',						32309 ),
		(32315,		'T-shirts korte mouw',				9817 ),
		(33111,		'Jassen',							9817 ),
		(34391,		'Overhemden',						9817 ),
			(2999,		'Casual',							34391 ),
			(128003,	'Klassiek',							34391 ),
		(65741,		'Broeken',							9817 ),
		(84539,		'Ondergoed',						9817 ),
			(33120,		'Overige ondergoed',				84539 ),
			(84541,		'Boxershorts',						84539 ),
			(84543,		'Hemden',							84539 ),
		(84559,		'Sokken',							9817 ),
		(127945,	'Shirts lange mouw',				9817 ),
		(151925,	'Badjassen',						9817 ),
	(12104,		'Damesschoenen',					11450 ),
		(15811,		'Gymschoenen',						12104 ),
		(23418,		'Sandalen en slippers',				12104 ),
		(23419,		'Platte schoenen',					12104 ),
		(23487,		'Overige damesschoenen',			12104 ),
		(28786,		'Plateauzolen',						12104 ),
		(51556,		'Pumps',							12104 ),
		(127937,	'Laarzen',							12104 ),
			(15816,		'Hoge laarzen',						127937 ),
			(40636,		'Enkellaarzen',						127937 ),
		(151447,	'Muiltjes',							12104 ),
	(12109,		'Accessoires',						11450 ),
		(1063,		'Overige accessoires',				12109 ),
		(12111,		'Sjaals en dassen',					12109 ),
		(35384,		'Handschoenen',						12109 ),
		(35385,		'Petten en caps',					12109 ),
		(39062,		'Paraplu''s en regenkleding',		12109 ),
		(44539,		'Zonnebrillen',						12109 ),
		(80565,		'Portemonees en beurzen',			12109 ),
		(80578,		'Riemen en bretels',				12109 ),
		(80587,		'Hoeden en mutsen',					12109 ),
		(80807,		'Stropdassen',						12109 ),
	(12136,		'Herenschoenen',					11450 ),
	(13154,		'Sportkleding',						11450 ),
		(24080,		'Sportschoenen',					13154 ),
		(36987,		'Shirts',							13154 ),
		(37005,		'Overige sportkleding',				13154 ),
		(42660,		'Aerobics- en fitnessmode',			13154 ),
		(153511,	'Trainingspakken',					13154 ),
	(15770,		'Bad- en strandmode',				11450 ),
		(30588,		'Zwembroeken en shorts',			15770 ),
		(44441,		'Overige bad- en strandmode',		15770 ),
		(84263,		'Bikini''s',						15770 ),
		(84269,		'Badpakken',						15770 ),
	(37008,		'Damestassen',						11450 ),
		(23116,		'Vintage tassen',					37008 ),
		(42526,		'Overige tassen',					37008 ),
		(80596,		'Aktetassen',						37008 ),
		(80597,		'Handtassen',						37008 ),
		(80599,		'Rugtassen',						37008 ),
		(93053,		'Avondtasjes',						37008 ),
		(93055,		'Schoudertassen',					37008 ),
		(93056,		'Weekendtassen',					37008 ),
	(80891,		'Kinderkleding- accessoires',		11450 ),
	(97120,		'Partijen en groothandel',			11450 ),
	(105163,	'Kinderkleding- unisex',			11450 ),
		(105164,	'Maat 92',							105163 ),
		(105165,	'Maat 98/104',						105163 ),
		(105166,	'Maat 110/116',						105163 ),
		(105167,	'Maat 122/128',						105163 ),
		(105168,	'Maat 134/140',						105163 ),
		(105169,	'Maat 146',							105163 ),
		(105170,	'Maat 152/158',						105163 ),
		(105171,	'Maat 164',							105163 ),
		(105172,	'Maat 170/176',						105163 ),
		(105173,	'Overige unisexkleding',			105163 ),
	(128240,	'Kinderkleding- schoenen',			11450 ),
		(17355,		'Unisex-schoenen',					128240 ),
		(80922,		'Meisjesschoenen',					128240 ),
			(32404,		'Overige meisjesschoenen',			80922 ),
			(80924,		'Maat 18-27',						80922 ),
			(80928,		'Maat 28-31',						80922 ),
			(80931,		'Maat 32-41',						80922 ),
		(80947,		'Jongensschoenen',					128240 ),
			(13236,		'Maat 32-41',						80947 ),
			(32372,		'Overige jongensschoenen',			80947 ),
			(80948,		'Maat 18-27',						80947 ),
			(80952,		'Maat 28-31',						80947 ),

-- 17 --
 (11700,	'Huis en tuin',						-1),
	(2032,		'Tuin',								11700 ),
		(8438,		'Overige tuinaccessoires',			2032 ),
		(19809,		'Barbecues',						2032 ),
		(19817,		'Vijvers en fonteinen',				2032 ),
		(20498,		'Bemesting en onderhoud',			2032 ),
		(20721,		'Parasols',							2032 ),
		(20727,		'Zwembaden',						2032 ),
		(25863,		'Tuinmeubels',						2032 ),
			(3186,		'Overige tuinmeubels',				25863 ),
			(84091,		'Tuinbanken',						25863 ),
			(84095,		'Tuintafels',						25863 ),
			(84103,		'Tuinstoelen',						25863 ),
			(118870,	'Accessoires',						25863 ),
		(26685,		'Hogedrukreinigers',				2032 ),
		(28727,		'Grasmaaiers',						2032 ),
		(40601,		'Tuindecoratie en -beelden',		2032 ),
		(40602,		'Tuinkabouters',					2032 ),
		(40605,		'Zaden en stekken',					2032 ),
		(50239,		'Tuingereedschap',					2032 ),
		(75656,		'Bloembollen',						2032 ),
		(84064,		'Tuinverlichting',					2032 ),
		(84136,		'Tuinhuisjes, serres en kassen',	2032 ),
		(114056,	'Verwarming buiten',				2032 ),
		(118858,	'Veranda''s en terrasmateriaal',	2032 ),
		(119656,	'Bomen en struiken',				2032 ),
		(132364,	'Bewatering',						2032 ),
		(132379,	'Schuttingen en hekken',			2032 ),
		(149565,	'Partytenten',						2032 ),
		(151637,	'Bloemen en planten',				2032 ),
	(3192,		'Meubels en wonen',					11700 ),
		(12294,		'Klokken en uurwerken',				3192 ),
		(19862,		'Kasten en vitrines',				3192 ),
		(20453,		'Dekens',							3192 ),
		(20460,		'Beddengoed en kussens',			3192 ),
		(20563,		'Sierkussens',						3192 ),
		(20571,		'Tapijten en vloeren',				3192 ),
		(25817,		'Decoratie',						3192 ),
			(20510,		'Overige decoratie',				25817 ),
			(108299,	'Schilderijen',						25817 ),
			(127923,	'Grote voorwerpen',					25817 ),
			(127924,	'Kleine voorwerpen',				25817 ),
		(26677,		'Badkamers en sanitair',			3192 ),
		(27532,		'Overige meubels en wonen',			3192 ),
		(31291,		'Lampen en verlichting',			3192 ),
		(32254,		'Bedden en lattenbodems',			3192 ),
		(38233,		'Spiegels',							3192 ),
		(40587,		'Handdoeken',						3192 ),
		(45515,		'Gordijnen',						3192 ),
		(54201,		'Matrassen',						3192 ),
		(54225,		'Banken en sofa''s',				3192 ),
		(54235,		'Stoelen en fauteuils',				3192 ),
		(54250,		'Tafels en bureaus',				3192 ),
		(54268,		'Kachels en haarden',				3192 ),
		(108428,	'Zitzakken en zitballen',			3192 ),
		(119688,	'Kamerplanten',						3192 ),
	(8440,		'Dierbenodigdheden',				11700 ),
		(11285,		'Benodigdheden honden',				8440 ),
		(20734,		'Benodigdheden vogels',				8440 ),
		(20754,		'Benodigdheden vissen',				8440 ),
		(24354,		'Benodigdheden katten',				8440 ),
		(26696,		'Benodigdheden knaagdieren',		8440 ),
		(26703,		'Overige dierbenodigdheden',		8440 ),
		(27559,		'Benodigdheden reptielen',			8440 ),
		(77694,		'Benodigdheden paarden',			8440 ),
	(19859,		'Gereedschappen',					11700 ),
		(303,		'Overig gereedschap',				19859 ),
		(19804,		'Gereedschap (hand ),',				19859 ),
		(30503,		'Gereedschap (elektrisch ),',		19859 ),
		(130104,	'Ladders',							19859 ),
	(20626,		'Keuken- en kookbenodigdheden',		11700 ),
		(3194,		'Overig keuken en koken',			20626 ),
		(20628,		'Pannen en schalen',				20626 ),
		(24318,		'Serviesgoed',						20626 ),
		(32464,		'Glazen en bekers',					20626 ),
		(34378,		'Bakbenodigdheden',					20626 ),
		(36935,		'Messen',							20626 ),
		(39022,		'Bestek en keukengerei',			20626 ),
		(54120,		'Barbenodigdheden',					20626 ),
		(54123,		'Dienbladen',						20626 ),
		(59045,		'Tupperware en voorraadpotten',		20626 ),
		(114318,	'Onderzetters',						20626 ),
		(114356,	'Peper- en zoutstellen',			20626 ),
		(151944,	'Vuilnisbakken en pedaalemmers',	20626 ),
	(20710,		'Huishoudelijke apparatuur',		11700 ),
		(12952,		'Overige huishoudelijke app',		20710 ),
		(30322,		'Wasmachines en -drogers',			20710 ),
		(30335,		'Stofzuigers',						20710 ),
		(69197,		'Ventilatoren en airco''s',			20710 ),
		(77234,		'Strijkijzers en -planken',			20710 ),
		(77305,		'Personenweegschalen',				20710 ),
	(25822,		'Overige huis en tuin',				11700 ),
	(25849,		'Keukens en keukenonderdelen',		11700 ),
	(26672,		'Badkamers en -onderdelen',			11700 ),
	(30329,		'Keukenapparatuur',					11700 ),
		(12165,		'Overige keukenapparatuur',			30329 ),
		(14824,		'Keukenweegschalen',				30329 ),
		(22534,		'Mixers',							30329 ),
		(30311,		'Fornuizen en ovens',				30329 ),
		(30332,		'Afwasmachines',					30329 ),
		(32901,		'Koffiezetapparaten',				30329 ),
		(45739,		'Afzuigkappen',						30329 ),
		(45747,		'Magnetrons',						30329 ),
		(65662,		'Koelkasten en diepvriezers',		30329 ),
		(77277,		'Broodroosters en tostimakers',		30329 ),
		(77288,		'Waterkokers',						30329 ),
		(99614,		'Broodmachines',					30329 ),
		(99640,		'Fondue- en gourmetsets',			30329 ),
		(153532,	'Sapmachines',						30329 ),
		(155678,	'Thuistaps',						30329 ),
	(30517,		'Bouwmaterialen',					11700 ),
	(32274,		'Verwarming binnen',				11700 ),
	(45805,		'Deuren',							11700 ),
	(114030,	'Naamplaten en huisnummers',		11700 );

INSERT INTO Rubriek(rubrieknummer, rubrieknaam, rubriek)
VALUES
-- 18 -- 
 (12081,	'Baby',								-1),
	(2984,		'Huishoudelijke benodigdheden',		12081 ),
		(15471,		'Babykamers en -meubels',			2984 ),
		(15476,		'Wiegen',							2984 ),
		(15477,		'Commodes',							2984 ),
		(18643,		'Beddengoed',						2984 ),
		(19747,		'Verlichting en decoratie',			2984 ),
		(23595,		'Beschermhekjes',					2984 ),
		(25653,		'Kinderstoelen en wipstoeltjes',	2984 ),
		(77109,		'Babyfoons',						2984 ),
		(105150,	'Overige huishoudelijk',			2984 ),
		(157301,	'Boxen',							2984 ),
		(157310,	'Bedjes',							2984 ),
	(8471,		'Babykleding - jongens',			12081 ),
		(127683,	'Maat 50',							8471 ),
			(8472,		'Overige maat 50',					127683 ),
			(57756,		'Setjes',							127683 ),
			(70184,		'Rompertjes',						127683 ),
			(70185,		'Broekjes',							127683 ),
			(70187,		'Jasjes',							127683 ),
			(70190,		'Sokjes',							127683 ),
			(70191,		'Pakjes',							127683 ),
			(76190,		'Truitjes en vestjes',				127683 ),
			(127692,	'Shirtjes en blouses',				127683 ),
		(127686,	'Maat 56',							8471 ),
			(14830,		'Overige maat 56',					127686 ),
			(70195,		'Shirtjes en blouses',				127686 ),
			(70196,		'Rompertjes',						127686 ),
			(70197,		'Broekjes',							127686 ),
			(70199,		'Jasjes',							127686 ),
			(70202,		'Sokjes',							127686 ),
			(70203,		'Pakjes',							127686 ),
			(70205,		'Truitjes en vestjes',				127686 ),
			(127695,	'Setjes',							127686 ),
		(127687,	'Maat 62',							8471 ),
			(8473,		'Overige maat 62',					127687 ),
			(38793,		'Shirtjes en blouses',				127687 ),
			(38794,		'Rompertjes',						127687 ),
			(38795,		'Broekjes',							127687 ),
			(38797,		'Jasjes',							127687 ),
			(38799,		'Pakjes',							127687 ),
			(38801,		'Truitjes en vestjes',				127687 ),
			(70209,		'Sokjes',							127687 ),
			(127699,	'Setjes',							127687 ),
		(127688,	'Maat 68',							8471 ),
			(12982,		'Overige maat 68',					127688 ),
			(32114,		'Shirtjes en blouses',				127688 ),
			(32115,		'Rompertjes',						127688 ),
			(32116,		'Broekjes',							127688 ),
			(32118,		'Jasjes',							127688 ),
			(32119,		'Pakjes',							127688 ),
			(32121,		'Truitjes en vestjes',				127688 ),
			(70212,		'Sokjes',							127688 ),
			(130490,	'Setjes',							127688 ),
		(127689,	'Maat 74',							8471 ),
			(8474,		'Overige maat 74',					127689 ),
			(32124,		'Shirtjes en blouses',				127689 ),
			(32125,		'Rompertjes',						127689 ),
			(32126,		'Broekjes',							127689 ),
			(32128,		'Jasjes',							127689 ),
			(32129,		'Pakjes',							127689 ),
			(32131,		'Truitjes en vestjes',				127689 ),
			(70215,		'Sokjes',							127689 ),
			(112106,	'Setjes',							127689 ),
		(127690,	'Maat 80',							8471 ),
			(12984,		'Overige maat 80',					127690 ),
			(34294,		'Shirtjes en blouses',				127690 ),
			(34295,		'Rompertjes',						127690 ),
			(34296,		'Broekjes',							127690 ),
			(34298,		'Jasjes',							127690 ),
			(34299,		'Pakjes',							127690 ),
			(34301,		'Truitjes en vestjes',				127690 ),
			(70218,		'Sokjes',							127690 ),
			(112125,	'Setjes',							127690 ),
		(127691,	'Maat 86',							8471 ),
			(12985,		'Overige maat 86',					127691 ),
			(34304,		'Shirtjes en blouses',				127691 ),
			(34305,		'Rompertjes',						127691 ),
			(34306,		'Broekjes',							127691 ),
			(34308,		'Jasjes',							127691 ),
			(34309,		'Pakjes',							127691 ),
			(34311,		'Truitjes en vestjes',				127691 ),
			(70221,		'Sokjes',							127691 ),
			(112138,	'Setjes',							127691 ),
	(8480,		'Overige babyartikelen',			12081 ),
	(15456,		'Verzorging',						12081 ),
		(15458,		'Overige verzorging',				15456 ),
		(23589,		'Spenen',							15456 ),
		(30244,		'Luieremmers',						15456 ),
		(30245,		'Potjes/wc-stoeltjes',				15456 ),
		(30246,		'Mondverzorging',					15456 ),
		(30247,		'Bad en hygiëne',					15456 ),
		(77113,		'Luiers',							15456 ),
		(99490,		'Verzorgingstassen',				15456 ),
		(106768,	'Aankleedkussens',					15456 ),
		(106793,	'Huidverzorging',					15456 ),
		(106801,	'Verschoondekens',					15456 ),
		(115329,	'Haarverzorging',					15456 ),
	(15468,		'Vervoer',							12081 ),
		(2989,		'Overig vervoer',					15468 ),
		(23610,		'Wandel- en kinderwagens',			15468 ),
		(23621,		'Buggy''s en joggers',				15468 ),
		(25664,		'Accessoires',						15468 ),
		(25668,		'Fiets- en autostoeltjes',			15468 ),
		(157276,	'Buikdragers',						15468 ),
		(157282,	'Rugdragers',						15468 ),
		(157287,	'Draagdoeken',						15468 ),
		(157318,	'Reisbedjes',						15468 ),
	(18634,		'Babyschoenen',						12081 ),
		(47628,		'Maat 18',							18634 ),
		(47632,		'Maat 19',							18634 ),
		(47636,		'Maat 20',							18634 ),
		(47640,		'Maat 21',							18634 ),
		(47641,		'Maat 22',							18634 ),
		(47645,		'Maat 23',							18634 ),
		(47649,		'Maat 24',							18634 ),
		(47653,		'Maat 25',							18634 ),
		(47657,		'Maat 26 en groter',				18634 ),
		(77049,		'Maat 16 en kleiner',				18634 ),
		(77058,		'Maat 17',							18634 ),
		(77098,		'Overige babyschoenen',				18634 ),
	(18637,		'Speelgoed',						12081 ),
		(2991,		'Overig speelgoed',					18637 ),
		(18638,		'Prentenboeken',					18637 ),
		(18639,		'Speelsets en speelkleden',			18637 ),
		(18640,		'Rammelaars en bijtringen',			18637 ),
		(19743,		'Zintuigontwikkeling',				18637 ),
		(22439,		'Loopstoelen en schommels',			18637 ),
		(22449,		'Houten speelgoed',					18637 ),
		(23609,		'Badspeeltjes',						18637 ),
		(42516,		'Muziekdoosjes en -mobielen',		18637 ),
		(106810,	'Knuffels',							18637 ),
	(36524,		'Babykleding - unisex',				12081 ),
		(127713,	'Maat 56',							36524 ),
			(102119,	'Shirtjes en blouses',				127713 ),
			(102121,	'Rompertjes',						127713 ),
			(102141,	'Broekjes',							127713 ),
			(102162,	'Jasjes',							127713 ),
			(102206,	'Truitjes en vestjes',				127713 ),
			(102208,	'Sokjes',							127713 ),
			(102210,	'Pakjes',							127713 ),
			(105223,	'Overige maat 56',					127713 ),
			(127721,	'Setjes',							127713 ),
		(127714,	'Maat 68',							36524 ),
			(102848,	'Shirtjes en blouses',				127714 ),
			(102850,	'Rompertjes',						127714 ),
			(102870,	'Broekjes',							127714 ),
			(102890,	'Jasjes',							127714 ),
			(102916,	'Sokjes',							127714 ),
			(102919,	'Pakjes',							127714 ),
			(102941,	'Truitjes en vestjes',				127714 ),
			(102964,	'Overige maat 68',					127714 ),
			(127729,	'Setjes',							127714 ),
		(127715,	'Maat 80',							36524 ),
			(103230,	'Shirtjes en blouses',				127715 ),
			(103232,	'Rompertjes',						127715 ),
			(103252,	'Broekjes',							127715 ),
			(103272,	'Jasjes',							127715 ),
			(103486,	'Pakjes',							127715 ),
			(103490,	'Sokjes',							127715 ),
			(103492,	'Overige maat 80',					127715 ),
			(103512,	'Truitjes en vestjes',				127715 ),
			(127731,	'Setjes',							127715 ),
		(127716,	'Maat 86',							36524 ),
			(103534,	'Shirtjes en blouses',				127716 ),
			(103536,	'Rompertjes',						127716 ),
			(103556,	'Broekjes',							127716 ),
			(103576,	'Jasjes',							127716 ),
			(103600,	'Pakjes',							127716 ),
			(103604,	'Sokjes',							127716 ),
			(103624,	'Truitjes en vestjes',				127716 ),
			(103626,	'Overige maat 86',					127716 ),
			(127732,	'Setjes',							127716 ),
		(127717,	'Maat 50',							36524 ),
			(101987,	'Shirtjes en blouses',				127717 ),
			(101989,	'Rompertjes',						127717 ),
			(102009,	'Broekjes',							127717 ),
			(102043,	'Jasjes',							127717 ),
			(102069,	'Sokjes',							127717 ),
			(102071,	'Pakjes',							127717 ),
			(102093,	'Truitjes en vestjes',				127717 ),
			(102116,	'Overige maat 50',					127717 ),
			(112297,	'Setjes',							127717 ),
		(127718,	'Maat 62',							36524 ),
			(102273,	'Shirtjes en blouses',				127718 ),
			(102275,	'Rompertjes',						127718 ),
			(102295,	'Broekjes',							127718 ),
			(102601,	'Jasjes',							127718 ),
			(102627,	'Pakjes',							127718 ),
			(102631,	'Sokjes',							127718 ),
			(102651,	'Truitjes en vestjes',				127718 ),
			(103361,	'Overige maat 62',					127718 ),
			(112359,	'Setjes',							127718 ),
		(127719,	'Maat 74',							36524 ),
			(102987,	'Shirtjes en blouses',				127719 ),
			(102989,	'Rompertjes',						127719 ),
			(103009,	'Broekjes',							127719 ),
			(103031,	'Jasjes',							127719 ),
			(103150,	'Pakjes',							127719 ),
			(103154,	'Sokjes',							127719 ),
			(103174,	'Truitjes en vestjes',				127719 ),
			(103188,	'Overige maat 74',					127719 ),
			(127730,	'Setjes',							127719 ),
	(73738,		'Babykleding - meisjes',			12081 ),
		(127648,	'Maat 50',							73738 ),
			(57814,		'Setjes',							127648 ),
			(70186,		'Jurkjes en rokjes',				127648 ),
			(73741,		'Shirtjes en blouses',				127648 ),
			(73742,		'Rompertjes',						127648 ),
			(73743,		'Broekjes',							127648 ),
			(73744,		'Jasjes',							127648 ),
			(73747,		'Sokjes',							127648 ),
			(73748,		'Pakjes',							127648 ),
			(73750,		'Overige maat 50',					127648 ),
			(76597,		'Truitjes en vestjes',				127648 ),
		(127652,	'Maat 56',							73738 ),
			(73753,		'Shirtjes en blouses',				127652 ),
			(73754,		'Rompertjes',						127652 ),
			(73755,		'Broekjes',							127652 ),
			(73756,		'Jasjes',							127652 ),
			(73759,		'Sokjes',							127652 ),
			(73760,		'Pakjes',							127652 ),
			(73762,		'Truitjes en vestjes',				127652 ),
			(73764,		'Overige maat 56',					127652 ),
			(76626,		'Jurkjes en rokjes',				127652 ),
			(127658,	'Setjes',							127652 ),
		(127653,	'Maat 62',							73738 ),
			(57825,		'Setjes',							127653 ),
			(73870,		'Shirtjes en blouses',				127653 ),
			(73871,		'Rompertjes',						127653 ),
			(73872,		'Broekjes',							127653 ),
			(73873,		'Jasjes',							127653 ),
			(73876,		'Sokjes',							127653 ),
			(73877,		'Pakjes',							127653 ),
			(73879,		'Truitjes en vestjes',				127653 ),
			(73881,		'Overige maat 62',					127653 ),
			(76716,		'Jurkjes en rokjes',				127653 ),
		(127654,	'Maat 68',							73738 ),
			(73919,		'Shirtjes en blouses',				127654 ),
			(73920,		'Rompertjes',						127654 ),
			(73921,		'Broekjes',							127654 ),
			(73922,		'Jasjes',							127654 ),
			(73925,		'Sokjes',							127654 ),
			(73926,		'Pakjes',							127654 ),
			(73928,		'Truitjes en vestjes',				127654 ),
			(73930,		'Overige maat 68',					127654 ),
			(76743,		'Jurkjes en rokjes',				127654 ),
			(127665,	'Setjes',							127654 ),
		(127667,	'Maat 74',							73738 ),
			(74009,		'Shirtjes en blouses',				127667 ),
			(74010,		'Rompertjes',						127667 ),
			(74011,		'Broekjes',							127667 ),
			(74012,		'Jasjes',							127667 ),
			(74015,		'Sokjes',							127667 ),
			(74016,		'Pakjes',							127667 ),
			(74018,		'Truitjes en vestjes',				127667 ),
			(74020,		'Overige maat 74',					127667 ),
			(76788,		'Jurkjes en rokjes',				127667 ),
			(112216,	'Setjes',							127667 ),
		(127668,	'Maat 80',							73738 ),
			(74036,		'Shirtjes en blouses',				127668 ),
			(74037,		'Rompertjes',						127668 ),
			(74038,		'Broekjes',							127668 ),
			(74039,		'Jasjes',							127668 ),
			(74042,		'Sokjes',							127668 ),
			(74043,		'Pakjes',							127668 ),
			(74045,		'Truitjes en vestjes',				127668 ),
			(74047,		'Overige maat 80',					127668 ),
			(76869,		'Jurkjes en rokjes',				127668 ),
			(112231,	'Setjes',							127668 ),
		(127680,	'Maat 86',							73738 ),
			(74057,		'Shirtjes en blouses',				127680 ),
			(74058,		'Rompertjes',						127680 ),
			(74059,		'Broekjes',							127680 ),
			(74060,		'Jasjes',							127680 ),
			(74063,		'Sokjes',							127680 ),
			(74064,		'Pakjes',							127680 ),
			(74066,		'Truitjes en vestjes',				127680 ),
			(74068,		'Overige maat 86',					127680 ),
			(76914,		'Jurkjes en rokjes',				127680 ),
			(112283,	'Setjes',							127680 ),
	(106769,	'Voeding',							12081 ),
		(15460,		'Overige voeding',					106769 ),
		(23590,		'Borstvoedingbenodigdheden',		106769 ),
		(106770,	'Flessen',							106769 ),
		(106778,	'Flessenwarmers',					106769 ),
		(106782,	'Slabbetjes en schouderdoeken',		106769 ),
		(106789,	'Sterilisators',					106769 ),
		(141286,	'Drinkbekers',						106769 ),
		(157329,	'Eetsets en bestek',				106769 ),
	(112095,	'Babyslofjes',						12081 ),
	(115334,	'Sieraden',							12081 ),
	(127733,	'Babykleding - accessoires',		12081 ),
		(112355,	'Mutsen, sjaals en wantjes',		127733 ),
		(121594,	'Hoedjes en petjes',				127733 ),
		(129796,	'Overige babyaccessoires',			127733 ),

-- 19 -- 
 (12155,	'Gezondheid en verzorging',			-1),
	(11838,		'Lichaamsverzorging',				12155 ),
		(22538,		'Overige lichaamsverzorging',		11838 ),
		(36432,		'Handcrèmes',						11838 ),
		(47903,		'Bad- en doucheproducten',			11838 ),
			(36858,		'Badschuim',						47903 ),
			(47904,		'Badzout',							47903 ),
			(47905,		'Badolie',							47903 ),
			(47907,		'Overige badproducten',				47903 ),
			(107076,	'Bruisballen',						47903 ),
			(110150,	'Douchegel',						47903 ),
			(124369,	'Douchecrèmes',						47903 ),
		(47908,		'Deodorants',						11838 ),
		(47914,		'Lotions',							11838 ),
		(47917,		'Zeep',								11838 ),
		(47924,		'Ontharing voor dames',				11838 ),
		(107040,	'Anti-cellulitis',					11838 ),
		(107077,	'Hygiëne voor dames',				11838 ),
		(113851,	'Bruiningsproducten',				11838 ),
	(12157,		'Parfum, eau en after shave',		12155 ),
		(47954,		'Dames',							12157 ),
		(47955,		'Heren',							12157 ),
		(47975,		'Unisexparfums',					12157 ),
	(13264,		'Make-up',							12155 ),
		(36863,		'Ogen',								13264 ),
		(36867,		'Lippen',							13264 ),
		(47943,		'Teint',							13264 ),
		(107952,	'Overige make-up',					13264 ),
	(17351,		'Overige gezondheid',				12155 ),
	(22490,		'Optiek',							12155 ),
		(11373,		'Loepen',							22490 ),
		(22491,		'Overige optiek',					22490 ),
		(28958,		'Brillen en monturen dames',		22490 ),
		(28972,		'Brillen en monturen kinderen',		22490 ),
		(28973,		'Brillenhouders en -etuis',			22490 ),
		(30369,		'Contactlenzen',					22490 ),
		(36886,		'Brillen en monturen heren',		22490 ),
		(107091,	'Contactlenzenvloeistof',			22490 ),
		(127470,	'Brillenreiniging',					22490 ),
		(135905,	'Brillen en monturen unisex',		22490 ),
	(26528,		'Gezichtsverzorging',				12155 ),
		(22537,		'Overige gezichtsverzorging',		26528 ),
		(36358,		'Anti-rimpelproducten',				26528 ),
		(45172,		'Huidverzorging',					26528 ),
		(47861,		'Reinigingsproducten',				26528 ),
		(96392,		'Kuren en maskers',					26528 ),
		(96408,		'Nachtverzorging',					26528 ),
		(96424,		'Dagverzorging',					26528 ),
		(124329,	'Ogenverzorging',					26528 ),
	(32442,		'Revalidatie en hulpmiddelen',		12155 ),
	(32443,		'EHBO-producten',					12155 ),
	(33914,		'Tatoeages',						12155 ),
	(36872,		'Solarium- en saunaproducten',		12155 ),
	(47867,		'Gezondheidsartikelen',				12155 ),
		(11777,		'Therapeutische producten',			47867 ),
		(26535,		'Overige gezondheidsartikelen',		47867 ),
		(37822,		'Acupunctuur',						47867 ),
		(40100,		'Ontspanningsproducten',			47867 ),
		(47868,		'Allergieproducten',				47867 ),
		(47873,		'Voedingssupplementen',				47867 ),
		(70264,		'Massageproducten',					47867 ),
		(106822,	'Dieetproducten',					47867 ),
	(47879,		'Haarverzorging',					12155 ),
		(11853,		'Overige haarverzorging',			47879 ),
		(31413,		'Haargroeimiddelen',				47879 ),
		(47880,		'Haarverf',							47879 ),
		(47884,		'Haarversiering',					47879 ),
		(47898,		'Spoelingen',						47879 ),
		(82861,		'Shampoo',							47879 ),
		(82883,		'Pruiken en haarstukjes',			47879 ),
		(88579,		'Extensies',						47879 ),
		(106928,	'Gel en wax',						47879 ),
		(124353,	'Haarborstels',						47879 ),
		(127449,	'Spray',							47879 ),
	(47945,		'Manicure en nagels',				12155 ),
		(8397,		'Manicure',							47945 ),
		(26527,		'Overige manicure en nagels',		47945 ),
		(47939,		'Nagellak',							47945 ),
		(58937,		'Kunstnagels',						47945 ),
	(47949,		'Pedicure',							12155 ),
	(48070,		'Zonnecrème en aftersun',			12155 ),
	(48079,		'Mond- en gebitsverzorging',		12155 ),
		(48082,		'Mondreiniging',					48079 ),
		(48084,		'Tandpasta',						48079 ),
		(48085,		'Overige mondverzorging',			48079 ),
		(110232,	'Tandenborstels - hand',			48079 ),
		(110234,	'Tandzijde en floss',				48079 ),
		(113902,	'Tandenborstels - automatisch',		48079 ),
	(82897,		'Kindercosmetica',					12155 ),
	(107035,	'Scheerproducten',					12155 ),
		(47921,		'Scheerapparaten',					107035 ),
		(47930,		'Scheerschuim',						107035 ),
		(47931,		'Scheermesjes',						107035 ),
		(107034,	'Overige scheerproducten',			107035 ),
 
-- 20 -- 
 (12576,	'Industrie en kantoor',				-1),
	(9431,		'Diensten',							12576 ),
		(9559,		'Cursussen en opleidingen',			9431 ),
		(9560,		'Financieel en juridisch',			9431 ),
		(9574,		'Overige diensten',					9431 ),
		(22351,		'Facilitaire dienstverlening',		9431 ),
		(22361,		'Computers en IT',					9431 ),
		(110684,	'Bouw',								9431 ),
		(110699,	'Huishoudelijk',					9431 ),
		(110703,	'Tuin',								9431 ),
		(110717,	'Sport en welzijn',					9431 ),
		(110747,	'Marketing',						9431 ),
		(110757,	'Evenementen',						9431 ),
		(110775,	'Dierenverzorging en -training',	9431 ),
		(110780,	'Transport en logistiek',			9431 ),
	(9435,		'Groothandel en restpartijen',		12576 ),
	(9715,		'Overige industrie en kantoor',		12576 ),
	(9815,		'Kantoorartikelen en inrichting',	12576 ),
		(16991,		'Kantoorartikelen',					9815 ),
		(27691,		'Kantoorapparatuur',				9815 ),
		(27704,		'Presentatiemateriaal',				9815 ),
		(34345,		'Overige kantoorartikelen',			9815 ),
		(62441,		'Verpakkingen en verzending',		9815 ),
		(62464,		'Kantoormeubilair',					9815 ),
		(62531,		'Koffertjes en aktetassen',			9815 ),
		(62534,		'Technisch tekenen',				9815 ),
		(68484,		'Relatiegeschenken en reclame',		9815 ),
	(11262,		'Domeinnamen en webhosting',		12576 ),
	(11748,		'Land- en tuinbouw',				12576 ),
	(11815,		'Medische benodigdheden',			12576 ),
	(11874,		'Horeca',							12576 ),
	(11890,		'Winkelinrichting en inventaris',	12576 ),
	(34935,		'Bouwmateriaal',					12576 ),
	(62458,		'Visitekaartjes',					12576 ),
	(123099,	'Gereedschappen en machines',		12576 ),
	(124418,	'Meet- en regelapparatuur',			12576 ),
 
-- 21 -- 
 (14616,	'Games en consoles',				-1),
	(8119,		'Partijen en groothandel',			14616 ),
	(8241,		'Overige games en consoles',		14616 ),
	(11046,		'PC games',							14616 ),
		(3606,		'Overige PC games',					11046 ),
		(11047,		'Actie en avontuur',				11046 ),
		(11048,		'Arcade',							11046 ),
		(11049,		'Racen',							11046 ),
		(11050,		'Rollenspellen',					11046 ),
		(11051,		'Simulatie',						11046 ),
		(11053,		'Strategie',						11046 ),
		(27232,		'Kinderen en familie',				11046 ),
		(27234,		'Schieten',							11046 ),
		(41069,		'Sport',							11046 ),
		(91511,		'Educatief',						11046 ),
	(11988,		'Retro spelcomputers',				14616 ),
		(187,		'Overige retro games',				11988 ),
		(3526,		'Atari',							11988 ),
		(8097,		'MSX games',						11988 ),
		(151991,	'Commodore- en amigagames',			11988 ),
	(15110,		'Sega',								14616 ),
		(3653,		'Mega drive',						15110 ),
		(3665,		'Saturn',							15110 ),
		(4313,		'Dreamcast',						15110 ),
		(38576,		'Game Gear',						15110 ),
		(139972,	'Overige Sega',						15110 ),
	(21186,		'Playstation 2',					14616 ),
		(11328,		'Consoles',							21186 ),
		(15122,		'Games',							21186 ),
			(11321,		'Actie en avontuur',				15122 ),
			(11323,		'Racen',							15122 ),
			(11324,		'Rollenspellen',					15122 ),
			(11326,		'Sport',							15122 ),
			(11327,		'Strategie',						15122 ),
			(16157,		'Overige games',					15122 ),
			(27256,		'Schieten',							15122 ),
			(72493,		'Arcade',							15122 ),
			(72494,		'Kinderen en familie',				15122 ),
			(72495,		'Simulatie',						15122 ),
		(117040,	'Accessoires',						21186 ),
	(27713,		'Playstation',						14616 ),
		(3727,		'Consoles',							27713 ),
		(15120,		'Games',							27713 ),
		(38615,		'Accessoires',						27713 ),
	(27717,		'Xbox',								14616 ),
		(20387,		'Consoles',							27717 ),
		(27183,		'Games',							27717 ),
		(68259,		'Accessoires',						27717 ),
	(30307,		'Gamecube',							14616 ),
		(20389,		'Accessoires',						30307 ),
		(20391,		'Consoles',							30307 ),
		(27216,		'Games',							30307 ),
	(37209,		'Nintendo overig',					14616 ),
		(3594,		'SNES (Supernintendo ),',			37209 ),
		(3617,		'NES',								37209 ),
		(8168,		'Overige Nintendo',					37209 ),
		(112733,	'NES spellen',						37209 ),
		(112751,	'SNES spellen',						37209 ),
	(38577,		'Gameboy en Gameboy color',			14616 ),
		(38578,		'Accessoires',						38577 ),
		(38580,		'Consoles',							38577 ),
		(112679,	'Games',							38577 ),
	(100800,	'Nintendo DS',						14616 ),
		(75555,		'Consoles',							100800 ),
		(91509,		'Accessoires',						100800 ),
		(91510,		'Games',							100800 ),
	(100812,	'Sony PSP',							14616 ),
		(75556,		'Consoles',							100812 ),
		(127741,	'Accessoires',						100812 ),
		(127747,	'Games',							100812 ),
	(105151,	'Gameboy Advance en GBA SP',		14616 ),
		(48453,		'Accessoires',						105151 ),
		(48455,		'Consoles',							105151 ),
		(112697,	'Games',							105151 ),
			(112698,	'Actie en avontuur',				112697 ),
			(112700,	'Kinderen en familie',				112697 ),
			(112708,	'Racen',							112697 ),
			(112710,	'Schieten',							112697 ),
			(112712,	'Sport',							112697 ),
			(112714,	'Overige games',					112697 ), 
	(112823,	'Playstation 3',					14616 ),
		(117562,	'Games',							112823 ),
		(147177,	'Accessoires',						112823 ),
		(149492,	'Consoles',							112823 ),
	(112845,	'Xbox 360',							14616 ),
		(112846,	'Accessoires',						112845 ),
		(112847,	'Games',							112845 ),
		(112848,	'Consoles',							112845 ),
	(127897,	'Nintendo 64',						14616 ),
		(3580,		'Accessories',						127897 ),
		(3591,		'Consoles',							127897 ),
		(15103,		'Games',							127897 ),
	(147176,	'Nintendo Wii',						14616 ),
		(145519,	'Games',							147176 ),
		(145520,	'Consoles',							147176 ),
		(145526,	'Accessoires',						147176 ),

-- 22 -- 
 (14675,	'GSM en telecom',					-1),
	(9355,		'GSM''s',							14675 ),
	(9394,		'Accessoires en onderdelen',		14675 ),
		(15073,		'Batterijen en opladers',			9394 ),
			(12417,		'Motorola',							15073 ),
			(12423,		'Nokia',							15073 ),
			(12429,		'Panasonic',						15073 ),
			(12434,		'Philips',							15073 ),
			(12440,		'Sagem',							15073 ),
			(12446,		'Samsung',							15073 ),
			(12452,		'Siemens',							15073 ),
			(15034,		'Overige batterijen en opladers',	15073 ),
			(42416,		'BenQ',								15073 ),
			(48169,		'NEC',								15073 ),
			(48171,		'Sharp',							15073 ),
			(62795,		'LG',								15073 ),
			(62796,		'Mitsubishi',						15073 ),
			(62801,		'Sony Ericsson',					15073 ),
		(23979,		'Datakabels',						9394 ),
			(13436,		'Motorola',							23979 ),
			(13437,		'Nokia',							23979 ),
			(13441,		'Samsung',							23979 ),
			(23980,		'Overige datakabels',				23979 ),
			(62805,		'Sony Ericsson',					23979 ),
			(111310,	'Siemens',							23979 ),
		(24040,		'Telefoontasjes',					9394 ),
			(15036,		'Overige telefoontasjes',			24040 ),
			(32976,		'Sony Ericsson',					24040 ),
			(111139,	'Motorola',							24040 ),
			(111234,	'Samsung',							24040 ),
			(111323,	'Siemens',							24040 ),
			(123176,	'Nokia',							24040 ),
		(24045,		'Overige accessoires',				9394 ),
		(40574,		'Displays',							9394 ),
		(48163,		'Onderdelen',						9394 ),
		(56599,		'Telefoonsieraden',					9394 ),
		(111202,	'Frontjes en covers',				9394 ),
			(12427,		'Overige frontjes en covers',		111202 ),
			(20353,		'Motorola',							111202 ),
			(42429,		'Nokia',							111202 ),
			(68037,		'Samsung',							111202 ),
			(68038,		'Siemens',							111202 ),
			(75542,		'Sony Ericsson',					111202 ),
		(111363,	'Bluetooth',						9394 ),
		(115680,	'Headsets en carkits',				9394 ),
			(9399,		'Siemens',							115680 ),
			(24001,		'Overige headsets en carkits',		115680 ),
			(24011,		'Panasonic',						115680 ),
			(24012,		'Philips',							115680 ),
			(24013,		'Sagem',							115680 ),
			(24014,		'Samsung',							115680 ),
			(32973,		'Sony Ericsson',					115680 ),
			(48182,		'NEC',								115680 ),
			(48183,		'Sharp',							115680 ),
			(62810,		'LG',								115680 ),
			(62811,		'Mitsubishi',						115680 ),
			(111165,	'Nokia',							115680 ),
		(118260,	'Geheugenkaarten',					9394 ),
	(12395,		'Prepaid kaarten en -pakketten',	14675 ),
	(15049,		'Telefoons en faxen',				14675 ),
	(42428,		'Overige GSM en telecom',			14675 ),
	(77355,		'Software',							14675 ),
	(108267,	'Skype en Internettelefonie',		14675 );

INSERT INTO Verkoper
(gebruiker,bank,bankrekening,controleoptie,creditcard)
VALUES	('Gebruiker1','Rabobank',3966701,'Creditcard','1234-5678-9012-3456'),
		('Gebruiker2','Postbank',7190582,'Creditcard','0987-6543-2109-8765'),
		('Gebruiker3','SNS bank',8001657,'Creditcard','0192-8374-6556-7483'),
		('Gebruiker5','ING bank',7283489,'Creditcard','2984-1231-8714-1327'),
		('Gebruiker7','Rabobank',6576750,'Creditcard','3693-0284-5869-8732'),
		('Admin',	  'Rabobank',8946532,'Creditcard','4562-9732-1234-7896');

INSERT INTO Voorwerp
(      voorwerpnummer,titel,             beschrijving,                   startprijs,betalingswijze,  betalingsinstructie,          plaatsnaam,		land,      looptijd,looptijdBeginDag,looptijdBeginTijdstip,verzendkosten,verzendinstructies,verkoper,	koper,			looptijdEindeDag,looptijdEindeTijdstip,veilingGesloten,verkoopprijs)
VALUES	(0000000001, 'BMW 340i',		'Mooie BMW',						50.00,	'IDeal/PayPal',	'Gewoon overmaken',				'Arnhem',		'Nederland',	7,	'15-may-1999',		'09:20:20.0000000',		null,		null,			'Admin',	'Gebruiker1',	'22-may-1999',		'20:20:21',				1,			150.00),
		(0000000002, 'Cake',			'Zo goed als nieuw',				90.00,	'IDeal/PayPal',	'Je mag het geld zelf houden',	'Zevenaar',		'Polen',		3,	'20-feb-2018',		'09:20:20.0000000',		null,		null,			'Admin',	'Gebruiker5',	'22-feb-2018',		'20:20:21',				1,			639.99),
		(0000000003, 'Reclamebord',		'5x5 meter',						60.00,	'IDeal/PayPal',	'Contant',						'Utrecht',		'Nederland',	5,	'08-may-2018',		'09:20:20.0000000',		null,		null,			'Admin',	'Gebruiker5',	'13-may-2018',		'20:20:21',				1,			75.00),
		(0000000004, 'BMW 320d',		'Zuinige sportieve auto',			70.00,	'IDeal/PayPal', 'Kijk maar of je betaald',		'Arnhem',		'Nederland',	7,	'28-may-2018',		'09:20:20.0000000',		null,		null,			'Admin',	'Gebruiker1',	'29-may-2018',		'20:20:21',				1,			80.00),
		(0000000005, 'BMW 535i',		'Fijne auto',						85.00,	'IDeal/PayPal', 'Contant betalen kan niet',		'Arnhem',		'Nederland',	7,	'27-may-2018',		'09:20:20.0000000',		null,		null,			'Admin',	'Gebruiker1',	'29-may-2018',		'20:20:21',				1,			90.00),
		(0000000006, 'Audi RS6',		'Lekkere motor',					70.00,	'IDeal/PayPal', 'Kijk maar of je betaald',		'Arnhem',		'Nederland',	7,	'28-may-2018',		'09:20:20.0000000',		null,		null,			'Admin',	'Gebruiker1',	'29-may-2018',		'20:20:21',				1,			80.00),
		(0000000007, 'Renault Megane',	'Lelijke auto',						10.00,	'IDeal/PayPal', 'Kijk maar of je betaald',		'Boxmeer',		'Nederland',	3,	'28-may-2018',		'09:20:20.0000000',		null,		null,			'Admin',	'Gebruiker1',	'29-may-2018',		'20:20:21',				1,			15.00),
		(0000000008, 'Mercedes C63s',	'Heeft geen smaak',					270.00, 'IDeal/PayPal', 'Betaal gewoon',				'Arnhem',		'Nederland',	7,	'28-may-2018',		'09:20:20.0000000',		null,		null,			'Admin',	'Gebruiker1',	'29-may-2018',		'20:20:21',				1,			280.00),
		(0000000009, 'The Maze Runner', 'Deel 1, Engels',					10.00,	'IDeal/PayPal', 'Overmaken',					'Den Haag',		'Nederland',	5,	'27-may-2018',		'08:55:00.0000000',		NULL,		NULL,			'Admin',	'Gebruiker3',	'01-jun-2018',		'08:55:01',				0,			12.00),
		(0000000010, 'Harry Potter',	'Deel 1, z.g.a.n., EN',				8.99,	'IDeal/PayPal', 'Overmaken',					'Maastricht',	'Nederland',	7,	'29-may-2018',		'03:59:00.0000000',		NULL,		NULL,			'Admin',	'Gebruiker2',	'05-jun-2018',		'04:00:00',				0,			10.50),
		(0000000011, 'Nijntje',			'Vanaf 3 jaar',						4.00,	'IDeal/PayPal', 'Storten',						'Utrecht',		'Nederland',	3,	'27-may-2018',		'18:25:00.0000000',		NULL,		NULL,			'Admin',	'Gebruiker3',	'30-may-2018',		'18:25:01',				0,			4.50),
		(0000000012, 'Ready Player One','Ernest Cline',						9.99,	'IDeal',		'Neem contact op',				'Zwolle',		'Nederland',	10,	'28-may-2018',		'14:36:18.0000000',		3.80,		'Via PostNL',	'Admin',	'Gebruiker7',	'07-jun-2018',		'14:36:19',				0,			11.00),
		(0000000013, 'Origin',			'Dan Brown - 2017',					17.00,	'IDeal',		'Z.s.m overmaken',				'Rheden',		'Nederland',	5,	'27-may-2018',		'17:47:23.0000000',		3.80,		NULL,			'Admin',	'Gebruiker2',	'01-jun-2018',		'17:47:24',				0,			18.50),
		(0000000014, 'Call Of Duty BO3','Gekke gimma a nifauw',				40.00,	'IDeal/PayPal', 'Betaal gewoon',				'Arnhem',		'Nederland',	7,	'28-may-2018',		'09:20:20.0000000',		null,		null,			'Admin',	'Gebruiker1',	'30-may-2018',		'20:20:21',				0,			50.00),
		(0000000015, 'Fortnite',		'A zebiiiisssss',					40.00,	'IDeal/PayPal', 'Betaal gewoon',				'Arnhem',		'Nederland',	7,	'28-may-2018',		'09:20:20.0000000',		null,		null,			'Admin',	'Gebruiker1',	'30-may-2018',		'20:20:21',				0,			50.00),
		(0000000016, 'Battlefield 1',	'Erg leuk',							40.00,	'IDeal/PayPal', 'Betaal gewoon',				'Arnhem',		'Nederland',	7,	'28-may-2018',		'09:20:20.0000000',		null,		null,			'Admin',	'Gebruiker1',	'30-may-2018',		'20:20:21',				0,			50.00),
		(0000000017, 'Counter Strike',	'Super pittig',						40.00,	'IDeal/PayPal', 'Betaal gewoon',				'Arnhem',		'Nederland',	7,	'28-may-2018',		'09:20:20.0000000',		null,		null,			'Admin',	'Gebruiker1',	'30-may-2018',		'20:20:21',				0,			50.00),
		(0000000018, 'Call Of Duty BO2','BO3 is leuker',					40.00,	'IDeal/PayPal', 'Betaal gewoon',				'Arnhem',		'Nederland',	7,	'28-may-2018',		'09:20:20.0000000',		null,		null,			'Admin',	'Gebruiker1',	'30-may-2018',		'20:20:21',				0,			50.00);

INSERT INTO Feedback
(voorwerp,soortgebruiker,feedbacksoort,dag,tijdstip,commentaar)
VALUES	(0000000001,'koper','positief','22-apr-2018','10:44:21.0000000','Bedankt!');

INSERT INTO Bod
(voorwerp,bodbedrag,gebruiker,boddag,bodtijdstip)
VALUES	(0000000001,	150.00,	'Gebruiker1',	'21-apr-2018',	'12:00:00.0000000'),
		(0000000002,	639.99,	'Gebruiker5',	'21-feb-2018',	'15:45:06.0000000'),
		(0000000003,	75.00,	'Gebruiker5',	'10-may-2018',	'05:04:03.0000000'),
		(0000000004,	70,		'Gebruiker3',	'28-may-2018',	'23:04:03.0000000'),
		(0000000005,	88,		'Gebruiker7',	'28-may-2018',	'23:04:03.0000000'),
		(0000000006,	71,		'Gebruiker3',	'28-may-2018',	'23:04:03.0000000'),
		(0000000007,	11,		'Gebruiker5',	'28-may-2018',	'23:04:03.0000000'),
		(0000000008,	271,	'Gebruiker5',	'28-may-2018',	'23:04:03.0000000'),
		(0000000009,	12,		'Gebruiker3',	'28-may-2018',	'19:15:00.0000000'),
		(0000000010,	10.50,	'Gebruiker2',	'29-may-2018',	'09:26:08.0000000'),
		(0000000011,	4.50,	'Gebruiker3',	'29-may-2018',	'05:15:48.0000000'),
		(0000000012,	11,		'Gebruiker7',	'29-may-2018',	'07:58:16.0000000'),
		(0000000013,	18.50,	'Gebruiker2',	'28-may-2018',	'22:06:47.0000000'),
		(0000000014,	60,		'Gebruiker3',	'09-feb-2018',	'16:04:03.0000000'),
		(0000000015,	70,		'Gebruiker5',	'28-feb-2018',	'17:04:03.0000000'),
		(0000000016,	65,		'Gebruiker7',	'28-mar-2018',	'19:04:03.0000000'),
		(0000000017,	55,		'Gebruiker1',	'28-jan-2018',	'21:04:03.0000000'),
		(0000000018,	130,	'Gebruiker7',	'28-jan-2018',	'06:04:03.0000000');

INSERT INTO Bestand
(filenaam,voorwerp)
VALUES	('bmw304i.jpg',			0000000001),
		('cake.jpg',			0000000002),
		('reclamebordcola.jpg',	0000000003),
		('320d.jpg',			0000000004),
		('535i.jpg',			0000000005),
		('rs6.jpg',				0000000006),
		('megane.jpg',			0000000007),
		('c63s.jpg',			0000000008),
		('tmr.jpg',				0000000009),
		('hp1.jpg',				0000000010),
		('nijntje.jpg',			0000000011),
		('rp1.jpg',				0000000012),
		('origin.jpg',			0000000013),
		('bo3.jpg',				0000000014),
		('fortnite.jpg',		0000000015),
		('b1.jpg',				0000000016),
		('cs.jpg',				0000000017),
		('bo2.jpg',				0000000018);

INSERT INTO VoorwerpInRubriek (voorwerp, rubriekOpLaagsteNiveau, rubriekOpHoogsteNiveau)
VALUES	(0000000001,	9837,	9800),
		(0000000002,	1139,	267),
		(0000000003,	62862,	1),
		(0000000004,	9837,	9800),
		(0000000005,	9837,	9800),
		(0000000006,	9837,	9800),
		(0000000007,	9837,	9800),
		(0000000008,	9837,	9800),
		(0000000009,	1103,	267),
		(0000000010,	1103,	267),
		(0000000011,	17163,	267),
		(0000000012,	1103,	267),
		(0000000013,	32675,	267),
		(0000000014,	27234,	14616),
		(0000000015,	27234,	14616),
		(0000000016,	27234,	14616),
		(0000000017,	27234,	14616),
		(0000000018,	27234,	14616);


/* Tabellen voor conversies */

GO
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('11pistou','8870','België','BE',72.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('11qa','64057','Verenigde Staten','US',98.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('1234jackkirby','BH189HT','Verenigd Koninkrijk','GB',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('123dredge','IP117HR','Verenigd Koninkrijk','GB',89.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('126thst','08854','Verenigde Staten','US',93.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('12magi','8954','België','BE',75.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('1302_vlaanderen','1654','België','BE',63.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('1880wk','04932','Duitsland','DE',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('1stopbabystore','','Verenigd Koninkrijk','GB',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('2010montresor','20100','Italië','IT',98.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('2013beauty13','','Duitsland','DE',99.7)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('2013pinkfriday','9190','België','BE',99.1)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('24musiclady','NG43ND','Verenigd Koninkrijk','GB',59.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('26ruedulabrador','5002','België','BE',97.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('5mcd','SE129AN','Verenigd Koninkrijk','GB',78.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('643doubleplaycards2010','PE27BW','Verenigd Koninkrijk','GB',93.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('64basque','','Frankrijk','FR',61.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('67richard','3435DW','Nederland','NL',56.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('69boomer','13350','Verenigde Staten','US',94.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('7379bob','1650','België','BE',97.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('a-place-in-space','CR01RN','Verenigd Koninkrijk','GB',87.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('a-toys','56154','Duitsland','DE',97.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('a_davy','3730','België','BE',66.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('abeldoorn','3930','Woudenberg,Nederland','NL',67.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('absolutecomicsandstatues','11374','Verenigde Staten','US',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('actualcoolcats','23235','Verenigde Staten','US',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('adamsworldnl','7245AX','Nederland','NL',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('adcollection','5025AC','Nederland','NL',98.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('adidassambatrainers','BN99PN','Verenigd Koninkrijk','GB',68.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('admul','5624CA','Nederland','NL',75.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('afeefa80','LS83QW','Verenigd Koninkrijk','GB',98.2)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('agrios-buch','51427','Duitsland','DE',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('aherolegacycomics','06040','Verenigde Staten','US',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('albalk97','01420','Verenigde Staten','US',83.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('alexthefatdawg','SA488AE','Verenigd Koninkrijk','GB',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ali19550','4822','Oostenrijk','AT',78.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('alsaret$genny99','05036','Italië','IT',99.5)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('alternateuniversecomics','SL99DH','Verenigd Koninkrijk','GB',100.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('alterverse','06511','Verenigde Staten','US',66.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ann_cloughton','YO130AT','Verenigd Koninkrijk','GB',74.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('anne-clara','2500','België','BE',91.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('annemanieke','1910','België','BE',90.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('annh1559','2100','België','BE',96.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('anniea123','HX26AJ','Verenigd Koninkrijk','GB',69.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('anticousato','70122','Italië','IT',78.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('antikspielzeug','55127','Duitsland','DE',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('antiktharandt09','01737','Duitsland','DE',99.7)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('antiquariat_dr.lautwein','90489','Duitsland','DE',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('antique.secondhandshop','','België','BE',78.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('antiqueprintsandmaps_nl','6581WP','Nederland','NL',99.1)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('aphebe','','Frankrijk','FR',61.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('archivecomics','32780','Verenigde Staten','US',56.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('argie_de','','Duitsland','DE',83.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('arkle3','','Verenigd Koninkrijk','GB',64.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('arsenicjulie','31634','Duitsland','DE',64.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('art.and.books','10043','Italië','IT',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('assofreeciak','10141','Italië','IT',99.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('astainvista04','','Italië','IT',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('auctionbargainshere','11001','Verenigde Staten','US',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('avaz2838','76549','Verenigde Staten','US',61.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('balak_nl','1094SM','Nederland','NL',80.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('bampf-collectables','BS148NF','Verenigd Koninkrijk','GB',90.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('bargain$eeker','16412','Verenigde Staten','US',80.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('baronselderie-62','46499','Duitsland','DE',86.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('bazardellibro','73100','Italië','IT',99.5)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('beatchapter','E70NJ','Verenigd Koninkrijk','GB',87.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('beautyzz2009','','Verenigd Koninkrijk','GB',98.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('beerzshop','2152TG','Nederland','NL',95.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('belgian-coast','8560','België','BE',58.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('bellashop05','45768','Duitsland','DE',88.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('beloved-max','6041JR','Nederland','NL',96.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ben1955_nl','','Nederland','NL',75.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('berwannes','8000','België','BE',90.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('betelgese','','Italië','IT',56.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('bianchi99','5076','Haaren,Nederland','NL',0.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('bildertraum','','Duitsland','DE',99.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('bisjeke','9320','België','BE',87.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('blarte','47100','Italië','IT',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('blas2283','','Verenigd Koninkrijk','GB',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('blastfromthepastmagazine','PE28HF','Verenigd Koninkrijk','GB',57.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('blaswell','','Nederland','NL',88.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('bluronin85','','Italië','IT',99.7)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('bobbybutt11','MK464DR','Verenigd Koninkrijk','GB',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('bobcrocker','02879','Verenigde Staten','US',64.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('bobsco64','PR83DQ','Verenigd Koninkrijk','GB',94.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('boekenband','8200','België','BE',58.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('boekenwormpje','4014PW','Nederland','NL',78.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('bombero47','9050','België','BE',95.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('bongkong','97211','Verenigde Staten','US',86.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('books_discount','PR98QH','Verenigd Koninkrijk','GB',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('boondockcollectibles','11767','Verenigde Staten','US',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('boonsart','2515BA','Nederland','NL',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('boubou1713','7100','België','BE',99.3)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('breezer-man','77880','Duitsland','DE',96.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('brocantique-30','30250','Frankrijk','FR',81.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('buch-service-2.hand','70378','Duitsland','DE',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('buch24-de','','Duitsland','DE',69.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('buchweltonline','24539','Duitsland','DE',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('bulb_inc','93550','Verenigde Staten','US',96.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('buntespapier_de','47057','Duitsland','DE',86.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('buy','','Verenigde Staten','US',99.3)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('calpix','','Verenigde Staten','US',61.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('capitalmale','22046','Verenigde Staten','US',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ccsims02','CF481DB','Verenigd Koninkrijk','GB',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('cercachetrovi99','48100','Italië','IT',99.2)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('champ0814','9690','België','BE',82.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('charles1076','EX25DU','Verenigd Koninkrijk','GB',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('chealton','90766','Duitsland','DE',95.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('checkpoint45','SK66GD','Verenigd Koninkrijk','GB',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('chikira','','Nederland','NL',100.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('chipmunk5178','','Nederland','NL',95.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('chlp1815','','Verenigd Koninkrijk','GB',64.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('chrisdmbebis','1480','België','BE',69.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('christian6760','6724','België','BE',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('chunkaay','90020','Verenigde Staten','US',56.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ciadlo','','Mexico','MX',70.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('clioheist','2220','België','BE',96.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('cmbooksnstuff','75063','Verenigde Staten','US',99.5)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('cocacolafanta','70825','Duitsland','DE',99.4)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('coco3766','6000','België','BE',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('cocoyovanny888','01259','Duitsland','DE',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('codingknuffel','9320','België','BE',92.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('coldtonnageman','GU206JQ','Verenigd Koninkrijk','GB',90.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('collectorsdenwf','76306','Verenigde Staten','US',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('collectorshop24nl','3565AV','Nederland','NL',64.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('collectorsworld-va','22003','Verenigde Staten','US',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('collectoushop','49360','Frankrijk','FR',99.7)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('comic-biz-store','N129LH','Verenigd Koninkrijk','GB',81.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('comic-kontor-no.1','69151','Duitsland','DE',79.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('comic.productions.nordbaden','77855','Duitsland','DE',62.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('comic.sense','11710','Verenigde Staten','US',92.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('comic_collector1974','20782','Verenigde Staten','US',71.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('comic_haus','44135','Duitsland','DE',57.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('comicanderl','81929','Duitsland','DE',58.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('comicladen-kollektiv','20259','Duitsland','DE',56.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('comiclick','','Duitsland','DE',58.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('comicmania101','S118JG','Verenigd Koninkrijk','GB',86.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('comixzoneonline','13212','Verenigde Staten','US',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('conventionex','33016','Verenigde Staten','US',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('cookee-bookee','N33AE','Verenigd Koninkrijk','GB',57.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('corur','6641','Beuningen GLD,Nederland','NL',77.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('cosmicdiarist','M15QD','Verenigd Koninkrijk','GB',58.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('cosmicgiftsuk','YO152DS','Verenigd Koninkrijk','GB',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('cottage_of_lost_play','2610','België','BE',81.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('crocobio','1400','België','BE',85.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('crystalshift','11208','Verenigde Staten','US',99.2)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('culturalexperience27','15610','Verenigde Staten','US',94.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('curefan17','89015','Verenigde Staten','US',94.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('dabro4711','3191','Hoogvliet Rotterdam,Nederland','NL',100.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('daleyinternational2012','E153BP','Verenigd Koninkrijk','GB',89.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('dangio_max','40139','Italië','IT',98.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('dannygemma','SW24LB','Verenigd Koninkrijk','GB',88.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('davidemensch','5707XZ','Nederland','NL',0.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('daywarm000','TS14JF','Verenigd Koninkrijk','GB',99.4)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('dddavids777','97401','Verenigde Staten','US',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ddkcarl','2170','België','BE',98.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('dead.peoples.stuff','95376','Verenigde Staten','US',67.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('deardidi','9032','België','BE',98.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('debali','11552','Verenigde Staten','US',98.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('debelder73','2570','België','BE',71.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('deceaseddog','GY11HY','Verenigd Koninkrijk','GB',100.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('deepspaceeleven','','Verenigd Koninkrijk','GB',97.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('dejowi','79280','Duitsland','DE',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('dekker84','2587HM','Nederland','NL',72.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('demonciccio','17024','Italië','IT',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('devizescollectables','SN102JR','Verenigd Koninkrijk','GB',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('diacaras','7559CP','Nederland','NL',57.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('dieterscomic','73732','Duitsland','DE',66.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('dildoke','3000','België','BE',91.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('dirtyharry0162','72574','Duitsland','DE',97.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('dishgo','7522CS','Nederland','NL',0.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('dituttopertutti.mercatino','38050','Italië','IT',99.5)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('dizneyart','98611','Verenigde Staten','US',98.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('dlddestock62','62750','Frankrijk','FR',99.7)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('doctorbooksrl','61100','Italië','IT',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('dominique9756','8950','België','BE',96.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('doroteo74','06016','Italië','IT',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('dove-shop','HU70YF','Verenigd Koninkrijk','GB',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('dr-wazoo','33316','Verenigde Staten','US',98.3)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('drsox2036','8000','België','BE',92.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('dtacoll','33618','Verenigde Staten','US',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('duckburg','','Duitsland','DE',63.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('dustmop45','97365','Verenigde Staten','US',78.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('easy-ankauf','24113','Duitsland','DE',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('editions_du_jeudi','4020','België','BE',74.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('eer323','1653','België','BE',60.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ejgleb','','Nederland','NL',56.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('eklo2002','35394','Duitsland','DE',85.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('elenarossetti1975','82018','Italië','IT',98.4)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('elric3007','TQ121YB','Verenigd Koninkrijk','GB',70.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('encanledo','38259','Duitsland','DE',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('endrucomics','','Italië','IT',58.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('eufrazie','9280','België','BE',86.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('euram','','België','BE',96.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('european-grading-service','53894','Duitsland','DE',88.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('euroverzend','5611','Eindhoven,Nederland','NL',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('eurus2000','','Duitsland','DE',56.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('everything-football','','Verenigd Koninkrijk','GB',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('f-l-o-h-1-0-0','85221','Duitsland','DE',93.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('faetigigliola62','47035','Italië','IT',80.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('fannynanou','1050','België','BE',93.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('fantasia-spielzeug.de','14050','Duitsland','DE',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('fantasticstore','38118','Duitsland','DE',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('fantasy-comics','10526','Verenigde Staten','US',60.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('fc089081','4920','België','BE',91.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('fcdisie','1767CM','Nederland','NL',79.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('fede1673','37060','Italië','IT',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('feldec68','84025','Italië','IT',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ferifox27','00172','Italië','IT',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('fifer_andy','KY62PT','Verenigd Koninkrijk','GB',83.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('figo_de_kat','2600','België','BE',70.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('filip9900','','België','BE',62.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('filtheforce','8800','België','BE',90.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('fiodor72','','Italië','IT',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('firefly1685','03062','Verenigde Staten','US',74.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('florent1935','9990','België','BE',57.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('flyingcloggie','5301ZX','Nederland','NL',92.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('fonorama','3520','België','BE',63.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('fourguysandachick','28625','Verenigde Staten','US',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('francesco-alberti','10117','Duitsland','DE',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('frankieoost','7543DJ','Nederland','NL',62.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('franklin6060','','Duitsland','DE',78.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('frankloos2008','3680','België','BE',89.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('fredgales','1052RR','Nederland','NL',80.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('fromthevault2u','13027','Verenigde Staten','US',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('fruitylicious_uk','WA117AG','Verenigd Koninkrijk','GB',80.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('fun2sport','2573','''s-Gravenhage,Nederland','NL',75.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('funzonexxl','3272','België','BE',82.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('gadgetfreaknl','6411NC','Nederland','NL',76.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('gameveen','1013BZ','Nederland','NL',0.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('garry_creations','','Verenigd Koninkrijk','GB',63.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('gebr.-kuehn-fachhandel-buecher-spielwaren-bastelbedarf','57319','Duitsland','DE',77.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('geelgroen1234','9340','België','BE',87.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('geitestaart','7880','België','BE',94.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('geluidsdragers','7831HA','Nederland','NL',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('geoconde','8400','België','BE',88.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('george.l','PL67EQ','Verenigd Koninkrijk','GB',74.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ggmont','50300','Frankrijk','FR',99.5)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('gieken0','2000','België','BE',62.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('glunderw0rld','','Nederland','NL',96.7)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('goldrhox','9034HG','Nederland','NL',61.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('good-old-antiques','1980','België','BE',88.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('gorgias62','2492NP','Nederland','NL',100.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('gr273','','Nederland','NL',67.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('gravin99','6372KD','Nederland','NL',96.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('greendiamonds1','3010','België','BE',73.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('grethescraftartandwool','CT102JS','Verenigd Koninkrijk','GB',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('griffioengrafiek','','Nederland','NL',80.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('gruttosi','2496HX','Nederland','NL',95.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('guardion','70327','Duitsland','DE',82.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('gugumed_it','06126','Italië','IT',99.7)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('h2comics','6531KC','Nederland','NL',93.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('hajogeur','4824JJ','Nederland','NL',99.7)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('hajomaje','84037','Verenigde Staten','US',70.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('hallofjusticecomics','80138','Verenigde Staten','US',87.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('hamsterklf76','LS73ET','Verenigd Koninkrijk','GB',57.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('hannah11zoe','BS217TG','Verenigd Koninkrijk','GB',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('hans511126johannes','2726TJ','Nederland','NL',99.7)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('hans6075','ST72HX','Verenigd Koninkrijk','GB',98.2)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('hansboeken13','1357PR','Nederland','NL',80.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('happys-comic-marktplatz','42799','Duitsland','DE',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('harleyscomics','M146AU','Verenigd Koninkrijk','GB',91.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('haveanicedaytoday','1601JP','Nederland','NL',67.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('hawthornstrading','NR67EQ','Verenigd Koninkrijk','GB',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('hecomic','93053','Duitsland','DE',99.7)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('hemiagnos','1120','België','BE',96.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('henk1230','','Nederland','NL',88.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('hero4sale','10999','Duitsland','DE',56.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('herobincollectables','33071','Verenigde Staten','US',79.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('hevanba','5012AE','Nederland','NL',80.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('hh-automobilia','45964','Duitsland','DE',96.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('hobbyruimte','8300','België','BE',94.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('horio-be2014','1170','België','BE',62.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('hospiz-spendenverkauf','45661','Duitsland','DE',56.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('house_of_stamps_67','67150','Frankrijk','FR',98.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('hovebooks','BN37SB','Verenigd Koninkrijk','GB',57.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('i.fratt.1972','00041','Italië','IT',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('iamnotwolverine','S207LR','Verenigd Koninkrijk','GB',56.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ichartasrl','','Italië','IT',77.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('indyjones9793','98506','Verenigde Staten','US',60.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('infamous9indy','46221','Verenigde Staten','US',94.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('info-on-collectibles','8560','België','BE',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('inmondadori','','Italië','IT',99.1)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('jaceshad','04657','Verenigde Staten','US',92.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('jahreb','','Verenigde Staten','US',71.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('jankawasaki','3461HL','Nederland','NL',77.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('janlej','8310','België','BE',95.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('jar_jar__1','','Duitsland','DE',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('jarod_64','44100','Italië','IT',100.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('jasonbarber24','43228','Verenigde Staten','US',96.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('jbs15','','Verenigde Staten','US',57.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('jeanphih','6990','België','BE',73.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('jeroenvossen','3650','België','BE',84.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('jhquarles','75703','Verenigde Staten','US',61.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('jjmaxistore','47843','Italië','IT',96.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('joca2425','3920','België','BE',65.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('johndanvers','2060','België','BE',56.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('johns-modelcarsandtrains','','Nederland','NL',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('johnson.girls','55345','Verenigde Staten','US',83.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('jolan59','6700','België','BE',61.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('jonah-hex-lives','BS374AX','Verenigd Koninkrijk','GB',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('jonbaron','2000','België','BE',98.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('joncas45','S358PA','Verenigd Koninkrijk','GB',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('joske2399','8980','België','BE',75.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('jp-stamps','6414EH','Nederland','NL',83.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('jpjp1999','27012','Verenigde Staten','US',86.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('jven_nl','5258ER','Nederland','NL',66.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('k_en_d_used_items','6446BX','Nederland','NL',96.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('kanakaris1','3630','België','BE',81.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('karnomotorsport','','Frankrijk','FR',98.7)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('katelb0','LE88BH','Verenigd Koninkrijk','GB',84.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('katiehughes262012','S704LX','Verenigd Koninkrijk','GB',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('kautzcollect','3441XJ','Nederland','NL',59.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('keeslahaze','','Nederland','NL',68.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('kerouacroad','W55NH','Verenigd Koninkrijk','GB',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('kevinspacey20','73112','Verenigde Staten','US',98.5)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('khazaarh','5640','België','BE',63.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('khovan38','38480','Frankrijk','FR',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('kilagon10','90504','Verenigde Staten','US',56.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('koeiekop','5953CK','Nederland','NL',83.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('kolmhofer','4070','Oostenrijk','AT',99.4)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('koopveiligonlineshop','3273AC','Nederland','NL',83.3)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('kristpie','3560','België','BE',77.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('kryptonkomics','','Verenigd Koninkrijk','GB',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('kstudio','43068','Verenigde Staten','US',60.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('kuiftinbob','9200','België','BE',68.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('kulturgutes','64546','Duitsland','DE',60.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('kurtje1972','8670','België','BE',80.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('lacavedaromes','94140','Frankrijk','FR',60.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('lacollezionistamoltocarina65','80100','Italië','IT',93.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('lamo27','4431','België','BE',89.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('lauronadon','07866','Verenigde Staten','US',62.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('laz-e-bid','41001','Verenigde Staten','US',99.4)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('le_grenier_des_bd2011','4020','België','BE',61.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ledepotliege','4000','België','BE',60.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('lee1913','03054','Verenigde Staten','US',92.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('legras_doritha','5324AX','Nederland','NL',91.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('leopoldc3','9190','België','BE',87.5)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('lethal_quicksilver','94928','Verenigde Staten','US',57.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('librairiehistoiresdarts','35000','Frankrijk','FR',82.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('libreriavitanova','35010','Italië','IT',81.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('libridiireale','40131','Italië','IT',97.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('libromania_matera','75100','Italië','IT',65.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('librosalento','','Italië','IT',90.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('lie12345','2018','België','BE',0.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('lightningbolt1979','7823AC','Nederland','NL',84.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('livresetdesseins','08000','Frankrijk','FR',99.1)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('lo_turco72','80126','Italië','IT',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('logunnsblade-uk','IG50JB','Verenigd Koninkrijk','GB',76.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('lokov0','06179','Duitsland','DE',63.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('londonreznor','21016','Italië','IT',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('lospecchiodelrock','95019','Italië','IT',99.7)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('lost4toys','11552','Verenigde Staten','US',87.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('lucantonio2005','80123','Italië','IT',74.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('lucasmart','85600','Frankrijk','FR',99.7)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('lucbert','10064','Italië','IT',61.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('lucien230','20124','Italië','IT',69.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('lucky86_fr','','Frankrijk','FR',80.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ludofr76','1430','België','BE',66.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('lymbus','65123','Italië','IT',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('lyubiza','20148','Italië','IT',75.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('m.den.hartog','3707TK','Nederland','NL',81.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('macdui01','','Verenigd Koninkrijk','GB',95.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('macduidigital','EH112AW','Verenigd Koninkrijk','GB',99.3)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('mad-mart','YO164RX','Verenigd Koninkrijk','GB',94.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('madformags','SK117PG','Verenigd Koninkrijk','GB',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('magazine-machine','','Verenigd Koninkrijk','GB',95.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('magazinemarkt','3553RT','Nederland','NL',98.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('magic_white_unicorn','CF417TT','Verenigd Koninkrijk','GB',72.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('mamadejan','2340','België','BE',98.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('mamy7009','23100','Italië','IT',85.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('manga_book_sales','78613','Verenigde Staten','US',65.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('mangusta086','12073','Italië','IT',99.7)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('marcos_bathroom','IP145UD','Verenigd Koninkrijk','GB',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('marijka_m','92656','Verenigde Staten','US',90.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('marius0703','2515BG','Nederland','NL',71.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('marrc2','1080','België','BE',98.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('martindaglelie','9203ZC','Nederland','NL',85.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('martinridley','N42PQ','Verenigd Koninkrijk','GB',72.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('mary5715','','Verenigd Koninkrijk','GB',62.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('masbrad','95363','Verenigde Staten','US',99.2)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('mavito','10036','Italië','IT',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('maxigamer_be','2610','België','BE',72.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('mcmom53','5403LB','Nederland','NL',81.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('mekanykal','85008','Verenigde Staten','US',99.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('mericourt0_0','5101','België','BE',72.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('mfholmes27','PE29QA','Verenigd Koninkrijk','GB',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('midpacific2002','96814','Verenigde Staten','US',65.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('mike-denis','SK145NS','Verenigd Koninkrijk','GB',74.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('mikeshep68','W139DS','Verenigd Koninkrijk','GB',84.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('mimmo.fumetti','72020','Italië','IT',98.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('min3738','CW57GG','Verenigd Koninkrijk','GB',98.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('minneke1972','2500','België','BE',99.5)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('misseypootle','S614NR','Verenigd Koninkrijk','GB',80.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('mktoysandbooks-uk','BT56QR','Verenigd Koninkrijk','GB',82.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('mkunst2012','2000','België','BE',65.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('mo-schu','83620','Duitsland','DE',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('modder1970','6836PA','Nederland','NL',69.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('modelbouwdon-felipe','2100','België','BE',86.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('mohitojo','SE38TN','Verenigd Koninkrijk','GB',92.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('moneywisebooks','NR303NQ','Verenigd Koninkrijk','GB',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('mooiweertje22','6882HM','Nederland','NL',75.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('moosewoodson','38116','Verenigde Staten','US',78.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('morti_i','AL60JL','Verenigd Koninkrijk','GB',56.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('msefsathome','HP226HH','Verenigd Koninkrijk','GB',83.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('multitronixx','90134','Italië','IT',99.3)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('musicandbooksetc','','Verenigd Koninkrijk','GB',61.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('musicandmovie-fan-be','','België','BE',92.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('musicsubway.dolf','5527KD','Nederland','NL',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('mycomicshop','76010','Verenigde Staten','US',99.5)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('neapolis-2008','80038','Italië','IT',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('newprix','58036','Italië','IT',99.7)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('nielsklinkenberg','7411KR','Nederland','NL',76.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('nitrox1966','','Amerikaans-Samoa','AS',68.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('njfenner','','Verenigd Koninkrijk','GB',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('nordseekunst','21789','Duitsland','DE',56.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('nostalgie1895','01612','Duitsland','DE',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('now4sale13','9881','België','BE',73.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('oaktree709','TN62UW','Verenigd Koninkrijk','GB',70.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('oban4me','','België','BE',97.3)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('oh..so','PE134QE','Verenigd Koninkrijk','GB',89.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ohko','B323RL','Verenigd Koninkrijk','GB',57.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('oldgit1940','','Verenigd Koninkrijk','GB',74.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('oliver_kammler','03149','Duitsland','DE',76.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('olivier9862','03800','Frankrijk','FR',99.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('omepeet','2289ER','Nederland','NL',67.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('online-handel','15370','Duitsland','DE',99.2)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('oodals_uk','60954','Verenigde Staten','US',99.3)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('oodals_us','NR70WF','Verenigd Koninkrijk','GB',99.4)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('origineelgeschenkje','9320','België','BE',88.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('oscars428','','Verenigd Koninkrijk','GB',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ouwens4','3114','Schiedam,Nederland','NL',56.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('p4420580','9120','België','BE',64.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('panis_offertissime','','Italië','IT',75.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('papawembandre','7880','België','BE',59.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('paper-and-books','3000','België','BE',75.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('paris-texas04','','Italië','IT',89.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('passieflora3680','3680','België','BE',96.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('patbateman43','11374','Verenigde Staten','US',60.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('patti2000','','Duitsland','DE',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('pcarena-bristol','','Verenigd Koninkrijk','GB',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('peachke','2235','België','BE',70.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('penfold_t_mole','NG36EJ','Verenigd Koninkrijk','GB',77.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('petesiboy','33467','Verenigde Staten','US',60.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('petfred87','8500','België','BE',71.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('phil666732','4032','België','BE',67.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('piedra1963','','Italië','IT',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('pjsautolit','50669','Verenigde Staten','US',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('pkgsales','95136','Verenigde Staten','US',90.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('placeagora','45290','Frankrijk','FR',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('planet-media','76887','Duitsland','DE',99.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('platinum1400','94127','Verenigde Staten','US',64.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('pops_comics','72034','Verenigde Staten','US',66.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('postyzd','8630','België','BE',94.1)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('power-flame','','Duitsland','DE',73.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ppateb','','Duitsland','DE',83.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('prairie.partners','47436','Verenigde Staten','US',87.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('punk_rock_addict','04133','Polen','PL',59.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('quanha-boy','3920','België','BE',87.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('queenrocks64','4566AN','Nederland','NL',76.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('qujav','30735','Verenigde Staten','US',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('racingracoon','SN252EB','Verenigd Koninkrijk','GB',82.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ramopen66','90419','Duitsland','DE',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('random.cool.stuff','N165RB','Verenigd Koninkrijk','GB',71.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('rare_records09','1730','België','BE',70.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('rascozion','9280','België','BE',94.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ratbike_nl','','Nederland','NL',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('redhotcomics','G459UH','Verenigd Koninkrijk','GB',71.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('reinerschuckmonstersandheroes','64289','Duitsland','DE',90.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('remi11_nl','2317','Leiden,Nederland','NL',67.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('replayvideogames_co_uk','WR144NG','Verenigd Koninkrijk','GB',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('resbook','90143','Italië','IT',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('rgilbert15','14304','Verenigde Staten','US',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('rhand09','9686VE','Nederland','NL',81.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ridderhenck','7943CP','Nederland','NL',90.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ridersco.shop','BD24JP','Verenigd Koninkrijk','GB',99.7)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('rik550s','PE71QA','Verenigd Koninkrijk','GB',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('rilela','23611','Duitsland','DE',86.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ritasclearencesale','6412SP','Nederland','NL',69.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('rlbaines','S57SN','Verenigd Koninkrijk','GB',96.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('road0476','9700','België','BE',66.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('robbieyee','27613','Verenigde Staten','US',68.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('robertr3293','20110','Verenigde Staten','US',75.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('robsnka','8052','Oostenrijk','AT',69.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('rockdude1','86413','Verenigde Staten','US',99.5)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('rockitman2691','5854BS','Nederland','NL',88.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('rogedi','','Nederland','NL',69.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('rossana1174','24050','Italië','IT',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('rotterdam_comics','3071VH','Nederland','NL',68.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('rubikcubelife','','Verenigd Koninkrijk','GB',98.1)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ruttimm','1053KP','Nederland','NL',0.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ruudoverdijk','1328ES','Nederland','NL',61.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ryzard_nl','9713GW','Nederland','NL',98.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('sailyawa','18643','Verenigde Staten','US',99.1)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('salem3.5.7','13006','Frankrijk','FR',97.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('samisassy','','Verenigde Staten','US',98.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('sandeling_nl','3342GC','Nederland','NL',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('sandgate1953','LS257EY','Verenigd Koninkrijk','GB',70.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('sandygilchristworld','','Verenigd Koninkrijk','GB',88.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('sanmar-2008','1025TM','Nederland','NL',59.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('santeclaus','','Verenigd Koninkrijk','GB',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('sas1athome71','60148','Verenigde Staten','US',99.5)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('satiropa','2300','België','BE',93.1)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('sauliusst','DA144AA','Verenigd Koninkrijk','GB',99.7)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('schaumburger-shop','31688','Duitsland','DE',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('selling_great_items','34787','Verenigde Staten','US',62.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('serependiteit','','België','BE',85.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('serpentina_nl','','Nederland','NL',66.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('sewbeck','CV325YF','Verenigd Koninkrijk','GB',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('shancq184','1450','België','BE',90.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('shellheadcomics2','63125','Verenigde Staten','US',57.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('sia-sarahshop','4116CH','Nederland','NL',63.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('silmarilrp12','63100','Italië','IT',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('silverspaceknight','37188','Verenigde Staten','US',89.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('simiansalesinc','50265','Verenigde Staten','US',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('sirioja96','16200','Frankrijk','FR',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('siwime','4824','Breda,Nederland','NL',89.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('sk-bookscom','','Verenigd Koninkrijk','GB',58.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('skepora','2220','België','BE',85.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('smoeltje0','6845KE','Nederland','NL',73.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('snapelio','24040','Italië','IT',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('sockeyedavid','99615','Verenigde Staten','US',92.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('sof1967','45200','Frankrijk','FR',84.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('soncla34','34290','Frankrijk','FR',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('spaansespook','5283','Boxtel,Nederland','NL',99.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('speedy-jay','HA51DB','Verenigd Koninkrijk','GB',83.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('spendi_spandi_effendi','80132','Italië','IT',79.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('sportwagen0807','9870','België','BE',77.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('spots1412','1057HJ','Nederland','NL',0.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('sprintkonijn','9100','België','BE',99.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('stakstik1','9300','België','BE',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('staplerremover','','Verenigd Koninkrijk','GB',84.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('steve_robbi','37083','Duitsland','DE',69.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('steveh974','BR31TY','Verenigd Koninkrijk','GB',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('stew1974','15317','Verenigde Staten','US',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('stone_soup_records','LL186HA','Verenigd Koninkrijk','GB',56.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('stopinette061','6890','België','BE',85.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('stouf70','70120','Frankrijk','FR',88.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('sugie30','8310','België','BE',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('super-buch','51469','Duitsland','DE',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('superboy632','16509','Verenigde Staten','US',59.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('suswis','4273XA','Nederland','NL',83.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('suzie_c','TW26NQ','Verenigd Koninkrijk','GB',86.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('suzys_magazines_and_comics','RG127FG','Verenigd Koninkrijk','GB',71.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('swordt2000','08820','Verenigde Staten','US',74.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('sycamorebooks','WN58HB','Verenigd Koninkrijk','GB',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('t-bucket777','37724','Verenigde Staten','US',76.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('takesuback4vinyl','SK117YW','Verenigd Koninkrijk','GB',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('tanjae2255','36039','Duitsland','DE',99.7)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('tanmanandlex','59602','Verenigde Staten','US',99.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('tantys','2235','België','BE',67.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('tastevin-be','1050','België','BE',98.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('tchang5','4651','België','BE',98.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('tellybox','LA14TH','Verenigd Koninkrijk','GB',64.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('teusvc','3527WG','Nederland','NL',0.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('thbargains2012','HP12PJ','Verenigd Koninkrijk','GB',98.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('the-white-tiger001','7100','België','BE',66.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('theatticbug','','Verenigd Koninkrijk','GB',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('thecargohold','','Verenigde Staten','US',76.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('thecomicnewsstand','19066','Verenigde Staten','US',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('thedrewcarson','EH269BB','Verenigd Koninkrijk','GB',86.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('thegreatgearstore','','Verenigd Koninkrijk','GB',99.7)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('thejumpingfrog','','Verenigde Staten','US',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('thelistedliss','M2R2S9','Canada','CA',70.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('thesuperbikebarn2012','7242CH','Nederland','NL',91.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('thethreeneils222','CO102YW','Verenigd Koninkrijk','GB',76.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('they_walk_among_us','TW91RW','Verenigd Koninkrijk','GB',77.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('think-magazines-uk','EX226PS','Verenigd Koninkrijk','GB',70.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('thomasdenies','4331HN','Nederland','NL',0.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('times-were-when','','Nederland','NL',80.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('timmy--2000','1181NV','Nederland','NL',94.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('titileterrible','J0K1S0','Canada','CA',93.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('tragopaan','2930','België','BE',94.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('trickyal77','DE224JQ','Verenigd Koninkrijk','GB',93.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('tripje_nl','','Nederland','NL',63.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('twinspappalardo2011','','Italië','IT',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('uanta15','','Verenigd Koninkrijk','GB',96.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('ube108ube','43100','Italië','IT',82.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('umberto8951','81025','Italië','IT',99.7)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('uniformuniverse','BB97UT','Verenigd Koninkrijk','GB',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('univista!','HA96EA','Verenigd Koninkrijk','GB',68.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('upidana','31515','Duitsland','DE',99.6)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('us2014.topl','97055','Verenigde Staten','US',85.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('vanni.c','20060','Italië','IT',58.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('vassyv','26300','Frankrijk','FR',99.5)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('velboyz','PL51AU','Verenigd Koninkrijk','GB',65.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('vian12','3300','België','BE',97.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('victorycomicsgroup','22046','Verenigde Staten','US',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('vincer2005','5611PR','Nederland','NL',84.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('vintagedecoration','3210','België','BE',0.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('vintageitemcom','9700','België','BE',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('vintagexplosion','','Nederland','NL',77.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('vinylon','84166','Duitsland','DE',99.9)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('viper152','7863','België','BE',61.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('vlaamsstripcentrum','2610','België','BE',74.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('voenkie','3271','België','BE',56.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('w.bakker','3051LN','Nederland','NL',57.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('warhorse1967','71302','Verenigde Staten','US',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('watermill_books','SA183GY','Verenigd Koninkrijk','GB',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('waterwoman54','2592VG','Nederland','NL',74.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('wedding.24july2010','B146DE','Verenigd Koninkrijk','GB',59.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('wem48','1780','België','BE',65.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('werni2','16727','Duitsland','DE',75.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('whisperingchicken','CV345QN','Verenigd Koninkrijk','GB',66.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('wisco82kpm','91403','Verenigde Staten','US',64.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('witteoctopus','8310','België','BE',83.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('wizona-nl','','Nederland','NL',65.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('wormke-grutman','1851','België','BE',79.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('wrathofmdfmk','95340','Verenigde Staten','US',99.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('wvd-verzamelen1','3328TG','Nederland','NL',93.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('www_lopo24_de','68766','Duitsland','DE',99.5)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('xray_37','3200','België','BE',94.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('xujinglei1688','','China','CN',99.8)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('xxcharlezxx','34112','Verenigde Staten','US',95.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('yankees508phillies','17050','Verenigde Staten','US',99.5)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('yardsaleholland','5022BE','Nederland','NL',93.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('yasminannabelle89','','Verenigd Koninkrijk','GB',84.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('you*mag','','Italië','IT',95.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('yourbusiness2012','','Hongkong','HK',91.2)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('zap3000','3212','België','BE',84.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('zeldatetris','33155','Verenigde Staten','US',78.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('zombiepie23','PL267QX','Verenigd Koninkrijk','GB',70.0)
INSERT Users (Username,Postalcode,Location,Country,Rating) VALUES ('zursammlereckeba','96050','Duitsland','DE',99.9)
GO


/*Categorieen*/
-- Voor de categorieen tabel is een conversie geschreven, maar omdat we alle rubrieken al handmatig in de database
-- hebben gezet, staat alles daar in commentaar. Hier worden ze wel toegevoegd, omdat er een constraint zit op
-- de Item tabel

ALTER TABLE Categorieen DROP CONSTRAINT FK_ParentCategorie
GO

INSERT Categorieen (ID,Name,Parent) VALUES (-1,'Root',NULL)
INSERT Categorieen (ID,Name,Parent) VALUES (1,'Verzamelen',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (30,'Overig klassiek speelgoed',19016)
INSERT Categorieen (ID,Name,Parent) VALUES (32,'Poppen',1)
INSERT Categorieen (ID,Name,Parent) VALUES (34,'Reclamevoorwerpen',1)
INSERT Categorieen (ID,Name,Parent) VALUES (35,'Overige reclamevoorwerpen',34)
INSERT Categorieen (ID,Name,Parent) VALUES (38,'Overige Coca-Cola',62848)
INSERT Categorieen (ID,Name,Parent) VALUES (57,'Film objecten',196)
INSERT Categorieen (ID,Name,Parent) VALUES (63,'Stripboeken',267)
INSERT Categorieen (ID,Name,Parent) VALUES (64,'Overige comics',900)
INSERT Categorieen (ID,Name,Parent) VALUES (80,'Verzamelstrips',63)
INSERT Categorieen (ID,Name,Parent) VALUES (117,'Overige beren en knuffels',386)
INSERT Categorieen (ID,Name,Parent) VALUES (120,'Creatief speelgoed',220)
INSERT Categorieen (ID,Name,Parent) VALUES (121,'Overig knutselen',25850)
INSERT Categorieen (ID,Name,Parent) VALUES (125,'1980 - heden',18828)
INSERT Categorieen (ID,Name,Parent) VALUES (127,'Overige ansichtkaarten',8991)
INSERT Categorieen (ID,Name,Parent) VALUES (137,'Disneyana',1)
INSERT Categorieen (ID,Name,Parent) VALUES (138,'Overige Disneyana',137)
INSERT Categorieen (ID,Name,Parent) VALUES (142,'Pluche',137)
INSERT Categorieen (ID,Name,Parent) VALUES (143,'Speldjes en buttons',137)
INSERT Categorieen (ID,Name,Parent) VALUES (151,'Pez',8710)
INSERT Categorieen (ID,Name,Parent) VALUES (154,'Overige Star Wars',29495)
INSERT Categorieen (ID,Name,Parent) VALUES (159,'Overige verzamelen',8710)
INSERT Categorieen (ID,Name,Parent) VALUES (160,'Computers',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (162,'Overige computers',160)
INSERT Categorieen (ID,Name,Parent) VALUES (164,'Overige processoren',78769)
INSERT Categorieen (ID,Name,Parent) VALUES (165,'Harddisks',38851)
INSERT Categorieen (ID,Name,Parent) VALUES (175,'Overige randapparatuur',3676)
INSERT Categorieen (ID,Name,Parent) VALUES (182,'Overige software',18793)
INSERT Categorieen (ID,Name,Parent) VALUES (187,'Overige retro games',11988)
INSERT Categorieen (ID,Name,Parent) VALUES (193,'Services',160)
INSERT Categorieen (ID,Name,Parent) VALUES (196,'Fanartikelen en merchandise',11232)
INSERT Categorieen (ID,Name,Parent) VALUES (197,'Overige filmobjecten',57)
INSERT Categorieen (ID,Name,Parent) VALUES (200,'Recente films',18823)
INSERT Categorieen (ID,Name,Parent) VALUES (201,'Overige TV-objecten',1424)
INSERT Categorieen (ID,Name,Parent) VALUES (202,'Sportverzamelartikelen',888)
INSERT Categorieen (ID,Name,Parent) VALUES (210,'Rock & Roll',157499)
INSERT Categorieen (ID,Name,Parent) VALUES (218,'Magic The Gathering',868)
INSERT Categorieen (ID,Name,Parent) VALUES (219,'Overige ruilkaartspellen',868)
INSERT Categorieen (ID,Name,Parent) VALUES (220,'Speelgoed en spellen',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (222,'Auto''s en vrachtwagens',1188)
INSERT Categorieen (ID,Name,Parent) VALUES (223,'Overige auto''s',222)
INSERT Categorieen (ID,Name,Parent) VALUES (226,'Poppen',220)
INSERT Categorieen (ID,Name,Parent) VALUES (233,'Gezelschapsspellen',220)
INSERT Categorieen (ID,Name,Parent) VALUES (234,'Overig speelgoed',220)
INSERT Categorieen (ID,Name,Parent) VALUES (246,'Overige actiefiguren',112024)
INSERT Categorieen (ID,Name,Parent) VALUES (257,'Overige wereldwijde munten',7990)
INSERT Categorieen (ID,Name,Parent) VALUES (260,'Postzegels',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (262,'USA',128384)
INSERT Categorieen (ID,Name,Parent) VALUES (264,'Overige postzegels',260)
INSERT Categorieen (ID,Name,Parent) VALUES (267,'Boeken en strips',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (268,'Overige boeken',267)
INSERT Categorieen (ID,Name,Parent) VALUES (269,'1940 - heden',22421)
INSERT Categorieen (ID,Name,Parent) VALUES (270,'Literatuur - buitenland',267)
INSERT Categorieen (ID,Name,Parent) VALUES (280,'Overige tijdschriften',607)
INSERT Categorieen (ID,Name,Parent) VALUES (281,'Sieraden en horloges',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (293,'Consumentenelektronica',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (294,'Overige foto, beeld en geluid',293)
INSERT Categorieen (ID,Name,Parent) VALUES (298,'Overig beeld',3287)
INSERT Categorieen (ID,Name,Parent) VALUES (303,'Overig gereedschap',19859)
INSERT Categorieen (ID,Name,Parent) VALUES (306,'Overige LP''s',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (307,'Overige CD''s',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (308,'Overige muziekinstrumenten',619)
INSERT Categorieen (ID,Name,Parent) VALUES (312,'Overige kleding',11450)
INSERT Categorieen (ID,Name,Parent) VALUES (313,'Overige herenkleding',9817)
INSERT Categorieen (ID,Name,Parent) VALUES (314,'Overige dameskleding',9816)
INSERT Categorieen (ID,Name,Parent) VALUES (315,'Kinderkleding - overige',11450)
INSERT Categorieen (ID,Name,Parent) VALUES (353,'Kunst, antiek en design',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (355,'Overige archeologie',37082)
INSERT Categorieen (ID,Name,Parent) VALUES (377,'2000 - heden',29224)
INSERT Categorieen (ID,Name,Parent) VALUES (381,'NTSC',7755)
INSERT Categorieen (ID,Name,Parent) VALUES (384,'Overige hengelsport',1492)
INSERT Categorieen (ID,Name,Parent) VALUES (386,'Beren en knuffels',220)
INSERT Categorieen (ID,Name,Parent) VALUES (412,'Instrumenten',7474)
INSERT Categorieen (ID,Name,Parent) VALUES (417,'Transport',1)
INSERT Categorieen (ID,Name,Parent) VALUES (420,'Fietsen',417)
INSERT Categorieen (ID,Name,Parent) VALUES (423,'Scheepvaart',417)
INSERT Categorieen (ID,Name,Parent) VALUES (424,'Overige auto''s, motoren, boten',9800)
INSERT Categorieen (ID,Name,Parent) VALUES (432,'Beatles',157499)
INSERT Categorieen (ID,Name,Parent) VALUES (433,'Elvis',157499)
INSERT Categorieen (ID,Name,Parent) VALUES (439,'Beanies',137)
INSERT Categorieen (ID,Name,Parent) VALUES (488,'Kralen',281)
INSERT Categorieen (ID,Name,Parent) VALUES (533,'Overige Afrika',127144)
INSERT Categorieen (ID,Name,Parent) VALUES (534,'Overig Azië',40711)
INSERT Categorieen (ID,Name,Parent) VALUES (540,'Duitsland',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (544,'Overige verzamelingen',7914)
INSERT Categorieen (ID,Name,Parent) VALUES (550,'Beeldende kunst',353)
INSERT Categorieen (ID,Name,Parent) VALUES (551,'Overige beeldende kunst',550)
INSERT Categorieen (ID,Name,Parent) VALUES (565,'Bierviltjes',8733)
INSERT Categorieen (ID,Name,Parent) VALUES (602,'Overige parfum',84885)
INSERT Categorieen (ID,Name,Parent) VALUES (607,'Tijdschriften en kranten',267)
INSERT Categorieen (ID,Name,Parent) VALUES (608,'Natuur en buitenleven',607)
INSERT Categorieen (ID,Name,Parent) VALUES (609,'Kinderen en jeugd',607)
INSERT Categorieen (ID,Name,Parent) VALUES (612,'Actualiteit en politiek',607)
INSERT Categorieen (ID,Name,Parent) VALUES (614,'Overige sport',105967)
INSERT Categorieen (ID,Name,Parent) VALUES (617,'Overige DVD''s',2288)
INSERT Categorieen (ID,Name,Parent) VALUES (619,'Muziekinstrumenten',11233)
INSERT Categorieen (ID,Name,Parent) VALUES (625,'Fotografie',293)
INSERT Categorieen (ID,Name,Parent) VALUES (692,'Overig Afrika',35303)
INSERT Categorieen (ID,Name,Parent) VALUES (693,'Overig Azië',32136)
INSERT Categorieen (ID,Name,Parent) VALUES (695,'Voor 1975',128302)
INSERT Categorieen (ID,Name,Parent) VALUES (697,'Post en communicatie',4752)
INSERT Categorieen (ID,Name,Parent) VALUES (698,'Plaatfouten',40413)
INSERT Categorieen (ID,Name,Parent) VALUES (702,'Overige accessoires',35322)
INSERT Categorieen (ID,Name,Parent) VALUES (703,'Overige thema''s',4752)
INSERT Categorieen (ID,Name,Parent) VALUES (706,'Overige analoge fotografie',11272)
INSERT Categorieen (ID,Name,Parent) VALUES (753,'Overige transformers',156076)
INSERT Categorieen (ID,Name,Parent) VALUES (786,'Overige USA',42723)
INSERT Categorieen (ID,Name,Parent) VALUES (788,'Olympische spelen',202)
INSERT Categorieen (ID,Name,Parent) VALUES (868,'Ruilkaartspellen',1)
INSERT Categorieen (ID,Name,Parent) VALUES (888,'Sport, fietsen en vakantie',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (900,'Comics',267)
INSERT Categorieen (ID,Name,Parent) VALUES (916,'Overige artiesten',33416)
INSERT Categorieen (ID,Name,Parent) VALUES (921,'Tweede Wereldoorlog',8998)
INSERT Categorieen (ID,Name,Parent) VALUES (924,'Verenigde Staten',21530)
INSERT Categorieen (ID,Name,Parent) VALUES (926,'Overige auto''s en transport',9013)
INSERT Categorieen (ID,Name,Parent) VALUES (931,'Radio''s en zenders',7474)
INSERT Categorieen (ID,Name,Parent) VALUES (984,'Muziek- en speeldozen',1)
INSERT Categorieen (ID,Name,Parent) VALUES (985,'Telefoon',7474)
INSERT Categorieen (ID,Name,Parent) VALUES (1038,'Dinky toys',222)
INSERT Categorieen (ID,Name,Parent) VALUES (1051,'Overig klassiek',19481)
INSERT Categorieen (ID,Name,Parent) VALUES (1052,'Country',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (1055,'Hardrock',19483)
INSERT Categorieen (ID,Name,Parent) VALUES (1058,'Films',26718)
INSERT Categorieen (ID,Name,Parent) VALUES (1063,'Overige accessoires',12109)
INSERT Categorieen (ID,Name,Parent) VALUES (1067,'Overige jongenskleding',3038)
INSERT Categorieen (ID,Name,Parent) VALUES (1068,'Overige meisjeskleding',3051)
INSERT Categorieen (ID,Name,Parent) VALUES (1071,'Vinyl en platen',11233)
INSERT Categorieen (ID,Name,Parent) VALUES (1072,'Kindermuziek',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (1074,'Country',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (1076,'Religieus, New Age en Gospel',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (1081,'Filmmuziek en soundtracks',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (1082,'Elektronische huisdieren',19071)
INSERT Categorieen (ID,Name,Parent) VALUES (1093,'Jeugd- en kinderboeken',267)
INSERT Categorieen (ID,Name,Parent) VALUES (1103,'Tieners van 12 jaar en ouder',1093)
INSERT Categorieen (ID,Name,Parent) VALUES (1105,'Studie- en theorieboeken',267)
INSERT Categorieen (ID,Name,Parent) VALUES (1106,'Bedrijfskunde en management',267)
INSERT Categorieen (ID,Name,Parent) VALUES (1107,'Computers en internet',267)
INSERT Categorieen (ID,Name,Parent) VALUES (1115,'Psychologie en zelfhulp',267)
INSERT Categorieen (ID,Name,Parent) VALUES (1137,'Business',607)
INSERT Categorieen (ID,Name,Parent) VALUES (1138,'Antiek en verzamelen',607)
INSERT Categorieen (ID,Name,Parent) VALUES (1139,'Eten en drinken',607)
INSERT Categorieen (ID,Name,Parent) VALUES (1140,'Hobby',607)
INSERT Categorieen (ID,Name,Parent) VALUES (1141,'Wonen, huis en tuin',607)
INSERT Categorieen (ID,Name,Parent) VALUES (1145,'Film en tv',607)
INSERT Categorieen (ID,Name,Parent) VALUES (1147,'Wetenschap',607)
INSERT Categorieen (ID,Name,Parent) VALUES (1148,'Sciencefiction en fantasy',607)
INSERT Categorieen (ID,Name,Parent) VALUES (1150,'Reizen en ontspanning',607)
INSERT Categorieen (ID,Name,Parent) VALUES (1174,'Matchbox',222)
INSERT Categorieen (ID,Name,Parent) VALUES (1183,'Overige rollenspellen',2543)
INSERT Categorieen (ID,Name,Parent) VALUES (1188,'Modelbouw en miniaturen',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (1211,'Kunstvoorwerpen',353)
INSERT Categorieen (ID,Name,Parent) VALUES (1245,'Printers',3676)
INSERT Categorieen (ID,Name,Parent) VALUES (1256,'Overige accessoires',9884)
INSERT Categorieen (ID,Name,Parent) VALUES (1293,'Boten en vaartuigen',9800)
INSERT Categorieen (ID,Name,Parent) VALUES (1305,'Tickets en toegangskaarten',888)
INSERT Categorieen (ID,Name,Parent) VALUES (1307,'Overige tickets',1305)
INSERT Categorieen (ID,Name,Parent) VALUES (1374,'Disney',63)
INSERT Categorieen (ID,Name,Parent) VALUES (1375,'Beeldjes',137)
INSERT Categorieen (ID,Name,Parent) VALUES (1414,'Koningshuizen',1)
INSERT Categorieen (ID,Name,Parent) VALUES (1424,'TV objecten',196)
INSERT Categorieen (ID,Name,Parent) VALUES (1463,'Overige telefoonkaarten',8878)
INSERT Categorieen (ID,Name,Parent) VALUES (1476,'8 mm',52552)
INSERT Categorieen (ID,Name,Parent) VALUES (1477,'16 mm',52552)
INSERT Categorieen (ID,Name,Parent) VALUES (1480,'Geheugen',38851)
INSERT Categorieen (ID,Name,Parent) VALUES (1492,'Hengelsport',888)
INSERT Categorieen (ID,Name,Parent) VALUES (1494,'Hengelonderdelen',1492)
INSERT Categorieen (ID,Name,Parent) VALUES (1500,'Radiobenodigdheden',14969)
INSERT Categorieen (ID,Name,Parent) VALUES (1508,'VHS-video’s',11232)
INSERT Categorieen (ID,Name,Parent) VALUES (1559,'Blues',43619)
INSERT Categorieen (ID,Name,Parent) VALUES (1560,'Cabaret en komedie',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (1562,'Pop jaren ''80',21727)
INSERT Categorieen (ID,Name,Parent) VALUES (1564,'Instrumentaal',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (1565,'Latin',19485)
INSERT Categorieen (ID,Name,Parent) VALUES (1569,'Overige rap en hiphop',62835)
INSERT Categorieen (ID,Name,Parent) VALUES (1570,'Overige R&B en Soul',43639)
INSERT Categorieen (ID,Name,Parent) VALUES (1572,'Alternative Rock',19483)
INSERT Categorieen (ID,Name,Parent) VALUES (1574,'Heavy Metal',34317)
INSERT Categorieen (ID,Name,Parent) VALUES (1575,'Soft Rock',19483)
INSERT Categorieen (ID,Name,Parent) VALUES (1577,'Techno en industrial',19479)
INSERT Categorieen (ID,Name,Parent) VALUES (1578,'Easy Listening',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (1579,'Overige wereldmuziek',19485)
INSERT Categorieen (ID,Name,Parent) VALUES (1580,'Blues',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (1581,'Dance',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (1582,'Disco',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (1583,'Kerstmis en Sinterklaas',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (1584,'Instrumentaal',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (1597,'Techno',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (1598,'Easy Listening',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (1599,'Wereldmuziek',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (1603,'Cassettes',25915)
INSERT Categorieen (ID,Name,Parent) VALUES (2005,'Tinnen speelgoed',19016)
INSERT Categorieen (ID,Name,Parent) VALUES (2028,'Big Band',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (2032,'Tuin',11700)
INSERT Categorieen (ID,Name,Parent) VALUES (2205,'Antiek',7478)
INSERT Categorieen (ID,Name,Parent) VALUES (2218,'Kleding en textiel',353)
INSERT Categorieen (ID,Name,Parent) VALUES (2230,'Poëzie en gedichten',267)
INSERT Categorieen (ID,Name,Parent) VALUES (2234,'Films en tv-series',267)
INSERT Categorieen (ID,Name,Parent) VALUES (2242,'Roddelbladen',607)
INSERT Categorieen (ID,Name,Parent) VALUES (2243,'Computers en IT',607)
INSERT Categorieen (ID,Name,Parent) VALUES (2247,'Religieus, New Age en Gospel',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (2249,'House',19479)
INSERT Categorieen (ID,Name,Parent) VALUES (2250,'Indie en Britpop',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (2252,'Punkrock',19483)
INSERT Categorieen (ID,Name,Parent) VALUES (2257,'Cabaret en komedie',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (2264,'Gesproken woord',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (2265,'Overige 7'''' singles',20801)
INSERT Categorieen (ID,Name,Parent) VALUES (2288,'Film DVD''s',11232)
INSERT Categorieen (ID,Name,Parent) VALUES (2289,'Overige actie en avontuur',41520)
INSERT Categorieen (ID,Name,Parent) VALUES (2290,'Overige tekenfilms en animatie',41523)
INSERT Categorieen (ID,Name,Parent) VALUES (2291,'Tekenfilms',41523)
INSERT Categorieen (ID,Name,Parent) VALUES (2292,'Overige kinder- en familiefilm',41526)
INSERT Categorieen (ID,Name,Parent) VALUES (2295,'Overige documentaire',41543)
INSERT Categorieen (ID,Name,Parent) VALUES (2296,'Overige speelfilms en drama',41550)
INSERT Categorieen (ID,Name,Parent) VALUES (2298,'Fantasy',41571)
INSERT Categorieen (ID,Name,Parent) VALUES (2299,'Overige horror en griezel',41558)
INSERT Categorieen (ID,Name,Parent) VALUES (2302,'Vechtsporten',41520)
INSERT Categorieen (ID,Name,Parent) VALUES (2303,'Overige concerten',23275)
INSERT Categorieen (ID,Name,Parent) VALUES (2305,'Mysterie',41539)
INSERT Categorieen (ID,Name,Parent) VALUES (2307,'Overige sciencefiction',41571)
INSERT Categorieen (ID,Name,Parent) VALUES (2310,'Oorlog en militair',41520)
INSERT Categorieen (ID,Name,Parent) VALUES (2312,'Overige fanartikelen',196)
INSERT Categorieen (ID,Name,Parent) VALUES (2323,'Posters',57)
INSERT Categorieen (ID,Name,Parent) VALUES (2334,'Popsterren en idolen',157499)
INSERT Categorieen (ID,Name,Parent) VALUES (2474,'POTF 2  (1989 - 1999)',112034)
INSERT Categorieen (ID,Name,Parent) VALUES (2475,'Vintage (1977 - 1989)',112034)
INSERT Categorieen (ID,Name,Parent) VALUES (2476,'Episode 1',112034)
INSERT Categorieen (ID,Name,Parent) VALUES (2485,'Beast wars en machine wars',156076)
INSERT Categorieen (ID,Name,Parent) VALUES (2505,'Majorette',222)
INSERT Categorieen (ID,Name,Parent) VALUES (2515,'Solido',222)
INSERT Categorieen (ID,Name,Parent) VALUES (2543,'Rollenspellen',220)
INSERT Categorieen (ID,Name,Parent) VALUES (2547,'Sciencefiction',2543)
INSERT Categorieen (ID,Name,Parent) VALUES (2550,'Overige gezelschapspellen',233)
INSERT Categorieen (ID,Name,Parent) VALUES (2570,'Knikkers',19016)
INSERT Categorieen (ID,Name,Parent) VALUES (2575,'Overig Playmobil',19854)
INSERT Categorieen (ID,Name,Parent) VALUES (2601,'Steiff',220)
INSERT Categorieen (ID,Name,Parent) VALUES (2605,'Pokémon',8605)
INSERT Categorieen (ID,Name,Parent) VALUES (2611,'Engels/Amerikaans',60238)
INSERT Categorieen (ID,Name,Parent) VALUES (2662,'Robots en futuristisch',112024)
INSERT Categorieen (ID,Name,Parent) VALUES (2663,'Jojo''s',19016)
INSERT Categorieen (ID,Name,Parent) VALUES (2761,'Overig aardewerk',60913)
INSERT Categorieen (ID,Name,Parent) VALUES (2769,'Gouda',60913)
INSERT Categorieen (ID,Name,Parent) VALUES (2912,'Rugby',888)
INSERT Categorieen (ID,Name,Parent) VALUES (2913,'Overige hardlopen',56801)
INSERT Categorieen (ID,Name,Parent) VALUES (2917,'Overige tennis',13340)
INSERT Categorieen (ID,Name,Parent) VALUES (2984,'Huishoudelijke benodigdheden',12081)
INSERT Categorieen (ID,Name,Parent) VALUES (2989,'Overig vervoer',15468)
INSERT Categorieen (ID,Name,Parent) VALUES (2991,'Overig speelgoed',18637)
INSERT Categorieen (ID,Name,Parent) VALUES (2999,'Casual',34391)
INSERT Categorieen (ID,Name,Parent) VALUES (3010,'Maat 40-42 (L)',12997)
INSERT Categorieen (ID,Name,Parent) VALUES (3020,'Zwangerschapskleding',9816)
INSERT Categorieen (ID,Name,Parent) VALUES (3029,'Grote maten',11450)
INSERT Categorieen (ID,Name,Parent) VALUES (3038,'Kinderkleding- jongens',11450)
INSERT Categorieen (ID,Name,Parent) VALUES (3051,'Kinderkleding- meisjes',11450)
INSERT Categorieen (ID,Name,Parent) VALUES (3071,'Blouses',98378)
INSERT Categorieen (ID,Name,Parent) VALUES (3088,'Overige kralen',153953)
INSERT Categorieen (ID,Name,Parent) VALUES (3103,'Breien',8423)
INSERT Categorieen (ID,Name,Parent) VALUES (3114,'Overig scrapping',111848)
INSERT Categorieen (ID,Name,Parent) VALUES (3116,'Naaien en naaimachines',8423)
INSERT Categorieen (ID,Name,Parent) VALUES (3186,'Overige tuinmeubels',25863)
INSERT Categorieen (ID,Name,Parent) VALUES (3192,'Meubels en wonen',11700)
INSERT Categorieen (ID,Name,Parent) VALUES (3194,'Overig keuken en koken',20626)
INSERT Categorieen (ID,Name,Parent) VALUES (3254,'Bed & Breakfasts',160939)
INSERT Categorieen (ID,Name,Parent) VALUES (3287,'Beeld',293)
INSERT Categorieen (ID,Name,Parent) VALUES (3294,'Rekenmachines',293)
INSERT Categorieen (ID,Name,Parent) VALUES (3323,'Lenzen',11272)
INSERT Categorieen (ID,Name,Parent) VALUES (3326,'Fotografica',11272)
INSERT Categorieen (ID,Name,Parent) VALUES (3327,'Digitale compactcamera''s',625)
INSERT Categorieen (ID,Name,Parent) VALUES (3365,'Rome: Republiek',4733)
INSERT Categorieen (ID,Name,Parent) VALUES (3394,'Verenigd Koninkrijk',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (3444,'Waardepapieren, aandelen',11116)
INSERT Categorieen (ID,Name,Parent) VALUES (3467,'Overig Oceanië',128385)
INSERT Categorieen (ID,Name,Parent) VALUES (3468,'Australië',128385)
INSERT Categorieen (ID,Name,Parent) VALUES (3478,'Canada',128384)
INSERT Categorieen (ID,Name,Parent) VALUES (3490,'Ierland',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (3491,'Flora',4752)
INSERT Categorieen (ID,Name,Parent) VALUES (3493,'Spanje en kolonies',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (3496,'Voor 1975',128306)
INSERT Categorieen (ID,Name,Parent) VALUES (3497,'Faeröer',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (3498,'Gebruikt',3499)
INSERT Categorieen (ID,Name,Parent) VALUES (3499,'Verenigd Koninkrijk',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (3515,'Verenigde Naties',4752)
INSERT Categorieen (ID,Name,Parent) VALUES (3526,'Atari',11988)
INSERT Categorieen (ID,Name,Parent) VALUES (3542,'Commodore',8086)
INSERT Categorieen (ID,Name,Parent) VALUES (3580,'Accessories',127897)
INSERT Categorieen (ID,Name,Parent) VALUES (3591,'Consoles',127897)
INSERT Categorieen (ID,Name,Parent) VALUES (3594,'SNES (Supernintendo)',37209)
INSERT Categorieen (ID,Name,Parent) VALUES (3606,'Overige PC games',11046)
INSERT Categorieen (ID,Name,Parent) VALUES (3617,'NES',37209)
INSERT Categorieen (ID,Name,Parent) VALUES (3628,'Sleutelhangers',8710)
INSERT Categorieen (ID,Name,Parent) VALUES (3653,'Mega drive',15110)
INSERT Categorieen (ID,Name,Parent) VALUES (3665,'Saturn',15110)
INSERT Categorieen (ID,Name,Parent) VALUES (3666,'Overige kabels en netwerken',32202)
INSERT Categorieen (ID,Name,Parent) VALUES (3676,'Randapparatuur',160)
INSERT Categorieen (ID,Name,Parent) VALUES (3691,'Modems',160)
INSERT Categorieen (ID,Name,Parent) VALUES (3694,'Monitors',3676)
INSERT Categorieen (ID,Name,Parent) VALUES (3707,'Laptops en onderdelen',160)
INSERT Categorieen (ID,Name,Parent) VALUES (3727,'Consoles',27713)
INSERT Categorieen (ID,Name,Parent) VALUES (3736,'PC''s',160)
INSERT Categorieen (ID,Name,Parent) VALUES (3783,'Educatief',18793)
INSERT Categorieen (ID,Name,Parent) VALUES (3805,'Antivirus en beveiliging',18793)
INSERT Categorieen (ID,Name,Parent) VALUES (3833,'Overige bedels',43048)
INSERT Categorieen (ID,Name,Parent) VALUES (3952,'Overige stripboeken',63)
INSERT Categorieen (ID,Name,Parent) VALUES (3956,'Tom Poes en Olivier B. Bommel',63)
INSERT Categorieen (ID,Name,Parent) VALUES (3972,'Overige Nederlandse strips',63)
INSERT Categorieen (ID,Name,Parent) VALUES (4096,'Australië en Oceanië',8991)
INSERT Categorieen (ID,Name,Parent) VALUES (4174,'Overige kunst, antiek, design',353)
INSERT Categorieen (ID,Name,Parent) VALUES (4178,'Westerns',41520)
INSERT Categorieen (ID,Name,Parent) VALUES (4184,'Israel',40711)
INSERT Categorieen (ID,Name,Parent) VALUES (4185,'Korea',40711)
INSERT Categorieen (ID,Name,Parent) VALUES (4291,'Internet',18793)
INSERT Categorieen (ID,Name,Parent) VALUES (4301,'Overige Pokémon',60238)
INSERT Categorieen (ID,Name,Parent) VALUES (4313,'Dreamcast',15110)
INSERT Categorieen (ID,Name,Parent) VALUES (4341,'Overige actie en avontuur',16663)
INSERT Categorieen (ID,Name,Parent) VALUES (4344,'Overige Kinder- & familiefilms',35076)
INSERT Categorieen (ID,Name,Parent) VALUES (4347,'Documentaire en educatief',1508)
INSERT Categorieen (ID,Name,Parent) VALUES (4352,'Horror en griezel',1508)
INSERT Categorieen (ID,Name,Parent) VALUES (4355,'Vechtsporten',16663)
INSERT Categorieen (ID,Name,Parent) VALUES (4361,'Sport en fitness',1508)
INSERT Categorieen (ID,Name,Parent) VALUES (4365,'Oorlog en militair',16663)
INSERT Categorieen (ID,Name,Parent) VALUES (4366,'Westerns',16663)
INSERT Categorieen (ID,Name,Parent) VALUES (4388,'Hockey',888)
INSERT Categorieen (ID,Name,Parent) VALUES (4599,'Apple, Macintosh',160)
INSERT Categorieen (ID,Name,Parent) VALUES (4613,'Moederborden',38851)
INSERT Categorieen (ID,Name,Parent) VALUES (4693,'Overige ontvangers',12941)
INSERT Categorieen (ID,Name,Parent) VALUES (4696,'G1 en G2',156076)
INSERT Categorieen (ID,Name,Parent) VALUES (4698,'Japanse kaarten',60238)
INSERT Categorieen (ID,Name,Parent) VALUES (4716,'Tweede Wereldoorlog',15502)
INSERT Categorieen (ID,Name,Parent) VALUES (4733,'Antieke en Middeleeuwse munten',11116)
INSERT Categorieen (ID,Name,Parent) VALUES (4734,'Rome',4733)
INSERT Categorieen (ID,Name,Parent) VALUES (4735,'Rome: Provincie',4733)
INSERT Categorieen (ID,Name,Parent) VALUES (4737,'Perzisch, Indisch, Azië',4733)
INSERT Categorieen (ID,Name,Parent) VALUES (4738,'Grieks',4733)
INSERT Categorieen (ID,Name,Parent) VALUES (4739,'Arabische wereld',4733)
INSERT Categorieen (ID,Name,Parent) VALUES (4740,'Chinees',4733)
INSERT Categorieen (ID,Name,Parent) VALUES (4741,'Keltisch',4733)
INSERT Categorieen (ID,Name,Parent) VALUES (4742,'Europa',260)
INSERT Categorieen (ID,Name,Parent) VALUES (4743,'Midden- en Zuid-Amerika',260)
INSERT Categorieen (ID,Name,Parent) VALUES (4744,'Overige België',40396)
INSERT Categorieen (ID,Name,Parent) VALUES (4750,'Geschiedenis',4752)
INSERT Categorieen (ID,Name,Parent) VALUES (4752,'Thematische postzegels',260)
INSERT Categorieen (ID,Name,Parent) VALUES (4754,'Overige sporten',36684)
INSERT Categorieen (ID,Name,Parent) VALUES (4756,'Wetenschap en techniek',4752)
INSERT Categorieen (ID,Name,Parent) VALUES (4757,'Overige verkeer en transport',36735)
INSERT Categorieen (ID,Name,Parent) VALUES (4773,'Glas in lood en Tiffany',7478)
INSERT Categorieen (ID,Name,Parent) VALUES (4837,'Overig borduren, breien, haken',127909)
INSERT Categorieen (ID,Name,Parent) VALUES (4929,'Risque',8991)
INSERT Categorieen (ID,Name,Parent) VALUES (4941,'Overige Europese niet-Euro',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (7390,'Antiquarische boeken',353)
INSERT Categorieen (ID,Name,Parent) VALUES (7398,'Religie',7390)
INSERT Categorieen (ID,Name,Parent) VALUES (7406,'Geografie en etnografie',7390)
INSERT Categorieen (ID,Name,Parent) VALUES (7410,'Geschiedenis',7390)
INSERT Categorieen (ID,Name,Parent) VALUES (7420,'Kunst en cultuur',7390)
INSERT Categorieen (ID,Name,Parent) VALUES (7427,'Wetenschap en geneeskunde',7390)
INSERT Categorieen (ID,Name,Parent) VALUES (7435,'Literatuur',7390)
INSERT Categorieen (ID,Name,Parent) VALUES (7444,'Sociale wetenschappen',7390)
INSERT Categorieen (ID,Name,Parent) VALUES (7451,'Techniek, verkeer en economie',7390)
INSERT Categorieen (ID,Name,Parent) VALUES (7456,'Overig antiquariaat',7390)
INSERT Categorieen (ID,Name,Parent) VALUES (7463,'Grafische kunst',550)
INSERT Categorieen (ID,Name,Parent) VALUES (7464,'Etsen en gravures',7463)
INSERT Categorieen (ID,Name,Parent) VALUES (7468,'Antieke schilderijen',40688)
INSERT Categorieen (ID,Name,Parent) VALUES (7474,'Antieke apparaten',1)
INSERT Categorieen (ID,Name,Parent) VALUES (7478,'Glas en kristal',353)
INSERT Categorieen (ID,Name,Parent) VALUES (7479,'Flessen',7478)
INSERT Categorieen (ID,Name,Parent) VALUES (7484,'Overig glas en kristal',7478)
INSERT Categorieen (ID,Name,Parent) VALUES (7485,'Etnische kunst',353)
INSERT Categorieen (ID,Name,Parent) VALUES (7488,'Beeldjes en miniaturen',1211)
INSERT Categorieen (ID,Name,Parent) VALUES (7491,'Antieke meubels',353)
INSERT Categorieen (ID,Name,Parent) VALUES (7689,'Reisboeken en -gidsen',267)
INSERT Categorieen (ID,Name,Parent) VALUES (7736,'Historisch',41520)
INSERT Categorieen (ID,Name,Parent) VALUES (7746,'Musical en Opera',2288)
INSERT Categorieen (ID,Name,Parent) VALUES (7755,'Laserdisks',35064)
INSERT Categorieen (ID,Name,Parent) VALUES (7756,'PAL',7755)
INSERT Categorieen (ID,Name,Parent) VALUES (7766,'Trance en hardhouse',19479)
INSERT Categorieen (ID,Name,Parent) VALUES (7769,'Drum & bass en jungle',19479)
INSERT Categorieen (ID,Name,Parent) VALUES (7770,'Electronica',19479)
INSERT Categorieen (ID,Name,Parent) VALUES (7782,'Verzamelalbums',1071)
INSERT Categorieen (ID,Name,Parent) VALUES (7788,'Minidisc',25915)
INSERT Categorieen (ID,Name,Parent) VALUES (7794,'Keyboards, synths, piano''s',619)
INSERT Categorieen (ID,Name,Parent) VALUES (7798,'Strijk- en snaarinstrumenten',619)
INSERT Categorieen (ID,Name,Parent) VALUES (7825,'Duitsland',260)
INSERT Categorieen (ID,Name,Parent) VALUES (7849,'Bundespost (D-mark periode)',7825)
INSERT Categorieen (ID,Name,Parent) VALUES (7854,'Gebruikt',88766)
INSERT Categorieen (ID,Name,Parent) VALUES (7864,'Gebruikt',105293)
INSERT Categorieen (ID,Name,Parent) VALUES (7870,'BRD 1948 - 1959',7849)
INSERT Categorieen (ID,Name,Parent) VALUES (7872,'BRD 1960 - 1979',7849)
INSERT Categorieen (ID,Name,Parent) VALUES (7874,'BRD 1980 - 1989',7849)
INSERT Categorieen (ID,Name,Parent) VALUES (7875,'BRD 1990 - heden',7849)
INSERT Categorieen (ID,Name,Parent) VALUES (7876,'Bundespost (Euro periode)',7825)
INSERT Categorieen (ID,Name,Parent) VALUES (7881,'(Semi) modern 1945 - heden',40398)
INSERT Categorieen (ID,Name,Parent) VALUES (7886,'Monaco',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (7887,'Roemenie',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (7888,'Overige Europese landen',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (7890,'Turkije en Cyprus',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (7891,'Hongarije',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (7892,'Vaticaanstad',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (7896,'Kunst en cultuur',4752)
INSERT Categorieen (ID,Name,Parent) VALUES (7901,'Zegels zonder frankeerwaarde',260)
INSERT Categorieen (ID,Name,Parent) VALUES (7902,'Brieven',105255)
INSERT Categorieen (ID,Name,Parent) VALUES (7903,'Europa CEPT',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (7914,'Verzamelingen en partijen',260)
INSERT Categorieen (ID,Name,Parent) VALUES (7919,'Europa',7914)
INSERT Categorieen (ID,Name,Parent) VALUES (7921,'Wereld',7914)
INSERT Categorieen (ID,Name,Parent) VALUES (7939,'Overige antieke munten',4733)
INSERT Categorieen (ID,Name,Parent) VALUES (7953,'Overige penningen',18492)
INSERT Categorieen (ID,Name,Parent) VALUES (7972,'Misslagen en proefdrukken',11116)
INSERT Categorieen (ID,Name,Parent) VALUES (7975,'Euromunten en -biljetten',11116)
INSERT Categorieen (ID,Name,Parent) VALUES (7976,'Overige euromunten',7975)
INSERT Categorieen (ID,Name,Parent) VALUES (7977,'Bulgarije',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (7985,'Polen',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (7988,'Zweden',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (7990,'Wereldwijde munten',11116)
INSERT Categorieen (ID,Name,Parent) VALUES (7991,'Egypte en Arabische Staten',127144)
INSERT Categorieen (ID,Name,Parent) VALUES (7992,'Mexico',45145)
INSERT Categorieen (ID,Name,Parent) VALUES (7993,'Overige Latijns Amerika',45145)
INSERT Categorieen (ID,Name,Parent) VALUES (7994,'Zilveren en gouden munten',7990)
INSERT Categorieen (ID,Name,Parent) VALUES (7999,'Verzamelingen en partijen',11116)
INSERT Categorieen (ID,Name,Parent) VALUES (8008,'Azië',12822)
INSERT Categorieen (ID,Name,Parent) VALUES (8045,'Grafische kaarten',38851)
INSERT Categorieen (ID,Name,Parent) VALUES (8060,'Overige modems',3691)
INSERT Categorieen (ID,Name,Parent) VALUES (8081,'Scanners',3676)
INSERT Categorieen (ID,Name,Parent) VALUES (8086,'Retrocomputers',160)
INSERT Categorieen (ID,Name,Parent) VALUES (8097,'MSX games',11988)
INSERT Categorieen (ID,Name,Parent) VALUES (8101,'Overige retrocomputers',8086)
INSERT Categorieen (ID,Name,Parent) VALUES (8119,'Partijen en groothandel',14616)
INSERT Categorieen (ID,Name,Parent) VALUES (8141,'Amiga',8086)
INSERT Categorieen (ID,Name,Parent) VALUES (8168,'Overige Nintendo',37209)
INSERT Categorieen (ID,Name,Parent) VALUES (8241,'Overige games en consoles',14616)
INSERT Categorieen (ID,Name,Parent) VALUES (8265,'Overige portable spelers',73839)
INSERT Categorieen (ID,Name,Parent) VALUES (8267,'Overige MP3-spelers',73839)
INSERT Categorieen (ID,Name,Parent) VALUES (8274,'Analoge spiegelreflexcamera''s',625)
INSERT Categorieen (ID,Name,Parent) VALUES (8297,'Accessoires (digitaal)',625)
INSERT Categorieen (ID,Name,Parent) VALUES (8397,'Manicure',47945)
INSERT Categorieen (ID,Name,Parent) VALUES (8423,'Hobby''s en handwerken',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (8438,'Overige tuinaccessoires',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (8440,'Dierbenodigdheden',11700)
INSERT Categorieen (ID,Name,Parent) VALUES (8464,'Merkkleding',9817)
INSERT Categorieen (ID,Name,Parent) VALUES (8471,'Babykleding - jongens',12081)
INSERT Categorieen (ID,Name,Parent) VALUES (8472,'Overige maat 50',127683)
INSERT Categorieen (ID,Name,Parent) VALUES (8473,'Overige maat 62',127687)
INSERT Categorieen (ID,Name,Parent) VALUES (8474,'Overige maat 74',127689)
INSERT Categorieen (ID,Name,Parent) VALUES (8476,'Overige maat 98/104',98323)
INSERT Categorieen (ID,Name,Parent) VALUES (8480,'Overige babyartikelen',12081)
INSERT Categorieen (ID,Name,Parent) VALUES (8497,'Vliegtickets',1305)
INSERT Categorieen (ID,Name,Parent) VALUES (8503,'Vakantie- en reisbenodigdheden',888)
INSERT Categorieen (ID,Name,Parent) VALUES (8507,'Rugzakken',8503)
INSERT Categorieen (ID,Name,Parent) VALUES (8514,'Wintersport',160939)
INSERT Categorieen (ID,Name,Parent) VALUES (8516,'Overige reisbenodigdheden',8503)
INSERT Categorieen (ID,Name,Parent) VALUES (8534,'Asterix',63)
INSERT Categorieen (ID,Name,Parent) VALUES (8541,'Garfield',63)
INSERT Categorieen (ID,Name,Parent) VALUES (8556,'Tarzan',900)
INSERT Categorieen (ID,Name,Parent) VALUES (8557,'Kuifje',63)
INSERT Categorieen (ID,Name,Parent) VALUES (8569,'Overige Belgische strips',63)
INSERT Categorieen (ID,Name,Parent) VALUES (8575,'Manga',900)
INSERT Categorieen (ID,Name,Parent) VALUES (8588,'Vanaf 1990',1374)
INSERT Categorieen (ID,Name,Parent) VALUES (8593,'Figuurtjes',137)
INSERT Categorieen (ID,Name,Parent) VALUES (8595,'Huishoudelijke artikelen',137)
INSERT Categorieen (ID,Name,Parent) VALUES (8596,'Kleding',137)
INSERT Categorieen (ID,Name,Parent) VALUES (8598,'Munten',137)
INSERT Categorieen (ID,Name,Parent) VALUES (8600,'Posters',137)
INSERT Categorieen (ID,Name,Parent) VALUES (8602,'Speelgoed',137)
INSERT Categorieen (ID,Name,Parent) VALUES (8603,'Horloges en klokken',137)
INSERT Categorieen (ID,Name,Parent) VALUES (8605,'Poppetjes en figuurtjes',1)
INSERT Categorieen (ID,Name,Parent) VALUES (8617,'Smurfen',8605)
INSERT Categorieen (ID,Name,Parent) VALUES (8621,'Overige poppetjes',8605)
INSERT Categorieen (ID,Name,Parent) VALUES (8664,'Booster Packs',218)
INSERT Categorieen (ID,Name,Parent) VALUES (8665,'Losse kaarten - in print',218)
INSERT Categorieen (ID,Name,Parent) VALUES (8666,'Losse kaarten - out of print',218)
INSERT Categorieen (ID,Name,Parent) VALUES (8667,'Verzamelingen',218)
INSERT Categorieen (ID,Name,Parent) VALUES (8668,'Overige Magic The Gathering',218)
INSERT Categorieen (ID,Name,Parent) VALUES (8673,'Ruilkaarten en albums',1)
INSERT Categorieen (ID,Name,Parent) VALUES (8710,'Overige verzamelobjecten',1)
INSERT Categorieen (ID,Name,Parent) VALUES (8715,'Spaarpotten en geldartikelen',1)
INSERT Categorieen (ID,Name,Parent) VALUES (8733,'Bierartikelen',1)
INSERT Categorieen (ID,Name,Parent) VALUES (8735,'Bieretiketten',8733)
INSERT Categorieen (ID,Name,Parent) VALUES (8736,'Bierflessen',8733)
INSERT Categorieen (ID,Name,Parent) VALUES (8737,'Bierglazen',8733)
INSERT Categorieen (ID,Name,Parent) VALUES (8740,'Overige bierartikelen',8733)
INSERT Categorieen (ID,Name,Parent) VALUES (8743,'Landkaarten',417)
INSERT Categorieen (ID,Name,Parent) VALUES (8751,'Pennen',8710)
INSERT Categorieen (ID,Name,Parent) VALUES (8780,'Diddl',1)
INSERT Categorieen (ID,Name,Parent) VALUES (8781,'A4 blokbladen',100511)
INSERT Categorieen (ID,Name,Parent) VALUES (8782,'A5 blokbladen',100511)
INSERT Categorieen (ID,Name,Parent) VALUES (8783,'A6 blokbladen',100511)
INSERT Categorieen (ID,Name,Parent) VALUES (8784,'(Post) kaarten',8780)
INSERT Categorieen (ID,Name,Parent) VALUES (8789,'Verzamelfiguren en knuffels',8780)
INSERT Categorieen (ID,Name,Parent) VALUES (8792,'Briefpapier',8780)
INSERT Categorieen (ID,Name,Parent) VALUES (8796,'Overige Diddl',8780)
INSERT Categorieen (ID,Name,Parent) VALUES (8820,'Mineralen en fossielen',1)
INSERT Categorieen (ID,Name,Parent) VALUES (8830,'Pins',47499)
INSERT Categorieen (ID,Name,Parent) VALUES (8861,'Reclameborden',34)
INSERT Categorieen (ID,Name,Parent) VALUES (8870,'Zippo''s',9832)
INSERT Categorieen (ID,Name,Parent) VALUES (8874,'Overige rookartikelen',9832)
INSERT Categorieen (ID,Name,Parent) VALUES (8875,'Overige antieke apparaten',7474)
INSERT Categorieen (ID,Name,Parent) VALUES (8878,'Telefoonkaarten',1)
INSERT Categorieen (ID,Name,Parent) VALUES (8886,'Motieven',8878)
INSERT Categorieen (ID,Name,Parent) VALUES (8887,'Nederland',8878)
INSERT Categorieen (ID,Name,Parent) VALUES (8892,'Ruimtevaart',417)
INSERT Categorieen (ID,Name,Parent) VALUES (8893,'Overige transport',417)
INSERT Categorieen (ID,Name,Parent) VALUES (8991,'Ansichtkaarten en foto''s',1)
INSERT Categorieen (ID,Name,Parent) VALUES (8998,'Oorlogen',8991)
INSERT Categorieen (ID,Name,Parent) VALUES (9002,'Dieren',8991)
INSERT Categorieen (ID,Name,Parent) VALUES (9013,'Auto''s en transport',8991)
INSERT Categorieen (ID,Name,Parent) VALUES (9014,'Auto''s',9013)
INSERT Categorieen (ID,Name,Parent) VALUES (9018,'Vliegtuigen',9013)
INSERT Categorieen (ID,Name,Parent) VALUES (9019,'Schepen',9013)
INSERT Categorieen (ID,Name,Parent) VALUES (9031,'Overig Europa',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (9033,'Azië',8991)
INSERT Categorieen (ID,Name,Parent) VALUES (9035,'Treinen',1188)
INSERT Categorieen (ID,Name,Parent) VALUES (9040,'Overig Spoor N',13292)
INSERT Categorieen (ID,Name,Parent) VALUES (9047,'Brochures e.d.',9035)
INSERT Categorieen (ID,Name,Parent) VALUES (9053,'Spoor H0',9035)
INSERT Categorieen (ID,Name,Parent) VALUES (9056,'Roco',9053)
INSERT Categorieen (ID,Name,Parent) VALUES (9060,'Fleischmann',9053)
INSERT Categorieen (ID,Name,Parent) VALUES (9090,'Bburago',222)
INSERT Categorieen (ID,Name,Parent) VALUES (9097,'Herpa',222)
INSERT Categorieen (ID,Name,Parent) VALUES (9107,'Hot wheels',222)
INSERT Categorieen (ID,Name,Parent) VALUES (9108,'Minichamps',222)
INSERT Categorieen (ID,Name,Parent) VALUES (9114,'Norev',222)
INSERT Categorieen (ID,Name,Parent) VALUES (9125,'Siku',222)
INSERT Categorieen (ID,Name,Parent) VALUES (9141,'Bouwpakketten',1188)
INSERT Categorieen (ID,Name,Parent) VALUES (9153,'Radiobestuurd',1188)
INSERT Categorieen (ID,Name,Parent) VALUES (9165,'Overig constructief speelgoed',18993)
INSERT Categorieen (ID,Name,Parent) VALUES (9173,'Auto''s',22138)
INSERT Categorieen (ID,Name,Parent) VALUES (9177,'Kennis- en vraagspellen',233)
INSERT Categorieen (ID,Name,Parent) VALUES (9178,'Bordspellen',233)
INSERT Categorieen (ID,Name,Parent) VALUES (9185,'Verzamelingen en partijen',220)
INSERT Categorieen (ID,Name,Parent) VALUES (9192,'Fietsen en fietssport',888)
INSERT Categorieen (ID,Name,Parent) VALUES (9194,'Racefietsen',9192)
INSERT Categorieen (ID,Name,Parent) VALUES (9202,'Watersporten',888)
INSERT Categorieen (ID,Name,Parent) VALUES (9206,'Overige sportverzamelartikelen',202)
INSERT Categorieen (ID,Name,Parent) VALUES (9284,'Overige horloges',26088)
INSERT Categorieen (ID,Name,Parent) VALUES (9291,'Overige sporthorloges',91068)
INSERT Categorieen (ID,Name,Parent) VALUES (9295,'Onderdelen en accessoires',281)
INSERT Categorieen (ID,Name,Parent) VALUES (9301,'Verzamelingen en partijen',281)
INSERT Categorieen (ID,Name,Parent) VALUES (9319,'Bijoux',281)
INSERT Categorieen (ID,Name,Parent) VALUES (9321,'Ringen',9319)
INSERT Categorieen (ID,Name,Parent) VALUES (9322,'Gewone oorsieraden',10985)
INSERT Categorieen (ID,Name,Parent) VALUES (9348,'Cherished Teddies',386)
INSERT Categorieen (ID,Name,Parent) VALUES (9355,'GSM''s',14675)
INSERT Categorieen (ID,Name,Parent) VALUES (9394,'Accessoires en onderdelen',14675)
INSERT Categorieen (ID,Name,Parent) VALUES (9399,'Siemens',115680)
INSERT Categorieen (ID,Name,Parent) VALUES (9431,'Diensten',12576)
INSERT Categorieen (ID,Name,Parent) VALUES (9435,'Groothandel en restpartijen',12576)
INSERT Categorieen (ID,Name,Parent) VALUES (9559,'Cursussen en opleidingen',9431)
INSERT Categorieen (ID,Name,Parent) VALUES (9560,'Financieel en juridisch',9431)
INSERT Categorieen (ID,Name,Parent) VALUES (9574,'Overige diensten',9431)
INSERT Categorieen (ID,Name,Parent) VALUES (9662,'Partijen en groothandel',160)
INSERT Categorieen (ID,Name,Parent) VALUES (9715,'Overige industrie en kantoor',12576)
INSERT Categorieen (ID,Name,Parent) VALUES (9800,'Auto''s, motoren en boten',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (9801,'Auto''s',9800)
INSERT Categorieen (ID,Name,Parent) VALUES (9804,'Motoren',9800)
INSERT Categorieen (ID,Name,Parent) VALUES (9812,'Overig transport en verkeer',64802)
INSERT Categorieen (ID,Name,Parent) VALUES (9815,'Kantoorartikelen en inrichting',12576)
INSERT Categorieen (ID,Name,Parent) VALUES (9816,'Dameskleding',11450)
INSERT Categorieen (ID,Name,Parent) VALUES (9817,'Herenkleding',11450)
INSERT Categorieen (ID,Name,Parent) VALUES (9820,'Actiefiguren',8605)
INSERT Categorieen (ID,Name,Parent) VALUES (9822,'Overige wargames',16486)
INSERT Categorieen (ID,Name,Parent) VALUES (9824,'Overige Star Wars',112034)
INSERT Categorieen (ID,Name,Parent) VALUES (9830,'Overige aanstekers',9832)
INSERT Categorieen (ID,Name,Parent) VALUES (9832,'Rookartikelen, Zippo''s',1)
INSERT Categorieen (ID,Name,Parent) VALUES (9834,'Alfa Romeo',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (9835,'Audi',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (9837,'BMW',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (9843,'Fiat',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (9844,'Ford',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (9855,'Mercedes',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (9858,'Opel',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (9859,'Peugeot',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (9860,'Porsche',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (9861,'Renault',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (9872,'Volvo',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (9873,'Volkswagen',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (9883,'Overige auto''s',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (9884,'Autoaccessoires en onderdelen',9800)
INSERT Categorieen (ID,Name,Parent) VALUES (9887,'Overige accessoires',82099)
INSERT Categorieen (ID,Name,Parent) VALUES (9888,'Standaard velgen',14770)
INSERT Categorieen (ID,Name,Parent) VALUES (9891,'Banden',14770)
INSERT Categorieen (ID,Name,Parent) VALUES (9895,'Overige onderdelen',63318)
INSERT Categorieen (ID,Name,Parent) VALUES (9903,'Overige oldtimers',18323)
INSERT Categorieen (ID,Name,Parent) VALUES (9939,'Scooters en brommers',9800)
INSERT Categorieen (ID,Name,Parent) VALUES (9973,'Overige verbruiksartikelen',106261)
INSERT Categorieen (ID,Name,Parent) VALUES (9975,'GI Joe',9820)
INSERT Categorieen (ID,Name,Parent) VALUES (9980,'Transformers',75718)
INSERT Categorieen (ID,Name,Parent) VALUES (9983,'Overige actiefiguren',9820)
INSERT Categorieen (ID,Name,Parent) VALUES (9992,'Glamrock',19483)
INSERT Categorieen (ID,Name,Parent) VALUES (10434,'Overig onderhoud',30167)
INSERT Categorieen (ID,Name,Parent) VALUES (10511,'Skating en rolschaatsen',888)
INSERT Categorieen (ID,Name,Parent) VALUES (10514,'Paardensport',888)
INSERT Categorieen (ID,Name,Parent) VALUES (10518,'Duiksport',888)
INSERT Categorieen (ID,Name,Parent) VALUES (10525,'Barbie',226)
INSERT Categorieen (ID,Name,Parent) VALUES (10584,'Filters',11272)
INSERT Categorieen (ID,Name,Parent) VALUES (10615,'Luidsprekers',14969)
INSERT Categorieen (ID,Name,Parent) VALUES (10682,'Verzamelaarshorloges',26088)
INSERT Categorieen (ID,Name,Parent) VALUES (10705,'Parels',281)
INSERT Categorieen (ID,Name,Parent) VALUES (10914,'Just the Right Shoe',8710)
INSERT Categorieen (ID,Name,Parent) VALUES (10960,'Harley Davidson',34)
INSERT Categorieen (ID,Name,Parent) VALUES (10975,'Armbanden',281)
INSERT Categorieen (ID,Name,Parent) VALUES (10985,'Oorsieraden',281)
INSERT Categorieen (ID,Name,Parent) VALUES (10994,'Hangers',281)
INSERT Categorieen (ID,Name,Parent) VALUES (11006,'Hangers',9319)
INSERT Categorieen (ID,Name,Parent) VALUES (11007,'Broches',281)
INSERT Categorieen (ID,Name,Parent) VALUES (11015,'Overige sieraden',281)
INSERT Categorieen (ID,Name,Parent) VALUES (11046,'PC games',14616)
INSERT Categorieen (ID,Name,Parent) VALUES (11047,'Actie en avontuur',11046)
INSERT Categorieen (ID,Name,Parent) VALUES (11048,'Arcade',11046)
INSERT Categorieen (ID,Name,Parent) VALUES (11049,'Racen',11046)
INSERT Categorieen (ID,Name,Parent) VALUES (11050,'Rollenspellen',11046)
INSERT Categorieen (ID,Name,Parent) VALUES (11051,'Simulatie',11046)
INSERT Categorieen (ID,Name,Parent) VALUES (11053,'Strategie',11046)
INSERT Categorieen (ID,Name,Parent) VALUES (11116,'Munten en bankbiljetten',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (11226,'Besturingssystemen',18793)
INSERT Categorieen (ID,Name,Parent) VALUES (11232,'Film en DVD',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (11233,'Muziek en -instrumenten',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (11262,'Domeinnamen en webhosting',12576)
INSERT Categorieen (ID,Name,Parent) VALUES (11272,'Accessoires (analoog)',625)
INSERT Categorieen (ID,Name,Parent) VALUES (11285,'Benodigdheden honden',8440)
INSERT Categorieen (ID,Name,Parent) VALUES (11321,'Actie en avontuur',15122)
INSERT Categorieen (ID,Name,Parent) VALUES (11323,'Racen',15122)
INSERT Categorieen (ID,Name,Parent) VALUES (11324,'Rollenspellen',15122)
INSERT Categorieen (ID,Name,Parent) VALUES (11326,'Sport',15122)
INSERT Categorieen (ID,Name,Parent) VALUES (11327,'Strategie',15122)
INSERT Categorieen (ID,Name,Parent) VALUES (11328,'Consoles',21186)
INSERT Categorieen (ID,Name,Parent) VALUES (11373,'Loepen',22490)
INSERT Categorieen (ID,Name,Parent) VALUES (11450,'Kleding en mode',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (11700,'Huis en tuin',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (11731,'Educatief speelgoed',220)
INSERT Categorieen (ID,Name,Parent) VALUES (11748,'Land- en tuinbouw',12576)
INSERT Categorieen (ID,Name,Parent) VALUES (11777,'Therapeutische producten',47867)
INSERT Categorieen (ID,Name,Parent) VALUES (11815,'Medische benodigdheden',12576)
INSERT Categorieen (ID,Name,Parent) VALUES (11838,'Lichaamsverzorging',12155)
INSERT Categorieen (ID,Name,Parent) VALUES (11853,'Overige haarverzorging',47879)
INSERT Categorieen (ID,Name,Parent) VALUES (11874,'Horeca',12576)
INSERT Categorieen (ID,Name,Parent) VALUES (11890,'Winkelinrichting en inventaris',12576)
INSERT Categorieen (ID,Name,Parent) VALUES (11988,'Retro spelcomputers',14616)
INSERT Categorieen (ID,Name,Parent) VALUES (12065,'Elektronica-onderdelen',293)
INSERT Categorieen (ID,Name,Parent) VALUES (12081,'Baby',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (12090,'Broeken',9816)
INSERT Categorieen (ID,Name,Parent) VALUES (12104,'Damesschoenen',11450)
INSERT Categorieen (ID,Name,Parent) VALUES (12109,'Accessoires',11450)
INSERT Categorieen (ID,Name,Parent) VALUES (12111,'Sjaals en dassen',12109)
INSERT Categorieen (ID,Name,Parent) VALUES (12136,'Herenschoenen',11450)
INSERT Categorieen (ID,Name,Parent) VALUES (12155,'Gezondheid en verzorging',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (12157,'Parfum, eau en after shave',12155)
INSERT Categorieen (ID,Name,Parent) VALUES (12165,'Overige keukenapparatuur',30329)
INSERT Categorieen (ID,Name,Parent) VALUES (12171,'Bessy',63)
INSERT Categorieen (ID,Name,Parent) VALUES (12172,'Jerom',63)
INSERT Categorieen (ID,Name,Parent) VALUES (12174,'Lucky Luke',63)
INSERT Categorieen (ID,Name,Parent) VALUES (12214,'Motorfietsen',1188)
INSERT Categorieen (ID,Name,Parent) VALUES (12294,'Klokken en uurwerken',3192)
INSERT Categorieen (ID,Name,Parent) VALUES (12395,'Prepaid kaarten en -pakketten',14675)
INSERT Categorieen (ID,Name,Parent) VALUES (12417,'Motorola',15073)
INSERT Categorieen (ID,Name,Parent) VALUES (12423,'Nokia',15073)
INSERT Categorieen (ID,Name,Parent) VALUES (12427,'Overige frontjes en covers',111202)
INSERT Categorieen (ID,Name,Parent) VALUES (12429,'Panasonic',15073)
INSERT Categorieen (ID,Name,Parent) VALUES (12434,'Philips',15073)
INSERT Categorieen (ID,Name,Parent) VALUES (12440,'Sagem',15073)
INSERT Categorieen (ID,Name,Parent) VALUES (12446,'Samsung',15073)
INSERT Categorieen (ID,Name,Parent) VALUES (12452,'Siemens',15073)
INSERT Categorieen (ID,Name,Parent) VALUES (12547,'Poppenhuizen en toebehoren',226)
INSERT Categorieen (ID,Name,Parent) VALUES (12549,'Poppenkleding en -artikelen',226)
INSERT Categorieen (ID,Name,Parent) VALUES (12576,'Industrie en kantoor',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (12593,'Superhelden',41520)
INSERT Categorieen (ID,Name,Parent) VALUES (12805,'Chansons',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (12810,'Bladmuziek en muziekboeken',619)
INSERT Categorieen (ID,Name,Parent) VALUES (12821,'Afrika',12822)
INSERT Categorieen (ID,Name,Parent) VALUES (12822,'Biljetten Buitenland',11116)
INSERT Categorieen (ID,Name,Parent) VALUES (12823,'Australië',12822)
INSERT Categorieen (ID,Name,Parent) VALUES (12824,'Oceanië',12822)
INSERT Categorieen (ID,Name,Parent) VALUES (12838,'Microfoons',3676)
INSERT Categorieen (ID,Name,Parent) VALUES (12909,'PA- en podiumapparatuur',21770)
INSERT Categorieen (ID,Name,Parent) VALUES (12941,'Satelliet- en kabelontvangers',3287)
INSERT Categorieen (ID,Name,Parent) VALUES (12952,'Overige huishoudelijke app',20710)
INSERT Categorieen (ID,Name,Parent) VALUES (12982,'Overige maat 68',127688)
INSERT Categorieen (ID,Name,Parent) VALUES (12984,'Overige maat 80',127690)
INSERT Categorieen (ID,Name,Parent) VALUES (12985,'Overige maat 86',127691)
INSERT Categorieen (ID,Name,Parent) VALUES (12989,'Avondkleding',9816)
INSERT Categorieen (ID,Name,Parent) VALUES (12995,'Avondkleding en bruidskleding',3029)
INSERT Categorieen (ID,Name,Parent) VALUES (12997,'Combinaties en mantelpakken',9816)
INSERT Categorieen (ID,Name,Parent) VALUES (12998,'Maat 32-34 (XXS/XS)',12997)
INSERT Categorieen (ID,Name,Parent) VALUES (12999,'Maat 36 (S)',12997)
INSERT Categorieen (ID,Name,Parent) VALUES (13016,'Jeans',9816)
INSERT Categorieen (ID,Name,Parent) VALUES (13019,'Broeken en jeans',3029)
INSERT Categorieen (ID,Name,Parent) VALUES (13021,'Blouses',9816)
INSERT Categorieen (ID,Name,Parent) VALUES (13027,'Blouses en hemden',3029)
INSERT Categorieen (ID,Name,Parent) VALUES (13029,'Truien',9816)
INSERT Categorieen (ID,Name,Parent) VALUES (13035,'Truien',3029)
INSERT Categorieen (ID,Name,Parent) VALUES (13045,'Jasjes en blazers',9816)
INSERT Categorieen (ID,Name,Parent) VALUES (13051,'Jassen en jasjes',3029)
INSERT Categorieen (ID,Name,Parent) VALUES (13126,'Truien',9817)
INSERT Categorieen (ID,Name,Parent) VALUES (13135,'Pantalons',9817)
INSERT Categorieen (ID,Name,Parent) VALUES (13154,'Sportkleding',11450)
INSERT Categorieen (ID,Name,Parent) VALUES (13213,'Jassen en jasjes',98333)
INSERT Categorieen (ID,Name,Parent) VALUES (13214,'Jassen en jasjes',98374)
INSERT Categorieen (ID,Name,Parent) VALUES (13219,'Blouses en overhemden',98333)
INSERT Categorieen (ID,Name,Parent) VALUES (13220,'Blouses en overhemden',98374)
INSERT Categorieen (ID,Name,Parent) VALUES (13225,'Broeken',98333)
INSERT Categorieen (ID,Name,Parent) VALUES (13226,'Broeken',98374)
INSERT Categorieen (ID,Name,Parent) VALUES (13231,'Truien',98333)
INSERT Categorieen (ID,Name,Parent) VALUES (13232,'Truien',98374)
INSERT Categorieen (ID,Name,Parent) VALUES (13236,'Maat 32-41',80947)
INSERT Categorieen (ID,Name,Parent) VALUES (13242,'Jassen en jasjes',98386)
INSERT Categorieen (ID,Name,Parent) VALUES (13243,'Jassen en jasjes',98390)
INSERT Categorieen (ID,Name,Parent) VALUES (13246,'Truien',98386)
INSERT Categorieen (ID,Name,Parent) VALUES (13247,'Truien',98390)
INSERT Categorieen (ID,Name,Parent) VALUES (13250,'Blouses',98386)
INSERT Categorieen (ID,Name,Parent) VALUES (13251,'Blouses',98390)
INSERT Categorieen (ID,Name,Parent) VALUES (13254,'Rokken en jurken',98386)
INSERT Categorieen (ID,Name,Parent) VALUES (13255,'Rokken en jurken',98390)
INSERT Categorieen (ID,Name,Parent) VALUES (13258,'Broeken',98386)
INSERT Categorieen (ID,Name,Parent) VALUES (13259,'Broeken',98390)
INSERT Categorieen (ID,Name,Parent) VALUES (13264,'Make-up',12155)
INSERT Categorieen (ID,Name,Parent) VALUES (13292,'Spoor N',9035)
INSERT Categorieen (ID,Name,Parent) VALUES (13296,'Schuco',222)
INSERT Categorieen (ID,Name,Parent) VALUES (13315,'Lego en Duplo',220)
INSERT Categorieen (ID,Name,Parent) VALUES (13327,'Overige vakantie',160939)
INSERT Categorieen (ID,Name,Parent) VALUES (13331,'Voetbal',888)
INSERT Categorieen (ID,Name,Parent) VALUES (13334,'Golf',888)
INSERT Categorieen (ID,Name,Parent) VALUES (13340,'Tennis',888)
INSERT Categorieen (ID,Name,Parent) VALUES (13347,'Overige sporten',888)
INSERT Categorieen (ID,Name,Parent) VALUES (13353,'Bootkleding',9800)
INSERT Categorieen (ID,Name,Parent) VALUES (13355,'Verf en onderhoud',36629)
INSERT Categorieen (ID,Name,Parent) VALUES (13358,'Overige bootaccessoires',36629)
INSERT Categorieen (ID,Name,Parent) VALUES (13361,'Fitness en training',888)
INSERT Categorieen (ID,Name,Parent) VALUES (13362,'Overige fitness',13361)
INSERT Categorieen (ID,Name,Parent) VALUES (13364,'Vlieg- en luchtsport',888)
INSERT Categorieen (ID,Name,Parent) VALUES (13368,'Funsport',888)
INSERT Categorieen (ID,Name,Parent) VALUES (13379,'Overige paardensport',10514)
INSERT Categorieen (ID,Name,Parent) VALUES (13389,'Skiën en langlaufen',888)
INSERT Categorieen (ID,Name,Parent) VALUES (13394,'Snowboarden',888)
INSERT Categorieen (ID,Name,Parent) VALUES (13419,'Gewone hangers',10994)
INSERT Categorieen (ID,Name,Parent) VALUES (13436,'Motorola',23979)
INSERT Categorieen (ID,Name,Parent) VALUES (13437,'Nokia',23979)
INSERT Categorieen (ID,Name,Parent) VALUES (13441,'Samsung',23979)
INSERT Categorieen (ID,Name,Parent) VALUES (13493,'Rokken',9816)
INSERT Categorieen (ID,Name,Parent) VALUES (13518,'Jokers en speelkaarten',1)
INSERT Categorieen (ID,Name,Parent) VALUES (13658,'Stripfiguren',75718)
INSERT Categorieen (ID,Name,Parent) VALUES (13846,'Sneeuwkogels',137)
INSERT Categorieen (ID,Name,Parent) VALUES (13926,'Chocolade-artikelen',1)
INSERT Categorieen (ID,Name,Parent) VALUES (13976,'Voor 1940',15502)
INSERT Categorieen (ID,Name,Parent) VALUES (13992,'Kranten',607)
INSERT Categorieen (ID,Name,Parent) VALUES (13998,'Koningshuizen',8991)
INSERT Categorieen (ID,Name,Parent) VALUES (14027,'Motoren',267)
INSERT Categorieen (ID,Name,Parent) VALUES (14049,'Luchtvaart',417)
INSERT Categorieen (ID,Name,Parent) VALUES (14233,'Brochures en documentatie',9800)
INSERT Categorieen (ID,Name,Parent) VALUES (14235,'Tijdschriften en jaarboeken',14233)
INSERT Categorieen (ID,Name,Parent) VALUES (14256,'Overige caravans en vouwwagens',44794)
INSERT Categorieen (ID,Name,Parent) VALUES (14258,'Auto audio, video en navigatie',9800)
INSERT Categorieen (ID,Name,Parent) VALUES (14259,'Autoradio''s met cd en mp3',14258)
INSERT Categorieen (ID,Name,Parent) VALUES (14260,'Autoradio''s met cassette',14258)
INSERT Categorieen (ID,Name,Parent) VALUES (14261,'Autoradio''s met minidisc',14258)
INSERT Categorieen (ID,Name,Parent) VALUES (14263,'Cd-spelers en -wisselaars',14258)
INSERT Categorieen (ID,Name,Parent) VALUES (14264,'Equalizers',14258)
INSERT Categorieen (ID,Name,Parent) VALUES (14274,'Overig audio, video, navigatie',14258)
INSERT Categorieen (ID,Name,Parent) VALUES (14291,'Intel',78769)
INSERT Categorieen (ID,Name,Parent) VALUES (14328,'Overige herenhorloges',91064)
INSERT Categorieen (ID,Name,Parent) VALUES (14357,'Aas',1492)
INSERT Categorieen (ID,Name,Parent) VALUES (14385,'Waterski''s',1293)
INSERT Categorieen (ID,Name,Parent) VALUES (14450,'Bestelauto''s',46159)
INSERT Categorieen (ID,Name,Parent) VALUES (14483,'Huidige albums',127799)
INSERT Categorieen (ID,Name,Parent) VALUES (14596,'Nederlandstalig',20801)
INSERT Categorieen (ID,Name,Parent) VALUES (14601,'Nederlandstalig',21733)
INSERT Categorieen (ID,Name,Parent) VALUES (14604,'Nederlandstalig',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (14616,'Games en consoles',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (14675,'GSM en telecom',-1)
INSERT Categorieen (ID,Name,Parent) VALUES (14732,'Classic Rock',19483)
INSERT Categorieen (ID,Name,Parent) VALUES (14761,'Tuning, styling en interieur',9884)
INSERT Categorieen (ID,Name,Parent) VALUES (14767,'Overige tuning, styling, int.',14761)
INSERT Categorieen (ID,Name,Parent) VALUES (14768,'Carrosserie',9884)
INSERT Categorieen (ID,Name,Parent) VALUES (14769,'Overige carrosserie',14768)
INSERT Categorieen (ID,Name,Parent) VALUES (14770,'Velgen en banden',9884)
INSERT Categorieen (ID,Name,Parent) VALUES (14771,'Overige velgen en banden',14770)
INSERT Categorieen (ID,Name,Parent) VALUES (14780,'Motoronderdelen en -access.',9800)
INSERT Categorieen (ID,Name,Parent) VALUES (14784,'Motorkleding en helmen',9800)
INSERT Categorieen (ID,Name,Parent) VALUES (14785,'Helmen en toebehoren',14784)
INSERT Categorieen (ID,Name,Parent) VALUES (14788,'Overige motorkleding',14784)
INSERT Categorieen (ID,Name,Parent) VALUES (14803,'Geheugenkaarten',8297)
INSERT Categorieen (ID,Name,Parent) VALUES (14824,'Keukenweegschalen',30329)
INSERT Categorieen (ID,Name,Parent) VALUES (14830,'Overige maat 56',127686)
INSERT Categorieen (ID,Name,Parent) VALUES (14890,'Acteurs',33416)
INSERT Categorieen (ID,Name,Parent) VALUES (14969,'Geluid',293)
INSERT Categorieen (ID,Name,Parent) VALUES (15034,'Overige batterijen en opladers',15073)
INSERT Categorieen (ID,Name,Parent) VALUES (15036,'Overige telefoontasjes',24040)
INSERT Categorieen (ID,Name,Parent) VALUES (15049,'Telefoons en faxen',14675)
INSERT Categorieen (ID,Name,Parent) VALUES (15073,'Batterijen en opladers',9394)
INSERT Categorieen (ID,Name,Parent) VALUES (15103,'Games',127897)
INSERT Categorieen (ID,Name,Parent) VALUES (15110,'Sega',14616)
INSERT Categorieen (ID,Name,Parent) VALUES (15120,'Games',27713)
INSERT Categorieen (ID,Name,Parent) VALUES (15122,'Games',21186)
INSERT Categorieen (ID,Name,Parent) VALUES (15456,'Verzorging',12081)
INSERT Categorieen (ID,Name,Parent) VALUES (15458,'Overige verzorging',15456)
INSERT Categorieen (ID,Name,Parent) VALUES (15460,'Overige voeding',106769)
INSERT Categorieen (ID,Name,Parent) VALUES (15468,'Vervoer',12081)
INSERT Categorieen (ID,Name,Parent) VALUES (15471,'Babykamers en -meubels',2984)
INSERT Categorieen (ID,Name,Parent) VALUES (15476,'Wiegen',2984)
INSERT Categorieen (ID,Name,Parent) VALUES (15477,'Commodes',2984)
INSERT Categorieen (ID,Name,Parent) VALUES (15502,'Militaria',1)
INSERT Categorieen (ID,Name,Parent) VALUES (15510,'Vliegtuigen',1188)
INSERT Categorieen (ID,Name,Parent) VALUES (15514,'Partijen en losse onderdelen',13315)
INSERT Categorieen (ID,Name,Parent) VALUES (15537,'Inktpatronen',106261)
INSERT Categorieen (ID,Name,Parent) VALUES (15643,'Nachtkleding',98380)
INSERT Categorieen (ID,Name,Parent) VALUES (15720,'Bruidskleding',9816)
INSERT Categorieen (ID,Name,Parent) VALUES (15770,'Bad- en strandmode',11450)
INSERT Categorieen (ID,Name,Parent) VALUES (15811,'Gymschoenen',12104)
INSERT Categorieen (ID,Name,Parent) VALUES (15816,'Hoge laarzen',127937)
INSERT Categorieen (ID,Name,Parent) VALUES (15918,'AMD',78769)
INSERT Categorieen (ID,Name,Parent) VALUES (16078,'Boottickets',1305)
INSERT Categorieen (ID,Name,Parent) VALUES (16157,'Overige games',15122)
INSERT Categorieen (ID,Name,Parent) VALUES (16486,'Wargames',220)
INSERT Categorieen (ID,Name,Parent) VALUES (16528,'Overig keramiek',60913)
INSERT Categorieen (ID,Name,Parent) VALUES (16531,'Blikken, brons en tin',1211)
INSERT Categorieen (ID,Name,Parent) VALUES (16533,'Overige kunstvoorwerpen',1211)
INSERT Categorieen (ID,Name,Parent) VALUES (16663,'Actie en avontuur',1508)
INSERT Categorieen (ID,Name,Parent) VALUES (16665,'Comedy en humor',1508)
INSERT Categorieen (ID,Name,Parent) VALUES (16672,'Tekenfilms en animatie',1508)
INSERT Categorieen (ID,Name,Parent) VALUES (16674,'Thriller en misdaad',1508)
INSERT Categorieen (ID,Name,Parent) VALUES (16675,'Sciencefiction en fantasy',1508)
INSERT Categorieen (ID,Name,Parent) VALUES (16679,'Overige video''s',1508)
INSERT Categorieen (ID,Name,Parent) VALUES (16911,'Tot 600 cc',9804)
INSERT Categorieen (ID,Name,Parent) VALUES (16918,'600 tot 1000 cc',9804)
INSERT Categorieen (ID,Name,Parent) VALUES (16925,'Zwaarder dan 1000 cc',9804)
INSERT Categorieen (ID,Name,Parent) VALUES (16991,'Kantoorartikelen',9815)
INSERT Categorieen (ID,Name,Parent) VALUES (17032,'Overige treinen',9035)
INSERT Categorieen (ID,Name,Parent) VALUES (17076,'Batman',900)
INSERT Categorieen (ID,Name,Parent) VALUES (17082,'Spider-Man',900)
INSERT Categorieen (ID,Name,Parent) VALUES (17084,'Superman',900)
INSERT Categorieen (ID,Name,Parent) VALUES (17085,'X-men',900)
INSERT Categorieen (ID,Name,Parent) VALUES (17090,'Harde kaft',63)
INSERT Categorieen (ID,Name,Parent) VALUES (17157,'Kinderen van 6 tot 9 jaar',1093)
INSERT Categorieen (ID,Name,Parent) VALUES (17163,'Baby, peuter en kleuter',1093)
INSERT Categorieen (ID,Name,Parent) VALUES (17214,'1990 - heden',131188)
INSERT Categorieen (ID,Name,Parent) VALUES (17330,'Overige dameshorloges',91060)
INSERT Categorieen (ID,Name,Parent) VALUES (17351,'Overige gezondheid',12155)
INSERT Categorieen (ID,Name,Parent) VALUES (17355,'Unisex-schoenen',128240)
INSERT Categorieen (ID,Name,Parent) VALUES (17550,'Overige CD-singels',21733)
INSERT Categorieen (ID,Name,Parent) VALUES (17725,'Overige sportartikelen',113754)
INSERT Categorieen (ID,Name,Parent) VALUES (17771,'Gebruikt',25793)
INSERT Categorieen (ID,Name,Parent) VALUES (17797,'Overige fauna',36702)
INSERT Categorieen (ID,Name,Parent) VALUES (17805,'Overige andere formaten',35064)
INSERT Categorieen (ID,Name,Parent) VALUES (18174,'Citroën',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (18179,'Daewoo',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (18180,'Ferrari',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (18183,'Hyundai',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (18185,'Jaguar',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (18186,'Lancia',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (18187,'Maserati',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (18206,'Honda',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (18211,'Mazda',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (18230,'Mitsubishi',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (18238,'Nissan',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (18262,'Rover',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (18263,'Saab',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (18270,'Seat',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (18275,'Skoda',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (18276,'Smart',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (18277,'Subaru',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (18283,'Suzuki',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (18290,'Toyota',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (18307,'Overige transportvoertuigen',46159)
INSERT Categorieen (ID,Name,Parent) VALUES (18323,'Oldtimers',9884)
INSERT Categorieen (ID,Name,Parent) VALUES (18332,'Handleidingen',14233)
INSERT Categorieen (ID,Name,Parent) VALUES (18369,'Brochures en folders',14233)
INSERT Categorieen (ID,Name,Parent) VALUES (18370,'Italiaanse merken',18369)
INSERT Categorieen (ID,Name,Parent) VALUES (18373,'Franse merken',18369)
INSERT Categorieen (ID,Name,Parent) VALUES (18379,'Aziatische merken',18369)
INSERT Categorieen (ID,Name,Parent) VALUES (18384,'Duitse merken',18369)
INSERT Categorieen (ID,Name,Parent) VALUES (18391,'Engelse merken',18369)
INSERT Categorieen (ID,Name,Parent) VALUES (18405,'Overige merken',18369)
INSERT Categorieen (ID,Name,Parent) VALUES (18449,'Quads en trikes',9800)
INSERT Categorieen (ID,Name,Parent) VALUES (18466,'Middeleeuws',4733)
INSERT Categorieen (ID,Name,Parent) VALUES (18478,'Litouwen',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (18479,'Tsjechoslowakije',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (18480,'Turkije',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (18483,'Caraïben',45145)
INSERT Categorieen (ID,Name,Parent) VALUES (18492,'Penningen',11116)
INSERT Categorieen (ID,Name,Parent) VALUES (18504,'Herinneringspenningen',18492)
INSERT Categorieen (ID,Name,Parent) VALUES (18546,'Onderdelen en accessoires',3707)
INSERT Categorieen (ID,Name,Parent) VALUES (18552,'Netwerkkaarten',32202)
INSERT Categorieen (ID,Name,Parent) VALUES (18605,'DJ-apparatuur',21770)
INSERT Categorieen (ID,Name,Parent) VALUES (18634,'Babyschoenen',12081)
INSERT Categorieen (ID,Name,Parent) VALUES (18637,'Speelgoed',12081)
INSERT Categorieen (ID,Name,Parent) VALUES (18638,'Prentenboeken',18637)
INSERT Categorieen (ID,Name,Parent) VALUES (18639,'Speelsets en speelkleden',18637)
INSERT Categorieen (ID,Name,Parent) VALUES (18640,'Rammelaars en bijtringen',18637)
INSERT Categorieen (ID,Name,Parent) VALUES (18643,'Beddengoed',2984)
INSERT Categorieen (ID,Name,Parent) VALUES (18648,'Muppet Show',8605)
INSERT Categorieen (ID,Name,Parent) VALUES (18677,'Overige fietskleding',22171)
INSERT Categorieen (ID,Name,Parent) VALUES (18755,'Medailles',11116)
INSERT Categorieen (ID,Name,Parent) VALUES (18793,'Software',160)
INSERT Categorieen (ID,Name,Parent) VALUES (18823,'Foto''s',196)
INSERT Categorieen (ID,Name,Parent) VALUES (18824,'Oude films',18823)
INSERT Categorieen (ID,Name,Parent) VALUES (18826,'Overige foto''s',18823)
INSERT Categorieen (ID,Name,Parent) VALUES (18828,'Posters, affiches en kaartjes',1)
INSERT Categorieen (ID,Name,Parent) VALUES (18854,'Tv en series',18823)
INSERT Categorieen (ID,Name,Parent) VALUES (18923,'Overige golf',13334)
INSERT Categorieen (ID,Name,Parent) VALUES (18925,'Kleding',13334)
INSERT Categorieen (ID,Name,Parent) VALUES (18993,'Constructief speelgoed',220)
INSERT Categorieen (ID,Name,Parent) VALUES (19005,'Mindstorms',13315)
INSERT Categorieen (ID,Name,Parent) VALUES (19006,'Sets en overige lego',13315)
INSERT Categorieen (ID,Name,Parent) VALUES (19012,'Bionicle',13315)
INSERT Categorieen (ID,Name,Parent) VALUES (19016,'Klassiek speelgoed',220)
INSERT Categorieen (ID,Name,Parent) VALUES (19017,'Frisbees en boemerangs',25960)
INSERT Categorieen (ID,Name,Parent) VALUES (19024,'Hobbelpaarden',19016)
INSERT Categorieen (ID,Name,Parent) VALUES (19071,'Elektronisch speelgoed',220)
INSERT Categorieen (ID,Name,Parent) VALUES (19085,'Poker',233)
INSERT Categorieen (ID,Name,Parent) VALUES (19110,'Dozen',218)
INSERT Categorieen (ID,Name,Parent) VALUES (19114,'Complete sets',218)
INSERT Categorieen (ID,Name,Parent) VALUES (19115,'Starter decks',218)
INSERT Categorieen (ID,Name,Parent) VALUES (19295,'Kampeerartikelen en tenten',8503)
INSERT Categorieen (ID,Name,Parent) VALUES (19355,'Antieke gebruiksvoorwerpen',353)
INSERT Categorieen (ID,Name,Parent) VALUES (19380,'Delfts blauw',60913)
INSERT Categorieen (ID,Name,Parent) VALUES (19386,'Wandborden en tegels',353)
INSERT Categorieen (ID,Name,Parent) VALUES (19389,'Antiek keramiek',60913)
INSERT Categorieen (ID,Name,Parent) VALUES (19398,'Zilverwerk',1211)
INSERT Categorieen (ID,Name,Parent) VALUES (19449,'Stenen tijdperk',37082)
INSERT Categorieen (ID,Name,Parent) VALUES (19450,'Brons- en ijzertijd',37082)
INSERT Categorieen (ID,Name,Parent) VALUES (19451,'Keltisch',37082)
INSERT Categorieen (ID,Name,Parent) VALUES (19452,'Griekenland',37082)
INSERT Categorieen (ID,Name,Parent) VALUES (19453,'Romeinse tijd',37082)
INSERT Categorieen (ID,Name,Parent) VALUES (19454,'Middeleeuwen',37082)
INSERT Categorieen (ID,Name,Parent) VALUES (19455,'16e en 17e eeuw',37082)
INSERT Categorieen (ID,Name,Parent) VALUES (19464,'Gezondheid en voeding',267)
INSERT Categorieen (ID,Name,Parent) VALUES (19466,'Sport',267)
INSERT Categorieen (ID,Name,Parent) VALUES (19479,'Dance',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (19481,'Klassiek',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (19483,'Rock',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (19485,'Wereldmuziek',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (19516,'Herdenkingseuromunten',7975)
INSERT Categorieen (ID,Name,Parent) VALUES (19605,'CD-spelers',14969)
INSERT Categorieen (ID,Name,Parent) VALUES (19632,'Cassettespelers',14969)
INSERT Categorieen (ID,Name,Parent) VALUES (19671,'Radio''s en wekkerradio''s',14969)
INSERT Categorieen (ID,Name,Parent) VALUES (19721,'Projectors',3287)
INSERT Categorieen (ID,Name,Parent) VALUES (19736,'Tops',9816)
INSERT Categorieen (ID,Name,Parent) VALUES (19743,'Zintuigontwikkeling',18637)
INSERT Categorieen (ID,Name,Parent) VALUES (19747,'Verlichting en decoratie',2984)
INSERT Categorieen (ID,Name,Parent) VALUES (19758,'Hout',25850)
INSERT Categorieen (ID,Name,Parent) VALUES (19804,'Gereedschap (hand)',19859)
INSERT Categorieen (ID,Name,Parent) VALUES (19809,'Barbecues',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (19817,'Vijvers en fonteinen',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (19825,'Spiegels',8733)
INSERT Categorieen (ID,Name,Parent) VALUES (19844,'Racebaan en slotcars',1188)
INSERT Categorieen (ID,Name,Parent) VALUES (19854,'Playmobil',220)
INSERT Categorieen (ID,Name,Parent) VALUES (19858,'Natuur',19854)
INSERT Categorieen (ID,Name,Parent) VALUES (19859,'Gereedschappen',11700)
INSERT Categorieen (ID,Name,Parent) VALUES (19862,'Kasten en vitrines',3192)
INSERT Categorieen (ID,Name,Parent) VALUES (19875,'Vakantiehuisjes',160939)
INSERT Categorieen (ID,Name,Parent) VALUES (19963,'Apparaten',13361)
INSERT Categorieen (ID,Name,Parent) VALUES (19971,'Toebehoren',13361)
INSERT Categorieen (ID,Name,Parent) VALUES (19995,'Overige Barbie',10525)
INSERT Categorieen (ID,Name,Parent) VALUES (20049,'Tv-series en -programma''s',1508)
INSERT Categorieen (ID,Name,Parent) VALUES (20136,'Olieverf',40688)
INSERT Categorieen (ID,Name,Parent) VALUES (20150,'Beeldhouwkunst',550)
INSERT Categorieen (ID,Name,Parent) VALUES (20253,'China',9033)
INSERT Categorieen (ID,Name,Parent) VALUES (20259,'Japan',9033)
INSERT Categorieen (ID,Name,Parent) VALUES (20264,'Zuidoost-Azië',9033)
INSERT Categorieen (ID,Name,Parent) VALUES (20353,'Motorola',111202)
INSERT Categorieen (ID,Name,Parent) VALUES (20387,'Consoles',27717)
INSERT Categorieen (ID,Name,Parent) VALUES (20389,'Accessoires',30307)
INSERT Categorieen (ID,Name,Parent) VALUES (20391,'Consoles',30307)
INSERT Categorieen (ID,Name,Parent) VALUES (20453,'Dekens',3192)
INSERT Categorieen (ID,Name,Parent) VALUES (20460,'Beddengoed en kussens',3192)
INSERT Categorieen (ID,Name,Parent) VALUES (20498,'Bemesting en onderhoud',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (20510,'Overige decoratie',25817)
INSERT Categorieen (ID,Name,Parent) VALUES (20563,'Sierkussens',3192)
INSERT Categorieen (ID,Name,Parent) VALUES (20571,'Tapijten en vloeren',3192)
INSERT Categorieen (ID,Name,Parent) VALUES (20626,'Keuken- en kookbenodigdheden',11700)
INSERT Categorieen (ID,Name,Parent) VALUES (20628,'Pannen en schalen',20626)
INSERT Categorieen (ID,Name,Parent) VALUES (20710,'Huishoudelijke apparatuur',11700)
INSERT Categorieen (ID,Name,Parent) VALUES (20721,'Parasols',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (20727,'Zwembaden',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (20734,'Benodigdheden vogels',8440)
INSERT Categorieen (ID,Name,Parent) VALUES (20754,'Benodigdheden vissen',8440)
INSERT Categorieen (ID,Name,Parent) VALUES (20799,'Karaoke',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (20800,'LP''s en Maxi''s (12'''' , 10'''')',1071)
INSERT Categorieen (ID,Name,Parent) VALUES (20801,'Singles (7'''')',1071)
INSERT Categorieen (ID,Name,Parent) VALUES (20809,'Jazz, blues en soul',20801)
INSERT Categorieen (ID,Name,Parent) VALUES (20835,'Boog- en schietsport',888)
INSERT Categorieen (ID,Name,Parent) VALUES (20852,'IJshockey',888)
INSERT Categorieen (ID,Name,Parent) VALUES (20870,'Ballen',13340)
INSERT Categorieen (ID,Name,Parent) VALUES (21186,'Playstation 2',14616)
INSERT Categorieen (ID,Name,Parent) VALUES (21209,'Biljarten, pool en snooker',888)
INSERT Categorieen (ID,Name,Parent) VALUES (21214,'American football',888)
INSERT Categorieen (ID,Name,Parent) VALUES (21225,'Schaatsen',888)
INSERT Categorieen (ID,Name,Parent) VALUES (21254,'K''NEX',18993)
INSERT Categorieen (ID,Name,Parent) VALUES (21530,'Amerika',8991)
INSERT Categorieen (ID,Name,Parent) VALUES (21533,'Motoren',64802)
INSERT Categorieen (ID,Name,Parent) VALUES (21583,'Antieke instrumenten',353)
INSERT Categorieen (ID,Name,Parent) VALUES (21618,'Midden-Oosten',37082)
INSERT Categorieen (ID,Name,Parent) VALUES (21641,'Speakers',14258)
INSERT Categorieen (ID,Name,Parent) VALUES (21646,'Overige navigatiesystemen',38776)
INSERT Categorieen (ID,Name,Parent) VALUES (21647,'Versterkers',14258)
INSERT Categorieen (ID,Name,Parent) VALUES (21665,'Banden en velgen',14780)
INSERT Categorieen (ID,Name,Parent) VALUES (21687,'Encyclopedieën',267)
INSERT Categorieen (ID,Name,Parent) VALUES (21701,'Mannentijdschriften',607)
INSERT Categorieen (ID,Name,Parent) VALUES (21725,'Garage',19479)
INSERT Categorieen (ID,Name,Parent) VALUES (21726,'Gothic',19483)
INSERT Categorieen (ID,Name,Parent) VALUES (21727,'Pop',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (21730,'Nu Metal',34317)
INSERT Categorieen (ID,Name,Parent) VALUES (21731,'Rock ''n'' Roll',19483)
INSERT Categorieen (ID,Name,Parent) VALUES (21733,'CD-singles en maxi''s',11233)
INSERT Categorieen (ID,Name,Parent) VALUES (21735,'Dance en house',21733)
INSERT Categorieen (ID,Name,Parent) VALUES (21756,'Overige verzamelobjecten',157499)
INSERT Categorieen (ID,Name,Parent) VALUES (21758,'Blaasinstrumenten',619)
INSERT Categorieen (ID,Name,Parent) VALUES (21762,'Gitaren en versterkers',619)
INSERT Categorieen (ID,Name,Parent) VALUES (21767,'Slagwerk en drums',619)
INSERT Categorieen (ID,Name,Parent) VALUES (21770,'Studio- en live-apparatuur',11233)
INSERT Categorieen (ID,Name,Parent) VALUES (21771,'Overige apparatuur',21770)
INSERT Categorieen (ID,Name,Parent) VALUES (22132,'Overig elektronisch speelgoed',19071)
INSERT Categorieen (ID,Name,Parent) VALUES (22133,'Houten speelgoed',220)
INSERT Categorieen (ID,Name,Parent) VALUES (22138,'Voertuigen',220)
INSERT Categorieen (ID,Name,Parent) VALUES (22140,'Driewielers',22138)
INSERT Categorieen (ID,Name,Parent) VALUES (22142,'Steps',22138)
INSERT Categorieen (ID,Name,Parent) VALUES (22144,'Overige voertuigen',22138)
INSERT Categorieen (ID,Name,Parent) VALUES (22146,'Overige poppen',226)
INSERT Categorieen (ID,Name,Parent) VALUES (22148,'Overige buitenspeelgoed',25960)
INSERT Categorieen (ID,Name,Parent) VALUES (22152,'Partyspellen',233)
INSERT Categorieen (ID,Name,Parent) VALUES (22157,'Puzzels',220)
INSERT Categorieen (ID,Name,Parent) VALUES (22171,'Fiets- en wielrenkleding',9192)
INSERT Categorieen (ID,Name,Parent) VALUES (22177,'Zadels en toebehoren',10514)
INSERT Categorieen (ID,Name,Parent) VALUES (22182,'Toebehoren',10514)
INSERT Categorieen (ID,Name,Parent) VALUES (22351,'Facilitaire dienstverlening',9431)
INSERT Categorieen (ID,Name,Parent) VALUES (22361,'Computers en IT',9431)
INSERT Categorieen (ID,Name,Parent) VALUES (22411,'DVD-boxsets en verzamel-DVD''s',2288)
INSERT Categorieen (ID,Name,Parent) VALUES (22417,'Kaartspellen',233)
INSERT Categorieen (ID,Name,Parent) VALUES (22421,'Antieke boeken',7390)
INSERT Categorieen (ID,Name,Parent) VALUES (22423,'Bibliofilie en boekkunst',7390)
INSERT Categorieen (ID,Name,Parent) VALUES (22439,'Loopstoelen en schommels',18637)
INSERT Categorieen (ID,Name,Parent) VALUES (22449,'Houten speelgoed',18637)
INSERT Categorieen (ID,Name,Parent) VALUES (22490,'Optiek',12155)
INSERT Categorieen (ID,Name,Parent) VALUES (22491,'Overige optiek',22490)
INSERT Categorieen (ID,Name,Parent) VALUES (22520,'Chillout en ambient',19479)
INSERT Categorieen (ID,Name,Parent) VALUES (22534,'Mixers',30329)
INSERT Categorieen (ID,Name,Parent) VALUES (22537,'Overige gezichtsverzorging',26528)
INSERT Categorieen (ID,Name,Parent) VALUES (22538,'Overige lichaamsverzorging',11838)
INSERT Categorieen (ID,Name,Parent) VALUES (22563,'Logboeken en stempels',10518)
INSERT Categorieen (ID,Name,Parent) VALUES (22782,'Disney',4752)
INSERT Categorieen (ID,Name,Parent) VALUES (22825,'1815 - 1840 Willem I',28683)
INSERT Categorieen (ID,Name,Parent) VALUES (22826,'1840 - 1849 Willem II',28683)
INSERT Categorieen (ID,Name,Parent) VALUES (22827,'1849 - 1890 Willem III',28683)
INSERT Categorieen (ID,Name,Parent) VALUES (22829,'Nederlands Indië',28683)
INSERT Categorieen (ID,Name,Parent) VALUES (22832,'Overige Juliana',128245)
INSERT Categorieen (ID,Name,Parent) VALUES (22833,'Overige Beatrix',128254)
INSERT Categorieen (ID,Name,Parent) VALUES (22835,'Muntsets',28683)
INSERT Categorieen (ID,Name,Parent) VALUES (22836,'Halve gulden',105224)
INSERT Categorieen (ID,Name,Parent) VALUES (22838,'Zilveren en gouden munten',28683)
INSERT Categorieen (ID,Name,Parent) VALUES (22839,'Overige Nederlandse munten',28683)
INSERT Categorieen (ID,Name,Parent) VALUES (22883,'Rock',21733)
INSERT Categorieen (ID,Name,Parent) VALUES (22937,'België gewone Post',40396)
INSERT Categorieen (ID,Name,Parent) VALUES (22948,'FDC'' s en maximum kaarten',40396)
INSERT Categorieen (ID,Name,Parent) VALUES (22951,'Eerste emissie 1852',128283)
INSERT Categorieen (ID,Name,Parent) VALUES (22952,'1980 - 1989',128283)
INSERT Categorieen (ID,Name,Parent) VALUES (22953,'FDC E450 -  heden',105246)
INSERT Categorieen (ID,Name,Parent) VALUES (22954,'PB16 - PB30',105250)
INSERT Categorieen (ID,Name,Parent) VALUES (22955,'Overige brieven',105255)
INSERT Categorieen (ID,Name,Parent) VALUES (22959,'Port',40413)
INSERT Categorieen (ID,Name,Parent) VALUES (22960,'Overige Nederland',40413)
INSERT Categorieen (ID,Name,Parent) VALUES (22961,'1950 - 1959',128283)
INSERT Categorieen (ID,Name,Parent) VALUES (23022,'Interieur',82099)
INSERT Categorieen (ID,Name,Parent) VALUES (23056,'Huis, tuin en hobby',7390)
INSERT Categorieen (ID,Name,Parent) VALUES (23062,'Kinderboeken',7390)
INSERT Categorieen (ID,Name,Parent) VALUES (23116,'Vintage tassen',37008)
INSERT Categorieen (ID,Name,Parent) VALUES (23154,'Muizen',3676)
INSERT Categorieen (ID,Name,Parent) VALUES (23212,'Detectives',267)
INSERT Categorieen (ID,Name,Parent) VALUES (23260,'Muziek- en concertvideo''s',11233)
INSERT Categorieen (ID,Name,Parent) VALUES (23275,'Concerten en events',154051)
INSERT Categorieen (ID,Name,Parent) VALUES (23277,'Overige DVD''s',154051)
INSERT Categorieen (ID,Name,Parent) VALUES (23293,'Overige formaten',25915)
INSERT Categorieen (ID,Name,Parent) VALUES (23418,'Sandalen en slippers',12104)
INSERT Categorieen (ID,Name,Parent) VALUES (23419,'Platte schoenen',12104)
INSERT Categorieen (ID,Name,Parent) VALUES (23487,'Overige damesschoenen',12104)
INSERT Categorieen (ID,Name,Parent) VALUES (23528,'Feest- en carnavalskleding',3051)
INSERT Categorieen (ID,Name,Parent) VALUES (23537,'Overig breien',3103)
INSERT Categorieen (ID,Name,Parent) VALUES (23589,'Spenen',15456)
INSERT Categorieen (ID,Name,Parent) VALUES (23590,'Borstvoedingbenodigdheden',106769)
INSERT Categorieen (ID,Name,Parent) VALUES (23595,'Beschermhekjes',2984)
INSERT Categorieen (ID,Name,Parent) VALUES (23609,'Badspeeltjes',18637)
INSERT Categorieen (ID,Name,Parent) VALUES (23610,'Wandel- en kinderwagens',15468)
INSERT Categorieen (ID,Name,Parent) VALUES (23621,'Buggy''s en joggers',15468)
INSERT Categorieen (ID,Name,Parent) VALUES (23685,'Moderne poppen',226)
INSERT Categorieen (ID,Name,Parent) VALUES (23698,'Goud - puur',10994)
INSERT Categorieen (ID,Name,Parent) VALUES (23704,'Goud - puur',67725)
INSERT Categorieen (ID,Name,Parent) VALUES (23724,'Pennen',281)
INSERT Categorieen (ID,Name,Parent) VALUES (23775,'Zilver',67725)
INSERT Categorieen (ID,Name,Parent) VALUES (23931,'Overige dance',19479)
INSERT Categorieen (ID,Name,Parent) VALUES (23937,'Batterijen en accu''s',11272)
INSERT Categorieen (ID,Name,Parent) VALUES (23979,'Datakabels',9394)
INSERT Categorieen (ID,Name,Parent) VALUES (23980,'Overige datakabels',23979)
INSERT Categorieen (ID,Name,Parent) VALUES (24001,'Overige headsets en carkits',115680)
INSERT Categorieen (ID,Name,Parent) VALUES (24011,'Panasonic',115680)
INSERT Categorieen (ID,Name,Parent) VALUES (24012,'Philips',115680)
INSERT Categorieen (ID,Name,Parent) VALUES (24013,'Sagem',115680)
INSERT Categorieen (ID,Name,Parent) VALUES (24014,'Samsung',115680)
INSERT Categorieen (ID,Name,Parent) VALUES (24040,'Telefoontasjes',9394)
INSERT Categorieen (ID,Name,Parent) VALUES (24045,'Overige accessoires',9394)
INSERT Categorieen (ID,Name,Parent) VALUES (24046,'Jurken',9816)
INSERT Categorieen (ID,Name,Parent) VALUES (24052,'Rokken en jurken',3029)
INSERT Categorieen (ID,Name,Parent) VALUES (24071,'Jeans',9817)
INSERT Categorieen (ID,Name,Parent) VALUES (24080,'Sportschoenen',13154)
INSERT Categorieen (ID,Name,Parent) VALUES (24137,'Truien',98331)
INSERT Categorieen (ID,Name,Parent) VALUES (24318,'Serviesgoed',20626)
INSERT Categorieen (ID,Name,Parent) VALUES (24354,'Benodigdheden katten',8440)
INSERT Categorieen (ID,Name,Parent) VALUES (24365,'Paardrijsport',105967)
INSERT Categorieen (ID,Name,Parent) VALUES (24369,'Formule 1 en racesport',888)
INSERT Categorieen (ID,Name,Parent) VALUES (24395,'Overige Franse strips',63)
INSERT Categorieen (ID,Name,Parent) VALUES (25612,'Hotels',160939)
INSERT Categorieen (ID,Name,Parent) VALUES (25632,'Overige accessoires',14780)
INSERT Categorieen (ID,Name,Parent) VALUES (25634,'Scooter- en brommeronderdelen',9800)
INSERT Categorieen (ID,Name,Parent) VALUES (25641,'Accessoires en gereedschappen',14780)
INSERT Categorieen (ID,Name,Parent) VALUES (25642,'Beschermhoezen',14780)
INSERT Categorieen (ID,Name,Parent) VALUES (25653,'Kinderstoelen en wipstoeltjes',2984)
INSERT Categorieen (ID,Name,Parent) VALUES (25664,'Accessoires',15468)
INSERT Categorieen (ID,Name,Parent) VALUES (25668,'Fiets- en autostoeltjes',15468)
INSERT Categorieen (ID,Name,Parent) VALUES (25682,'Lifestyle en mode',607)
INSERT Categorieen (ID,Name,Parent) VALUES (25734,'Antieke poppen',226)
INSERT Categorieen (ID,Name,Parent) VALUES (25757,'Design',353)
INSERT Categorieen (ID,Name,Parent) VALUES (25763,'1980-1989',25757)
INSERT Categorieen (ID,Name,Parent) VALUES (25764,'1990-1999',25757)
INSERT Categorieen (ID,Name,Parent) VALUES (25785,'Religieuze kunst',353)
INSERT Categorieen (ID,Name,Parent) VALUES (25791,'Oostenrijk',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (25793,'Zwitserland',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (25797,'Motoren',417)
INSERT Categorieen (ID,Name,Parent) VALUES (25804,'Kleding en textiel',1)
INSERT Categorieen (ID,Name,Parent) VALUES (25817,'Decoratie',3192)
INSERT Categorieen (ID,Name,Parent) VALUES (25822,'Overige huis en tuin',11700)
INSERT Categorieen (ID,Name,Parent) VALUES (25849,'Keukens en keukenonderdelen',11700)
INSERT Categorieen (ID,Name,Parent) VALUES (25850,'Knutselen',8423)
INSERT Categorieen (ID,Name,Parent) VALUES (25852,'Overig schilderen',30471)
INSERT Categorieen (ID,Name,Parent) VALUES (25856,'Overige sieradenhobby''s',111837)
INSERT Categorieen (ID,Name,Parent) VALUES (25863,'Tuinmeubels',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (25890,'Pop jaren ''90',21727)
INSERT Categorieen (ID,Name,Parent) VALUES (25892,'Pop jaren ''60',21727)
INSERT Categorieen (ID,Name,Parent) VALUES (25893,'Pop jaren ''70',21727)
INSERT Categorieen (ID,Name,Parent) VALUES (25894,'Reggae en Ska',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (25898,'Verzamelalbums',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (25915,'Overige muziekformaten',11233)
INSERT Categorieen (ID,Name,Parent) VALUES (25918,'Maat 44-46 (XL)',12997)
INSERT Categorieen (ID,Name,Parent) VALUES (25930,'Scoubidou',220)
INSERT Categorieen (ID,Name,Parent) VALUES (25934,'Blikken speelgoed',19016)
INSERT Categorieen (ID,Name,Parent) VALUES (25956,'Muziekinstrumenten',220)
INSERT Categorieen (ID,Name,Parent) VALUES (25960,'Buitenspeelgoed',220)
INSERT Categorieen (ID,Name,Parent) VALUES (25961,'Vliegers',19016)
INSERT Categorieen (ID,Name,Parent) VALUES (25962,'Rolschaatsen',25960)
INSERT Categorieen (ID,Name,Parent) VALUES (25964,'Speeltuin',25960)
INSERT Categorieen (ID,Name,Parent) VALUES (26043,'Camcorders en filmcamera''s',3287)
INSERT Categorieen (ID,Name,Parent) VALUES (26066,'Analoge compactcamera''s',625)
INSERT Categorieen (ID,Name,Parent) VALUES (26088,'Horloges',281)
INSERT Categorieen (ID,Name,Parent) VALUES (26109,'Piercings',281)
INSERT Categorieen (ID,Name,Parent) VALUES (26124,'Beautycases',8503)
INSERT Categorieen (ID,Name,Parent) VALUES (26143,'Vechtsporten',888)
INSERT Categorieen (ID,Name,Parent) VALUES (26148,'Sporttassen',113754)
INSERT Categorieen (ID,Name,Parent) VALUES (26328,'Darts',888)
INSERT Categorieen (ID,Name,Parent) VALUES (26500,'Overige hobby''s',8423)
INSERT Categorieen (ID,Name,Parent) VALUES (26501,'Tekeningen',7463)
INSERT Categorieen (ID,Name,Parent) VALUES (26512,'Grammofoons',7474)
INSERT Categorieen (ID,Name,Parent) VALUES (26517,'Denemarken',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (26523,'Noorwegen',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (26527,'Overige manicure en nagels',47945)
INSERT Categorieen (ID,Name,Parent) VALUES (26528,'Gezichtsverzorging',12155)
INSERT Categorieen (ID,Name,Parent) VALUES (26535,'Overige gezondheidsartikelen',47867)
INSERT Categorieen (ID,Name,Parent) VALUES (26612,'Dierenobjecten',8710)
INSERT Categorieen (ID,Name,Parent) VALUES (26672,'Badkamers en -onderdelen',11700)
INSERT Categorieen (ID,Name,Parent) VALUES (26677,'Badkamers en sanitair',3192)
INSERT Categorieen (ID,Name,Parent) VALUES (26685,'Hogedrukreinigers',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (26696,'Benodigdheden knaagdieren',8440)
INSERT Categorieen (ID,Name,Parent) VALUES (26703,'Overige dierbenodigdheden',8440)
INSERT Categorieen (ID,Name,Parent) VALUES (26716,'Funk',43639)
INSERT Categorieen (ID,Name,Parent) VALUES (26718,'Filmmuziek en soundtracks',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (26762,'CD-, DVD-drives en -writers',38851)
INSERT Categorieen (ID,Name,Parent) VALUES (26788,'Controllers',38851)
INSERT Categorieen (ID,Name,Parent) VALUES (26793,'Switches en hubs',32202)
INSERT Categorieen (ID,Name,Parent) VALUES (26989,'Zilver',10994)
INSERT Categorieen (ID,Name,Parent) VALUES (27031,'Laarzen en schoenen',10514)
INSERT Categorieen (ID,Name,Parent) VALUES (27183,'Games',27717)
INSERT Categorieen (ID,Name,Parent) VALUES (27216,'Games',30307)
INSERT Categorieen (ID,Name,Parent) VALUES (27232,'Kinderen en familie',11046)
INSERT Categorieen (ID,Name,Parent) VALUES (27234,'Schieten',11046)
INSERT Categorieen (ID,Name,Parent) VALUES (27256,'Schieten',15122)
INSERT Categorieen (ID,Name,Parent) VALUES (27294,'Dragon',9820)
INSERT Categorieen (ID,Name,Parent) VALUES (27322,'Kunst en cultuur',267)
INSERT Categorieen (ID,Name,Parent) VALUES (27324,'Geschiedenis',267)
INSERT Categorieen (ID,Name,Parent) VALUES (27329,'Atlassen',267)
INSERT Categorieen (ID,Name,Parent) VALUES (27342,'Video-CD',35064)
INSERT Categorieen (ID,Name,Parent) VALUES (27422,'Disco',20801)
INSERT Categorieen (ID,Name,Parent) VALUES (27445,'Bekabeling',14258)
INSERT Categorieen (ID,Name,Parent) VALUES (27489,'Overige schilderkunst',40688)
INSERT Categorieen (ID,Name,Parent) VALUES (27532,'Overige meubels en wonen',3192)
INSERT Categorieen (ID,Name,Parent) VALUES (27541,'Garen',127909)
INSERT Categorieen (ID,Name,Parent) VALUES (27544,'Overig naaien en naaimachines',3116)
INSERT Categorieen (ID,Name,Parent) VALUES (27559,'Benodigdheden reptielen',8440)
INSERT Categorieen (ID,Name,Parent) VALUES (27577,'CD- en vinylaccessoires',11233)
INSERT Categorieen (ID,Name,Parent) VALUES (27578,'Reiniging en reparatie',27577)
INSERT Categorieen (ID,Name,Parent) VALUES (27579,'Overige accessoires',27577)
INSERT Categorieen (ID,Name,Parent) VALUES (27657,'Overig Spoor H0',9053)
INSERT Categorieen (ID,Name,Parent) VALUES (27659,'Vintage (1977 - 1989)',29495)
INSERT Categorieen (ID,Name,Parent) VALUES (27668,'Schrijf- en schoolgerei',220)
INSERT Categorieen (ID,Name,Parent) VALUES (27691,'Kantoorapparatuur',9815)
INSERT Categorieen (ID,Name,Parent) VALUES (27704,'Presentatiemateriaal',9815)
INSERT Categorieen (ID,Name,Parent) VALUES (27713,'Playstation',14616)
INSERT Categorieen (ID,Name,Parent) VALUES (27717,'Xbox',14616)
INSERT Categorieen (ID,Name,Parent) VALUES (27760,'Overige accessoires',8297)
INSERT Categorieen (ID,Name,Parent) VALUES (27917,'Kleding',13361)
INSERT Categorieen (ID,Name,Parent) VALUES (27922,'Accessoires en onderdelen',9192)
INSERT Categorieen (ID,Name,Parent) VALUES (28110,'Benodigdheden',30471)
INSERT Categorieen (ID,Name,Parent) VALUES (28179,'Verrekijkers en telescopen',293)
INSERT Categorieen (ID,Name,Parent) VALUES (28572,'Aanhangwagens',46159)
INSERT Categorieen (ID,Name,Parent) VALUES (28642,'Verlichting',63318)
INSERT Categorieen (ID,Name,Parent) VALUES (28648,'Lichtmetalen velgen',14770)
INSERT Categorieen (ID,Name,Parent) VALUES (28658,'Verzamelingen en partijen',63)
INSERT Categorieen (ID,Name,Parent) VALUES (28667,'Digitale kunst en fotografie',550)
INSERT Categorieen (ID,Name,Parent) VALUES (28671,'Duitsland',7975)
INSERT Categorieen (ID,Name,Parent) VALUES (28675,'Finland',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (28677,'Frankrijk',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (28679,'Griekenland',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (28681,'Italië',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (28683,'Nederlandse niet-euromunten',11116)
INSERT Categorieen (ID,Name,Parent) VALUES (28687,'Spanje',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (28703,'M.A.S.K',9820)
INSERT Categorieen (ID,Name,Parent) VALUES (28712,'Episode 2',112034)
INSERT Categorieen (ID,Name,Parent) VALUES (28716,'Na 1945',15502)
INSERT Categorieen (ID,Name,Parent) VALUES (28727,'Grasmaaiers',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (28748,'Karaoke',23275)
INSERT Categorieen (ID,Name,Parent) VALUES (28760,'Jazz',43619)
INSERT Categorieen (ID,Name,Parent) VALUES (28761,'Big Band',43619)
INSERT Categorieen (ID,Name,Parent) VALUES (28764,'Afrikaans',19485)
INSERT Categorieen (ID,Name,Parent) VALUES (28786,'Plateauzolen',12104)
INSERT Categorieen (ID,Name,Parent) VALUES (28811,'Meccano',18993)
INSERT Categorieen (ID,Name,Parent) VALUES (28813,'Avontuur',19854)
INSERT Categorieen (ID,Name,Parent) VALUES (28820,'Stadsleven',19854)
INSERT Categorieen (ID,Name,Parent) VALUES (28837,'Laptops',3707)
INSERT Categorieen (ID,Name,Parent) VALUES (28844,'Toetsenborden (met draad)',3676)
INSERT Categorieen (ID,Name,Parent) VALUES (28939,'Handleidingen',14969)
INSERT Categorieen (ID,Name,Parent) VALUES (28958,'Brillen en monturen dames',22490)
INSERT Categorieen (ID,Name,Parent) VALUES (28972,'Brillen en monturen kinderen',22490)
INSERT Categorieen (ID,Name,Parent) VALUES (28973,'Brillenhouders en -etuis',22490)
INSERT Categorieen (ID,Name,Parent) VALUES (29056,'Tuig',10514)
INSERT Categorieen (ID,Name,Parent) VALUES (29223,'1900 - 1939',22421)
INSERT Categorieen (ID,Name,Parent) VALUES (29224,'Romans',267)
INSERT Categorieen (ID,Name,Parent) VALUES (29240,'Architectuur en decoratie',607)
INSERT Categorieen (ID,Name,Parent) VALUES (29241,'Kunst en cultuur',607)
INSERT Categorieen (ID,Name,Parent) VALUES (29301,'Economie en marketing',267)
INSERT Categorieen (ID,Name,Parent) VALUES (29484,'Mensen en gezichten',8991)
INSERT Categorieen (ID,Name,Parent) VALUES (29495,'Star Wars',75718)
INSERT Categorieen (ID,Name,Parent) VALUES (29741,'TV-ontvangers',12941)
INSERT Categorieen (ID,Name,Parent) VALUES (29750,'Oldtimers en klassiekers',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (29757,'MG',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (29792,'Luisterboeken',267)
INSERT Categorieen (ID,Name,Parent) VALUES (29798,'Harry Potter',75718)
INSERT Categorieen (ID,Name,Parent) VALUES (29799,'Lord of the Rings',75718)
INSERT Categorieen (ID,Name,Parent) VALUES (30100,'Boksen',888)
INSERT Categorieen (ID,Name,Parent) VALUES (30154,'Disco- en karaoke-apparatuur',14969)
INSERT Categorieen (ID,Name,Parent) VALUES (30164,'Daihatsu',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (30167,'Onderhoud',9884)
INSERT Categorieen (ID,Name,Parent) VALUES (30168,'Autowax en reiniging',30167)
INSERT Categorieen (ID,Name,Parent) VALUES (30172,'Sportstoelen en gordels',14761)
INSERT Categorieen (ID,Name,Parent) VALUES (30208,'Dameskleding',14784)
INSERT Categorieen (ID,Name,Parent) VALUES (30222,'Herenkleding',14784)
INSERT Categorieen (ID,Name,Parent) VALUES (30234,'Koffers en bagage',14780)
INSERT Categorieen (ID,Name,Parent) VALUES (30244,'Luieremmers',15456)
INSERT Categorieen (ID,Name,Parent) VALUES (30245,'Potjes/wc-stoeltjes',15456)
INSERT Categorieen (ID,Name,Parent) VALUES (30246,'Mondverzorging',15456)
INSERT Categorieen (ID,Name,Parent) VALUES (30247,'Bad en hygiëne',15456)
INSERT Categorieen (ID,Name,Parent) VALUES (30261,'Architectuur',4752)
INSERT Categorieen (ID,Name,Parent) VALUES (30307,'Gamecube',14616)
INSERT Categorieen (ID,Name,Parent) VALUES (30311,'Fornuizen en ovens',30329)
INSERT Categorieen (ID,Name,Parent) VALUES (30322,'Wasmachines en -drogers',20710)
INSERT Categorieen (ID,Name,Parent) VALUES (30329,'Keukenapparatuur',11700)
INSERT Categorieen (ID,Name,Parent) VALUES (30332,'Afwasmachines',30329)
INSERT Categorieen (ID,Name,Parent) VALUES (30335,'Stofzuigers',20710)
INSERT Categorieen (ID,Name,Parent) VALUES (30369,'Contactlenzen',22490)
INSERT Categorieen (ID,Name,Parent) VALUES (30471,'Schilderen',8423)
INSERT Categorieen (ID,Name,Parent) VALUES (30489,'Servetten',8423)
INSERT Categorieen (ID,Name,Parent) VALUES (30503,'Gereedschap (elektrisch)',19859)
INSERT Categorieen (ID,Name,Parent) VALUES (30517,'Bouwmaterialen',11700)
INSERT Categorieen (ID,Name,Parent) VALUES (30588,'Zwembroeken en shorts',15770)
INSERT Categorieen (ID,Name,Parent) VALUES (30602,'Overige grafische kunst',7463)
INSERT Categorieen (ID,Name,Parent) VALUES (30612,'Zeefdrukken',7463)
INSERT Categorieen (ID,Name,Parent) VALUES (30617,'Antieke lampen',353)
INSERT Categorieen (ID,Name,Parent) VALUES (30629,'Kleden en tapijten',353)
INSERT Categorieen (ID,Name,Parent) VALUES (30675,'Gebouwen',1188)
INSERT Categorieen (ID,Name,Parent) VALUES (30684,'België',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (30685,'Arabisch',19485)
INSERT Categorieen (ID,Name,Parent) VALUES (30736,'Sigarenbandjes',1)
INSERT Categorieen (ID,Name,Parent) VALUES (30744,'Mountainbikes',9192)
INSERT Categorieen (ID,Name,Parent) VALUES (30751,'Stadsfietsen',9192)
INSERT Categorieen (ID,Name,Parent) VALUES (30752,'Damesfietsen',30751)
INSERT Categorieen (ID,Name,Parent) VALUES (30753,'Herenfietsen',30751)
INSERT Categorieen (ID,Name,Parent) VALUES (30760,'Triathlon',888)
INSERT Categorieen (ID,Name,Parent) VALUES (30892,'Smeermiddelen',30167)
INSERT Categorieen (ID,Name,Parent) VALUES (30896,'Gereedschap',82099)
INSERT Categorieen (ID,Name,Parent) VALUES (30939,'CD-R(W) en DVD-R(W)',106261)
INSERT Categorieen (ID,Name,Parent) VALUES (30965,'Toetsenborden (draadloos)',3676)
INSERT Categorieen (ID,Name,Parent) VALUES (31021,'Maat 32-34 (XXS/XS)',12090)
INSERT Categorieen (ID,Name,Parent) VALUES (31022,'Maat 36 (S)',12090)
INSERT Categorieen (ID,Name,Parent) VALUES (31023,'Maat 40-42 (L)',12090)
INSERT Categorieen (ID,Name,Parent) VALUES (31024,'Maat 44-46 (XL)',12090)
INSERT Categorieen (ID,Name,Parent) VALUES (31027,'Overige broeken',12090)
INSERT Categorieen (ID,Name,Parent) VALUES (31058,'T-shirts',9816)
INSERT Categorieen (ID,Name,Parent) VALUES (31063,'Overige shirts lange mouw',53159)
INSERT Categorieen (ID,Name,Parent) VALUES (31065,'Shirts',3029)
INSERT Categorieen (ID,Name,Parent) VALUES (31091,'Spoor 0',9035)
INSERT Categorieen (ID,Name,Parent) VALUES (31122,'Tamiya',222)
INSERT Categorieen (ID,Name,Parent) VALUES (31134,'Ierland',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (31135,'Monaco',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (31136,'Portugal',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (31137,'San Marino',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (31138,'Vaticaan',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (31291,'Lampen en verlichting',3192)
INSERT Categorieen (ID,Name,Parent) VALUES (31298,'Overige avondkleding',12989)
INSERT Categorieen (ID,Name,Parent) VALUES (31300,'Overige combinaties',12997)
INSERT Categorieen (ID,Name,Parent) VALUES (31301,'Overige jurken',24046)
INSERT Categorieen (ID,Name,Parent) VALUES (31302,'Overige rokken',13493)
INSERT Categorieen (ID,Name,Parent) VALUES (31304,'Overige blouses',13021)
INSERT Categorieen (ID,Name,Parent) VALUES (31305,'Overige tops',19736)
INSERT Categorieen (ID,Name,Parent) VALUES (31306,'Overige truien',13029)
INSERT Categorieen (ID,Name,Parent) VALUES (31308,'Overige jasjes en blazers',13045)
INSERT Categorieen (ID,Name,Parent) VALUES (31365,'Badminton',888)
INSERT Categorieen (ID,Name,Parent) VALUES (31394,'Dozen',60241)
INSERT Categorieen (ID,Name,Parent) VALUES (31396,'Booster Packs',60241)
INSERT Categorieen (ID,Name,Parent) VALUES (31398,'Warhammer',16486)
INSERT Categorieen (ID,Name,Parent) VALUES (31413,'Haargroeimiddelen',47879)
INSERT Categorieen (ID,Name,Parent) VALUES (31731,'Lijm en tape',111848)
INSERT Categorieen (ID,Name,Parent) VALUES (32114,'Shirtjes en blouses',127688)
INSERT Categorieen (ID,Name,Parent) VALUES (32115,'Rompertjes',127688)
INSERT Categorieen (ID,Name,Parent) VALUES (32116,'Broekjes',127688)
INSERT Categorieen (ID,Name,Parent) VALUES (32118,'Jasjes',127688)
INSERT Categorieen (ID,Name,Parent) VALUES (32119,'Pakjes',127688)
INSERT Categorieen (ID,Name,Parent) VALUES (32121,'Truitjes en vestjes',127688)
INSERT Categorieen (ID,Name,Parent) VALUES (32124,'Shirtjes en blouses',127689)
INSERT Categorieen (ID,Name,Parent) VALUES (32125,'Rompertjes',127689)
INSERT Categorieen (ID,Name,Parent) VALUES (32126,'Broekjes',127689)
INSERT Categorieen (ID,Name,Parent) VALUES (32128,'Jasjes',127689)
INSERT Categorieen (ID,Name,Parent) VALUES (32129,'Pakjes',127689)
INSERT Categorieen (ID,Name,Parent) VALUES (32131,'Truitjes en vestjes',127689)
INSERT Categorieen (ID,Name,Parent) VALUES (32135,'Caraïben',260)
INSERT Categorieen (ID,Name,Parent) VALUES (32136,'Azië',260)
INSERT Categorieen (ID,Name,Parent) VALUES (32137,'China',32136)
INSERT Categorieen (ID,Name,Parent) VALUES (32138,'Japan',32136)
INSERT Categorieen (ID,Name,Parent) VALUES (32202,'Kabels en netwerk',160)
INSERT Categorieen (ID,Name,Parent) VALUES (32225,'Analoog',3691)
INSERT Categorieen (ID,Name,Parent) VALUES (32226,'ADSL',3691)
INSERT Categorieen (ID,Name,Parent) VALUES (32228,'ISDN',3691)
INSERT Categorieen (ID,Name,Parent) VALUES (32254,'Bedden en lattenbodems',3192)
INSERT Categorieen (ID,Name,Parent) VALUES (32274,'Verwarming binnen',11700)
INSERT Categorieen (ID,Name,Parent) VALUES (32309,'Kostuums, pakken en smokings',9817)
INSERT Categorieen (ID,Name,Parent) VALUES (32315,'T-shirts korte mouw',9817)
INSERT Categorieen (ID,Name,Parent) VALUES (32331,'Overige maten',32309)
INSERT Categorieen (ID,Name,Parent) VALUES (32372,'Overige jongensschoenen',80947)
INSERT Categorieen (ID,Name,Parent) VALUES (32404,'Overige meisjesschoenen',80922)
INSERT Categorieen (ID,Name,Parent) VALUES (32442,'Revalidatie en hulpmiddelen',12155)
INSERT Categorieen (ID,Name,Parent) VALUES (32443,'EHBO-producten',12155)
INSERT Categorieen (ID,Name,Parent) VALUES (32464,'Glazen en bekers',20626)
INSERT Categorieen (ID,Name,Parent) VALUES (32475,'Luxemburg',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (32476,'Rusland',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (32511,'Lood en gordels',10518)
INSERT Categorieen (ID,Name,Parent) VALUES (32516,'Kleding en schoenen',10518)
INSERT Categorieen (ID,Name,Parent) VALUES (32522,'Instrumenten',10518)
INSERT Categorieen (ID,Name,Parent) VALUES (32529,'Luchtflessen',10518)
INSERT Categorieen (ID,Name,Parent) VALUES (32537,'Onderwatercamera''s',10518)
INSERT Categorieen (ID,Name,Parent) VALUES (32542,'Dans en ballet',888)
INSERT Categorieen (ID,Name,Parent) VALUES (32633,'Caravans',44794)
INSERT Categorieen (ID,Name,Parent) VALUES (32642,'Avontuur',41520)
INSERT Categorieen (ID,Name,Parent) VALUES (32675,'Thrillers',267)
INSERT Categorieen (ID,Name,Parent) VALUES (32676,'Sciencefiction en fantasy',267)
INSERT Categorieen (ID,Name,Parent) VALUES (32680,'Esoterie en spiritualiteit',267)
INSERT Categorieen (ID,Name,Parent) VALUES (32754,'Fantastische Vier',900)
INSERT Categorieen (ID,Name,Parent) VALUES (32757,'Hulk',900)
INSERT Categorieen (ID,Name,Parent) VALUES (32768,'Wonder Woman',900)
INSERT Categorieen (ID,Name,Parent) VALUES (32852,'Home cinema en DVD-spelers',3287)
INSERT Categorieen (ID,Name,Parent) VALUES (32898,'Draadloos en WiFi',32202)
INSERT Categorieen (ID,Name,Parent) VALUES (32901,'Koffiezetapparaten',30329)
INSERT Categorieen (ID,Name,Parent) VALUES (32935,'Batterijen en accu''s',8297)
INSERT Categorieen (ID,Name,Parent) VALUES (32948,'Fotoalbums en fotolijsten',11272)
INSERT Categorieen (ID,Name,Parent) VALUES (32973,'Sony Ericsson',115680)
INSERT Categorieen (ID,Name,Parent) VALUES (32976,'Sony Ericsson',24040)
INSERT Categorieen (ID,Name,Parent) VALUES (33012,'Hardrock, metal',157499)
INSERT Categorieen (ID,Name,Parent) VALUES (33052,'Overige Lord of the Rings',60225)
INSERT Categorieen (ID,Name,Parent) VALUES (33092,'Jassen',9816)
INSERT Categorieen (ID,Name,Parent) VALUES (33093,'Maat 32-34 (XXS/XS)',33092)
INSERT Categorieen (ID,Name,Parent) VALUES (33094,'Maat 36 (S)',33092)
INSERT Categorieen (ID,Name,Parent) VALUES (33095,'Maat 40-42 (L)',33092)
INSERT Categorieen (ID,Name,Parent) VALUES (33096,'Maat 44-46 (XL)',33092)
INSERT Categorieen (ID,Name,Parent) VALUES (33100,'Overige jassen',33092)
INSERT Categorieen (ID,Name,Parent) VALUES (33111,'Jassen',9817)
INSERT Categorieen (ID,Name,Parent) VALUES (33120,'Overige ondergoed',84539)
INSERT Categorieen (ID,Name,Parent) VALUES (33131,'Antieke sieraden',281)
INSERT Categorieen (ID,Name,Parent) VALUES (33219,'Märklin',9053)
INSERT Categorieen (ID,Name,Parent) VALUES (33288,'Death Metal',34317)
INSERT Categorieen (ID,Name,Parent) VALUES (33290,'Speed en Thrash Metal',34317)
INSERT Categorieen (ID,Name,Parent) VALUES (33305,'Barbiepoppen',10525)
INSERT Categorieen (ID,Name,Parent) VALUES (33317,'Accessoires',10525)
INSERT Categorieen (ID,Name,Parent) VALUES (33356,'Duitsland',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (33388,'Europa',8991)
INSERT Categorieen (ID,Name,Parent) VALUES (33389,'Joegoslavië (voormalig)',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (33390,'Letland',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (33391,'België',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (33392,'Denemarken',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (33393,'Finland',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (33394,'Frankrijk',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (33395,'Griekenland',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (33396,'Groot-Brittannië',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (33397,'Italië',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (33398,'Monaco',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (33400,'Afrika',8991)
INSERT Categorieen (ID,Name,Parent) VALUES (33402,'Canada',21530)
INSERT Categorieen (ID,Name,Parent) VALUES (33403,'Overig Amerika',21530)
INSERT Categorieen (ID,Name,Parent) VALUES (33404,'Midden-Amerika',21530)
INSERT Categorieen (ID,Name,Parent) VALUES (33405,'Zuid-Amerika',21530)
INSERT Categorieen (ID,Name,Parent) VALUES (33406,'Thema''s',8991)
INSERT Categorieen (ID,Name,Parent) VALUES (33416,'Artiesten en beroemdheden',8991)
INSERT Categorieen (ID,Name,Parent) VALUES (33421,'Fotomontage en kunst',8991)
INSERT Categorieen (ID,Name,Parent) VALUES (33444,'Advertenties en reclame',8991)
INSERT Categorieen (ID,Name,Parent) VALUES (33448,'Sport',8991)
INSERT Categorieen (ID,Name,Parent) VALUES (33450,'Motoren',9013)
INSERT Categorieen (ID,Name,Parent) VALUES (33465,'Overige voetbal',13331)
INSERT Categorieen (ID,Name,Parent) VALUES (33466,'Voetbalplaatjes en foto''s',13331)
INSERT Categorieen (ID,Name,Parent) VALUES (33468,'Vlaggen',13331)
INSERT Categorieen (ID,Name,Parent) VALUES (33469,'Programma''s',13331)
INSERT Categorieen (ID,Name,Parent) VALUES (33471,'Toegangskaarten',13331)
INSERT Categorieen (ID,Name,Parent) VALUES (33482,'Basketbal',888)
INSERT Categorieen (ID,Name,Parent) VALUES (33485,'Shirts',68752)
INSERT Categorieen (ID,Name,Parent) VALUES (33497,'Tafeltennis',888)
INSERT Categorieen (ID,Name,Parent) VALUES (33503,'Overige fietsen',9192)
INSERT Categorieen (ID,Name,Parent) VALUES (33559,'Remmen',63318)
INSERT Categorieen (ID,Name,Parent) VALUES (33707,'Lampen, LEDs en neon',14761)
INSERT Categorieen (ID,Name,Parent) VALUES (33914,'Tatoeages',12155)
INSERT Categorieen (ID,Name,Parent) VALUES (33977,'Albums',111848)
INSERT Categorieen (ID,Name,Parent) VALUES (33978,'Die-cuts en stanzen',111848)
INSERT Categorieen (ID,Name,Parent) VALUES (34002,'Jolees, stickers en rub-ons',111848)
INSERT Categorieen (ID,Name,Parent) VALUES (34178,'Guust Flater',63)
INSERT Categorieen (ID,Name,Parent) VALUES (34291,'Provinciale munten',28683)
INSERT Categorieen (ID,Name,Parent) VALUES (34294,'Shirtjes en blouses',127690)
INSERT Categorieen (ID,Name,Parent) VALUES (34295,'Rompertjes',127690)
INSERT Categorieen (ID,Name,Parent) VALUES (34296,'Broekjes',127690)
INSERT Categorieen (ID,Name,Parent) VALUES (34298,'Jasjes',127690)
INSERT Categorieen (ID,Name,Parent) VALUES (34299,'Pakjes',127690)
INSERT Categorieen (ID,Name,Parent) VALUES (34301,'Truitjes en vestjes',127690)
INSERT Categorieen (ID,Name,Parent) VALUES (34304,'Shirtjes en blouses',127691)
INSERT Categorieen (ID,Name,Parent) VALUES (34305,'Rompertjes',127691)
INSERT Categorieen (ID,Name,Parent) VALUES (34306,'Broekjes',127691)
INSERT Categorieen (ID,Name,Parent) VALUES (34308,'Jasjes',127691)
INSERT Categorieen (ID,Name,Parent) VALUES (34309,'Pakjes',127691)
INSERT Categorieen (ID,Name,Parent) VALUES (34311,'Truitjes en vestjes',127691)
INSERT Categorieen (ID,Name,Parent) VALUES (34317,'Metal',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (34345,'Overige kantoorartikelen',9815)
INSERT Categorieen (ID,Name,Parent) VALUES (34378,'Bakbenodigdheden',20626)
INSERT Categorieen (ID,Name,Parent) VALUES (34391,'Overhemden',9817)
INSERT Categorieen (ID,Name,Parent) VALUES (34424,'Viewmaster',8710)
INSERT Categorieen (ID,Name,Parent) VALUES (34425,'Overige benodigdheden',37528)
INSERT Categorieen (ID,Name,Parent) VALUES (34461,'Europa (niet-Euro)',12822)
INSERT Categorieen (ID,Name,Parent) VALUES (34470,'Nederlandse bankbiljetten',11116)
INSERT Categorieen (ID,Name,Parent) VALUES (34514,'Korte reizen en trips',160939)
INSERT Categorieen (ID,Name,Parent) VALUES (34573,'Arrangementen',160939)
INSERT Categorieen (ID,Name,Parent) VALUES (34578,'Sportieve vakanties',160939)
INSERT Categorieen (ID,Name,Parent) VALUES (34628,'Nederland',8991)
INSERT Categorieen (ID,Name,Parent) VALUES (34629,'Noorwegen',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (34631,'Polen',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (34632,'Rusland',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (34633,'San Marino',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (34634,'Zweden',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (34636,'Spanje',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (34637,'Vaticaanstad',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (34742,'Bierblikjes',8733)
INSERT Categorieen (ID,Name,Parent) VALUES (34748,'Flessen',35692)
INSERT Categorieen (ID,Name,Parent) VALUES (34749,'Glazen',35692)
INSERT Categorieen (ID,Name,Parent) VALUES (34755,'Overige drankmerken',35692)
INSERT Categorieen (ID,Name,Parent) VALUES (34760,'Lucifersdoosjes',9832)
INSERT Categorieen (ID,Name,Parent) VALUES (34775,'Bussen',417)
INSERT Categorieen (ID,Name,Parent) VALUES (34777,'Vrachtvervoer',417)
INSERT Categorieen (ID,Name,Parent) VALUES (34814,'Concert- en festivalkaartjes',11233)
INSERT Categorieen (ID,Name,Parent) VALUES (34856,'Sportwedstrijden',1305)
INSERT Categorieen (ID,Name,Parent) VALUES (34935,'Bouwmateriaal',12576)
INSERT Categorieen (ID,Name,Parent) VALUES (34939,'Edelmetalen',11116)
INSERT Categorieen (ID,Name,Parent) VALUES (34976,'Mokken',8780)
INSERT Categorieen (ID,Name,Parent) VALUES (35009,'Politie en detective',41539)
INSERT Categorieen (ID,Name,Parent) VALUES (35014,'Disney',41523)
INSERT Categorieen (ID,Name,Parent) VALUES (35015,'Komedie en humor',2288)
INSERT Categorieen (ID,Name,Parent) VALUES (35016,'Brits',35015)
INSERT Categorieen (ID,Name,Parent) VALUES (35018,'Slapstick',35015)
INSERT Categorieen (ID,Name,Parent) VALUES (35026,'Tiener',41558)
INSERT Categorieen (ID,Name,Parent) VALUES (35042,'Voor 1900',18828)
INSERT Categorieen (ID,Name,Parent) VALUES (35064,'Andere formaten',11232)
INSERT Categorieen (ID,Name,Parent) VALUES (35066,'Actie',16663)
INSERT Categorieen (ID,Name,Parent) VALUES (35067,'Avontuur',16663)
INSERT Categorieen (ID,Name,Parent) VALUES (35071,'Superhelden',16663)
INSERT Categorieen (ID,Name,Parent) VALUES (35072,'Rampen',16663)
INSERT Categorieen (ID,Name,Parent) VALUES (35076,'Kinder- en familiefilms',1508)
INSERT Categorieen (ID,Name,Parent) VALUES (35123,'Boekenweekgeschenk',267)
INSERT Categorieen (ID,Name,Parent) VALUES (35263,'Oud-duitse staten',7825)
INSERT Categorieen (ID,Name,Parent) VALUES (35282,'Albanie',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (35288,'Bulgarije',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (35289,'Denemarken',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (35290,'Overig Finland',128312)
INSERT Categorieen (ID,Name,Parent) VALUES (35291,'Griekenland',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (35293,'Luxemburg',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (35295,'Noorwegen',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (35303,'Afrika',260)
INSERT Categorieen (ID,Name,Parent) VALUES (35305,'Zuid-Afrika',35303)
INSERT Categorieen (ID,Name,Parent) VALUES (35309,'India',32136)
INSERT Categorieen (ID,Name,Parent) VALUES (35310,'Indonesië',32136)
INSERT Categorieen (ID,Name,Parent) VALUES (35311,'Israël',32136)
INSERT Categorieen (ID,Name,Parent) VALUES (35312,'Cambodja',32136)
INSERT Categorieen (ID,Name,Parent) VALUES (35313,'Korea',32136)
INSERT Categorieen (ID,Name,Parent) VALUES (35314,'Vietnam',32136)
INSERT Categorieen (ID,Name,Parent) VALUES (35315,'Thailand',32136)
INSERT Categorieen (ID,Name,Parent) VALUES (35322,'Accessoires',260)
INSERT Categorieen (ID,Name,Parent) VALUES (35384,'Handschoenen',12109)
INSERT Categorieen (ID,Name,Parent) VALUES (35385,'Petten en caps',12109)
INSERT Categorieen (ID,Name,Parent) VALUES (35400,'Sport en spel',7390)
INSERT Categorieen (ID,Name,Parent) VALUES (35416,'Oostenrijk',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (35422,'Oostenrijk',7975)
INSERT Categorieen (ID,Name,Parent) VALUES (35427,'Albanië',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (35428,'Frankrijk',7975)
INSERT Categorieen (ID,Name,Parent) VALUES (35433,'Joegoslavië',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (35434,'Monaco',7975)
INSERT Categorieen (ID,Name,Parent) VALUES (35438,'Nederland',7975)
INSERT Categorieen (ID,Name,Parent) VALUES (35443,'Roemenië',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (35444,'San Marino',7975)
INSERT Categorieen (ID,Name,Parent) VALUES (35448,'Spanje',7975)
INSERT Categorieen (ID,Name,Parent) VALUES (35453,'Vaticaan',7975)
INSERT Categorieen (ID,Name,Parent) VALUES (35475,'Ierland',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (35476,'Liechtenstein',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (35477,'Luxemburg',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (35478,'Portugal',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (35486,'Verzamelingen',8991)
INSERT Categorieen (ID,Name,Parent) VALUES (35499,'Kleding en accessoires',8780)
INSERT Categorieen (ID,Name,Parent) VALUES (35521,'Overige Yu-Gi-Oh!',60241)
INSERT Categorieen (ID,Name,Parent) VALUES (35522,'Auto''s',417)
INSERT Categorieen (ID,Name,Parent) VALUES (35535,'Treinen',417)
INSERT Categorieen (ID,Name,Parent) VALUES (35544,'Azië',8878)
INSERT Categorieen (ID,Name,Parent) VALUES (35545,'Afrika',8878)
INSERT Categorieen (ID,Name,Parent) VALUES (35546,'Amerika',8878)
INSERT Categorieen (ID,Name,Parent) VALUES (35547,'Australië',8878)
INSERT Categorieen (ID,Name,Parent) VALUES (35548,'Europa',8878)
INSERT Categorieen (ID,Name,Parent) VALUES (35692,'Drankmerken overige',34)
INSERT Categorieen (ID,Name,Parent) VALUES (35762,'GI Joe',900)
INSERT Categorieen (ID,Name,Parent) VALUES (35860,'Telefoons',137)
INSERT Categorieen (ID,Name,Parent) VALUES (35862,'Stickers en briefpapier',137)
INSERT Categorieen (ID,Name,Parent) VALUES (36358,'Anti-rimpelproducten',26528)
INSERT Categorieen (ID,Name,Parent) VALUES (36432,'Handcrèmes',11838)
INSERT Categorieen (ID,Name,Parent) VALUES (36524,'Babykleding - unisex',12081)
INSERT Categorieen (ID,Name,Parent) VALUES (36539,'Forever Friends',386)
INSERT Categorieen (ID,Name,Parent) VALUES (36589,'Breiwol',3103)
INSERT Categorieen (ID,Name,Parent) VALUES (36595,'Katoen',127909)
INSERT Categorieen (ID,Name,Parent) VALUES (36598,'Zijde',127909)
INSERT Categorieen (ID,Name,Parent) VALUES (36599,'Wol',127909)
INSERT Categorieen (ID,Name,Parent) VALUES (36623,'Overige boten en vaartuigen',1293)
INSERT Categorieen (ID,Name,Parent) VALUES (36629,'Bootonderdelen en -accessoires',9800)
INSERT Categorieen (ID,Name,Parent) VALUES (36635,'Verlichting en elektronica',36629)
INSERT Categorieen (ID,Name,Parent) VALUES (36637,'Motoren en schroeven',36629)
INSERT Categorieen (ID,Name,Parent) VALUES (36645,'Radio en communicatie',36629)
INSERT Categorieen (ID,Name,Parent) VALUES (36646,'Navigatiebenodigdheden',36629)
INSERT Categorieen (ID,Name,Parent) VALUES (36647,'Kaarten en tabellen',36629)
INSERT Categorieen (ID,Name,Parent) VALUES (36648,'Kompassen',36629)
INSERT Categorieen (ID,Name,Parent) VALUES (36653,'Masten, gieken en zeilen',36629)
INSERT Categorieen (ID,Name,Parent) VALUES (36655,'Lieren',36629)
INSERT Categorieen (ID,Name,Parent) VALUES (36684,'Sport',4752)
INSERT Categorieen (ID,Name,Parent) VALUES (36685,'Autosport',36684)
INSERT Categorieen (ID,Name,Parent) VALUES (36686,'Basketbal',36684)
INSERT Categorieen (ID,Name,Parent) VALUES (36687,'Boksen',36684)
INSERT Categorieen (ID,Name,Parent) VALUES (36689,'Voetbal',36684)
INSERT Categorieen (ID,Name,Parent) VALUES (36693,'Olympische Spelen',36684)
INSERT Categorieen (ID,Name,Parent) VALUES (36694,'Wielrennen',36684)
INSERT Categorieen (ID,Name,Parent) VALUES (36699,'Tennis',36684)
INSERT Categorieen (ID,Name,Parent) VALUES (36701,'Volleybal',36684)
INSERT Categorieen (ID,Name,Parent) VALUES (36702,'Fauna',4752)
INSERT Categorieen (ID,Name,Parent) VALUES (36703,'Apen',36702)
INSERT Categorieen (ID,Name,Parent) VALUES (36707,'Dinosauriërs',36702)
INSERT Categorieen (ID,Name,Parent) VALUES (36708,'Olifanten',36702)
INSERT Categorieen (ID,Name,Parent) VALUES (36711,'Vissen',36702)
INSERT Categorieen (ID,Name,Parent) VALUES (36718,'Honden',36702)
INSERT Categorieen (ID,Name,Parent) VALUES (36720,'Insecten',36702)
INSERT Categorieen (ID,Name,Parent) VALUES (36721,'Katten',36702)
INSERT Categorieen (ID,Name,Parent) VALUES (36725,'Papegaaien',36702)
INSERT Categorieen (ID,Name,Parent) VALUES (36726,'Paarden',36702)
INSERT Categorieen (ID,Name,Parent) VALUES (36728,'Reptielen en amfibieën',36702)
INSERT Categorieen (ID,Name,Parent) VALUES (36732,'Vlinders',36702)
INSERT Categorieen (ID,Name,Parent) VALUES (36733,'Vogels',36702)
INSERT Categorieen (ID,Name,Parent) VALUES (36735,'Verkeer en transport',4752)
INSERT Categorieen (ID,Name,Parent) VALUES (36736,'Auto''s',36735)
INSERT Categorieen (ID,Name,Parent) VALUES (36738,'Treinen',36735)
INSERT Categorieen (ID,Name,Parent) VALUES (36739,'Vliegtuigen',36735)
INSERT Categorieen (ID,Name,Parent) VALUES (36743,'Ruimtevaart',4752)
INSERT Categorieen (ID,Name,Parent) VALUES (36744,'Schepen',36735)
INSERT Categorieen (ID,Name,Parent) VALUES (36858,'Badschuim',47903)
INSERT Categorieen (ID,Name,Parent) VALUES (36863,'Ogen',13264)
INSERT Categorieen (ID,Name,Parent) VALUES (36867,'Lippen',13264)
INSERT Categorieen (ID,Name,Parent) VALUES (36872,'Solarium- en saunaproducten',12155)
INSERT Categorieen (ID,Name,Parent) VALUES (36886,'Brillen en monturen heren',22490)
INSERT Categorieen (ID,Name,Parent) VALUES (36935,'Messen',20626)
INSERT Categorieen (ID,Name,Parent) VALUES (36987,'Shirts',13154)
INSERT Categorieen (ID,Name,Parent) VALUES (37005,'Overige sportkleding',13154)
INSERT Categorieen (ID,Name,Parent) VALUES (37008,'Damestassen',11450)
INSERT Categorieen (ID,Name,Parent) VALUES (37082,'Archeologie',353)
INSERT Categorieen (ID,Name,Parent) VALUES (37084,'Egypte',37082)
INSERT Categorieen (ID,Name,Parent) VALUES (37085,'China',37082)
INSERT Categorieen (ID,Name,Parent) VALUES (37124,'België',7975)
INSERT Categorieen (ID,Name,Parent) VALUES (37130,'Finland',7975)
INSERT Categorieen (ID,Name,Parent) VALUES (37137,'Griekenland',7975)
INSERT Categorieen (ID,Name,Parent) VALUES (37143,'Ierland',7975)
INSERT Categorieen (ID,Name,Parent) VALUES (37149,'Italië',7975)
INSERT Categorieen (ID,Name,Parent) VALUES (37155,'Luxemburg',7975)
INSERT Categorieen (ID,Name,Parent) VALUES (37162,'Portugal',7975)
INSERT Categorieen (ID,Name,Parent) VALUES (37184,'Progressive',19483)
INSERT Categorieen (ID,Name,Parent) VALUES (37186,'Oost-Europees',19485)
INSERT Categorieen (ID,Name,Parent) VALUES (37209,'Nintendo overig',14616)
INSERT Categorieen (ID,Name,Parent) VALUES (37352,'Treintickets',1305)
INSERT Categorieen (ID,Name,Parent) VALUES (37355,'Carpooling',160939)
INSERT Categorieen (ID,Name,Parent) VALUES (37357,'Andorra',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (37358,'Bosnië-Herzegovina',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (37359,'Bulgarije',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (37360,'IJsland',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (37361,'Kroatië',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (37362,'Malta',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (37363,'Macedonië',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (37364,'Roemenië',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (37365,'Servië',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (37366,'Slovenië',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (37367,'Turkije',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (37481,'Goud - puur',10975)
INSERT Categorieen (ID,Name,Parent) VALUES (37503,'Goud - puur',10985)
INSERT Categorieen (ID,Name,Parent) VALUES (37528,'Kunstenaarsbenodigdheden',353)
INSERT Categorieen (ID,Name,Parent) VALUES (37530,'Krijt, stiften en pennen',37528)
INSERT Categorieen (ID,Name,Parent) VALUES (37532,'Aanstormend talent',353)
INSERT Categorieen (ID,Name,Parent) VALUES (37556,'Verzamelingen en partijen',353)
INSERT Categorieen (ID,Name,Parent) VALUES (37822,'Acupunctuur',47867)
INSERT Categorieen (ID,Name,Parent) VALUES (37887,'Episode 1',29495)
INSERT Categorieen (ID,Name,Parent) VALUES (37888,'Episode 2',29495)
INSERT Categorieen (ID,Name,Parent) VALUES (37889,'Episode 3',29495)
INSERT Categorieen (ID,Name,Parent) VALUES (37890,'POTF 2  (1989 - 1999)',29495)
INSERT Categorieen (ID,Name,Parent) VALUES (37958,'Landkaarten',7390)
INSERT Categorieen (ID,Name,Parent) VALUES (38233,'Spiegels',3192)
INSERT Categorieen (ID,Name,Parent) VALUES (38323,'Spinners',8710)
INSERT Categorieen (ID,Name,Parent) VALUES (38329,'Overige PDA''s en accessoires',38951)
INSERT Categorieen (ID,Name,Parent) VALUES (38331,'PDA''s en handhelds',38951)
INSERT Categorieen (ID,Name,Parent) VALUES (38576,'Game Gear',15110)
INSERT Categorieen (ID,Name,Parent) VALUES (38577,'Gameboy en Gameboy color',14616)
INSERT Categorieen (ID,Name,Parent) VALUES (38578,'Accessoires',38577)
INSERT Categorieen (ID,Name,Parent) VALUES (38580,'Consoles',38577)
INSERT Categorieen (ID,Name,Parent) VALUES (38615,'Accessoires',27713)
INSERT Categorieen (ID,Name,Parent) VALUES (38708,'Mini',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (38726,'Elektronica',63318)
INSERT Categorieen (ID,Name,Parent) VALUES (38754,'Antennes',14258)
INSERT Categorieen (ID,Name,Parent) VALUES (38759,'Handsfree kits',14258)
INSERT Categorieen (ID,Name,Parent) VALUES (38771,'Subwoofers',14258)
INSERT Categorieen (ID,Name,Parent) VALUES (38774,'Dvd-spelers',14258)
INSERT Categorieen (ID,Name,Parent) VALUES (38775,'TFT-schermen',14258)
INSERT Categorieen (ID,Name,Parent) VALUES (38776,'Navigatiesystemen en GPS',14258)
INSERT Categorieen (ID,Name,Parent) VALUES (38777,'Becker',38776)
INSERT Categorieen (ID,Name,Parent) VALUES (38778,'Blaupunkt',38776)
INSERT Categorieen (ID,Name,Parent) VALUES (38779,'Garmin',38776)
INSERT Categorieen (ID,Name,Parent) VALUES (38780,'VDO',38776)
INSERT Categorieen (ID,Name,Parent) VALUES (38788,'Trekhaken',82099)
INSERT Categorieen (ID,Name,Parent) VALUES (38793,'Shirtjes en blouses',127687)
INSERT Categorieen (ID,Name,Parent) VALUES (38794,'Rompertjes',127687)
INSERT Categorieen (ID,Name,Parent) VALUES (38795,'Broekjes',127687)
INSERT Categorieen (ID,Name,Parent) VALUES (38797,'Jasjes',127687)
INSERT Categorieen (ID,Name,Parent) VALUES (38799,'Pakjes',127687)
INSERT Categorieen (ID,Name,Parent) VALUES (38801,'Truitjes en vestjes',127687)
INSERT Categorieen (ID,Name,Parent) VALUES (38846,'Koeling',38851)
INSERT Categorieen (ID,Name,Parent) VALUES (38851,'PC onderdelen',160)
INSERT Categorieen (ID,Name,Parent) VALUES (38856,'Voedingskabels',38851)
INSERT Categorieen (ID,Name,Parent) VALUES (38866,'Overige PC-onderdelen',38851)
INSERT Categorieen (ID,Name,Parent) VALUES (38918,'Accu''s en batterijen',38951)
INSERT Categorieen (ID,Name,Parent) VALUES (38951,'PDA''s en accessoires',160)
INSERT Categorieen (ID,Name,Parent) VALUES (39022,'Bestek en keukengerei',20626)
INSERT Categorieen (ID,Name,Parent) VALUES (39061,'Overige T-shirts',31058)
INSERT Categorieen (ID,Name,Parent) VALUES (39062,'Paraplu''s en regenkleding',12109)
INSERT Categorieen (ID,Name,Parent) VALUES (39189,'Magie en mystiek',1)
INSERT Categorieen (ID,Name,Parent) VALUES (39226,'Elfenfiguurtjes',1)
INSERT Categorieen (ID,Name,Parent) VALUES (39235,'Sporters',8605)
INSERT Categorieen (ID,Name,Parent) VALUES (39246,'Dragonball Z',868)
INSERT Categorieen (ID,Name,Parent) VALUES (39269,'Verrassingseieren',8605)
INSERT Categorieen (ID,Name,Parent) VALUES (39271,'Verzamelingen en partijen',1)
INSERT Categorieen (ID,Name,Parent) VALUES (39317,'Jetski''s',1293)
INSERT Categorieen (ID,Name,Parent) VALUES (40100,'Ontspanningsproducten',47867)
INSERT Categorieen (ID,Name,Parent) VALUES (40181,'Motor- en chiptuning',14761)
INSERT Categorieen (ID,Name,Parent) VALUES (40189,'Ophanging, vering en remmen',14761)
INSERT Categorieen (ID,Name,Parent) VALUES (40193,'Interieur en accessoires',14761)
INSERT Categorieen (ID,Name,Parent) VALUES (40200,'Spoilers en bumpers',14761)
INSERT Categorieen (ID,Name,Parent) VALUES (40217,'Dakdragers',82099)
INSERT Categorieen (ID,Name,Parent) VALUES (40223,'Matten',14761)
INSERT Categorieen (ID,Name,Parent) VALUES (40278,'Sneeuwkettingen',14770)
INSERT Categorieen (ID,Name,Parent) VALUES (40300,'Handschoenen',14784)
INSERT Categorieen (ID,Name,Parent) VALUES (40313,'Duitse gebieden',7825)
INSERT Categorieen (ID,Name,Parent) VALUES (40396,'België',260)
INSERT Categorieen (ID,Name,Parent) VALUES (40398,'Frankrijk',260)
INSERT Categorieen (ID,Name,Parent) VALUES (40399,'Klassiek tot 1945',40398)
INSERT Categorieen (ID,Name,Parent) VALUES (40400,'Frankrijk Overige',40398)
INSERT Categorieen (ID,Name,Parent) VALUES (40407,'IJsland',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (40408,'Italië',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (40411,'Liechtenstein',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (40413,'Nederland',260)
INSERT Categorieen (ID,Name,Parent) VALUES (40414,'Nederland-Overzee',260)
INSERT Categorieen (ID,Name,Parent) VALUES (40416,'Malta',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (40417,'Polen',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (40419,'Portugal en kolonies',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (40422,'Rusland en gebieden',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (40424,'Sovjet-Unie',40422)
INSERT Categorieen (ID,Name,Parent) VALUES (40425,'Rusland',40422)
INSERT Categorieen (ID,Name,Parent) VALUES (40522,'Printerpapier',106261)
INSERT Categorieen (ID,Name,Parent) VALUES (40574,'Displays',9394)
INSERT Categorieen (ID,Name,Parent) VALUES (40587,'Handdoeken',3192)
INSERT Categorieen (ID,Name,Parent) VALUES (40601,'Tuindecoratie en -beelden',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (40602,'Tuinkabouters',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (40605,'Zaden en stekken',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (40636,'Enkellaarzen',127937)
INSERT Categorieen (ID,Name,Parent) VALUES (40686,'Communiekleding',3051)
INSERT Categorieen (ID,Name,Parent) VALUES (40688,'Schilderkunst',550)
INSERT Categorieen (ID,Name,Parent) VALUES (40710,'Andorra',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (40711,'Azië',7990)
INSERT Categorieen (ID,Name,Parent) VALUES (40712,'China',40711)
INSERT Categorieen (ID,Name,Parent) VALUES (40713,'India',40711)
INSERT Categorieen (ID,Name,Parent) VALUES (40714,'Japan',40711)
INSERT Categorieen (ID,Name,Parent) VALUES (40717,'Thailand',40711)
INSERT Categorieen (ID,Name,Parent) VALUES (40718,'Muntaccessoires',11116)
INSERT Categorieen (ID,Name,Parent) VALUES (40723,'Barok en oude muziek',19481)
INSERT Categorieen (ID,Name,Parent) VALUES (40837,'Taxi''s',417)
INSERT Categorieen (ID,Name,Parent) VALUES (40842,'Peuter- en kleuterspeelgoed',220)
INSERT Categorieen (ID,Name,Parent) VALUES (40852,'Schaakspellen',233)
INSERT Categorieen (ID,Name,Parent) VALUES (40860,'Casinospellen',233)
INSERT Categorieen (ID,Name,Parent) VALUES (40863,'Dobbelstenen',220)
INSERT Categorieen (ID,Name,Parent) VALUES (40864,'Schoenen',13331)
INSERT Categorieen (ID,Name,Parent) VALUES (40876,'Squash',888)
INSERT Categorieen (ID,Name,Parent) VALUES (40878,'Rackets',13340)
INSERT Categorieen (ID,Name,Parent) VALUES (41069,'Sport',11046)
INSERT Categorieen (ID,Name,Parent) VALUES (41520,'Actie en avontuur',2288)
INSERT Categorieen (ID,Name,Parent) VALUES (41522,'Rampen',41520)
INSERT Categorieen (ID,Name,Parent) VALUES (41523,'Tekenfilms en animatie',2288)
INSERT Categorieen (ID,Name,Parent) VALUES (41525,'Computer geanimeerd',41523)
INSERT Categorieen (ID,Name,Parent) VALUES (41526,'Kinder- en familiefilms',2288)
INSERT Categorieen (ID,Name,Parent) VALUES (41527,'Avontuur',41526)
INSERT Categorieen (ID,Name,Parent) VALUES (41528,'Komedie',41526)
INSERT Categorieen (ID,Name,Parent) VALUES (41529,'Educatief',41526)
INSERT Categorieen (ID,Name,Parent) VALUES (41530,'Fantasie en sprookjes',41526)
INSERT Categorieen (ID,Name,Parent) VALUES (41534,'Actie',35015)
INSERT Categorieen (ID,Name,Parent) VALUES (41535,'Romantiek',35015)
INSERT Categorieen (ID,Name,Parent) VALUES (41537,'Cabaret',35015)
INSERT Categorieen (ID,Name,Parent) VALUES (41539,'Thriller en misdaad',2288)
INSERT Categorieen (ID,Name,Parent) VALUES (41540,'Misdaad',41539)
INSERT Categorieen (ID,Name,Parent) VALUES (41541,'Spionage',41539)
INSERT Categorieen (ID,Name,Parent) VALUES (41543,'Documentaires & educatie',2288)
INSERT Categorieen (ID,Name,Parent) VALUES (41544,'Biografie',41543)
INSERT Categorieen (ID,Name,Parent) VALUES (41546,'Historie',41543)
INSERT Categorieen (ID,Name,Parent) VALUES (41547,'Natuur',41543)
INSERT Categorieen (ID,Name,Parent) VALUES (41548,'Wetenschap en techniek',41543)
INSERT Categorieen (ID,Name,Parent) VALUES (41550,'Speelfilm en drama',2288)
INSERT Categorieen (ID,Name,Parent) VALUES (41551,'Politiek',41550)
INSERT Categorieen (ID,Name,Parent) VALUES (41558,'Horror en griezel',2288)
INSERT Categorieen (ID,Name,Parent) VALUES (41559,'Monsters',41558)
INSERT Categorieen (ID,Name,Parent) VALUES (41560,'Occult en bovennatuurlijk',41558)
INSERT Categorieen (ID,Name,Parent) VALUES (41567,'Jazz',23275)
INSERT Categorieen (ID,Name,Parent) VALUES (41570,'Rap en hiphop',23275)
INSERT Categorieen (ID,Name,Parent) VALUES (41571,'Sciencefiction en fantasy',2288)
INSERT Categorieen (ID,Name,Parent) VALUES (41572,'Buitenaardse wezens',41571)
INSERT Categorieen (ID,Name,Parent) VALUES (41573,'Futuristisch',41571)
INSERT Categorieen (ID,Name,Parent) VALUES (41574,'Robots',41571)
INSERT Categorieen (ID,Name,Parent) VALUES (41575,'Ruimteavontuur',41571)
INSERT Categorieen (ID,Name,Parent) VALUES (41584,'TV series en programma''s DVD''s',11232)
INSERT Categorieen (ID,Name,Parent) VALUES (41587,'Cabaret en komedie',41584)
INSERT Categorieen (ID,Name,Parent) VALUES (41588,'Drama',41584)
INSERT Categorieen (ID,Name,Parent) VALUES (41589,'Sciencefiction en fantasy',41584)
INSERT Categorieen (ID,Name,Parent) VALUES (41590,'Overige series en programma''s',41584)
INSERT Categorieen (ID,Name,Parent) VALUES (41594,'Reizen',41543)
INSERT Categorieen (ID,Name,Parent) VALUES (41853,'Office en zakelijk',18793)
INSERT Categorieen (ID,Name,Parent) VALUES (41859,'Grafisch en multimedia',18793)
INSERT Categorieen (ID,Name,Parent) VALUES (41870,'Kinderen',18793)
INSERT Categorieen (ID,Name,Parent) VALUES (42381,'Overige militaria',15502)
INSERT Categorieen (ID,Name,Parent) VALUES (42416,'BenQ',15073)
INSERT Categorieen (ID,Name,Parent) VALUES (42428,'Overige GSM en telecom',14675)
INSERT Categorieen (ID,Name,Parent) VALUES (42429,'Nokia',111202)
INSERT Categorieen (ID,Name,Parent) VALUES (42516,'Muziekdoosjes en -mobielen',18637)
INSERT Categorieen (ID,Name,Parent) VALUES (42525,'Binnenhuisarchitectuur',267)
INSERT Categorieen (ID,Name,Parent) VALUES (42526,'Overige tassen',37008)
INSERT Categorieen (ID,Name,Parent) VALUES (42660,'Aerobics- en fitnessmode',13154)
INSERT Categorieen (ID,Name,Parent) VALUES (42680,'Aziatische kunst',353)
INSERT Categorieen (ID,Name,Parent) VALUES (42723,'USA',7990)
INSERT Categorieen (ID,Name,Parent) VALUES (42724,'Bullion-Munten',42723)
INSERT Categorieen (ID,Name,Parent) VALUES (42725,'Herdenkingsmunten',42723)
INSERT Categorieen (ID,Name,Parent) VALUES (42726,'Goud en platina',42723)
INSERT Categorieen (ID,Name,Parent) VALUES (42727,'Munten per stuk',42723)
INSERT Categorieen (ID,Name,Parent) VALUES (42728,'Muntsets',42723)
INSERT Categorieen (ID,Name,Parent) VALUES (42737,'Kleding',10525)
INSERT Categorieen (ID,Name,Parent) VALUES (42806,'Toebehoren',1492)
INSERT Categorieen (ID,Name,Parent) VALUES (42807,'Clubs',13334)
INSERT Categorieen (ID,Name,Parent) VALUES (42810,'Dameskleding',10514)
INSERT Categorieen (ID,Name,Parent) VALUES (42843,'Oorlog en militair',41543)
INSERT Categorieen (ID,Name,Parent) VALUES (42845,'Oorlog en militair',41550)
INSERT Categorieen (ID,Name,Parent) VALUES (43048,'Bedels',281)
INSERT Categorieen (ID,Name,Parent) VALUES (43049,'Dieren',43048)
INSERT Categorieen (ID,Name,Parent) VALUES (43050,'Steentjes en parels',43048)
INSERT Categorieen (ID,Name,Parent) VALUES (43051,'Figuurtjes',43048)
INSERT Categorieen (ID,Name,Parent) VALUES (43052,'Hartjes, liefde',43048)
INSERT Categorieen (ID,Name,Parent) VALUES (43053,'Seizoensgebonden',43048)
INSERT Categorieen (ID,Name,Parent) VALUES (43054,'Letters',43048)
INSERT Categorieen (ID,Name,Parent) VALUES (43055,'Muziek',43048)
INSERT Categorieen (ID,Name,Parent) VALUES (43056,'Vlaggen',43048)
INSERT Categorieen (ID,Name,Parent) VALUES (43057,'Hobby''s',43048)
INSERT Categorieen (ID,Name,Parent) VALUES (43058,'Religieus',43048)
INSERT Categorieen (ID,Name,Parent) VALUES (43059,'Sport',43048)
INSERT Categorieen (ID,Name,Parent) VALUES (43453,'Digitale spiegelreflexcamera''s',625)
INSERT Categorieen (ID,Name,Parent) VALUES (43585,'Orkesten',19481)
INSERT Categorieen (ID,Name,Parent) VALUES (43619,'Jazz, Big Band en Blues',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (43639,'R&B en soul',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (43642,'Motown',43639)
INSERT Categorieen (ID,Name,Parent) VALUES (43645,'Freestyle',62835)
INSERT Categorieen (ID,Name,Parent) VALUES (43646,'Gangsta',62835)
INSERT Categorieen (ID,Name,Parent) VALUES (43647,'Hip Hop',62835)
INSERT Categorieen (ID,Name,Parent) VALUES (43648,'Old School',62835)
INSERT Categorieen (ID,Name,Parent) VALUES (43652,'Overige rock',19483)
INSERT Categorieen (ID,Name,Parent) VALUES (43657,'Grunge',19483)
INSERT Categorieen (ID,Name,Parent) VALUES (43663,'TV',26718)
INSERT Categorieen (ID,Name,Parent) VALUES (43668,'Indisch',19485)
INSERT Categorieen (ID,Name,Parent) VALUES (43670,'Klassiek en opera',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (43688,'Trance',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (43689,'Jazz',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (43695,'Pop',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (43700,'R&B en Soul',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (43704,'Soul',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (43707,'Rock',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (43708,'Vinyl beperkte oplagen',1071)
INSERT Categorieen (ID,Name,Parent) VALUES (43839,'Animatie',41523)
INSERT Categorieen (ID,Name,Parent) VALUES (44109,'Dungeons & Dragons',2543)
INSERT Categorieen (ID,Name,Parent) VALUES (44111,'Fantasy',2543)
INSERT Categorieen (ID,Name,Parent) VALUES (44166,'Folie en stickers',14761)
INSERT Categorieen (ID,Name,Parent) VALUES (44176,'Spiegels',14761)
INSERT Categorieen (ID,Name,Parent) VALUES (44204,'Sportuitlaten en luchtfilters',14761)
INSERT Categorieen (ID,Name,Parent) VALUES (44333,'Laarzen en schoenen',14784)
INSERT Categorieen (ID,Name,Parent) VALUES (44441,'Overige bad- en strandmode',15770)
INSERT Categorieen (ID,Name,Parent) VALUES (44450,'Badjassen',9816)
INSERT Categorieen (ID,Name,Parent) VALUES (44539,'Zonnebrillen',12109)
INSERT Categorieen (ID,Name,Parent) VALUES (44556,'Catalogi',7390)
INSERT Categorieen (ID,Name,Parent) VALUES (44610,'Kleding',56801)
INSERT Categorieen (ID,Name,Parent) VALUES (44613,'Schoenen',56801)
INSERT Categorieen (ID,Name,Parent) VALUES (44626,'Skates',10511)
INSERT Categorieen (ID,Name,Parent) VALUES (44629,'Broeken',22171)
INSERT Categorieen (ID,Name,Parent) VALUES (44646,'Shirts',22171)
INSERT Categorieen (ID,Name,Parent) VALUES (44652,'Ademapparatuur',10518)
INSERT Categorieen (ID,Name,Parent) VALUES (44671,'Duikcomputers',10518)
INSERT Categorieen (ID,Name,Parent) VALUES (44676,'Duiklampen',10518)
INSERT Categorieen (ID,Name,Parent) VALUES (44688,'Duiken',105967)
INSERT Categorieen (ID,Name,Parent) VALUES (44695,'Overige duiksport',10518)
INSERT Categorieen (ID,Name,Parent) VALUES (44730,'Film en circus',1305)
INSERT Categorieen (ID,Name,Parent) VALUES (44793,'Vouwwagens',44794)
INSERT Categorieen (ID,Name,Parent) VALUES (44794,'Caravans en vouwwagens',9800)
INSERT Categorieen (ID,Name,Parent) VALUES (44795,'Campers en motorhomes',46159)
INSERT Categorieen (ID,Name,Parent) VALUES (45137,'Hong Kong',40711)
INSERT Categorieen (ID,Name,Parent) VALUES (45139,'Filipijnen',40711)
INSERT Categorieen (ID,Name,Parent) VALUES (45145,'Latijns Amerika',7990)
INSERT Categorieen (ID,Name,Parent) VALUES (45148,'Europese niet-euromunten',11116)
INSERT Categorieen (ID,Name,Parent) VALUES (45153,'Hongarije',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (45172,'Huidverzorging',26528)
INSERT Categorieen (ID,Name,Parent) VALUES (45338,'Noord- en Zuid-Amerika',12822)
INSERT Categorieen (ID,Name,Parent) VALUES (45515,'Gordijnen',3192)
INSERT Categorieen (ID,Name,Parent) VALUES (45540,'Rock',20801)
INSERT Categorieen (ID,Name,Parent) VALUES (45551,'Grunge en garage',20801)
INSERT Categorieen (ID,Name,Parent) VALUES (45618,'Pioneer',38776)
INSERT Categorieen (ID,Name,Parent) VALUES (45642,'Bussen',46159)
INSERT Categorieen (ID,Name,Parent) VALUES (45644,'Vrachtwagens en opleggers',46159)
INSERT Categorieen (ID,Name,Parent) VALUES (45739,'Afzuigkappen',30329)
INSERT Categorieen (ID,Name,Parent) VALUES (45747,'Magnetrons',30329)
INSERT Categorieen (ID,Name,Parent) VALUES (45805,'Deuren',11700)
INSERT Categorieen (ID,Name,Parent) VALUES (45838,'Sokken',9816)
INSERT Categorieen (ID,Name,Parent) VALUES (45990,'Malta',7975)
INSERT Categorieen (ID,Name,Parent) VALUES (45991,'Australië en Oceanië',7990)
INSERT Categorieen (ID,Name,Parent) VALUES (45997,'Canada',7990)
INSERT Categorieen (ID,Name,Parent) VALUES (46004,'Overige munten en biljetten',11116)
INSERT Categorieen (ID,Name,Parent) VALUES (46010,'Folk',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (46032,'Timesharing',160939)
INSERT Categorieen (ID,Name,Parent) VALUES (46159,'Transportvoertuigen',9800)
INSERT Categorieen (ID,Name,Parent) VALUES (46329,'Auto''s',64802)
INSERT Categorieen (ID,Name,Parent) VALUES (46339,'Gezondheid en medisch',267)
INSERT Categorieen (ID,Name,Parent) VALUES (46515,'Overige bruidskleding',15720)
INSERT Categorieen (ID,Name,Parent) VALUES (46638,'Akoestische gitaren',21762)
INSERT Categorieen (ID,Name,Parent) VALUES (46645,'Elektrische gitaren',21762)
INSERT Categorieen (ID,Name,Parent) VALUES (46652,'Versterkers',21762)
INSERT Categorieen (ID,Name,Parent) VALUES (46666,'Effecten',21762)
INSERT Categorieen (ID,Name,Parent) VALUES (46675,'Gitaaraccessoires',21762)
INSERT Categorieen (ID,Name,Parent) VALUES (46957,'Studio- en opnameapparatuur',21770)
INSERT Categorieen (ID,Name,Parent) VALUES (47160,'Gebruikt',25791)
INSERT Categorieen (ID,Name,Parent) VALUES (47164,'Groenland',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (47166,'1920 - 1929',128283)
INSERT Categorieen (ID,Name,Parent) VALUES (47170,'Åland',128312)
INSERT Categorieen (ID,Name,Parent) VALUES (47171,'Zweden',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (47173,'Aruba',40414)
INSERT Categorieen (ID,Name,Parent) VALUES (47499,'Speldjes en buttons',1)
INSERT Categorieen (ID,Name,Parent) VALUES (47500,'Speldjes',47499)
INSERT Categorieen (ID,Name,Parent) VALUES (47526,'Kano''s en kajaks',1293)
INSERT Categorieen (ID,Name,Parent) VALUES (47606,'USB-sticks',3676)
INSERT Categorieen (ID,Name,Parent) VALUES (47627,'Transportvoertuigaccessoires',9800)
INSERT Categorieen (ID,Name,Parent) VALUES (47628,'Maat 18',18634)
INSERT Categorieen (ID,Name,Parent) VALUES (47632,'Maat 19',18634)
INSERT Categorieen (ID,Name,Parent) VALUES (47636,'Maat 20',18634)
INSERT Categorieen (ID,Name,Parent) VALUES (47640,'Maat 21',18634)
INSERT Categorieen (ID,Name,Parent) VALUES (47641,'Maat 22',18634)
INSERT Categorieen (ID,Name,Parent) VALUES (47645,'Maat 23',18634)
INSERT Categorieen (ID,Name,Parent) VALUES (47649,'Maat 24',18634)
INSERT Categorieen (ID,Name,Parent) VALUES (47653,'Maat 25',18634)
INSERT Categorieen (ID,Name,Parent) VALUES (47657,'Maat 26 en groter',18634)
INSERT Categorieen (ID,Name,Parent) VALUES (47681,'Brieven en postwaardestukken',7825)
INSERT Categorieen (ID,Name,Parent) VALUES (47799,'Geluidskaarten',38851)
INSERT Categorieen (ID,Name,Parent) VALUES (47861,'Reinigingsproducten',26528)
INSERT Categorieen (ID,Name,Parent) VALUES (47867,'Gezondheidsartikelen',12155)
INSERT Categorieen (ID,Name,Parent) VALUES (47868,'Allergieproducten',47867)
INSERT Categorieen (ID,Name,Parent) VALUES (47873,'Voedingssupplementen',47867)
INSERT Categorieen (ID,Name,Parent) VALUES (47879,'Haarverzorging',12155)
INSERT Categorieen (ID,Name,Parent) VALUES (47880,'Haarverf',47879)
INSERT Categorieen (ID,Name,Parent) VALUES (47884,'Haarversiering',47879)
INSERT Categorieen (ID,Name,Parent) VALUES (47898,'Spoelingen',47879)
INSERT Categorieen (ID,Name,Parent) VALUES (47903,'Bad- en doucheproducten',11838)
INSERT Categorieen (ID,Name,Parent) VALUES (47904,'Badzout',47903)
INSERT Categorieen (ID,Name,Parent) VALUES (47905,'Badolie',47903)
INSERT Categorieen (ID,Name,Parent) VALUES (47907,'Overige badproducten',47903)
INSERT Categorieen (ID,Name,Parent) VALUES (47908,'Deodorants',11838)
INSERT Categorieen (ID,Name,Parent) VALUES (47914,'Lotions',11838)
INSERT Categorieen (ID,Name,Parent) VALUES (47917,'Zeep',11838)
INSERT Categorieen (ID,Name,Parent) VALUES (47921,'Scheerapparaten',107035)
INSERT Categorieen (ID,Name,Parent) VALUES (47924,'Ontharing voor dames',11838)
INSERT Categorieen (ID,Name,Parent) VALUES (47930,'Scheerschuim',107035)
INSERT Categorieen (ID,Name,Parent) VALUES (47931,'Scheermesjes',107035)
INSERT Categorieen (ID,Name,Parent) VALUES (47939,'Nagellak',47945)
INSERT Categorieen (ID,Name,Parent) VALUES (47943,'Teint',13264)
INSERT Categorieen (ID,Name,Parent) VALUES (47945,'Manicure en nagels',12155)
INSERT Categorieen (ID,Name,Parent) VALUES (47949,'Pedicure',12155)
INSERT Categorieen (ID,Name,Parent) VALUES (47954,'Dames',12157)
INSERT Categorieen (ID,Name,Parent) VALUES (47955,'Heren',12157)
INSERT Categorieen (ID,Name,Parent) VALUES (47975,'Unisexparfums',12157)
INSERT Categorieen (ID,Name,Parent) VALUES (48070,'Zonnecrème en aftersun',12155)
INSERT Categorieen (ID,Name,Parent) VALUES (48079,'Mond- en gebitsverzorging',12155)
INSERT Categorieen (ID,Name,Parent) VALUES (48082,'Mondreiniging',48079)
INSERT Categorieen (ID,Name,Parent) VALUES (48084,'Tandpasta',48079)
INSERT Categorieen (ID,Name,Parent) VALUES (48085,'Overige mondverzorging',48079)
INSERT Categorieen (ID,Name,Parent) VALUES (48163,'Onderdelen',9394)
INSERT Categorieen (ID,Name,Parent) VALUES (48169,'NEC',15073)
INSERT Categorieen (ID,Name,Parent) VALUES (48171,'Sharp',15073)
INSERT Categorieen (ID,Name,Parent) VALUES (48182,'NEC',115680)
INSERT Categorieen (ID,Name,Parent) VALUES (48183,'Sharp',115680)
INSERT Categorieen (ID,Name,Parent) VALUES (48329,'Motorboten en jachten',1293)
INSERT Categorieen (ID,Name,Parent) VALUES (48334,'Overige maat 110/116',98378)
INSERT Categorieen (ID,Name,Parent) VALUES (48348,'Blouses',98380)
INSERT Categorieen (ID,Name,Parent) VALUES (48350,'Overige maat 122/128',98380)
INSERT Categorieen (ID,Name,Parent) VALUES (48369,'Blouses',98382)
INSERT Categorieen (ID,Name,Parent) VALUES (48371,'Overige maat 134/140',98382)
INSERT Categorieen (ID,Name,Parent) VALUES (48382,'Nero',63)
INSERT Categorieen (ID,Name,Parent) VALUES (48411,'Michel Vaillant',63)
INSERT Categorieen (ID,Name,Parent) VALUES (48453,'Accessoires',105151)
INSERT Categorieen (ID,Name,Parent) VALUES (48455,'Consoles',105151)
INSERT Categorieen (ID,Name,Parent) VALUES (48756,'Sets',111848)
INSERT Categorieen (ID,Name,Parent) VALUES (49046,'Blouses',98384)
INSERT Categorieen (ID,Name,Parent) VALUES (49048,'Overige maat 146',98384)
INSERT Categorieen (ID,Name,Parent) VALUES (49051,'Overige maat 152/158',98386)
INSERT Categorieen (ID,Name,Parent) VALUES (49065,'Broeken',98388)
INSERT Categorieen (ID,Name,Parent) VALUES (49066,'Jassen en jasjes',98388)
INSERT Categorieen (ID,Name,Parent) VALUES (49067,'Rokken en jurken',98388)
INSERT Categorieen (ID,Name,Parent) VALUES (49068,'Truien',98388)
INSERT Categorieen (ID,Name,Parent) VALUES (49071,'Blouses',98388)
INSERT Categorieen (ID,Name,Parent) VALUES (49073,'Overige maat 164',98388)
INSERT Categorieen (ID,Name,Parent) VALUES (49078,'Overige maat 170/176',98390)
INSERT Categorieen (ID,Name,Parent) VALUES (49091,'Overige maat 110/116',98325)
INSERT Categorieen (ID,Name,Parent) VALUES (49104,'Overige maat 122/128',98327)
INSERT Categorieen (ID,Name,Parent) VALUES (49122,'Overige maat 134/140',98329)
INSERT Categorieen (ID,Name,Parent) VALUES (49135,'Overige maat 146',98331)
INSERT Categorieen (ID,Name,Parent) VALUES (49137,'Overige maat 152/158',98333)
INSERT Categorieen (ID,Name,Parent) VALUES (49149,'Broeken',98372)
INSERT Categorieen (ID,Name,Parent) VALUES (49150,'Jassen en jasjes',98372)
INSERT Categorieen (ID,Name,Parent) VALUES (49151,'Truien',98372)
INSERT Categorieen (ID,Name,Parent) VALUES (49153,'Blouses en overhemden',98372)
INSERT Categorieen (ID,Name,Parent) VALUES (49155,'Overige maat 164',98372)
INSERT Categorieen (ID,Name,Parent) VALUES (49159,'Overige maat 170/176',98374)
INSERT Categorieen (ID,Name,Parent) VALUES (49170,'Hongarije',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (49174,'Buttons',47499)
INSERT Categorieen (ID,Name,Parent) VALUES (49196,'Decks - type I',218)
INSERT Categorieen (ID,Name,Parent) VALUES (49759,'Caravan-accessoires',9800)
INSERT Categorieen (ID,Name,Parent) VALUES (49769,'Uitlaatsystemen',14780)
INSERT Categorieen (ID,Name,Parent) VALUES (49790,'Remmen',14780)
INSERT Categorieen (ID,Name,Parent) VALUES (49810,'Voetsteunen',14780)
INSERT Categorieen (ID,Name,Parent) VALUES (49824,'Instrumenten en assen',14780)
INSERT Categorieen (ID,Name,Parent) VALUES (49831,'Kettingen en koppelingen',14780)
INSERT Categorieen (ID,Name,Parent) VALUES (49845,'Sturen, schakel- en handgrepen',14780)
INSERT Categorieen (ID,Name,Parent) VALUES (49866,'Verlichting en lampen',14780)
INSERT Categorieen (ID,Name,Parent) VALUES (49879,'Motor en versnelling',14780)
INSERT Categorieen (ID,Name,Parent) VALUES (49892,'Zittingen',14780)
INSERT Categorieen (ID,Name,Parent) VALUES (49899,'Spiegels',14780)
INSERT Categorieen (ID,Name,Parent) VALUES (49912,'Tanks',14780)
INSERT Categorieen (ID,Name,Parent) VALUES (49925,'Stickers en bekleding',14780)
INSERT Categorieen (ID,Name,Parent) VALUES (50239,'Tuingereedschap',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (50288,'Booster Packs',60225)
INSERT Categorieen (ID,Name,Parent) VALUES (50289,'Foil cards',60225)
INSERT Categorieen (ID,Name,Parent) VALUES (50290,'Losse kaarten',60225)
INSERT Categorieen (ID,Name,Parent) VALUES (50291,'Promokaarten',60225)
INSERT Categorieen (ID,Name,Parent) VALUES (50292,'Starter decks',60225)
INSERT Categorieen (ID,Name,Parent) VALUES (50293,'Verzamelingen',60225)
INSERT Categorieen (ID,Name,Parent) VALUES (50541,'Kia',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (50637,'Gewone armbanden',10975)
INSERT Categorieen (ID,Name,Parent) VALUES (51556,'Pumps',12104)
INSERT Categorieen (ID,Name,Parent) VALUES (51567,'Zwemkleding',3051)
INSERT Categorieen (ID,Name,Parent) VALUES (51569,'Broeken',98378)
INSERT Categorieen (ID,Name,Parent) VALUES (51571,'Broeken',98380)
INSERT Categorieen (ID,Name,Parent) VALUES (51573,'Broeken',98382)
INSERT Categorieen (ID,Name,Parent) VALUES (51575,'Broeken',98384)
INSERT Categorieen (ID,Name,Parent) VALUES (51584,'Sportkleding',3051)
INSERT Categorieen (ID,Name,Parent) VALUES (51596,'Jassen en jasjes',98378)
INSERT Categorieen (ID,Name,Parent) VALUES (51598,'Jassen en jasjes',98380)
INSERT Categorieen (ID,Name,Parent) VALUES (51600,'Jassen en jasjes',98382)
INSERT Categorieen (ID,Name,Parent) VALUES (51602,'Jassen en jasjes',98384)
INSERT Categorieen (ID,Name,Parent) VALUES (51603,'Rokken en jurken',98378)
INSERT Categorieen (ID,Name,Parent) VALUES (51605,'Rokken en jurken',98380)
INSERT Categorieen (ID,Name,Parent) VALUES (51607,'Rokken en jurken',98382)
INSERT Categorieen (ID,Name,Parent) VALUES (51609,'Rokken en jurken',98384)
INSERT Categorieen (ID,Name,Parent) VALUES (51610,'Truien',98384)
INSERT Categorieen (ID,Name,Parent) VALUES (51618,'Truien',98378)
INSERT Categorieen (ID,Name,Parent) VALUES (51620,'Truien',98380)
INSERT Categorieen (ID,Name,Parent) VALUES (51622,'Truien',98382)
INSERT Categorieen (ID,Name,Parent) VALUES (51702,'Shirts',98378)
INSERT Categorieen (ID,Name,Parent) VALUES (51706,'Shirts',98380)
INSERT Categorieen (ID,Name,Parent) VALUES (51710,'Shirts',98382)
INSERT Categorieen (ID,Name,Parent) VALUES (51714,'Shirts',98384)
INSERT Categorieen (ID,Name,Parent) VALUES (51919,'Zwemkleding',3038)
INSERT Categorieen (ID,Name,Parent) VALUES (51921,'Broeken',98325)
INSERT Categorieen (ID,Name,Parent) VALUES (51923,'Broeken',98327)
INSERT Categorieen (ID,Name,Parent) VALUES (51925,'Broeken',98329)
INSERT Categorieen (ID,Name,Parent) VALUES (51927,'Broeken',98331)
INSERT Categorieen (ID,Name,Parent) VALUES (51934,'Jassen en jasjes',98325)
INSERT Categorieen (ID,Name,Parent) VALUES (51936,'Jassen en jasjes',98327)
INSERT Categorieen (ID,Name,Parent) VALUES (51938,'Jassen en jasjes',98329)
INSERT Categorieen (ID,Name,Parent) VALUES (51940,'Jassen en jasjes',98331)
INSERT Categorieen (ID,Name,Parent) VALUES (51949,'Truien',98327)
INSERT Categorieen (ID,Name,Parent) VALUES (51951,'Truien',98329)
INSERT Categorieen (ID,Name,Parent) VALUES (51959,'Sportkleding',3038)
INSERT Categorieen (ID,Name,Parent) VALUES (51961,'Shirts',98325)
INSERT Categorieen (ID,Name,Parent) VALUES (51968,'Shirts',98331)
INSERT Categorieen (ID,Name,Parent) VALUES (51970,'Shirts',98329)
INSERT Categorieen (ID,Name,Parent) VALUES (51972,'Shirts',98327)
INSERT Categorieen (ID,Name,Parent) VALUES (51993,'Truien',98325)
INSERT Categorieen (ID,Name,Parent) VALUES (52002,'Blouses en overhemden',98325)
INSERT Categorieen (ID,Name,Parent) VALUES (52006,'Blouses en overhemden',98327)
INSERT Categorieen (ID,Name,Parent) VALUES (52008,'Blouses en overhemden',98329)
INSERT Categorieen (ID,Name,Parent) VALUES (52010,'Blouses en overhemden',98331)
INSERT Categorieen (ID,Name,Parent) VALUES (52043,'Special interest',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (52044,'Verzamelingen',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (52046,'Verzamelingen en groothandel',11233)
INSERT Categorieen (ID,Name,Parent) VALUES (52058,'Posters',157499)
INSERT Categorieen (ID,Name,Parent) VALUES (52064,'Gesigneerde artikelen',157499)
INSERT Categorieen (ID,Name,Parent) VALUES (52065,'Bands en groepen',157499)
INSERT Categorieen (ID,Name,Parent) VALUES (52145,'Overige speldjes en buttons',47499)
INSERT Categorieen (ID,Name,Parent) VALUES (52176,'Verzamelingen',60241)
INSERT Categorieen (ID,Name,Parent) VALUES (52178,'Starter decks',60241)
INSERT Categorieen (ID,Name,Parent) VALUES (52473,'Accessoires en opslag',11233)
INSERT Categorieen (ID,Name,Parent) VALUES (52552,'Film',35064)
INSERT Categorieen (ID,Name,Parent) VALUES (53159,'Shirts lange mouw',9816)
INSERT Categorieen (ID,Name,Parent) VALUES (53590,'Actrices',33416)
INSERT Categorieen (ID,Name,Parent) VALUES (53591,'Ansichtkaarten',57)
INSERT Categorieen (ID,Name,Parent) VALUES (53870,'Drempels en lijsten',14761)
INSERT Categorieen (ID,Name,Parent) VALUES (53934,'Stuur en bediening',63318)
INSERT Categorieen (ID,Name,Parent) VALUES (53938,'Autostoelen en bekleding',82099)
INSERT Categorieen (ID,Name,Parent) VALUES (54013,'Kinderkleding',14784)
INSERT Categorieen (ID,Name,Parent) VALUES (54120,'Barbenodigdheden',20626)
INSERT Categorieen (ID,Name,Parent) VALUES (54123,'Dienbladen',20626)
INSERT Categorieen (ID,Name,Parent) VALUES (54201,'Matrassen',3192)
INSERT Categorieen (ID,Name,Parent) VALUES (54225,'Banken en sofa''s',3192)
INSERT Categorieen (ID,Name,Parent) VALUES (54235,'Stoelen en fauteuils',3192)
INSERT Categorieen (ID,Name,Parent) VALUES (54250,'Tafels en bureaus',3192)
INSERT Categorieen (ID,Name,Parent) VALUES (54268,'Kachels en haarden',3192)
INSERT Categorieen (ID,Name,Parent) VALUES (54274,'Maat 32-34 (XXS/XS)',12989)
INSERT Categorieen (ID,Name,Parent) VALUES (54280,'Maat 36 (S)',12989)
INSERT Categorieen (ID,Name,Parent) VALUES (54286,'Maat 44-46 (XL)',12989)
INSERT Categorieen (ID,Name,Parent) VALUES (54295,'Maat 40-42 (L)',12989)
INSERT Categorieen (ID,Name,Parent) VALUES (54314,'Maat 32-34 (XXS/XS)',13021)
INSERT Categorieen (ID,Name,Parent) VALUES (54322,'Maat 36 (S)',13021)
INSERT Categorieen (ID,Name,Parent) VALUES (54330,'Maat 44-46 (XL)',13021)
INSERT Categorieen (ID,Name,Parent) VALUES (54342,'Maat 40-42 (L)',13021)
INSERT Categorieen (ID,Name,Parent) VALUES (54346,'Maat 32-34 (XXS/XS)',13045)
INSERT Categorieen (ID,Name,Parent) VALUES (54349,'Maat 36 (S)',13045)
INSERT Categorieen (ID,Name,Parent) VALUES (54352,'Maat 40-42 (L)',13045)
INSERT Categorieen (ID,Name,Parent) VALUES (54355,'Maat 44-46 (XL)',13045)
INSERT Categorieen (ID,Name,Parent) VALUES (54364,'W27 en kleiner',13016)
INSERT Categorieen (ID,Name,Parent) VALUES (54365,'W28',13016)
INSERT Categorieen (ID,Name,Parent) VALUES (54366,'W29',13016)
INSERT Categorieen (ID,Name,Parent) VALUES (54367,'W30',13016)
INSERT Categorieen (ID,Name,Parent) VALUES (54368,'W31',13016)
INSERT Categorieen (ID,Name,Parent) VALUES (54369,'W32',13016)
INSERT Categorieen (ID,Name,Parent) VALUES (54370,'W33-W35',13016)
INSERT Categorieen (ID,Name,Parent) VALUES (54371,'W36-W38',13016)
INSERT Categorieen (ID,Name,Parent) VALUES (54492,'Maat 32-34 (XXS/XS)',24046)
INSERT Categorieen (ID,Name,Parent) VALUES (54495,'Maat 36 (S)',24046)
INSERT Categorieen (ID,Name,Parent) VALUES (54498,'Maat 40-42 (L)',24046)
INSERT Categorieen (ID,Name,Parent) VALUES (54501,'Maat 44-46 (XL)',24046)
INSERT Categorieen (ID,Name,Parent) VALUES (54510,'Maat 32-34 (XXS/XS)',13029)
INSERT Categorieen (ID,Name,Parent) VALUES (54515,'Maat 36 (S)',13029)
INSERT Categorieen (ID,Name,Parent) VALUES (54520,'Maat 40-42 (L)',13029)
INSERT Categorieen (ID,Name,Parent) VALUES (54521,'Maat 44-46 (XL)',13029)
INSERT Categorieen (ID,Name,Parent) VALUES (54535,'Maat 32-34 (XXS/XS)',13493)
INSERT Categorieen (ID,Name,Parent) VALUES (54536,'Maat 36 (S)',13493)
INSERT Categorieen (ID,Name,Parent) VALUES (54537,'Maat 40-42 (L)',13493)
INSERT Categorieen (ID,Name,Parent) VALUES (54538,'Maat 44-46 (XL)',13493)
INSERT Categorieen (ID,Name,Parent) VALUES (54559,'Maat 32-34 (XXS/XS)',19736)
INSERT Categorieen (ID,Name,Parent) VALUES (54560,'Maat 36 (S)',19736)
INSERT Categorieen (ID,Name,Parent) VALUES (54561,'Maat 40-42 (L)',19736)
INSERT Categorieen (ID,Name,Parent) VALUES (54562,'Maat 44-46 (XL)',19736)
INSERT Categorieen (ID,Name,Parent) VALUES (54593,'Maat 44-45',32309)
INSERT Categorieen (ID,Name,Parent) VALUES (54596,'Maat 48-49',32309)
INSERT Categorieen (ID,Name,Parent) VALUES (54599,'Maat 56-57',32309)
INSERT Categorieen (ID,Name,Parent) VALUES (54611,'Maat 52-53',32309)
INSERT Categorieen (ID,Name,Parent) VALUES (54823,'Houtbewerking',37528)
INSERT Categorieen (ID,Name,Parent) VALUES (54824,'Verf',37528)
INSERT Categorieen (ID,Name,Parent) VALUES (54846,'Doeken',37528)
INSERT Categorieen (ID,Name,Parent) VALUES (54864,'Papier',37528)
INSERT Categorieen (ID,Name,Parent) VALUES (54882,'Penselen',37528)
INSERT Categorieen (ID,Name,Parent) VALUES (54907,'Steenbewerking',37528)
INSERT Categorieen (ID,Name,Parent) VALUES (54951,'Kerstmis en Sinterklaas',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (55007,'Knuffels',386)
INSERT Categorieen (ID,Name,Parent) VALUES (55216,'Chronografen',91064)
INSERT Categorieen (ID,Name,Parent) VALUES (55378,'Overige piercings',26109)
INSERT Categorieen (ID,Name,Parent) VALUES (56353,'Tekno',222)
INSERT Categorieen (ID,Name,Parent) VALUES (56358,'Cararama',222)
INSERT Categorieen (ID,Name,Parent) VALUES (56528,'Chroom en emblemen',14761)
INSERT Categorieen (ID,Name,Parent) VALUES (56599,'Telefoonsieraden',9394)
INSERT Categorieen (ID,Name,Parent) VALUES (56700,'Vakantietegoedbonnen',160939)
INSERT Categorieen (ID,Name,Parent) VALUES (56766,'Schoenen',13340)
INSERT Categorieen (ID,Name,Parent) VALUES (56801,'Hardlopen en jogging',888)
INSERT Categorieen (ID,Name,Parent) VALUES (56802,'Toebehoren',56801)
INSERT Categorieen (ID,Name,Parent) VALUES (57146,'1990 - 1999',128283)
INSERT Categorieen (ID,Name,Parent) VALUES (57147,'1960 - 1969',128283)
INSERT Categorieen (ID,Name,Parent) VALUES (57296,'Cd''s en software',38776)
INSERT Categorieen (ID,Name,Parent) VALUES (57349,'Stickers en logo''s',14761)
INSERT Categorieen (ID,Name,Parent) VALUES (57354,'Skiboxen',82099)
INSERT Categorieen (ID,Name,Parent) VALUES (57356,'Fietsdragers',82099)
INSERT Categorieen (ID,Name,Parent) VALUES (57756,'Setjes',127683)
INSERT Categorieen (ID,Name,Parent) VALUES (57814,'Setjes',127648)
INSERT Categorieen (ID,Name,Parent) VALUES (57825,'Setjes',127653)
INSERT Categorieen (ID,Name,Parent) VALUES (58532,'Midden-Oosten',40711)
INSERT Categorieen (ID,Name,Parent) VALUES (58533,'Reproducties',4733)
INSERT Categorieen (ID,Name,Parent) VALUES (58535,'Europenningen',18492)
INSERT Categorieen (ID,Name,Parent) VALUES (58600,'Northern Soul',43639)
INSERT Categorieen (ID,Name,Parent) VALUES (58601,'East Coast',62835)
INSERT Categorieen (ID,Name,Parent) VALUES (58602,'West Coast',62835)
INSERT Categorieen (ID,Name,Parent) VALUES (58609,'Garage',19483)
INSERT Categorieen (ID,Name,Parent) VALUES (58614,'Verzamelalbums',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (58616,'Volksmuziek',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (58620,'Indie en Britpop',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (58627,'Reggae en ska',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (58635,'Breakz en crossover',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (58640,'Garage',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (58641,'Hardcore',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (58642,'House',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (58648,'Pop jaren ‘80',64869)
INSERT Categorieen (ID,Name,Parent) VALUES (58670,'Pop',20801)
INSERT Categorieen (ID,Name,Parent) VALUES (58677,'Overige muziek en instrumenten',11233)
INSERT Categorieen (ID,Name,Parent) VALUES (58812,'Tijdschriften',7390)
INSERT Categorieen (ID,Name,Parent) VALUES (58859,'Aquarel',40688)
INSERT Categorieen (ID,Name,Parent) VALUES (58937,'Kunstnagels',47945)
INSERT Categorieen (ID,Name,Parent) VALUES (58965,'Kook- en klusprogramma''s',41584)
INSERT Categorieen (ID,Name,Parent) VALUES (58966,'Dance',23275)
INSERT Categorieen (ID,Name,Parent) VALUES (58974,'Partijen en groothandel',11232)
INSERT Categorieen (ID,Name,Parent) VALUES (58997,'VHS-boxen en verzamelvideo’s',1508)
INSERT Categorieen (ID,Name,Parent) VALUES (59045,'Tupperware en voorraadpotten',20626)
INSERT Categorieen (ID,Name,Parent) VALUES (59177,'Kleding en sieraden',157499)
INSERT Categorieen (ID,Name,Parent) VALUES (59222,'TV en video',7474)
INSERT Categorieen (ID,Name,Parent) VALUES (59251,'Trekking en survival',8503)
INSERT Categorieen (ID,Name,Parent) VALUES (59411,'Vitaminen en energie',13361)
INSERT Categorieen (ID,Name,Parent) VALUES (59423,'Schoenen',13361)
INSERT Categorieen (ID,Name,Parent) VALUES (59901,'Oorkondes, bekers en medailles',113754)
INSERT Categorieen (ID,Name,Parent) VALUES (60212,'Spongebob',8605)
INSERT Categorieen (ID,Name,Parent) VALUES (60225,'Lord of the Rings',868)
INSERT Categorieen (ID,Name,Parent) VALUES (60238,'Pokémon',868)
INSERT Categorieen (ID,Name,Parent) VALUES (60241,'Yu-Gi-Oh!',868)
INSERT Categorieen (ID,Name,Parent) VALUES (60440,'Gouache',40688)
INSERT Categorieen (ID,Name,Parent) VALUES (60662,'Voor 1914',8998)
INSERT Categorieen (ID,Name,Parent) VALUES (60663,'Eerste Wereldoorlog',8998)
INSERT Categorieen (ID,Name,Parent) VALUES (60664,'Na 1945',8998)
INSERT Categorieen (ID,Name,Parent) VALUES (60805,'Star Wars',868)
INSERT Categorieen (ID,Name,Parent) VALUES (60807,'Star Trek',868)
INSERT Categorieen (ID,Name,Parent) VALUES (60821,'Grote flessen',84885)
INSERT Categorieen (ID,Name,Parent) VALUES (60868,'Actie',41520)
INSERT Categorieen (ID,Name,Parent) VALUES (60870,'Romantiek',41520)
INSERT Categorieen (ID,Name,Parent) VALUES (60880,'Overige comedy en humor',35015)
INSERT Categorieen (ID,Name,Parent) VALUES (60882,'Historisch',41550)
INSERT Categorieen (ID,Name,Parent) VALUES (60892,'Misdaad, gangster en maffia',41584)
INSERT Categorieen (ID,Name,Parent) VALUES (60893,'Cult',41558)
INSERT Categorieen (ID,Name,Parent) VALUES (60896,'R&B en soul',23275)
INSERT Categorieen (ID,Name,Parent) VALUES (60902,'Kinderen en familie',41584)
INSERT Categorieen (ID,Name,Parent) VALUES (60903,'Soaps',41584)
INSERT Categorieen (ID,Name,Parent) VALUES (60913,'Keramiek',353)
INSERT Categorieen (ID,Name,Parent) VALUES (60914,'Historisch',16663)
INSERT Categorieen (ID,Name,Parent) VALUES (60915,'Romantiek',16663)
INSERT Categorieen (ID,Name,Parent) VALUES (60919,'Avontuur',35076)
INSERT Categorieen (ID,Name,Parent) VALUES (60920,'Komedie',35076)
INSERT Categorieen (ID,Name,Parent) VALUES (60921,'Educatief',35076)
INSERT Categorieen (ID,Name,Parent) VALUES (60922,'Fantasie en sprookjes',35076)
INSERT Categorieen (ID,Name,Parent) VALUES (60991,'Markt- en verkoopkramen',46159)
INSERT Categorieen (ID,Name,Parent) VALUES (60999,'Houders',14258)
INSERT Categorieen (ID,Name,Parent) VALUES (61009,'Kenwood',38776)
INSERT Categorieen (ID,Name,Parent) VALUES (61011,'Philips',38776)
INSERT Categorieen (ID,Name,Parent) VALUES (61013,'Aandrijving',63318)
INSERT Categorieen (ID,Name,Parent) VALUES (61107,'1901 - 1950',18828)
INSERT Categorieen (ID,Name,Parent) VALUES (61108,'1951 - 1980',18828)
INSERT Categorieen (ID,Name,Parent) VALUES (61154,'Transmissie',63318)
INSERT Categorieen (ID,Name,Parent) VALUES (61409,'Uitlaatsystemen',63318)
INSERT Categorieen (ID,Name,Parent) VALUES (61920,'Vering en demping',63318)
INSERT Categorieen (ID,Name,Parent) VALUES (61939,'Ruitenwissers en antennes',63318)
INSERT Categorieen (ID,Name,Parent) VALUES (61959,'Alarm en veiligheid',82099)
INSERT Categorieen (ID,Name,Parent) VALUES (62287,'Modelbouw',607)
INSERT Categorieen (ID,Name,Parent) VALUES (62441,'Verpakkingen en verzending',9815)
INSERT Categorieen (ID,Name,Parent) VALUES (62458,'Visitekaartjes',12576)
INSERT Categorieen (ID,Name,Parent) VALUES (62464,'Kantoormeubilair',9815)
INSERT Categorieen (ID,Name,Parent) VALUES (62531,'Koffertjes en aktetassen',9815)
INSERT Categorieen (ID,Name,Parent) VALUES (62534,'Technisch tekenen',9815)
INSERT Categorieen (ID,Name,Parent) VALUES (62795,'LG',15073)
INSERT Categorieen (ID,Name,Parent) VALUES (62796,'Mitsubishi',15073)
INSERT Categorieen (ID,Name,Parent) VALUES (62801,'Sony Ericsson',15073)
INSERT Categorieen (ID,Name,Parent) VALUES (62805,'Sony Ericsson',23979)
INSERT Categorieen (ID,Name,Parent) VALUES (62810,'LG',115680)
INSERT Categorieen (ID,Name,Parent) VALUES (62811,'Mitsubishi',115680)
INSERT Categorieen (ID,Name,Parent) VALUES (62835,'Rap en hiphop',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (62841,'Plunjezakken',8503)
INSERT Categorieen (ID,Name,Parent) VALUES (62848,'Coca-Cola',34)
INSERT Categorieen (ID,Name,Parent) VALUES (62852,'Flesjes',62848)
INSERT Categorieen (ID,Name,Parent) VALUES (62856,'Blikjes',62848)
INSERT Categorieen (ID,Name,Parent) VALUES (62857,'Glazen',62848)
INSERT Categorieen (ID,Name,Parent) VALUES (62862,'Reclameborden',62848)
INSERT Categorieen (ID,Name,Parent) VALUES (62896,'Nummerborden',417)
INSERT Categorieen (ID,Name,Parent) VALUES (62904,'Trainingspakken',68752)
INSERT Categorieen (ID,Name,Parent) VALUES (62992,'Herenkleding',10514)
INSERT Categorieen (ID,Name,Parent) VALUES (62997,'Kinderkleding',10514)
INSERT Categorieen (ID,Name,Parent) VALUES (63318,'Onderdelen',9884)
INSERT Categorieen (ID,Name,Parent) VALUES (63705,'Motors en motoronderdelen',63318)
INSERT Categorieen (ID,Name,Parent) VALUES (63830,'Sport en fitness',2288)
INSERT Categorieen (ID,Name,Parent) VALUES (63831,'Overige thrillers en midaad',41539)
INSERT Categorieen (ID,Name,Parent) VALUES (63842,'Videoclips',154051)
INSERT Categorieen (ID,Name,Parent) VALUES (64140,'Klokken en uurwerken',353)
INSERT Categorieen (ID,Name,Parent) VALUES (64192,'Politiek',267)
INSERT Categorieen (ID,Name,Parent) VALUES (64193,'Dieren en natuur',267)
INSERT Categorieen (ID,Name,Parent) VALUES (64319,'Porselein',353)
INSERT Categorieen (ID,Name,Parent) VALUES (64727,'Wetenschap',267)
INSERT Categorieen (ID,Name,Parent) VALUES (64755,'Amerikaanse stripboeken',900)
INSERT Categorieen (ID,Name,Parent) VALUES (64790,'Muziek',607)
INSERT Categorieen (ID,Name,Parent) VALUES (64802,'Transport en verkeer',607)
INSERT Categorieen (ID,Name,Parent) VALUES (64803,'Vliegtuigen',64802)
INSERT Categorieen (ID,Name,Parent) VALUES (64804,'Treinen',64802)
INSERT Categorieen (ID,Name,Parent) VALUES (64862,'Amerikaanse merken',18369)
INSERT Categorieen (ID,Name,Parent) VALUES (64863,'Rap en hiphop',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (64869,'Pop',21733)
INSERT Categorieen (ID,Name,Parent) VALUES (64870,'Pop jaren ’60 en ‘70',64869)
INSERT Categorieen (ID,Name,Parent) VALUES (64871,'Pop jaren ‘90',64869)
INSERT Categorieen (ID,Name,Parent) VALUES (64872,'Pop 2000 - heden',64869)
INSERT Categorieen (ID,Name,Parent) VALUES (64879,'Plaatwerk',14768)
INSERT Categorieen (ID,Name,Parent) VALUES (64880,'Spiegels',63318)
INSERT Categorieen (ID,Name,Parent) VALUES (64909,'Grilles',14768)
INSERT Categorieen (ID,Name,Parent) VALUES (65056,'Sloten',63318)
INSERT Categorieen (ID,Name,Parent) VALUES (65072,'Bumpers',14768)
INSERT Categorieen (ID,Name,Parent) VALUES (65101,'Deuren',14768)
INSERT Categorieen (ID,Name,Parent) VALUES (65174,'Britse Gemenebest',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (65272,'Wieldoppen',14770)
INSERT Categorieen (ID,Name,Parent) VALUES (65662,'Koelkasten en diepvriezers',30329)
INSERT Categorieen (ID,Name,Parent) VALUES (65741,'Broeken',9817)
INSERT Categorieen (ID,Name,Parent) VALUES (65766,'Rode Ridder',63)
INSERT Categorieen (ID,Name,Parent) VALUES (65767,'Urbanus',63)
INSERT Categorieen (ID,Name,Parent) VALUES (65806,'Soul',43639)
INSERT Categorieen (ID,Name,Parent) VALUES (65809,'R&B',43639)
INSERT Categorieen (ID,Name,Parent) VALUES (65973,'Kleding',1492)
INSERT Categorieen (ID,Name,Parent) VALUES (66048,'Toebehoren en onderdelen',10511)
INSERT Categorieen (ID,Name,Parent) VALUES (66051,'Overige skating',10511)
INSERT Categorieen (ID,Name,Parent) VALUES (66112,'Bergbeklimmen',888)
INSERT Categorieen (ID,Name,Parent) VALUES (66201,'TV''s',3287)
INSERT Categorieen (ID,Name,Parent) VALUES (66227,'Kinderhorloges',26088)
INSERT Categorieen (ID,Name,Parent) VALUES (66229,'Kindersieraden',281)
INSERT Categorieen (ID,Name,Parent) VALUES (66854,'Blikken',353)
INSERT Categorieen (ID,Name,Parent) VALUES (67036,'Acryl op doek',40688)
INSERT Categorieen (ID,Name,Parent) VALUES (67679,'Interbellum',8998)
INSERT Categorieen (ID,Name,Parent) VALUES (67725,'Ringen',281)
INSERT Categorieen (ID,Name,Parent) VALUES (67839,'Apple iPod MP3-spelers',73839)
INSERT Categorieen (ID,Name,Parent) VALUES (68037,'Samsung',111202)
INSERT Categorieen (ID,Name,Parent) VALUES (68038,'Siemens',111202)
INSERT Categorieen (ID,Name,Parent) VALUES (68053,'Koormuziek',19481)
INSERT Categorieen (ID,Name,Parent) VALUES (68057,'Progressive house',19479)
INSERT Categorieen (ID,Name,Parent) VALUES (68062,'Overige Metal',34317)
INSERT Categorieen (ID,Name,Parent) VALUES (68065,'Metal',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (68259,'Accessoires',27717)
INSERT Categorieen (ID,Name,Parent) VALUES (68399,'IXO',222)
INSERT Categorieen (ID,Name,Parent) VALUES (68484,'Relatiegeschenken en reclame',9815)
INSERT Categorieen (ID,Name,Parent) VALUES (68568,'Stoffen',3116)
INSERT Categorieen (ID,Name,Parent) VALUES (68583,'IJsland',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (68584,'Kroatië',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (68585,'Servië',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (68586,'Slowakije',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (68587,'Slovenië',7975)
INSERT Categorieen (ID,Name,Parent) VALUES (68588,'Tsjechië',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (68589,'Cyprus',7975)
INSERT Categorieen (ID,Name,Parent) VALUES (68593,'Kindermuziek',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (68752,'Kleding',13331)
INSERT Categorieen (ID,Name,Parent) VALUES (68787,'Handbal',888)
INSERT Categorieen (ID,Name,Parent) VALUES (68837,'Pretparken en themaparken',1305)
INSERT Categorieen (ID,Name,Parent) VALUES (68883,'Edelstenen',281)
INSERT Categorieen (ID,Name,Parent) VALUES (69197,'Ventilatoren en airco''s',20710)
INSERT Categorieen (ID,Name,Parent) VALUES (69733,'Overig Azië',9033)
INSERT Categorieen (ID,Name,Parent) VALUES (69789,'Duel Masters',868)
INSERT Categorieen (ID,Name,Parent) VALUES (70089,'Nieuw-Zeeland',128385)
INSERT Categorieen (ID,Name,Parent) VALUES (70098,'Koningshuizen',4752)
INSERT Categorieen (ID,Name,Parent) VALUES (70184,'Rompertjes',127683)
INSERT Categorieen (ID,Name,Parent) VALUES (70185,'Broekjes',127683)
INSERT Categorieen (ID,Name,Parent) VALUES (70186,'Jurkjes en rokjes',127648)
INSERT Categorieen (ID,Name,Parent) VALUES (70187,'Jasjes',127683)
INSERT Categorieen (ID,Name,Parent) VALUES (70190,'Sokjes',127683)
INSERT Categorieen (ID,Name,Parent) VALUES (70191,'Pakjes',127683)
INSERT Categorieen (ID,Name,Parent) VALUES (70195,'Shirtjes en blouses',127686)
INSERT Categorieen (ID,Name,Parent) VALUES (70196,'Rompertjes',127686)
INSERT Categorieen (ID,Name,Parent) VALUES (70197,'Broekjes',127686)
INSERT Categorieen (ID,Name,Parent) VALUES (70199,'Jasjes',127686)
INSERT Categorieen (ID,Name,Parent) VALUES (70202,'Sokjes',127686)
INSERT Categorieen (ID,Name,Parent) VALUES (70203,'Pakjes',127686)
INSERT Categorieen (ID,Name,Parent) VALUES (70205,'Truitjes en vestjes',127686)
INSERT Categorieen (ID,Name,Parent) VALUES (70209,'Sokjes',127687)
INSERT Categorieen (ID,Name,Parent) VALUES (70212,'Sokjes',127688)
INSERT Categorieen (ID,Name,Parent) VALUES (70215,'Sokjes',127689)
INSERT Categorieen (ID,Name,Parent) VALUES (70218,'Sokjes',127690)
INSERT Categorieen (ID,Name,Parent) VALUES (70221,'Sokjes',127691)
INSERT Categorieen (ID,Name,Parent) VALUES (70222,'Maat 92',3038)
INSERT Categorieen (ID,Name,Parent) VALUES (70224,'Blouses en overhemden',70222)
INSERT Categorieen (ID,Name,Parent) VALUES (70226,'Broeken',70222)
INSERT Categorieen (ID,Name,Parent) VALUES (70227,'Rokken en jurken',74069)
INSERT Categorieen (ID,Name,Parent) VALUES (70228,'Jassen en jasjes',70222)
INSERT Categorieen (ID,Name,Parent) VALUES (70230,'Jeans',70222)
INSERT Categorieen (ID,Name,Parent) VALUES (70232,'Overige maat 92',70222)
INSERT Categorieen (ID,Name,Parent) VALUES (70234,'Truien',70222)
INSERT Categorieen (ID,Name,Parent) VALUES (70238,'Shirts',98323)
INSERT Categorieen (ID,Name,Parent) VALUES (70244,'Jeans',98323)
INSERT Categorieen (ID,Name,Parent) VALUES (70264,'Massageproducten',47867)
INSERT Categorieen (ID,Name,Parent) VALUES (70806,'Teddyberen',386)
INSERT Categorieen (ID,Name,Parent) VALUES (70848,'Ballen',13331)
INSERT Categorieen (ID,Name,Parent) VALUES (70855,'Broeken',68752)
INSERT Categorieen (ID,Name,Parent) VALUES (70898,'Kleding',13340)
INSERT Categorieen (ID,Name,Parent) VALUES (70918,'Nordic walking',888)
INSERT Categorieen (ID,Name,Parent) VALUES (72344,'Dieren',607)
INSERT Categorieen (ID,Name,Parent) VALUES (72345,'Religie',607)
INSERT Categorieen (ID,Name,Parent) VALUES (72407,'Actie',41526)
INSERT Categorieen (ID,Name,Parent) VALUES (72408,'Klassiekers',41526)
INSERT Categorieen (ID,Name,Parent) VALUES (72409,'Actie en avontuur',41584)
INSERT Categorieen (ID,Name,Parent) VALUES (72410,'Actie',35076)
INSERT Categorieen (ID,Name,Parent) VALUES (72411,'Klassiekers',35076)
INSERT Categorieen (ID,Name,Parent) VALUES (72493,'Arcade',15122)
INSERT Categorieen (ID,Name,Parent) VALUES (72494,'Kinderen en familie',15122)
INSERT Categorieen (ID,Name,Parent) VALUES (72495,'Simulatie',15122)
INSERT Categorieen (ID,Name,Parent) VALUES (72500,'MSX',8086)
INSERT Categorieen (ID,Name,Parent) VALUES (72616,'Voor 1899',22421)
INSERT Categorieen (ID,Name,Parent) VALUES (73001,'Sturen, poken en pedalen',14761)
INSERT Categorieen (ID,Name,Parent) VALUES (73466,'Japan',37082)
INSERT Categorieen (ID,Name,Parent) VALUES (73570,'Harry Potter',868)
INSERT Categorieen (ID,Name,Parent) VALUES (73738,'Babykleding - meisjes',12081)
INSERT Categorieen (ID,Name,Parent) VALUES (73741,'Shirtjes en blouses',127648)
INSERT Categorieen (ID,Name,Parent) VALUES (73742,'Rompertjes',127648)
INSERT Categorieen (ID,Name,Parent) VALUES (73743,'Broekjes',127648)
INSERT Categorieen (ID,Name,Parent) VALUES (73744,'Jasjes',127648)
INSERT Categorieen (ID,Name,Parent) VALUES (73747,'Sokjes',127648)
INSERT Categorieen (ID,Name,Parent) VALUES (73748,'Pakjes',127648)
INSERT Categorieen (ID,Name,Parent) VALUES (73750,'Overige maat 50',127648)
INSERT Categorieen (ID,Name,Parent) VALUES (73753,'Shirtjes en blouses',127652)
INSERT Categorieen (ID,Name,Parent) VALUES (73754,'Rompertjes',127652)
INSERT Categorieen (ID,Name,Parent) VALUES (73755,'Broekjes',127652)
INSERT Categorieen (ID,Name,Parent) VALUES (73756,'Jasjes',127652)
INSERT Categorieen (ID,Name,Parent) VALUES (73759,'Sokjes',127652)
INSERT Categorieen (ID,Name,Parent) VALUES (73760,'Pakjes',127652)
INSERT Categorieen (ID,Name,Parent) VALUES (73762,'Truitjes en vestjes',127652)
INSERT Categorieen (ID,Name,Parent) VALUES (73764,'Overige maat 56',127652)
INSERT Categorieen (ID,Name,Parent) VALUES (73839,'MP3-spelers en portables',14969)
INSERT Categorieen (ID,Name,Parent) VALUES (73870,'Shirtjes en blouses',127653)
INSERT Categorieen (ID,Name,Parent) VALUES (73871,'Rompertjes',127653)
INSERT Categorieen (ID,Name,Parent) VALUES (73872,'Broekjes',127653)
INSERT Categorieen (ID,Name,Parent) VALUES (73873,'Jasjes',127653)
INSERT Categorieen (ID,Name,Parent) VALUES (73876,'Sokjes',127653)
INSERT Categorieen (ID,Name,Parent) VALUES (73877,'Pakjes',127653)
INSERT Categorieen (ID,Name,Parent) VALUES (73879,'Truitjes en vestjes',127653)
INSERT Categorieen (ID,Name,Parent) VALUES (73881,'Overige maat 62',127653)
INSERT Categorieen (ID,Name,Parent) VALUES (73919,'Shirtjes en blouses',127654)
INSERT Categorieen (ID,Name,Parent) VALUES (73920,'Rompertjes',127654)
INSERT Categorieen (ID,Name,Parent) VALUES (73921,'Broekjes',127654)
INSERT Categorieen (ID,Name,Parent) VALUES (73922,'Jasjes',127654)
INSERT Categorieen (ID,Name,Parent) VALUES (73925,'Sokjes',127654)
INSERT Categorieen (ID,Name,Parent) VALUES (73926,'Pakjes',127654)
INSERT Categorieen (ID,Name,Parent) VALUES (73928,'Truitjes en vestjes',127654)
INSERT Categorieen (ID,Name,Parent) VALUES (73930,'Overige maat 68',127654)
INSERT Categorieen (ID,Name,Parent) VALUES (74009,'Shirtjes en blouses',127667)
INSERT Categorieen (ID,Name,Parent) VALUES (74010,'Rompertjes',127667)
INSERT Categorieen (ID,Name,Parent) VALUES (74011,'Broekjes',127667)
INSERT Categorieen (ID,Name,Parent) VALUES (74012,'Jasjes',127667)
INSERT Categorieen (ID,Name,Parent) VALUES (74015,'Sokjes',127667)
INSERT Categorieen (ID,Name,Parent) VALUES (74016,'Pakjes',127667)
INSERT Categorieen (ID,Name,Parent) VALUES (74018,'Truitjes en vestjes',127667)
INSERT Categorieen (ID,Name,Parent) VALUES (74020,'Overige maat 74',127667)
INSERT Categorieen (ID,Name,Parent) VALUES (74036,'Shirtjes en blouses',127668)
INSERT Categorieen (ID,Name,Parent) VALUES (74037,'Rompertjes',127668)
INSERT Categorieen (ID,Name,Parent) VALUES (74038,'Broekjes',127668)
INSERT Categorieen (ID,Name,Parent) VALUES (74039,'Jasjes',127668)
INSERT Categorieen (ID,Name,Parent) VALUES (74042,'Sokjes',127668)
INSERT Categorieen (ID,Name,Parent) VALUES (74043,'Pakjes',127668)
INSERT Categorieen (ID,Name,Parent) VALUES (74045,'Truitjes en vestjes',127668)
INSERT Categorieen (ID,Name,Parent) VALUES (74047,'Overige maat 80',127668)
INSERT Categorieen (ID,Name,Parent) VALUES (74057,'Shirtjes en blouses',127680)
INSERT Categorieen (ID,Name,Parent) VALUES (74058,'Rompertjes',127680)
INSERT Categorieen (ID,Name,Parent) VALUES (74059,'Broekjes',127680)
INSERT Categorieen (ID,Name,Parent) VALUES (74060,'Jasjes',127680)
INSERT Categorieen (ID,Name,Parent) VALUES (74063,'Sokjes',127680)
INSERT Categorieen (ID,Name,Parent) VALUES (74064,'Pakjes',127680)
INSERT Categorieen (ID,Name,Parent) VALUES (74066,'Truitjes en vestjes',127680)
INSERT Categorieen (ID,Name,Parent) VALUES (74068,'Overige maat 86',127680)
INSERT Categorieen (ID,Name,Parent) VALUES (74069,'Maat 92',3051)
INSERT Categorieen (ID,Name,Parent) VALUES (74071,'Blouses',74069)
INSERT Categorieen (ID,Name,Parent) VALUES (74073,'Broeken',74069)
INSERT Categorieen (ID,Name,Parent) VALUES (74074,'Jassen en jasjes',74069)
INSERT Categorieen (ID,Name,Parent) VALUES (74076,'Jeans',74069)
INSERT Categorieen (ID,Name,Parent) VALUES (74078,'Overige maat 92',74069)
INSERT Categorieen (ID,Name,Parent) VALUES (74080,'Truien',74069)
INSERT Categorieen (ID,Name,Parent) VALUES (74085,'Shirt',98376)
INSERT Categorieen (ID,Name,Parent) VALUES (74090,'Jeans',98376)
INSERT Categorieen (ID,Name,Parent) VALUES (74096,'Overige maat 98/104',98376)
INSERT Categorieen (ID,Name,Parent) VALUES (74287,'Nachtkleding',98327)
INSERT Categorieen (ID,Name,Parent) VALUES (74288,'Nachtkleding',98378)
INSERT Categorieen (ID,Name,Parent) VALUES (74294,'Conrad',222)
INSERT Categorieen (ID,Name,Parent) VALUES (74427,'Beperkte oplagen',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (74462,'Stekkers en stroomadapters',8503)
INSERT Categorieen (ID,Name,Parent) VALUES (74463,'Strandaccessoires',8503)
INSERT Categorieen (ID,Name,Parent) VALUES (74470,'Vouwfietsen',9192)
INSERT Categorieen (ID,Name,Parent) VALUES (74474,'Beurzen en evenementen',1305)
INSERT Categorieen (ID,Name,Parent) VALUES (75534,'Familie',41550)
INSERT Categorieen (ID,Name,Parent) VALUES (75542,'Sony Ericsson',111202)
INSERT Categorieen (ID,Name,Parent) VALUES (75549,'Lounge en downtempo',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (75550,'Mainstream',43639)
INSERT Categorieen (ID,Name,Parent) VALUES (75552,'Club en Lounge',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (75555,'Consoles',100800)
INSERT Categorieen (ID,Name,Parent) VALUES (75556,'Consoles',100812)
INSERT Categorieen (ID,Name,Parent) VALUES (75571,'Mallen en sjablonen',111848)
INSERT Categorieen (ID,Name,Parent) VALUES (75656,'Bloembollen',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (75718,'Fanartikelen',1)
INSERT Categorieen (ID,Name,Parent) VALUES (76013,'Interieur en accessoires',18323)
INSERT Categorieen (ID,Name,Parent) VALUES (76022,'Carrosserie',18323)
INSERT Categorieen (ID,Name,Parent) VALUES (76045,'Velgen en banden',18323)
INSERT Categorieen (ID,Name,Parent) VALUES (76052,'Onderdelen en onderhoud',18323)
INSERT Categorieen (ID,Name,Parent) VALUES (76119,'Elektronica en ontstekingen',14780)
INSERT Categorieen (ID,Name,Parent) VALUES (76127,'Motorsport, enduro en cross',9800)
INSERT Categorieen (ID,Name,Parent) VALUES (76190,'Truitjes en vestjes',127683)
INSERT Categorieen (ID,Name,Parent) VALUES (76597,'Truitjes en vestjes',127648)
INSERT Categorieen (ID,Name,Parent) VALUES (76626,'Jurkjes en rokjes',127652)
INSERT Categorieen (ID,Name,Parent) VALUES (76716,'Jurkjes en rokjes',127653)
INSERT Categorieen (ID,Name,Parent) VALUES (76743,'Jurkjes en rokjes',127654)
INSERT Categorieen (ID,Name,Parent) VALUES (76788,'Jurkjes en rokjes',127667)
INSERT Categorieen (ID,Name,Parent) VALUES (76869,'Jurkjes en rokjes',127668)
INSERT Categorieen (ID,Name,Parent) VALUES (76914,'Jurkjes en rokjes',127680)
INSERT Categorieen (ID,Name,Parent) VALUES (77049,'Maat 16 en kleiner',18634)
INSERT Categorieen (ID,Name,Parent) VALUES (77058,'Maat 17',18634)
INSERT Categorieen (ID,Name,Parent) VALUES (77098,'Overige babyschoenen',18634)
INSERT Categorieen (ID,Name,Parent) VALUES (77109,'Babyfoons',2984)
INSERT Categorieen (ID,Name,Parent) VALUES (77113,'Luiers',15456)
INSERT Categorieen (ID,Name,Parent) VALUES (77234,'Strijkijzers en -planken',20710)
INSERT Categorieen (ID,Name,Parent) VALUES (77277,'Broodroosters en tostimakers',30329)
INSERT Categorieen (ID,Name,Parent) VALUES (77288,'Waterkokers',30329)
INSERT Categorieen (ID,Name,Parent) VALUES (77305,'Personenweegschalen',20710)
INSERT Categorieen (ID,Name,Parent) VALUES (77355,'Software',14675)
INSERT Categorieen (ID,Name,Parent) VALUES (77361,'Software',38951)
INSERT Categorieen (ID,Name,Parent) VALUES (77379,'Broeken',98376)
INSERT Categorieen (ID,Name,Parent) VALUES (77387,'Jassen en jasjes',98376)
INSERT Categorieen (ID,Name,Parent) VALUES (77412,'Jeans',98378)
INSERT Categorieen (ID,Name,Parent) VALUES (77414,'Jeans',98380)
INSERT Categorieen (ID,Name,Parent) VALUES (77416,'Jeans',98382)
INSERT Categorieen (ID,Name,Parent) VALUES (77418,'Jeans',98384)
INSERT Categorieen (ID,Name,Parent) VALUES (77419,'Jeans',98386)
INSERT Categorieen (ID,Name,Parent) VALUES (77421,'Jeans',98388)
INSERT Categorieen (ID,Name,Parent) VALUES (77422,'Jeans',98390)
INSERT Categorieen (ID,Name,Parent) VALUES (77424,'Rokken en jurken',98376)
INSERT Categorieen (ID,Name,Parent) VALUES (77432,'Truien',98376)
INSERT Categorieen (ID,Name,Parent) VALUES (77449,'Broeken',98323)
INSERT Categorieen (ID,Name,Parent) VALUES (77458,'Blouses',98376)
INSERT Categorieen (ID,Name,Parent) VALUES (77462,'Jassen en jasjes',98323)
INSERT Categorieen (ID,Name,Parent) VALUES (77466,'Truien',98323)
INSERT Categorieen (ID,Name,Parent) VALUES (77473,'Blouses en overhemden',98323)
INSERT Categorieen (ID,Name,Parent) VALUES (77476,'Jeans',98325)
INSERT Categorieen (ID,Name,Parent) VALUES (77478,'Jeans',98327)
INSERT Categorieen (ID,Name,Parent) VALUES (77480,'Jeans',98329)
INSERT Categorieen (ID,Name,Parent) VALUES (77482,'Jeans',98331)
INSERT Categorieen (ID,Name,Parent) VALUES (77483,'Jeans',98333)
INSERT Categorieen (ID,Name,Parent) VALUES (77485,'Jeans',98372)
INSERT Categorieen (ID,Name,Parent) VALUES (77486,'Jeans',98374)
INSERT Categorieen (ID,Name,Parent) VALUES (77526,'Bosnië-Herzegovina',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (77527,'Macedonië',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (77528,'Oekraïne',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (77533,'Masters of the Universe',9820)
INSERT Categorieen (ID,Name,Parent) VALUES (77544,'Losse kaarten',60241)
INSERT Categorieen (ID,Name,Parent) VALUES (77583,'Banden, spaken en wielen',27922)
INSERT Categorieen (ID,Name,Parent) VALUES (77591,'Fietsverlichting',27922)
INSERT Categorieen (ID,Name,Parent) VALUES (77595,'Bescherming',10511)
INSERT Categorieen (ID,Name,Parent) VALUES (77606,'Zadels',27922)
INSERT Categorieen (ID,Name,Parent) VALUES (77694,'Benodigdheden paarden',8440)
INSERT Categorieen (ID,Name,Parent) VALUES (77745,'Accessoires',12941)
INSERT Categorieen (ID,Name,Parent) VALUES (77746,'LNB''s',12941)
INSERT Categorieen (ID,Name,Parent) VALUES (77756,'Schotels',12941)
INSERT Categorieen (ID,Name,Parent) VALUES (77836,'Blueberry',63)
INSERT Categorieen (ID,Name,Parent) VALUES (77837,'Bollie en Billie',63)
INSERT Categorieen (ID,Name,Parent) VALUES (77845,'Smurfen',63)
INSERT Categorieen (ID,Name,Parent) VALUES (77850,'Zeldzame stripboeken',63)
INSERT Categorieen (ID,Name,Parent) VALUES (78356,'Litho''s en steendrukken',7463)
INSERT Categorieen (ID,Name,Parent) VALUES (78570,'Design',267)
INSERT Categorieen (ID,Name,Parent) VALUES (78600,'Motorsport',105967)
INSERT Categorieen (ID,Name,Parent) VALUES (78604,'Kamperen',64802)
INSERT Categorieen (ID,Name,Parent) VALUES (78618,'Filatelie',607)
INSERT Categorieen (ID,Name,Parent) VALUES (78628,'Fitness',105967)
INSERT Categorieen (ID,Name,Parent) VALUES (78633,'Financiën',607)
INSERT Categorieen (ID,Name,Parent) VALUES (78769,'Processoren',38851)
INSERT Categorieen (ID,Name,Parent) VALUES (78921,'Gamepads',3676)
INSERT Categorieen (ID,Name,Parent) VALUES (78932,'Joysticks',3676)
INSERT Categorieen (ID,Name,Parent) VALUES (79439,'Headsets',3676)
INSERT Categorieen (ID,Name,Parent) VALUES (79444,'Speakers',3676)
INSERT Categorieen (ID,Name,Parent) VALUES (79455,'Webcams',3676)
INSERT Categorieen (ID,Name,Parent) VALUES (79463,'Bluetooth',32202)
INSERT Categorieen (ID,Name,Parent) VALUES (80024,'Reality TV',41584)
INSERT Categorieen (ID,Name,Parent) VALUES (80025,'Cult',2288)
INSERT Categorieen (ID,Name,Parent) VALUES (80026,'Cult',1508)
INSERT Categorieen (ID,Name,Parent) VALUES (80565,'Portemonees en beurzen',12109)
INSERT Categorieen (ID,Name,Parent) VALUES (80578,'Riemen en bretels',12109)
INSERT Categorieen (ID,Name,Parent) VALUES (80587,'Hoeden en mutsen',12109)
INSERT Categorieen (ID,Name,Parent) VALUES (80596,'Aktetassen',37008)
INSERT Categorieen (ID,Name,Parent) VALUES (80597,'Handtassen',37008)
INSERT Categorieen (ID,Name,Parent) VALUES (80599,'Rugtassen',37008)
INSERT Categorieen (ID,Name,Parent) VALUES (80701,'Maat 46-47',32309)
INSERT Categorieen (ID,Name,Parent) VALUES (80706,'Maat 50-51',32309)
INSERT Categorieen (ID,Name,Parent) VALUES (80711,'Maat 58-59',32309)
INSERT Categorieen (ID,Name,Parent) VALUES (80716,'Maat 54-55',32309)
INSERT Categorieen (ID,Name,Parent) VALUES (80807,'Stropdassen',12109)
INSERT Categorieen (ID,Name,Parent) VALUES (80891,'Kinderkleding- accessoires',11450)
INSERT Categorieen (ID,Name,Parent) VALUES (80922,'Meisjesschoenen',128240)
INSERT Categorieen (ID,Name,Parent) VALUES (80924,'Maat 18-27',80922)
INSERT Categorieen (ID,Name,Parent) VALUES (80928,'Maat 28-31',80922)
INSERT Categorieen (ID,Name,Parent) VALUES (80931,'Maat 32-41',80922)
INSERT Categorieen (ID,Name,Parent) VALUES (80947,'Jongensschoenen',128240)
INSERT Categorieen (ID,Name,Parent) VALUES (80948,'Maat 18-27',80947)
INSERT Categorieen (ID,Name,Parent) VALUES (80952,'Maat 28-31',80947)
INSERT Categorieen (ID,Name,Parent) VALUES (81111,'Corgi',222)
INSERT Categorieen (ID,Name,Parent) VALUES (81118,'Maisto',222)
INSERT Categorieen (ID,Name,Parent) VALUES (81157,'Overige modelbouw',1188)
INSERT Categorieen (ID,Name,Parent) VALUES (81338,'Kamermuziek en ensembles',19481)
INSERT Categorieen (ID,Name,Parent) VALUES (81341,'Opera en vocaal',19481)
INSERT Categorieen (ID,Name,Parent) VALUES (81354,'Musicals',26718)
INSERT Categorieen (ID,Name,Parent) VALUES (81377,'Opbergsystemen cd''s',27577)
INSERT Categorieen (ID,Name,Parent) VALUES (81415,'Slowakije',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (81416,'Tsjechië',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (81424,'Looney Tunes',8605)
INSERT Categorieen (ID,Name,Parent) VALUES (81443,'Hengels',1492)
INSERT Categorieen (ID,Name,Parent) VALUES (81478,'Sokken en scheenbeschermers',68752)
INSERT Categorieen (ID,Name,Parent) VALUES (81494,'Overige kleding',68752)
INSERT Categorieen (ID,Name,Parent) VALUES (81587,'Tees',13334)
INSERT Categorieen (ID,Name,Parent) VALUES (81590,'Golftassen',13334)
INSERT Categorieen (ID,Name,Parent) VALUES (81595,'Vervoer',13334)
INSERT Categorieen (ID,Name,Parent) VALUES (81616,'Honkbal',888)
INSERT Categorieen (ID,Name,Parent) VALUES (81623,'Toebehoren',13340)
INSERT Categorieen (ID,Name,Parent) VALUES (81625,'Polsbandjes',888)
INSERT Categorieen (ID,Name,Parent) VALUES (81627,'Volleybal',888)
INSERT Categorieen (ID,Name,Parent) VALUES (81634,'Sloepen en reddingsboten',1293)
INSERT Categorieen (ID,Name,Parent) VALUES (81636,'Rubberboten',1293)
INSERT Categorieen (ID,Name,Parent) VALUES (81645,'Ankers en kettingen',36629)
INSERT Categorieen (ID,Name,Parent) VALUES (81646,'Touwen',36629)
INSERT Categorieen (ID,Name,Parent) VALUES (81647,'Reddingsvesten',36629)
INSERT Categorieen (ID,Name,Parent) VALUES (81660,'Fietsenrekken en -dragers',27922)
INSERT Categorieen (ID,Name,Parent) VALUES (81663,'Kinderfietsen',9192)
INSERT Categorieen (ID,Name,Parent) VALUES (81674,'Pedalen en cranks',27922)
INSERT Categorieen (ID,Name,Parent) VALUES (81741,'Overig geluid',14969)
INSERT Categorieen (ID,Name,Parent) VALUES (81848,'Nederlandse Antillen',28683)
INSERT Categorieen (ID,Name,Parent) VALUES (81849,'Aruba',28683)
INSERT Categorieen (ID,Name,Parent) VALUES (82099,'Accessoires en toebehoren',9884)
INSERT Categorieen (ID,Name,Parent) VALUES (82280,'Vrachtwagens',9013)
INSERT Categorieen (ID,Name,Parent) VALUES (82283,'Tiener',41550)
INSERT Categorieen (ID,Name,Parent) VALUES (82286,'Postcards',1424)
INSERT Categorieen (ID,Name,Parent) VALUES (82446,'Quadonderdelen',9800)
INSERT Categorieen (ID,Name,Parent) VALUES (82458,'Beschermers',14784)
INSERT Categorieen (ID,Name,Parent) VALUES (82861,'Shampoo',47879)
INSERT Categorieen (ID,Name,Parent) VALUES (82883,'Pruiken en haarstukjes',47879)
INSERT Categorieen (ID,Name,Parent) VALUES (82897,'Kindercosmetica',12155)
INSERT Categorieen (ID,Name,Parent) VALUES (82970,'Albums',35322)
INSERT Categorieen (ID,Name,Parent) VALUES (82983,'Catalogi',35322)
INSERT Categorieen (ID,Name,Parent) VALUES (82988,'Filatelistische literatuur',35322)
INSERT Categorieen (ID,Name,Parent) VALUES (83737,'Oorlog en militair',41584)
INSERT Categorieen (ID,Name,Parent) VALUES (83761,'Country',23275)
INSERT Categorieen (ID,Name,Parent) VALUES (83894,'Kettingen',111837)
INSERT Categorieen (ID,Name,Parent) VALUES (83986,'Scharen, mesjes en pincetten',111848)
INSERT Categorieen (ID,Name,Parent) VALUES (84064,'Tuinverlichting',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (84091,'Tuinbanken',25863)
INSERT Categorieen (ID,Name,Parent) VALUES (84095,'Tuintafels',25863)
INSERT Categorieen (ID,Name,Parent) VALUES (84103,'Tuinstoelen',25863)
INSERT Categorieen (ID,Name,Parent) VALUES (84136,'Tuinhuisjes, serres en kassen',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (84263,'Bikini''s',15770)
INSERT Categorieen (ID,Name,Parent) VALUES (84269,'Badpakken',15770)
INSERT Categorieen (ID,Name,Parent) VALUES (84368,'Maat 38 (M)',19736)
INSERT Categorieen (ID,Name,Parent) VALUES (84396,'Maat 32-34 (XXS/XS)',31058)
INSERT Categorieen (ID,Name,Parent) VALUES (84399,'Maat 32-34 (XXS/XS)',53159)
INSERT Categorieen (ID,Name,Parent) VALUES (84402,'Maat 36 (S)',31058)
INSERT Categorieen (ID,Name,Parent) VALUES (84405,'Maat 36-38 (S/M)',53159)
INSERT Categorieen (ID,Name,Parent) VALUES (84408,'Maat 40-42 (L)',31058)
INSERT Categorieen (ID,Name,Parent) VALUES (84411,'Maat 40-42 (L)',53159)
INSERT Categorieen (ID,Name,Parent) VALUES (84414,'Maat 44-46 (XL)',31058)
INSERT Categorieen (ID,Name,Parent) VALUES (84417,'Maat 44-46 (XL)',53159)
INSERT Categorieen (ID,Name,Parent) VALUES (84539,'Ondergoed',9817)
INSERT Categorieen (ID,Name,Parent) VALUES (84541,'Boxershorts',84539)
INSERT Categorieen (ID,Name,Parent) VALUES (84543,'Hemden',84539)
INSERT Categorieen (ID,Name,Parent) VALUES (84545,'Nachtkleding',98323)
INSERT Categorieen (ID,Name,Parent) VALUES (84546,'Nachtkleding',98325)
INSERT Categorieen (ID,Name,Parent) VALUES (84547,'Nachtkleding',98329)
INSERT Categorieen (ID,Name,Parent) VALUES (84548,'Nachtkleding',98333)
INSERT Categorieen (ID,Name,Parent) VALUES (84549,'Nachtkleding',98372)
INSERT Categorieen (ID,Name,Parent) VALUES (84550,'Nachtkleding',98374)
INSERT Categorieen (ID,Name,Parent) VALUES (84559,'Sokken',9817)
INSERT Categorieen (ID,Name,Parent) VALUES (84883,'Miniaturen',84885)
INSERT Categorieen (ID,Name,Parent) VALUES (84885,'Parfum',1)
INSERT Categorieen (ID,Name,Parent) VALUES (84912,'Radiografisch bestuurd',19071)
INSERT Categorieen (ID,Name,Parent) VALUES (84918,'Racebanen',19071)
INSERT Categorieen (ID,Name,Parent) VALUES (84935,'Skelters',22138)
INSERT Categorieen (ID,Name,Parent) VALUES (84939,'Duplo, primo, baby',13315)
INSERT Categorieen (ID,Name,Parent) VALUES (84977,'Trein',19854)
INSERT Categorieen (ID,Name,Parent) VALUES (84987,'Tenten, kastelen en hutten',25960)
INSERT Categorieen (ID,Name,Parent) VALUES (85045,'Arm- en beenkleding',22171)
INSERT Categorieen (ID,Name,Parent) VALUES (85046,'Handschoenen',22171)
INSERT Categorieen (ID,Name,Parent) VALUES (85059,'Brillen',22171)
INSERT Categorieen (ID,Name,Parent) VALUES (85068,'Sokken',22171)
INSERT Categorieen (ID,Name,Parent) VALUES (85076,'Schoenen',22171)
INSERT Categorieen (ID,Name,Parent) VALUES (85078,'Windjacks',22171)
INSERT Categorieen (ID,Name,Parent) VALUES (85126,'Fietscomputers',27922)
INSERT Categorieen (ID,Name,Parent) VALUES (85131,'Fietssloten',27922)
INSERT Categorieen (ID,Name,Parent) VALUES (85275,'Dekens en bekleding',10514)
INSERT Categorieen (ID,Name,Parent) VALUES (85346,'Turnen en gymnastiek',888)
INSERT Categorieen (ID,Name,Parent) VALUES (85365,'Surfplanken',1293)
INSERT Categorieen (ID,Name,Parent) VALUES (85417,'Kaarten',12941)
INSERT Categorieen (ID,Name,Parent) VALUES (85525,'Zakhorloges',26088)
INSERT Categorieen (ID,Name,Parent) VALUES (85553,'Onderdelen en accessoires',26088)
INSERT Categorieen (ID,Name,Parent) VALUES (85583,'Armbanden',9319)
INSERT Categorieen (ID,Name,Parent) VALUES (85590,'Colliers',9319)
INSERT Categorieen (ID,Name,Parent) VALUES (85593,'Oorsieraden',9319)
INSERT Categorieen (ID,Name,Parent) VALUES (85627,'Navelpiercings',26109)
INSERT Categorieen (ID,Name,Parent) VALUES (85652,'Tepelpiercings',26109)
INSERT Categorieen (ID,Name,Parent) VALUES (85672,'Wenkbrauwpiercings',26109)
INSERT Categorieen (ID,Name,Parent) VALUES (85691,'Neuspiercings',26109)
INSERT Categorieen (ID,Name,Parent) VALUES (85702,'Tongpiercings',26109)
INSERT Categorieen (ID,Name,Parent) VALUES (85732,'Metaal',25850)
INSERT Categorieen (ID,Name,Parent) VALUES (85811,'Overige brochures',14233)
INSERT Categorieen (ID,Name,Parent) VALUES (86043,'Overige oorsieraden',10985)
INSERT Categorieen (ID,Name,Parent) VALUES (86380,'Kaders en veringen',14780)
INSERT Categorieen (ID,Name,Parent) VALUES (86529,'Apple iPod accessoires',73839)
INSERT Categorieen (ID,Name,Parent) VALUES (86695,'Midden-Oosten',9033)
INSERT Categorieen (ID,Name,Parent) VALUES (86804,'Hifi- en stereosets',14969)
INSERT Categorieen (ID,Name,Parent) VALUES (87044,'Duitse Rijk',7825)
INSERT Categorieen (ID,Name,Parent) VALUES (87074,'Bekende tv-figuren',41523)
INSERT Categorieen (ID,Name,Parent) VALUES (87316,'Britains',222)
INSERT Categorieen (ID,Name,Parent) VALUES (87346,'Disco',19479)
INSERT Categorieen (ID,Name,Parent) VALUES (87443,'Petten, hoeden en helmen',10514)
INSERT Categorieen (ID,Name,Parent) VALUES (87485,'Basgitaren',21762)
INSERT Categorieen (ID,Name,Parent) VALUES (87604,'Oorlog',267)
INSERT Categorieen (ID,Name,Parent) VALUES (87645,'Kabels en verbindingen',32202)
INSERT Categorieen (ID,Name,Parent) VALUES (88579,'Extensies',47879)
INSERT Categorieen (ID,Name,Parent) VALUES (88766,'DDR',7825)
INSERT Categorieen (ID,Name,Parent) VALUES (88839,'Bustickets',1305)
INSERT Categorieen (ID,Name,Parent) VALUES (88844,'Voor 1960',1374)
INSERT Categorieen (ID,Name,Parent) VALUES (88845,'1960 - 1969',1374)
INSERT Categorieen (ID,Name,Parent) VALUES (88846,'1970 - 1979',1374)
INSERT Categorieen (ID,Name,Parent) VALUES (88847,'1980 - 1989',1374)
INSERT Categorieen (ID,Name,Parent) VALUES (88937,'Jeu de boules en petanque',888)
INSERT Categorieen (ID,Name,Parent) VALUES (89343,'Auto''s',267)
INSERT Categorieen (ID,Name,Parent) VALUES (90724,'Klassiek',41558)
INSERT Categorieen (ID,Name,Parent) VALUES (90726,'Tiener',35015)
INSERT Categorieen (ID,Name,Parent) VALUES (91057,'Zwitserland',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (91060,'Dameshorloges',26088)
INSERT Categorieen (ID,Name,Parent) VALUES (91061,'Quartz',91060)
INSERT Categorieen (ID,Name,Parent) VALUES (91062,'Mechanisch',91060)
INSERT Categorieen (ID,Name,Parent) VALUES (91064,'Herenhorloges',26088)
INSERT Categorieen (ID,Name,Parent) VALUES (91065,'Quartz',91064)
INSERT Categorieen (ID,Name,Parent) VALUES (91066,'Mechanisch',91064)
INSERT Categorieen (ID,Name,Parent) VALUES (91068,'Sporthorloges',26088)
INSERT Categorieen (ID,Name,Parent) VALUES (91069,'Quartz',91068)
INSERT Categorieen (ID,Name,Parent) VALUES (91070,'Mechanisch',91068)
INSERT Categorieen (ID,Name,Parent) VALUES (91071,'Chronografen',91068)
INSERT Categorieen (ID,Name,Parent) VALUES (91177,'Literair',607)
INSERT Categorieen (ID,Name,Parent) VALUES (91178,'Gezondheid en medisch',607)
INSERT Categorieen (ID,Name,Parent) VALUES (91395,'Misdaad',41543)
INSERT Categorieen (ID,Name,Parent) VALUES (91396,'Blues',23275)
INSERT Categorieen (ID,Name,Parent) VALUES (91397,'Reggae en ska',23275)
INSERT Categorieen (ID,Name,Parent) VALUES (91474,'Avant-garde en experimenteel',104612)
INSERT Categorieen (ID,Name,Parent) VALUES (91475,'Ballet en dans',19481)
INSERT Categorieen (ID,Name,Parent) VALUES (91486,'Avant-garde en experimenteel',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (91509,'Accessoires',100800)
INSERT Categorieen (ID,Name,Parent) VALUES (91510,'Games',100800)
INSERT Categorieen (ID,Name,Parent) VALUES (91511,'Educatief',11046)
INSERT Categorieen (ID,Name,Parent) VALUES (91577,'Nepal',32136)
INSERT Categorieen (ID,Name,Parent) VALUES (91578,'Filipijnen',32136)
INSERT Categorieen (ID,Name,Parent) VALUES (91579,'Taiwan',32136)
INSERT Categorieen (ID,Name,Parent) VALUES (91591,'Spark',222)
INSERT Categorieen (ID,Name,Parent) VALUES (91596,'Star Wars',16486)
INSERT Categorieen (ID,Name,Parent) VALUES (92699,'Overige armbanden',10975)
INSERT Categorieen (ID,Name,Parent) VALUES (92758,'Overige hangers',10994)
INSERT Categorieen (ID,Name,Parent) VALUES (92771,'Colliers',281)
INSERT Categorieen (ID,Name,Parent) VALUES (92791,'Overige colliers',92771)
INSERT Categorieen (ID,Name,Parent) VALUES (92920,'Overige ringen',67725)
INSERT Categorieen (ID,Name,Parent) VALUES (92956,'Kranten',7390)
INSERT Categorieen (ID,Name,Parent) VALUES (93053,'Avondtasjes',37008)
INSERT Categorieen (ID,Name,Parent) VALUES (93055,'Schoudertassen',37008)
INSERT Categorieen (ID,Name,Parent) VALUES (93056,'Weekendtassen',37008)
INSERT Categorieen (ID,Name,Parent) VALUES (93130,'Bierpullen',8733)
INSERT Categorieen (ID,Name,Parent) VALUES (93599,'Familie',35015)
INSERT Categorieen (ID,Name,Parent) VALUES (96392,'Kuren en maskers',26528)
INSERT Categorieen (ID,Name,Parent) VALUES (96408,'Nachtverzorging',26528)
INSERT Categorieen (ID,Name,Parent) VALUES (96424,'Dagverzorging',26528)
INSERT Categorieen (ID,Name,Parent) VALUES (96443,'WNF',36702)
INSERT Categorieen (ID,Name,Parent) VALUES (96573,'Hardcore, gabber en rave',19479)
INSERT Categorieen (ID,Name,Parent) VALUES (96635,'Zang- en studiomicrofoons',21770)
INSERT Categorieen (ID,Name,Parent) VALUES (96812,'Kuifje',8605)
INSERT Categorieen (ID,Name,Parent) VALUES (96972,'Zwarte humor',35015)
INSERT Categorieen (ID,Name,Parent) VALUES (97100,'Kiekeboe',63)
INSERT Categorieen (ID,Name,Parent) VALUES (97120,'Partijen en groothandel',11450)
INSERT Categorieen (ID,Name,Parent) VALUES (98304,'Merkkleding',9816)
INSERT Categorieen (ID,Name,Parent) VALUES (98305,'Maat 32-34 (XXS/XS)',98304)
INSERT Categorieen (ID,Name,Parent) VALUES (98306,'Maat 36 (S)',98304)
INSERT Categorieen (ID,Name,Parent) VALUES (98307,'Maat 40-42 (L)',98304)
INSERT Categorieen (ID,Name,Parent) VALUES (98308,'Maat 44-46 (XL)',98304)
INSERT Categorieen (ID,Name,Parent) VALUES (98309,'Overige merkkleding',98304)
INSERT Categorieen (ID,Name,Parent) VALUES (98323,'Maat 98/104',3038)
INSERT Categorieen (ID,Name,Parent) VALUES (98325,'Maat 110/116',3038)
INSERT Categorieen (ID,Name,Parent) VALUES (98327,'Maat 122/128',3038)
INSERT Categorieen (ID,Name,Parent) VALUES (98329,'Maat 134/140',3038)
INSERT Categorieen (ID,Name,Parent) VALUES (98331,'Maat 146',3038)
INSERT Categorieen (ID,Name,Parent) VALUES (98332,'Setjes',98331)
INSERT Categorieen (ID,Name,Parent) VALUES (98333,'Maat 152/158',3038)
INSERT Categorieen (ID,Name,Parent) VALUES (98372,'Maat 164',3038)
INSERT Categorieen (ID,Name,Parent) VALUES (98374,'Maat 170/176',3038)
INSERT Categorieen (ID,Name,Parent) VALUES (98376,'Maat 98/104',3051)
INSERT Categorieen (ID,Name,Parent) VALUES (98378,'Maat 110/116',3051)
INSERT Categorieen (ID,Name,Parent) VALUES (98380,'Maat 122/128',3051)
INSERT Categorieen (ID,Name,Parent) VALUES (98382,'Maat 134/140',3051)
INSERT Categorieen (ID,Name,Parent) VALUES (98384,'Maat 146',3051)
INSERT Categorieen (ID,Name,Parent) VALUES (98385,'Setjes',98384)
INSERT Categorieen (ID,Name,Parent) VALUES (98386,'Maat 152/158',3051)
INSERT Categorieen (ID,Name,Parent) VALUES (98388,'Maat 164',3051)
INSERT Categorieen (ID,Name,Parent) VALUES (98390,'Maat 170/176',3051)
INSERT Categorieen (ID,Name,Parent) VALUES (98642,'Nylon',127909)
INSERT Categorieen (ID,Name,Parent) VALUES (98796,'India',9033)
INSERT Categorieen (ID,Name,Parent) VALUES (98819,'Kleuter- en peuterfilms',41526)
INSERT Categorieen (ID,Name,Parent) VALUES (98823,'Metal',23275)
INSERT Categorieen (ID,Name,Parent) VALUES (98886,'Old skool',19479)
INSERT Categorieen (ID,Name,Parent) VALUES (98890,'Folk Rock',19483)
INSERT Categorieen (ID,Name,Parent) VALUES (98891,'Rockabilly',19483)
INSERT Categorieen (ID,Name,Parent) VALUES (98977,'Appartementen',160939)
INSERT Categorieen (ID,Name,Parent) VALUES (98991,'Verzamelingen en partijen',267)
INSERT Categorieen (ID,Name,Parent) VALUES (99490,'Verzorgingstassen',15456)
INSERT Categorieen (ID,Name,Parent) VALUES (99614,'Broodmachines',30329)
INSERT Categorieen (ID,Name,Parent) VALUES (99640,'Fondue- en gourmetsets',30329)
INSERT Categorieen (ID,Name,Parent) VALUES (99736,'Nachtkleding',98382)
INSERT Categorieen (ID,Name,Parent) VALUES (99737,'Nachtkleding',98384)
INSERT Categorieen (ID,Name,Parent) VALUES (99738,'Nachtkleding',98386)
INSERT Categorieen (ID,Name,Parent) VALUES (99739,'Nachtkleding',98388)
INSERT Categorieen (ID,Name,Parent) VALUES (99740,'Nachtkleding',98390)
INSERT Categorieen (ID,Name,Parent) VALUES (99748,'Communiekleding',3038)
INSERT Categorieen (ID,Name,Parent) VALUES (99897,'Revell',222)
INSERT Categorieen (ID,Name,Parent) VALUES (100017,'Boten',1188)
INSERT Categorieen (ID,Name,Parent) VALUES (100079,'Fischertechnik',18993)
INSERT Categorieen (ID,Name,Parent) VALUES (100083,'Magnetisch speelgoed',18993)
INSERT Categorieen (ID,Name,Parent) VALUES (100123,'Fisher Price',220)
INSERT Categorieen (ID,Name,Parent) VALUES (100134,'Technic',13315)
INSERT Categorieen (ID,Name,Parent) VALUES (100147,'Jacks',68752)
INSERT Categorieen (ID,Name,Parent) VALUES (100187,'Ballen',13334)
INSERT Categorieen (ID,Name,Parent) VALUES (100287,'Bowling',888)
INSERT Categorieen (ID,Name,Parent) VALUES (100495,'Vampiers',41558)
INSERT Categorieen (ID,Name,Parent) VALUES (100496,'Weerwolf',41558)
INSERT Categorieen (ID,Name,Parent) VALUES (100497,'Advocatuur',41539)
INSERT Categorieen (ID,Name,Parent) VALUES (100498,'Gangster en maffia',41539)
INSERT Categorieen (ID,Name,Parent) VALUES (100506,'Noord-Holland',34628)
INSERT Categorieen (ID,Name,Parent) VALUES (100507,'Zuid-Holland',34628)
INSERT Categorieen (ID,Name,Parent) VALUES (100509,'Utrecht',34628)
INSERT Categorieen (ID,Name,Parent) VALUES (100511,'Blokbladen',8780)
INSERT Categorieen (ID,Name,Parent) VALUES (100517,'Decks - type II',218)
INSERT Categorieen (ID,Name,Parent) VALUES (100536,'Stickers',8780)
INSERT Categorieen (ID,Name,Parent) VALUES (100538,'Suske en Wiske',8605)
INSERT Categorieen (ID,Name,Parent) VALUES (100539,'Volk van Laaf',8605)
INSERT Categorieen (ID,Name,Parent) VALUES (100540,'Reclameborden',35692)
INSERT Categorieen (ID,Name,Parent) VALUES (100552,'Overige fanartikelen',75718)
INSERT Categorieen (ID,Name,Parent) VALUES (100800,'Nintendo DS',14616)
INSERT Categorieen (ID,Name,Parent) VALUES (100812,'Sony PSP',14616)
INSERT Categorieen (ID,Name,Parent) VALUES (101026,'Foto en kunst',267)
INSERT Categorieen (ID,Name,Parent) VALUES (101030,'Religie',267)
INSERT Categorieen (ID,Name,Parent) VALUES (101065,'Boten',64802)
INSERT Categorieen (ID,Name,Parent) VALUES (101066,'Fotografie',607)
INSERT Categorieen (ID,Name,Parent) VALUES (101067,'Games',607)
INSERT Categorieen (ID,Name,Parent) VALUES (101071,'Vrouwentijdschriften',607)
INSERT Categorieen (ID,Name,Parent) VALUES (101382,'Easy Listening',23275)
INSERT Categorieen (ID,Name,Parent) VALUES (101392,'Amusement en spelshows',41584)
INSERT Categorieen (ID,Name,Parent) VALUES (101533,'Orgelmuziek',19481)
INSERT Categorieen (ID,Name,Parent) VALUES (101875,'Creative MP3-spelers',73839)
INSERT Categorieen (ID,Name,Parent) VALUES (101876,'iRiver MP3-spelers',73839)
INSERT Categorieen (ID,Name,Parent) VALUES (101877,'Philips MP3-spelers',73839)
INSERT Categorieen (ID,Name,Parent) VALUES (101879,'Sony MP3-spelers',73839)
INSERT Categorieen (ID,Name,Parent) VALUES (101987,'Shirtjes en blouses',127717)
INSERT Categorieen (ID,Name,Parent) VALUES (101989,'Rompertjes',127717)
INSERT Categorieen (ID,Name,Parent) VALUES (102009,'Broekjes',127717)
INSERT Categorieen (ID,Name,Parent) VALUES (102043,'Jasjes',127717)
INSERT Categorieen (ID,Name,Parent) VALUES (102069,'Sokjes',127717)
INSERT Categorieen (ID,Name,Parent) VALUES (102071,'Pakjes',127717)
INSERT Categorieen (ID,Name,Parent) VALUES (102093,'Truitjes en vestjes',127717)
INSERT Categorieen (ID,Name,Parent) VALUES (102116,'Overige maat 50',127717)
INSERT Categorieen (ID,Name,Parent) VALUES (102119,'Shirtjes en blouses',127713)
INSERT Categorieen (ID,Name,Parent) VALUES (102121,'Rompertjes',127713)
INSERT Categorieen (ID,Name,Parent) VALUES (102141,'Broekjes',127713)
INSERT Categorieen (ID,Name,Parent) VALUES (102162,'Jasjes',127713)
INSERT Categorieen (ID,Name,Parent) VALUES (102206,'Truitjes en vestjes',127713)
INSERT Categorieen (ID,Name,Parent) VALUES (102208,'Sokjes',127713)
INSERT Categorieen (ID,Name,Parent) VALUES (102210,'Pakjes',127713)
INSERT Categorieen (ID,Name,Parent) VALUES (102273,'Shirtjes en blouses',127718)
INSERT Categorieen (ID,Name,Parent) VALUES (102275,'Rompertjes',127718)
INSERT Categorieen (ID,Name,Parent) VALUES (102295,'Broekjes',127718)
INSERT Categorieen (ID,Name,Parent) VALUES (102601,'Jasjes',127718)
INSERT Categorieen (ID,Name,Parent) VALUES (102627,'Pakjes',127718)
INSERT Categorieen (ID,Name,Parent) VALUES (102631,'Sokjes',127718)
INSERT Categorieen (ID,Name,Parent) VALUES (102651,'Truitjes en vestjes',127718)
INSERT Categorieen (ID,Name,Parent) VALUES (102848,'Shirtjes en blouses',127714)
INSERT Categorieen (ID,Name,Parent) VALUES (102850,'Rompertjes',127714)
INSERT Categorieen (ID,Name,Parent) VALUES (102870,'Broekjes',127714)
INSERT Categorieen (ID,Name,Parent) VALUES (102890,'Jasjes',127714)
INSERT Categorieen (ID,Name,Parent) VALUES (102916,'Sokjes',127714)
INSERT Categorieen (ID,Name,Parent) VALUES (102919,'Pakjes',127714)
INSERT Categorieen (ID,Name,Parent) VALUES (102941,'Truitjes en vestjes',127714)
INSERT Categorieen (ID,Name,Parent) VALUES (102964,'Overige maat 68',127714)
INSERT Categorieen (ID,Name,Parent) VALUES (102987,'Shirtjes en blouses',127719)
INSERT Categorieen (ID,Name,Parent) VALUES (102989,'Rompertjes',127719)
INSERT Categorieen (ID,Name,Parent) VALUES (103009,'Broekjes',127719)
INSERT Categorieen (ID,Name,Parent) VALUES (103031,'Jasjes',127719)
INSERT Categorieen (ID,Name,Parent) VALUES (103150,'Pakjes',127719)
INSERT Categorieen (ID,Name,Parent) VALUES (103154,'Sokjes',127719)
INSERT Categorieen (ID,Name,Parent) VALUES (103174,'Truitjes en vestjes',127719)
INSERT Categorieen (ID,Name,Parent) VALUES (103188,'Overige maat 74',127719)
INSERT Categorieen (ID,Name,Parent) VALUES (103230,'Shirtjes en blouses',127715)
INSERT Categorieen (ID,Name,Parent) VALUES (103232,'Rompertjes',127715)
INSERT Categorieen (ID,Name,Parent) VALUES (103252,'Broekjes',127715)
INSERT Categorieen (ID,Name,Parent) VALUES (103272,'Jasjes',127715)
INSERT Categorieen (ID,Name,Parent) VALUES (103361,'Overige maat 62',127718)
INSERT Categorieen (ID,Name,Parent) VALUES (103398,'Romantiek',41550)
INSERT Categorieen (ID,Name,Parent) VALUES (103486,'Pakjes',127715)
INSERT Categorieen (ID,Name,Parent) VALUES (103490,'Sokjes',127715)
INSERT Categorieen (ID,Name,Parent) VALUES (103492,'Overige maat 80',127715)
INSERT Categorieen (ID,Name,Parent) VALUES (103512,'Truitjes en vestjes',127715)
INSERT Categorieen (ID,Name,Parent) VALUES (103534,'Shirtjes en blouses',127716)
INSERT Categorieen (ID,Name,Parent) VALUES (103536,'Rompertjes',127716)
INSERT Categorieen (ID,Name,Parent) VALUES (103556,'Broekjes',127716)
INSERT Categorieen (ID,Name,Parent) VALUES (103576,'Jasjes',127716)
INSERT Categorieen (ID,Name,Parent) VALUES (103600,'Pakjes',127716)
INSERT Categorieen (ID,Name,Parent) VALUES (103604,'Sokjes',127716)
INSERT Categorieen (ID,Name,Parent) VALUES (103624,'Truitjes en vestjes',127716)
INSERT Categorieen (ID,Name,Parent) VALUES (103626,'Overige maat 86',127716)
INSERT Categorieen (ID,Name,Parent) VALUES (104051,'Accessoires',60241)
INSERT Categorieen (ID,Name,Parent) VALUES (104612,'CD''s',11233)
INSERT Categorieen (ID,Name,Parent) VALUES (105150,'Overige huishoudelijk',2984)
INSERT Categorieen (ID,Name,Parent) VALUES (105151,'Gameboy Advance en GBA SP',14616)
INSERT Categorieen (ID,Name,Parent) VALUES (105163,'Kinderkleding- unisex',11450)
INSERT Categorieen (ID,Name,Parent) VALUES (105164,'Maat 92',105163)
INSERT Categorieen (ID,Name,Parent) VALUES (105165,'Maat 98/104',105163)
INSERT Categorieen (ID,Name,Parent) VALUES (105166,'Maat 110/116',105163)
INSERT Categorieen (ID,Name,Parent) VALUES (105167,'Maat 122/128',105163)
INSERT Categorieen (ID,Name,Parent) VALUES (105168,'Maat 134/140',105163)
INSERT Categorieen (ID,Name,Parent) VALUES (105169,'Maat 146',105163)
INSERT Categorieen (ID,Name,Parent) VALUES (105170,'Maat 152/158',105163)
INSERT Categorieen (ID,Name,Parent) VALUES (105171,'Maat 164',105163)
INSERT Categorieen (ID,Name,Parent) VALUES (105172,'Maat 170/176',105163)
INSERT Categorieen (ID,Name,Parent) VALUES (105173,'Overige unisexkleding',105163)
INSERT Categorieen (ID,Name,Parent) VALUES (105223,'Overige maat 56',127713)
INSERT Categorieen (ID,Name,Parent) VALUES (105224,'1890 - 1948 Wilhelmina',28683)
INSERT Categorieen (ID,Name,Parent) VALUES (105225,'0.5 cent',105224)
INSERT Categorieen (ID,Name,Parent) VALUES (105226,'1 cent',105224)
INSERT Categorieen (ID,Name,Parent) VALUES (105227,'2.5 cent',105224)
INSERT Categorieen (ID,Name,Parent) VALUES (105228,'5 cent',105224)
INSERT Categorieen (ID,Name,Parent) VALUES (105229,'10 cent',105224)
INSERT Categorieen (ID,Name,Parent) VALUES (105230,'25 cent',105224)
INSERT Categorieen (ID,Name,Parent) VALUES (105231,'Gulden',105224)
INSERT Categorieen (ID,Name,Parent) VALUES (105232,'Rijksdaalder',105224)
INSERT Categorieen (ID,Name,Parent) VALUES (105233,'Vijf gulden',105224)
INSERT Categorieen (ID,Name,Parent) VALUES (105234,'Tien gulden',105224)
INSERT Categorieen (ID,Name,Parent) VALUES (105243,'1864 - 1899',128283)
INSERT Categorieen (ID,Name,Parent) VALUES (105244,'1900 - 1919',128283)
INSERT Categorieen (ID,Name,Parent) VALUES (105245,'2000 - heden',128283)
INSERT Categorieen (ID,Name,Parent) VALUES (105246,'FDC (Eerstedag)',40413)
INSERT Categorieen (ID,Name,Parent) VALUES (105247,'FDC E1 -  E149',105246)
INSERT Categorieen (ID,Name,Parent) VALUES (105248,'FDC E150 - E249',105246)
INSERT Categorieen (ID,Name,Parent) VALUES (105249,'FDC E250 - E349',105246)
INSERT Categorieen (ID,Name,Parent) VALUES (105250,'Postzegelboekjes',40413)
INSERT Categorieen (ID,Name,Parent) VALUES (105251,'PB 1 - PB15',105250)
INSERT Categorieen (ID,Name,Parent) VALUES (105252,'1970 - 1979',128283)
INSERT Categorieen (ID,Name,Parent) VALUES (105253,'1930 - 1939',128283)
INSERT Categorieen (ID,Name,Parent) VALUES (105254,'1940 - 1949',128283)
INSERT Categorieen (ID,Name,Parent) VALUES (105255,'Brieven en postwaardestukken',40413)
INSERT Categorieen (ID,Name,Parent) VALUES (105256,'Luchtpostfilatelie',105255)
INSERT Categorieen (ID,Name,Parent) VALUES (105257,'Briefkaarten',105255)
INSERT Categorieen (ID,Name,Parent) VALUES (105263,'Overig tot 1975',7903)
INSERT Categorieen (ID,Name,Parent) VALUES (105265,'Nederland',7914)
INSERT Categorieen (ID,Name,Parent) VALUES (105293,'Berlijn',7825)
INSERT Categorieen (ID,Name,Parent) VALUES (105967,'Sport',607)
INSERT Categorieen (ID,Name,Parent) VALUES (105970,'Voetbal',105967)
INSERT Categorieen (ID,Name,Parent) VALUES (105971,'Golf',105967)
INSERT Categorieen (ID,Name,Parent) VALUES (105973,'Vechtsporten',105967)
INSERT Categorieen (ID,Name,Parent) VALUES (105976,'Tennis',105967)
INSERT Categorieen (ID,Name,Parent) VALUES (106261,'Verbruiksartikelen',160)
INSERT Categorieen (ID,Name,Parent) VALUES (106768,'Aankleedkussens',15456)
INSERT Categorieen (ID,Name,Parent) VALUES (106769,'Voeding',12081)
INSERT Categorieen (ID,Name,Parent) VALUES (106770,'Flessen',106769)
INSERT Categorieen (ID,Name,Parent) VALUES (106778,'Flessenwarmers',106769)
INSERT Categorieen (ID,Name,Parent) VALUES (106782,'Slabbetjes en schouderdoeken',106769)
INSERT Categorieen (ID,Name,Parent) VALUES (106789,'Sterilisators',106769)
INSERT Categorieen (ID,Name,Parent) VALUES (106793,'Huidverzorging',15456)
INSERT Categorieen (ID,Name,Parent) VALUES (106801,'Verschoondekens',15456)
INSERT Categorieen (ID,Name,Parent) VALUES (106810,'Knuffels',18637)
INSERT Categorieen (ID,Name,Parent) VALUES (106822,'Dieetproducten',47867)
INSERT Categorieen (ID,Name,Parent) VALUES (106928,'Gel en wax',47879)
INSERT Categorieen (ID,Name,Parent) VALUES (107034,'Overige scheerproducten',107035)
INSERT Categorieen (ID,Name,Parent) VALUES (107035,'Scheerproducten',12155)
INSERT Categorieen (ID,Name,Parent) VALUES (107040,'Anti-cellulitis',11838)
INSERT Categorieen (ID,Name,Parent) VALUES (107076,'Bruisballen',47903)
INSERT Categorieen (ID,Name,Parent) VALUES (107077,'Hygiëne voor dames',11838)
INSERT Categorieen (ID,Name,Parent) VALUES (107091,'Contactlenzenvloeistof',22490)
INSERT Categorieen (ID,Name,Parent) VALUES (107116,'Overig Duitsland',7825)
INSERT Categorieen (ID,Name,Parent) VALUES (107476,'Nachtkleding',70222)
INSERT Categorieen (ID,Name,Parent) VALUES (107479,'Nachtkleding',74069)
INSERT Categorieen (ID,Name,Parent) VALUES (107480,'Nachtkleding',98376)
INSERT Categorieen (ID,Name,Parent) VALUES (107589,'Swarovski',7478)
INSERT Categorieen (ID,Name,Parent) VALUES (107697,'Oostenrijk',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (107706,'Zwitserland',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (107952,'Overige make-up',13264)
INSERT Categorieen (ID,Name,Parent) VALUES (108267,'Skype en Internettelefonie',14675)
INSERT Categorieen (ID,Name,Parent) VALUES (108299,'Schilderijen',25817)
INSERT Categorieen (ID,Name,Parent) VALUES (108428,'Zitzakken en zitballen',3192)
INSERT Categorieen (ID,Name,Parent) VALUES (109023,'Mysterie',41526)
INSERT Categorieen (ID,Name,Parent) VALUES (109024,'Psychologisch',41539)
INSERT Categorieen (ID,Name,Parent) VALUES (109025,'Religie',41543)
INSERT Categorieen (ID,Name,Parent) VALUES (109026,'New Age/spiritueel',23275)
INSERT Categorieen (ID,Name,Parent) VALUES (109043,'Mysterie',35076)
INSERT Categorieen (ID,Name,Parent) VALUES (110150,'Douchegel',47903)
INSERT Categorieen (ID,Name,Parent) VALUES (110232,'Tandenborstels - hand',48079)
INSERT Categorieen (ID,Name,Parent) VALUES (110234,'Tandzijde en floss',48079)
INSERT Categorieen (ID,Name,Parent) VALUES (110684,'Bouw',9431)
INSERT Categorieen (ID,Name,Parent) VALUES (110699,'Huishoudelijk',9431)
INSERT Categorieen (ID,Name,Parent) VALUES (110703,'Tuin',9431)
INSERT Categorieen (ID,Name,Parent) VALUES (110717,'Sport en welzijn',9431)
INSERT Categorieen (ID,Name,Parent) VALUES (110747,'Marketing',9431)
INSERT Categorieen (ID,Name,Parent) VALUES (110757,'Evenementen',9431)
INSERT Categorieen (ID,Name,Parent) VALUES (110775,'Dierenverzorging en -training',9431)
INSERT Categorieen (ID,Name,Parent) VALUES (110780,'Transport en logistiek',9431)
INSERT Categorieen (ID,Name,Parent) VALUES (111139,'Motorola',24040)
INSERT Categorieen (ID,Name,Parent) VALUES (111165,'Nokia',115680)
INSERT Categorieen (ID,Name,Parent) VALUES (111202,'Frontjes en covers',9394)
INSERT Categorieen (ID,Name,Parent) VALUES (111234,'Samsung',24040)
INSERT Categorieen (ID,Name,Parent) VALUES (111310,'Siemens',23979)
INSERT Categorieen (ID,Name,Parent) VALUES (111323,'Siemens',24040)
INSERT Categorieen (ID,Name,Parent) VALUES (111363,'Bluetooth',9394)
INSERT Categorieen (ID,Name,Parent) VALUES (111415,'Houders',38951)
INSERT Categorieen (ID,Name,Parent) VALUES (111800,'Stof',111848)
INSERT Categorieen (ID,Name,Parent) VALUES (111801,'Papier en karton',25850)
INSERT Categorieen (ID,Name,Parent) VALUES (111804,'Charms en frames',111848)
INSERT Categorieen (ID,Name,Parent) VALUES (111806,'Kaarten maken',8423)
INSERT Categorieen (ID,Name,Parent) VALUES (111820,'Ideeënboeken en -folders',111848)
INSERT Categorieen (ID,Name,Parent) VALUES (111827,'Stempelen',8423)
INSERT Categorieen (ID,Name,Parent) VALUES (111832,'Glimmers en glinsters',111848)
INSERT Categorieen (ID,Name,Parent) VALUES (111837,'Sieradenhobby',8423)
INSERT Categorieen (ID,Name,Parent) VALUES (111843,'Bedels en hangers',111837)
INSERT Categorieen (ID,Name,Parent) VALUES (111846,'Gereedschappen',111837)
INSERT Categorieen (ID,Name,Parent) VALUES (111848,'Scrapping en 3D',8423)
INSERT Categorieen (ID,Name,Parent) VALUES (111889,'Gereedschappen',111848)
INSERT Categorieen (ID,Name,Parent) VALUES (111893,'Linten en fibers',111848)
INSERT Categorieen (ID,Name,Parent) VALUES (111919,'Fournituren',3116)
INSERT Categorieen (ID,Name,Parent) VALUES (111925,'Knopen',8423)
INSERT Categorieen (ID,Name,Parent) VALUES (111936,'Patronen',3116)
INSERT Categorieen (ID,Name,Parent) VALUES (111941,'Pakketten',127909)
INSERT Categorieen (ID,Name,Parent) VALUES (111943,'Patronen',127909)
INSERT Categorieen (ID,Name,Parent) VALUES (111994,'Goochelen',8423)
INSERT Categorieen (ID,Name,Parent) VALUES (111998,'Episode 3',112034)
INSERT Categorieen (ID,Name,Parent) VALUES (111999,'Opbergsystemen vinyl',27577)
INSERT Categorieen (ID,Name,Parent) VALUES (112016,'Big Beat',19479)
INSERT Categorieen (ID,Name,Parent) VALUES (112017,'Breakbeat',19479)
INSERT Categorieen (ID,Name,Parent) VALUES (112024,'Actiefiguren',220)
INSERT Categorieen (ID,Name,Parent) VALUES (112034,'Star Wars',112024)
INSERT Categorieen (ID,Name,Parent) VALUES (112095,'Babyslofjes',12081)
INSERT Categorieen (ID,Name,Parent) VALUES (112106,'Setjes',127689)
INSERT Categorieen (ID,Name,Parent) VALUES (112125,'Setjes',127690)
INSERT Categorieen (ID,Name,Parent) VALUES (112138,'Setjes',127691)
INSERT Categorieen (ID,Name,Parent) VALUES (112216,'Setjes',127667)
INSERT Categorieen (ID,Name,Parent) VALUES (112231,'Setjes',127668)
INSERT Categorieen (ID,Name,Parent) VALUES (112283,'Setjes',127680)
INSERT Categorieen (ID,Name,Parent) VALUES (112297,'Setjes',127717)
INSERT Categorieen (ID,Name,Parent) VALUES (112355,'Mutsen, sjaals en wantjes',127733)
INSERT Categorieen (ID,Name,Parent) VALUES (112359,'Setjes',127718)
INSERT Categorieen (ID,Name,Parent) VALUES (112459,'Historische figuren',33416)
INSERT Categorieen (ID,Name,Parent) VALUES (112460,'Muzikanten',33416)
INSERT Categorieen (ID,Name,Parent) VALUES (112489,'Neopets',868)
INSERT Categorieen (ID,Name,Parent) VALUES (112679,'Games',38577)
INSERT Categorieen (ID,Name,Parent) VALUES (112697,'Games',105151)
INSERT Categorieen (ID,Name,Parent) VALUES (112698,'Actie en avontuur',112697)
INSERT Categorieen (ID,Name,Parent) VALUES (112700,'Kinderen en familie',112697)
INSERT Categorieen (ID,Name,Parent) VALUES (112708,'Racen',112697)
INSERT Categorieen (ID,Name,Parent) VALUES (112710,'Schieten',112697)
INSERT Categorieen (ID,Name,Parent) VALUES (112712,'Sport',112697)
INSERT Categorieen (ID,Name,Parent) VALUES (112714,'Overige games',112697)
INSERT Categorieen (ID,Name,Parent) VALUES (112733,'NES spellen',37209)
INSERT Categorieen (ID,Name,Parent) VALUES (112751,'SNES spellen',37209)
INSERT Categorieen (ID,Name,Parent) VALUES (112823,'Playstation 3',14616)
INSERT Categorieen (ID,Name,Parent) VALUES (112845,'Xbox 360',14616)
INSERT Categorieen (ID,Name,Parent) VALUES (112846,'Accessoires',112845)
INSERT Categorieen (ID,Name,Parent) VALUES (112847,'Games',112845)
INSERT Categorieen (ID,Name,Parent) VALUES (112848,'Consoles',112845)
INSERT Categorieen (ID,Name,Parent) VALUES (113038,'Live rollenspel',2543)
INSERT Categorieen (ID,Name,Parent) VALUES (113179,'Bollywood',2288)
INSERT Categorieen (ID,Name,Parent) VALUES (113420,'Grammofoons',14969)
INSERT Categorieen (ID,Name,Parent) VALUES (113754,'Sportartikelen',888)
INSERT Categorieen (ID,Name,Parent) VALUES (113851,'Bruiningsproducten',11838)
INSERT Categorieen (ID,Name,Parent) VALUES (113902,'Tandenborstels - automatisch',48079)
INSERT Categorieen (ID,Name,Parent) VALUES (114030,'Naamplaten en huisnummers',11700)
INSERT Categorieen (ID,Name,Parent) VALUES (114056,'Verwarming buiten',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (114318,'Onderzetters',20626)
INSERT Categorieen (ID,Name,Parent) VALUES (114356,'Peper- en zoutstellen',20626)
INSERT Categorieen (ID,Name,Parent) VALUES (114914,'Knopen en kralen',111848)
INSERT Categorieen (ID,Name,Parent) VALUES (115329,'Haarverzorging',15456)
INSERT Categorieen (ID,Name,Parent) VALUES (115334,'Sieraden',12081)
INSERT Categorieen (ID,Name,Parent) VALUES (115539,'Benodigdheden en opslag',11232)
INSERT Categorieen (ID,Name,Parent) VALUES (115612,'Navigatie-accessoires',38776)
INSERT Categorieen (ID,Name,Parent) VALUES (115680,'Headsets en carkits',9394)
INSERT Categorieen (ID,Name,Parent) VALUES (115777,'Riemen en peddels',36629)
INSERT Categorieen (ID,Name,Parent) VALUES (115794,'Regenkleding',22171)
INSERT Categorieen (ID,Name,Parent) VALUES (115806,'Jongleerballen en diabolo''s',220)
INSERT Categorieen (ID,Name,Parent) VALUES (115851,'Zilver',10975)
INSERT Categorieen (ID,Name,Parent) VALUES (115861,'Zilver',10985)
INSERT Categorieen (ID,Name,Parent) VALUES (116597,'Wielrennen',105967)
INSERT Categorieen (ID,Name,Parent) VALUES (117040,'Accessoires',21186)
INSERT Categorieen (ID,Name,Parent) VALUES (117562,'Games',112823)
INSERT Categorieen (ID,Name,Parent) VALUES (118260,'Geheugenkaarten',9394)
INSERT Categorieen (ID,Name,Parent) VALUES (118858,'Veranda''s en terrasmateriaal',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (118870,'Accessoires',25863)
INSERT Categorieen (ID,Name,Parent) VALUES (119201,'Roeiboten',1293)
INSERT Categorieen (ID,Name,Parent) VALUES (119232,'Atletiek',888)
INSERT Categorieen (ID,Name,Parent) VALUES (119357,'Foil cards',218)
INSERT Categorieen (ID,Name,Parent) VALUES (119656,'Bomen en struiken',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (119688,'Kamerplanten',3192)
INSERT Categorieen (ID,Name,Parent) VALUES (121594,'Hoedjes en petjes',127733)
INSERT Categorieen (ID,Name,Parent) VALUES (121624,'Hobby''s en techniek',267)
INSERT Categorieen (ID,Name,Parent) VALUES (121639,'Muziek',267)
INSERT Categorieen (ID,Name,Parent) VALUES (121863,'Musical',1508)
INSERT Categorieen (ID,Name,Parent) VALUES (121977,'Rolls Royce',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (122658,'Beschermhoezen',111848)
INSERT Categorieen (ID,Name,Parent) VALUES (122659,'Eyelets, brads en snaps',111848)
INSERT Categorieen (ID,Name,Parent) VALUES (123099,'Gereedschappen en machines',12576)
INSERT Categorieen (ID,Name,Parent) VALUES (123176,'Nokia',24040)
INSERT Categorieen (ID,Name,Parent) VALUES (123317,'Gewone colliers',92771)
INSERT Categorieen (ID,Name,Parent) VALUES (123345,'Gewone ringen',67725)
INSERT Categorieen (ID,Name,Parent) VALUES (123786,'Bhutan',32136)
INSERT Categorieen (ID,Name,Parent) VALUES (123788,'Laos',32136)
INSERT Categorieen (ID,Name,Parent) VALUES (123789,'Mongolië',32136)
INSERT Categorieen (ID,Name,Parent) VALUES (123790,'Midden-Oosten',32136)
INSERT Categorieen (ID,Name,Parent) VALUES (123860,'Tin',16486)
INSERT Categorieen (ID,Name,Parent) VALUES (124329,'Ogenverzorging',26528)
INSERT Categorieen (ID,Name,Parent) VALUES (124353,'Haarborstels',47879)
INSERT Categorieen (ID,Name,Parent) VALUES (124369,'Douchecrèmes',47903)
INSERT Categorieen (ID,Name,Parent) VALUES (124418,'Meet- en regelapparatuur',12576)
INSERT Categorieen (ID,Name,Parent) VALUES (124517,'Verf',30471)
INSERT Categorieen (ID,Name,Parent) VALUES (124709,'Microscopen',293)
INSERT Categorieen (ID,Name,Parent) VALUES (125354,'Minibikes',9192)
INSERT Categorieen (ID,Name,Parent) VALUES (126448,'Naalden en toebehoren',3103)
INSERT Categorieen (ID,Name,Parent) VALUES (126454,'Campings en vakantieparken',160939)
INSERT Categorieen (ID,Name,Parent) VALUES (126455,'Magazines en (jaar)boeken',13331)
INSERT Categorieen (ID,Name,Parent) VALUES (127144,'Afrika',7990)
INSERT Categorieen (ID,Name,Parent) VALUES (127145,'Zuid-Afrika',127144)
INSERT Categorieen (ID,Name,Parent) VALUES (127449,'Spray',47879)
INSERT Categorieen (ID,Name,Parent) VALUES (127470,'Brillenreiniging',22490)
INSERT Categorieen (ID,Name,Parent) VALUES (127648,'Maat 50',73738)
INSERT Categorieen (ID,Name,Parent) VALUES (127652,'Maat 56',73738)
INSERT Categorieen (ID,Name,Parent) VALUES (127653,'Maat 62',73738)
INSERT Categorieen (ID,Name,Parent) VALUES (127654,'Maat 68',73738)
INSERT Categorieen (ID,Name,Parent) VALUES (127658,'Setjes',127652)
INSERT Categorieen (ID,Name,Parent) VALUES (127665,'Setjes',127654)
INSERT Categorieen (ID,Name,Parent) VALUES (127667,'Maat 74',73738)
INSERT Categorieen (ID,Name,Parent) VALUES (127668,'Maat 80',73738)
INSERT Categorieen (ID,Name,Parent) VALUES (127680,'Maat 86',73738)
INSERT Categorieen (ID,Name,Parent) VALUES (127683,'Maat 50',8471)
INSERT Categorieen (ID,Name,Parent) VALUES (127686,'Maat 56',8471)
INSERT Categorieen (ID,Name,Parent) VALUES (127687,'Maat 62',8471)
INSERT Categorieen (ID,Name,Parent) VALUES (127688,'Maat 68',8471)
INSERT Categorieen (ID,Name,Parent) VALUES (127689,'Maat 74',8471)
INSERT Categorieen (ID,Name,Parent) VALUES (127690,'Maat 80',8471)
INSERT Categorieen (ID,Name,Parent) VALUES (127691,'Maat 86',8471)
INSERT Categorieen (ID,Name,Parent) VALUES (127692,'Shirtjes en blouses',127683)
INSERT Categorieen (ID,Name,Parent) VALUES (127695,'Setjes',127686)
INSERT Categorieen (ID,Name,Parent) VALUES (127699,'Setjes',127687)
INSERT Categorieen (ID,Name,Parent) VALUES (127713,'Maat 56',36524)
INSERT Categorieen (ID,Name,Parent) VALUES (127714,'Maat 68',36524)
INSERT Categorieen (ID,Name,Parent) VALUES (127715,'Maat 80',36524)
INSERT Categorieen (ID,Name,Parent) VALUES (127716,'Maat 86',36524)
INSERT Categorieen (ID,Name,Parent) VALUES (127717,'Maat 50',36524)
INSERT Categorieen (ID,Name,Parent) VALUES (127718,'Maat 62',36524)
INSERT Categorieen (ID,Name,Parent) VALUES (127719,'Maat 74',36524)
INSERT Categorieen (ID,Name,Parent) VALUES (127721,'Setjes',127713)
INSERT Categorieen (ID,Name,Parent) VALUES (127729,'Setjes',127714)
INSERT Categorieen (ID,Name,Parent) VALUES (127730,'Setjes',127719)
INSERT Categorieen (ID,Name,Parent) VALUES (127731,'Setjes',127715)
INSERT Categorieen (ID,Name,Parent) VALUES (127732,'Setjes',127716)
INSERT Categorieen (ID,Name,Parent) VALUES (127733,'Babykleding - accessoires',12081)
INSERT Categorieen (ID,Name,Parent) VALUES (127735,'Kinderen van 10 tot 12 jaar',1093)
INSERT Categorieen (ID,Name,Parent) VALUES (127737,'Tot 1939',131188)
INSERT Categorieen (ID,Name,Parent) VALUES (127739,'1940 - 1969',131188)
INSERT Categorieen (ID,Name,Parent) VALUES (127740,'1970 - 1989',131188)
INSERT Categorieen (ID,Name,Parent) VALUES (127741,'Accessoires',100812)
INSERT Categorieen (ID,Name,Parent) VALUES (127747,'Games',100812)
INSERT Categorieen (ID,Name,Parent) VALUES (127793,'Sciencefiction',900)
INSERT Categorieen (ID,Name,Parent) VALUES (127794,'Fantasy',900)
INSERT Categorieen (ID,Name,Parent) VALUES (127797,'Jan Jans en de Kinderen',63)
INSERT Categorieen (ID,Name,Parent) VALUES (127798,'Kapitein Rob',63)
INSERT Categorieen (ID,Name,Parent) VALUES (127799,'Suske en Wiske',63)
INSERT Categorieen (ID,Name,Parent) VALUES (127800,'Oude albums',127799)
INSERT Categorieen (ID,Name,Parent) VALUES (127801,'Verhalen',267)
INSERT Categorieen (ID,Name,Parent) VALUES (127802,'Bekende tv-figuren',41526)
INSERT Categorieen (ID,Name,Parent) VALUES (127804,'Politiek',41539)
INSERT Categorieen (ID,Name,Parent) VALUES (127805,'Wetenschap',41584)
INSERT Categorieen (ID,Name,Parent) VALUES (127806,'Sport en fitness',41584)
INSERT Categorieen (ID,Name,Parent) VALUES (127807,'Detectives en krimi''s',41584)
INSERT Categorieen (ID,Name,Parent) VALUES (127808,'Documentaires en natuur',41584)
INSERT Categorieen (ID,Name,Parent) VALUES (127809,'Bekende tv-figuren',35076)
INSERT Categorieen (ID,Name,Parent) VALUES (127897,'Nintendo 64',14616)
INSERT Categorieen (ID,Name,Parent) VALUES (127909,'Borduren en haken',8423)
INSERT Categorieen (ID,Name,Parent) VALUES (127915,'Pakketten',25850)
INSERT Categorieen (ID,Name,Parent) VALUES (127923,'Grote voorwerpen',25817)
INSERT Categorieen (ID,Name,Parent) VALUES (127924,'Kleine voorwerpen',25817)
INSERT Categorieen (ID,Name,Parent) VALUES (127925,'Maat 38 (M)',12989)
INSERT Categorieen (ID,Name,Parent) VALUES (127926,'Maat 38 (M)',13021)
INSERT Categorieen (ID,Name,Parent) VALUES (127927,'Maat 38 (M)',12090)
INSERT Categorieen (ID,Name,Parent) VALUES (127928,'Maat 38 (M)',15720)
INSERT Categorieen (ID,Name,Parent) VALUES (127929,'Maat 38 (M)',13045)
INSERT Categorieen (ID,Name,Parent) VALUES (127930,'Maat 38 (M)',12997)
INSERT Categorieen (ID,Name,Parent) VALUES (127931,'Maat 38 (M)',33092)
INSERT Categorieen (ID,Name,Parent) VALUES (127932,'Maat 38 (M)',24046)
INSERT Categorieen (ID,Name,Parent) VALUES (127933,'Maat 38 (M)',98304)
INSERT Categorieen (ID,Name,Parent) VALUES (127934,'Maat 38 (M)',13029)
INSERT Categorieen (ID,Name,Parent) VALUES (127935,'Maat 38 (M)',13493)
INSERT Categorieen (ID,Name,Parent) VALUES (127936,'Maat 38 (M)',31058)
INSERT Categorieen (ID,Name,Parent) VALUES (127937,'Laarzen',12104)
INSERT Categorieen (ID,Name,Parent) VALUES (127945,'Shirts lange mouw',9817)
INSERT Categorieen (ID,Name,Parent) VALUES (128003,'Klassiek',34391)
INSERT Categorieen (ID,Name,Parent) VALUES (128195,'Shirts',70222)
INSERT Categorieen (ID,Name,Parent) VALUES (128208,'Shirts',98333)
INSERT Categorieen (ID,Name,Parent) VALUES (128212,'Shirts',98372)
INSERT Categorieen (ID,Name,Parent) VALUES (128213,'Shirts',98374)
INSERT Categorieen (ID,Name,Parent) VALUES (128218,'Shirts',74069)
INSERT Categorieen (ID,Name,Parent) VALUES (128231,'Shirts',98386)
INSERT Categorieen (ID,Name,Parent) VALUES (128235,'Shirts',98388)
INSERT Categorieen (ID,Name,Parent) VALUES (128236,'Shirts',98390)
INSERT Categorieen (ID,Name,Parent) VALUES (128240,'Kinderkleding- schoenen',11450)
INSERT Categorieen (ID,Name,Parent) VALUES (128243,'Vanguards',222)
INSERT Categorieen (ID,Name,Parent) VALUES (128244,'Preiser',9053)
INSERT Categorieen (ID,Name,Parent) VALUES (128245,'1948 - 1980 Juliana',28683)
INSERT Categorieen (ID,Name,Parent) VALUES (128246,'1 cent',128245)
INSERT Categorieen (ID,Name,Parent) VALUES (128247,'5 cent',128245)
INSERT Categorieen (ID,Name,Parent) VALUES (128248,'25 cent',128245)
INSERT Categorieen (ID,Name,Parent) VALUES (128249,'Gulden',128245)
INSERT Categorieen (ID,Name,Parent) VALUES (128250,'Rijksdaalder',128245)
INSERT Categorieen (ID,Name,Parent) VALUES (128251,'Vijf gulden',128245)
INSERT Categorieen (ID,Name,Parent) VALUES (128252,'Tien gulden',128245)
INSERT Categorieen (ID,Name,Parent) VALUES (128253,'Sets en pakketten',128245)
INSERT Categorieen (ID,Name,Parent) VALUES (128254,'1980 - 2002 Beatrix',28683)
INSERT Categorieen (ID,Name,Parent) VALUES (128255,'5 cent',128254)
INSERT Categorieen (ID,Name,Parent) VALUES (128256,'10 cent',128254)
INSERT Categorieen (ID,Name,Parent) VALUES (128257,'25 cent',128254)
INSERT Categorieen (ID,Name,Parent) VALUES (128258,'Gulden',128254)
INSERT Categorieen (ID,Name,Parent) VALUES (128259,'Rijksdaalder',128254)
INSERT Categorieen (ID,Name,Parent) VALUES (128260,'Vijf gulden',128254)
INSERT Categorieen (ID,Name,Parent) VALUES (128261,'Tien gulden',128254)
INSERT Categorieen (ID,Name,Parent) VALUES (128262,'Sets en pakketten',128254)
INSERT Categorieen (ID,Name,Parent) VALUES (128263,'Dans - klassiek',23275)
INSERT Categorieen (ID,Name,Parent) VALUES (128264,'Nederlandstalig',23275)
INSERT Categorieen (ID,Name,Parent) VALUES (128270,'Postfris en ongebruikt',40413)
INSERT Categorieen (ID,Name,Parent) VALUES (128271,'Eerste emissie 1852',128270)
INSERT Categorieen (ID,Name,Parent) VALUES (128272,'1864 - 1899',128270)
INSERT Categorieen (ID,Name,Parent) VALUES (128273,'1900 - 1919',128270)
INSERT Categorieen (ID,Name,Parent) VALUES (128274,'1920 - 1929',128270)
INSERT Categorieen (ID,Name,Parent) VALUES (128275,'1930 - 1939',128270)
INSERT Categorieen (ID,Name,Parent) VALUES (128276,'1940 - 1949',128270)
INSERT Categorieen (ID,Name,Parent) VALUES (128277,'1950 - 1959',128270)
INSERT Categorieen (ID,Name,Parent) VALUES (128278,'1960 - 1969',128270)
INSERT Categorieen (ID,Name,Parent) VALUES (128279,'1970 - 1979',128270)
INSERT Categorieen (ID,Name,Parent) VALUES (128280,'1980 - 1989',128270)
INSERT Categorieen (ID,Name,Parent) VALUES (128281,'1990 - 1999',128270)
INSERT Categorieen (ID,Name,Parent) VALUES (128282,'2000 - heden',128270)
INSERT Categorieen (ID,Name,Parent) VALUES (128283,'Gebruikt',40413)
INSERT Categorieen (ID,Name,Parent) VALUES (128298,'FDC E350 - E449',105246)
INSERT Categorieen (ID,Name,Parent) VALUES (128299,'PB31 - PB45',105250)
INSERT Categorieen (ID,Name,Parent) VALUES (128300,'PB45 - heden',105250)
INSERT Categorieen (ID,Name,Parent) VALUES (128301,'Luchtpost',40413)
INSERT Categorieen (ID,Name,Parent) VALUES (128302,'Suriname',40414)
INSERT Categorieen (ID,Name,Parent) VALUES (128303,'1975 - heden',128302)
INSERT Categorieen (ID,Name,Parent) VALUES (128304,'Nederlands Indië',40414)
INSERT Categorieen (ID,Name,Parent) VALUES (128305,'Postfris en ongebruikt',128304)
INSERT Categorieen (ID,Name,Parent) VALUES (128306,'Nederlandse Antillen',40414)
INSERT Categorieen (ID,Name,Parent) VALUES (128307,'1975 - heden',128306)
INSERT Categorieen (ID,Name,Parent) VALUES (128308,'Curaçao',40414)
INSERT Categorieen (ID,Name,Parent) VALUES (128309,'Postfris en ongebruikt',128308)
INSERT Categorieen (ID,Name,Parent) VALUES (128310,'Gebruikt',128308)
INSERT Categorieen (ID,Name,Parent) VALUES (128312,'Finland',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (128314,'Postfris en ongebruikt',105293)
INSERT Categorieen (ID,Name,Parent) VALUES (128316,'Postfris en ongebruikt',88766)
INSERT Categorieen (ID,Name,Parent) VALUES (128318,'Postfris en ongebruikt',25791)
INSERT Categorieen (ID,Name,Parent) VALUES (128348,'Postfris en ongebruikt',25793)
INSERT Categorieen (ID,Name,Parent) VALUES (128350,'Postfris en ongebruikt',3499)
INSERT Categorieen (ID,Name,Parent) VALUES (128351,'Postfris',7903)
INSERT Categorieen (ID,Name,Parent) VALUES (128352,'Antarctica',260)
INSERT Categorieen (ID,Name,Parent) VALUES (128375,'Jaar van het Kind',4752)
INSERT Categorieen (ID,Name,Parent) VALUES (128376,'Rode Kruis',4752)
INSERT Categorieen (ID,Name,Parent) VALUES (128378,'Scouting',4752)
INSERT Categorieen (ID,Name,Parent) VALUES (128380,'Honkbal',36684)
INSERT Categorieen (ID,Name,Parent) VALUES (128384,'Noord-Amerika',260)
INSERT Categorieen (ID,Name,Parent) VALUES (128385,'Oceanië',260)
INSERT Categorieen (ID,Name,Parent) VALUES (128389,'Perfins',260)
INSERT Categorieen (ID,Name,Parent) VALUES (128390,'Stadspost',260)
INSERT Categorieen (ID,Name,Parent) VALUES (128391,'Nederland-Overzee',7914)
INSERT Categorieen (ID,Name,Parent) VALUES (128404,'Zuid-Afrika',33400)
INSERT Categorieen (ID,Name,Parent) VALUES (128405,'Overige Afrika',33400)
INSERT Categorieen (ID,Name,Parent) VALUES (128428,'Drenthe',34628)
INSERT Categorieen (ID,Name,Parent) VALUES (128429,'Flevoland',34628)
INSERT Categorieen (ID,Name,Parent) VALUES (128430,'Friesland',34628)
INSERT Categorieen (ID,Name,Parent) VALUES (128431,'Gelderland',34628)
INSERT Categorieen (ID,Name,Parent) VALUES (128432,'Groningen',34628)
INSERT Categorieen (ID,Name,Parent) VALUES (128433,'Limburg',34628)
INSERT Categorieen (ID,Name,Parent) VALUES (128445,'Overijssel',34628)
INSERT Categorieen (ID,Name,Parent) VALUES (128446,'Zeeland',34628)
INSERT Categorieen (ID,Name,Parent) VALUES (128962,'Feest- en carnavalskleding',3038)
INSERT Categorieen (ID,Name,Parent) VALUES (129796,'Overige babyaccessoires',127733)
INSERT Categorieen (ID,Name,Parent) VALUES (130104,'Ladders',19859)
INSERT Categorieen (ID,Name,Parent) VALUES (130208,'Maat 32-34 (XXS/XS)',15720)
INSERT Categorieen (ID,Name,Parent) VALUES (130211,'Maat 36 (S)',15720)
INSERT Categorieen (ID,Name,Parent) VALUES (130212,'Maat 40-42 (L)',15720)
INSERT Categorieen (ID,Name,Parent) VALUES (130213,'Maat 44-46 (XL)',15720)
INSERT Categorieen (ID,Name,Parent) VALUES (130256,'Tot 1939',29224)
INSERT Categorieen (ID,Name,Parent) VALUES (130257,'1940 - 1969',29224)
INSERT Categorieen (ID,Name,Parent) VALUES (130258,'1970 - 1989',29224)
INSERT Categorieen (ID,Name,Parent) VALUES (130265,'Arnold',13292)
INSERT Categorieen (ID,Name,Parent) VALUES (130269,'Fleischmann',13292)
INSERT Categorieen (ID,Name,Parent) VALUES (130285,'Minitrix',13292)
INSERT Categorieen (ID,Name,Parent) VALUES (130287,'Roco',13292)
INSERT Categorieen (ID,Name,Parent) VALUES (130425,'10 cent',128245)
INSERT Categorieen (ID,Name,Parent) VALUES (130429,'Chronografen',91060)
INSERT Categorieen (ID,Name,Parent) VALUES (130490,'Setjes',127688)
INSERT Categorieen (ID,Name,Parent) VALUES (131188,'Literatuur - Nederland',267)
INSERT Categorieen (ID,Name,Parent) VALUES (131855,'Stroomvoorziening en -adapters',32202)
INSERT Categorieen (ID,Name,Parent) VALUES (131992,'Behuizingen en kasten',38851)
INSERT Categorieen (ID,Name,Parent) VALUES (132075,'Routers',32202)
INSERT Categorieen (ID,Name,Parent) VALUES (132103,'Servers en toebehoren',160)
INSERT Categorieen (ID,Name,Parent) VALUES (132148,'Zeilboten',1293)
INSERT Categorieen (ID,Name,Parent) VALUES (132169,'Beroepsscheepvaart',1293)
INSERT Categorieen (ID,Name,Parent) VALUES (132364,'Bewatering',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (132379,'Schuttingen en hekken',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (132396,'Cruises',160939)
INSERT Categorieen (ID,Name,Parent) VALUES (133541,'Goud - puur',92771)
INSERT Categorieen (ID,Name,Parent) VALUES (133571,'Goud - verguld',10994)
INSERT Categorieen (ID,Name,Parent) VALUES (133575,'Goud - verguld',10975)
INSERT Categorieen (ID,Name,Parent) VALUES (133587,'Goud - verguld',92771)
INSERT Categorieen (ID,Name,Parent) VALUES (133591,'Goud - verguld',10985)
INSERT Categorieen (ID,Name,Parent) VALUES (133599,'Goud - verguld',67725)
INSERT Categorieen (ID,Name,Parent) VALUES (133618,'Zilver',92771)
INSERT Categorieen (ID,Name,Parent) VALUES (134639,'Stacaravans',44794)
INSERT Categorieen (ID,Name,Parent) VALUES (134665,'Roodbaard',63)
INSERT Categorieen (ID,Name,Parent) VALUES (134666,'Storm',63)
INSERT Categorieen (ID,Name,Parent) VALUES (134667,'Trigië',63)
INSERT Categorieen (ID,Name,Parent) VALUES (134675,'Actie',41523)
INSERT Categorieen (ID,Name,Parent) VALUES (134676,'Drama',35015)
INSERT Categorieen (ID,Name,Parent) VALUES (134977,'Lion Toys',222)
INSERT Categorieen (ID,Name,Parent) VALUES (135020,'Nederlandstalig',20800)
INSERT Categorieen (ID,Name,Parent) VALUES (135021,'Gemengde frankering',105255)
INSERT Categorieen (ID,Name,Parent) VALUES (135057,'Efteling',1)
INSERT Categorieen (ID,Name,Parent) VALUES (135222,'Gebruikt',128304)
INSERT Categorieen (ID,Name,Parent) VALUES (135735,'Pop Art',40688)
INSERT Categorieen (ID,Name,Parent) VALUES (135905,'Brillen en monturen unisex',22490)
INSERT Categorieen (ID,Name,Parent) VALUES (136051,'Leadtek',38776)
INSERT Categorieen (ID,Name,Parent) VALUES (136052,'TomTom',38776)
INSERT Categorieen (ID,Name,Parent) VALUES (136054,'Woonboten',1293)
INSERT Categorieen (ID,Name,Parent) VALUES (136207,'Art House',2288)
INSERT Categorieen (ID,Name,Parent) VALUES (136626,'Vesten',70222)
INSERT Categorieen (ID,Name,Parent) VALUES (136627,'Vesten',74069)
INSERT Categorieen (ID,Name,Parent) VALUES (136628,'Vesten',98323)
INSERT Categorieen (ID,Name,Parent) VALUES (136629,'Vesten',98325)
INSERT Categorieen (ID,Name,Parent) VALUES (136630,'Vesten',98327)
INSERT Categorieen (ID,Name,Parent) VALUES (136631,'Vesten',98329)
INSERT Categorieen (ID,Name,Parent) VALUES (136632,'Nachtkleding',98331)
INSERT Categorieen (ID,Name,Parent) VALUES (136633,'Vesten',98331)
INSERT Categorieen (ID,Name,Parent) VALUES (136634,'Vesten',98333)
INSERT Categorieen (ID,Name,Parent) VALUES (136635,'Vesten',98372)
INSERT Categorieen (ID,Name,Parent) VALUES (136636,'Vesten',98374)
INSERT Categorieen (ID,Name,Parent) VALUES (136639,'Vesten',98376)
INSERT Categorieen (ID,Name,Parent) VALUES (136640,'Vesten',98378)
INSERT Categorieen (ID,Name,Parent) VALUES (136641,'Vesten',98380)
INSERT Categorieen (ID,Name,Parent) VALUES (136642,'Vesten',98382)
INSERT Categorieen (ID,Name,Parent) VALUES (136643,'Vesten',98384)
INSERT Categorieen (ID,Name,Parent) VALUES (136644,'Vesten',98386)
INSERT Categorieen (ID,Name,Parent) VALUES (136645,'Vesten',98388)
INSERT Categorieen (ID,Name,Parent) VALUES (136646,'Vesten',98390)
INSERT Categorieen (ID,Name,Parent) VALUES (136649,'Art nouveau',7478)
INSERT Categorieen (ID,Name,Parent) VALUES (136650,'Design',7478)
INSERT Categorieen (ID,Name,Parent) VALUES (136689,'Israel',9033)
INSERT Categorieen (ID,Name,Parent) VALUES (136690,'New Wave',19483)
INSERT Categorieen (ID,Name,Parent) VALUES (136691,'Nederlands Nieuw-Guinea',40414)
INSERT Categorieen (ID,Name,Parent) VALUES (136692,'Schaken',36684)
INSERT Categorieen (ID,Name,Parent) VALUES (136860,'Werktuigen',18993)
INSERT Categorieen (ID,Name,Parent) VALUES (136883,'Kinderfietsen',22138)
INSERT Categorieen (ID,Name,Parent) VALUES (136889,'Tractors',22138)
INSERT Categorieen (ID,Name,Parent) VALUES (136916,'Poppenkasten en handpoppen',226)
INSERT Categorieen (ID,Name,Parent) VALUES (136933,'Strand- en waterspeelgoed',25960)
INSERT Categorieen (ID,Name,Parent) VALUES (138767,'1890-1919, Jugendstil',25757)
INSERT Categorieen (ID,Name,Parent) VALUES (138769,'Jugendstil',7478)
INSERT Categorieen (ID,Name,Parent) VALUES (138776,'1920-1949, Art déco',25757)
INSERT Categorieen (ID,Name,Parent) VALUES (138778,'Art deco',7478)
INSERT Categorieen (ID,Name,Parent) VALUES (138785,'1950-1959',25757)
INSERT Categorieen (ID,Name,Parent) VALUES (138794,'1960-1969',25757)
INSERT Categorieen (ID,Name,Parent) VALUES (138803,'1970-1979',25757)
INSERT Categorieen (ID,Name,Parent) VALUES (138812,'Vanaf 2000',25757)
INSERT Categorieen (ID,Name,Parent) VALUES (139835,'GPS ontvangers',293)
INSERT Categorieen (ID,Name,Parent) VALUES (139972,'Overige Sega',15110)
INSERT Categorieen (ID,Name,Parent) VALUES (140677,'1990 - 1999',29224)
INSERT Categorieen (ID,Name,Parent) VALUES (140937,'Koptelefoons',14969)
INSERT Categorieen (ID,Name,Parent) VALUES (141286,'Drinkbekers',106769)
INSERT Categorieen (ID,Name,Parent) VALUES (141749,'Groepsreizen',160939)
INSERT Categorieen (ID,Name,Parent) VALUES (141763,'Accessoires',218)
INSERT Categorieen (ID,Name,Parent) VALUES (145519,'Games',147176)
INSERT Categorieen (ID,Name,Parent) VALUES (145520,'Consoles',147176)
INSERT Categorieen (ID,Name,Parent) VALUES (145526,'Accessoires',147176)
INSERT Categorieen (ID,Name,Parent) VALUES (147176,'Nintendo Wii',14616)
INSERT Categorieen (ID,Name,Parent) VALUES (147177,'Accessoires',112823)
INSERT Categorieen (ID,Name,Parent) VALUES (148091,'Estland',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (148092,'Letland',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (148094,'Slovenië',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (148095,'Estland',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (148096,'Litouwen',33388)
INSERT Categorieen (ID,Name,Parent) VALUES (148101,'Kaartjes en proefmonsters',84885)
INSERT Categorieen (ID,Name,Parent) VALUES (148122,'Lastminutereizen',160939)
INSERT Categorieen (ID,Name,Parent) VALUES (148735,'Accordeons',619)
INSERT Categorieen (ID,Name,Parent) VALUES (149492,'Consoles',112823)
INSERT Categorieen (ID,Name,Parent) VALUES (149565,'Partytenten',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (150034,'Amerikaanse auto''s',9801)
INSERT Categorieen (ID,Name,Parent) VALUES (151220,'Lenzen',8297)
INSERT Categorieen (ID,Name,Parent) VALUES (151439,'Overige grote maten',3029)
INSERT Categorieen (ID,Name,Parent) VALUES (151447,'Muiltjes',12104)
INSERT Categorieen (ID,Name,Parent) VALUES (151637,'Bloemen en planten',2032)
INSERT Categorieen (ID,Name,Parent) VALUES (151925,'Badjassen',9817)
INSERT Categorieen (ID,Name,Parent) VALUES (151944,'Vuilnisbakken en pedaalemmers',20626)
INSERT Categorieen (ID,Name,Parent) VALUES (151982,'Papier en knipvellen',111848)
INSERT Categorieen (ID,Name,Parent) VALUES (151991,'Commodore- en amigagames',11988)
INSERT Categorieen (ID,Name,Parent) VALUES (153511,'Trainingspakken',13154)
INSERT Categorieen (ID,Name,Parent) VALUES (153532,'Sapmachines',30329)
INSERT Categorieen (ID,Name,Parent) VALUES (153564,'Sokken',3038)
INSERT Categorieen (ID,Name,Parent) VALUES (153797,'Sokken',3051)
INSERT Categorieen (ID,Name,Parent) VALUES (153946,'Stempels',111848)
INSERT Categorieen (ID,Name,Parent) VALUES (153953,'Kralen',111837)
INSERT Categorieen (ID,Name,Parent) VALUES (153954,'Steen, edelsteen en mineralen',153953)
INSERT Categorieen (ID,Name,Parent) VALUES (153955,'Glas en kristal',153953)
INSERT Categorieen (ID,Name,Parent) VALUES (153956,'Hout',153953)
INSERT Categorieen (ID,Name,Parent) VALUES (153957,'Kunststof',153953)
INSERT Categorieen (ID,Name,Parent) VALUES (153958,'Metaal',153953)
INSERT Categorieen (ID,Name,Parent) VALUES (154024,'Pop 2000 - heden',21727)
INSERT Categorieen (ID,Name,Parent) VALUES (154051,'DVD''s',11233)
INSERT Categorieen (ID,Name,Parent) VALUES (154052,'Klassiek',23275)
INSERT Categorieen (ID,Name,Parent) VALUES (154053,'Pop',23275)
INSERT Categorieen (ID,Name,Parent) VALUES (154054,'Rock',23275)
INSERT Categorieen (ID,Name,Parent) VALUES (155678,'Thuistaps',30329)
INSERT Categorieen (ID,Name,Parent) VALUES (156076,'Transformers',112024)
INSERT Categorieen (ID,Name,Parent) VALUES (156791,'Setjes',70222)
INSERT Categorieen (ID,Name,Parent) VALUES (156792,'Setjes',98323)
INSERT Categorieen (ID,Name,Parent) VALUES (156793,'Setjes',98325)
INSERT Categorieen (ID,Name,Parent) VALUES (156795,'Setjes',98327)
INSERT Categorieen (ID,Name,Parent) VALUES (156796,'Setjes',98329)
INSERT Categorieen (ID,Name,Parent) VALUES (156797,'Setjes',98333)
INSERT Categorieen (ID,Name,Parent) VALUES (156798,'Setjes',98372)
INSERT Categorieen (ID,Name,Parent) VALUES (156799,'Setjes',98374)
INSERT Categorieen (ID,Name,Parent) VALUES (156802,'Setjes',74069)
INSERT Categorieen (ID,Name,Parent) VALUES (156803,'Setjes',98376)
INSERT Categorieen (ID,Name,Parent) VALUES (156805,'Setjes',98378)
INSERT Categorieen (ID,Name,Parent) VALUES (156806,'Setjes',98380)
INSERT Categorieen (ID,Name,Parent) VALUES (156807,'Setjes',98382)
INSERT Categorieen (ID,Name,Parent) VALUES (156808,'Setjes',98386)
INSERT Categorieen (ID,Name,Parent) VALUES (156809,'Setjes',98388)
INSERT Categorieen (ID,Name,Parent) VALUES (156810,'Setjes',98390)
INSERT Categorieen (ID,Name,Parent) VALUES (157276,'Buikdragers',15468)
INSERT Categorieen (ID,Name,Parent) VALUES (157282,'Rugdragers',15468)
INSERT Categorieen (ID,Name,Parent) VALUES (157287,'Draagdoeken',15468)
INSERT Categorieen (ID,Name,Parent) VALUES (157301,'Boxen',2984)
INSERT Categorieen (ID,Name,Parent) VALUES (157310,'Bedjes',2984)
INSERT Categorieen (ID,Name,Parent) VALUES (157318,'Reisbedjes',15468)
INSERT Categorieen (ID,Name,Parent) VALUES (157329,'Eetsets en bestek',106769)
INSERT Categorieen (ID,Name,Parent) VALUES (157347,'Kookboeken en huishouding',267)
INSERT Categorieen (ID,Name,Parent) VALUES (157499,'Fanartikelen en merchandise',11233)
INSERT Categorieen (ID,Name,Parent) VALUES (157550,'McDonalds',34)
INSERT Categorieen (ID,Name,Parent) VALUES (157688,'Tsjechoslowakije',4742)
INSERT Categorieen (ID,Name,Parent) VALUES (157967,'Koffers en reistassen',8503)
INSERT Categorieen (ID,Name,Parent) VALUES (157969,'Kinderkoffers',8503)
INSERT Categorieen (ID,Name,Parent) VALUES (157989,'Koffersloten',8503)
INSERT Categorieen (ID,Name,Parent) VALUES (157991,'Naamplaatjes',8503)
INSERT Categorieen (ID,Name,Parent) VALUES (158626,'Malta',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (158628,'Cyprus',45148)
INSERT Categorieen (ID,Name,Parent) VALUES (159045,'Geocaching',888)
INSERT Categorieen (ID,Name,Parent) VALUES (160043,'Overig vanaf 1975',7903)
INSERT Categorieen (ID,Name,Parent) VALUES (160044,'Noord-Brabant',34628)
INSERT Categorieen (ID,Name,Parent) VALUES (160939,'Vakantiereizen',888)
INSERT Categorieen (ID,Name,Parent) VALUES (168471,'Slowakije',7975)
INSERT Categorieen (ID,Name,Parent) VALUES (179170,'Valuta',179197)
INSERT Categorieen (ID,Name,Parent) VALUES (179171,'Miners',179197)
INSERT Categorieen (ID,Name,Parent) VALUES (179172,'Mining-contracten',179197)
INSERT Categorieen (ID,Name,Parent) VALUES (179197,'Virtueel geld',11116)

GO
ALTER TABLE Categorieen ADD CONSTRAINT FK_ParentCategorie FOREIGN KEY(Parent) REFERENCES Categorieen(ID)