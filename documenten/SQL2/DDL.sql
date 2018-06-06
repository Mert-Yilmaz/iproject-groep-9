/* Versie 2 */
USE iproject9

----- ----- ----- -----
--- Droppen tables ---
---- ----- ----- -----
IF OBJECT_ID('dbo.Illustraties') IS NOT NULL
	DROP TABLE Illustraties;
IF OBJECT_ID('dbo.Items') IS NOT NULL
	DROP TABLE Items;
IF OBJECT_ID('dbo.Categorieen') IS NOT NULL
	DROP TABLE Categorieen;
IF OBJECT_ID('dbo.Users') IS NOT NULL
	DROP TABLE Users;
IF OBJECT_ID('dbo.VoorwerpInRubriek') IS NOT NULL
	DROP TABLE VoorwerpInRubriek;
IF OBJECT_ID('dbo.Bestand') IS NOT NULL
	DROP TABLE Bestand;
IF OBJECT_ID('dbo.Bod') IS NOT NULL
	DROP TABLE Bod;
IF OBJECT_ID('dbo.Feedback') IS NOT NULL
	DROP TABLE Feedback;
IF OBJECT_ID('dbo.Voorwerp') IS NOT NULL
	DROP TABLE Voorwerp;
IF OBJECT_ID('dbo.Verkoper') IS NOT NULL
	DROP TABLE Verkoper;
IF OBJECT_ID('dbo.Rubriek') IS NOT NULL
	DROP TABLE Rubriek;
IF OBJECT_ID('dbo.Gebruikerstelefoon') IS NOT NULL
	DROP TABLE Gebruikerstelefoon;
IF OBJECT_ID('dbo.Gebruiker') IS NOT NULL
	DROP TABLE Gebruiker;
IF OBJECT_ID('dbo.Vraag') IS NOT NULL
	DROP TABLE Vraag;

---- ----- ----- ----- ----- ----
-- Creëren en droppen functies --
---- ----- ----- ----- ----- ----

IF OBJECT_ID ('fControleerGebruikerIsVerkoper') IS NOT NULL
DROP FUNCTION fControleerGebruikerIsVerkoper

IF OBJECT_ID ('fCheckVeiling') IS NOT NULL
DROP FUNCTION fCheckVeiling

/*IF OBJECT_ID ('fControleoptieCreditcard') IS NOT NULL
DROP FUNCTION fControleoptieCreditcard*/

IF OBJECT_ID ('fCKMaxAfbeeldingen') IS NOT NULL
DROP FUNCTION fCKMaxAfbeeldingen

---------------------------------

GO
CREATE FUNCTION fControleerGebruikerIsVerkoper(@gebruiker VARCHAR(20))
RETURNS BIT
AS
BEGIN
	IF (@gebruiker = (SELECT gebruikersnaam FROM Gebruiker WHERE gebruikersnaam = @gebruiker AND verkoper = 1 AND actief = 1))
		RETURN 1 -- true
	ELSE 
		RETURN 0 -- false
	RETURN 0
END
GO

GO
CREATE FUNCTION fCheckVeiling(@voorwerpNummer NUMERIC(20, 0), @dag date, @tijd time)
RETURNS BIT
AS
BEGIN
	IF (@dag >= (SELECT CONVERT(date, GETDATE())) AND @tijd >= (SELECT CONVERT(time(0), getDate())))
	BEGIN
	UPDATE Voorwerp SET veilingGesloten = 1, isToegestaan = 0 WHERE voorwerpnummer = @voorwerpNummer
	END
RETURN 0
END
GO

/*GO -- In php
CREATE FUNCTION fControleoptieCreditcard(@controleoptie CHAR(10))
AS
BEGIN
	IF (@controleoptie LIKE 'Creditcard')
		BEGIN
			ALTER TABLE Verkoper
			ALTER COLUMN creditcard CHAR(19) NOT NULL
		END
	ELSE
		BEGIN
			ALTER TABLE Verkoper
			ALTER COLUMN creditcard CHAR(19) NULL
		END
END
GO*/

GO
CREATE FUNCTION fCKMaxAfbeeldingen(@filenaam CHAR(25), @voorwerp NUMERIC(20))
RETURNS BIT
AS
BEGIN
	IF ((SELECT COUNT(@filenaam) FROM Bestand WHERE @voorwerp = voorwerp) >= 1 AND (SELECT COUNT(@filenaam) FROM Bestand WHERE @voorwerp = voorwerp) <=4)
		RETURN 1 -- true
	ELSE
		RETURN 0 -- false
	RETURN 0
END
GO
---------------------------------

----- ----- ----- -----
-- Creëren  tabellen --
----- ----- ----- -----
CREATE TABLE Vraag (
	vraagnummer	INTEGER		NOT NULL,	-- 1
	tekstvraag	CHAR(40)	NOT NULL,	-- WAS 21

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pkVraag PRIMARY KEY (vraagnummer)
)

CREATE TABLE Gebruiker (
	gebruikersnaam		VARCHAR(20)				NOT NULL,	-- WAS CHAR(10)
	voornaam			CHAR(15)				NOT NULL,	-- WAS 5
	achternaam			CHAR(20)				NOT NULL,	-- WAS 8
	adresregel1			CHAR(30)				NOT NULL,	-- WAS 15
	adresregel2			CHAR(15) DEFAULT NULL		NULL,
	postcode			CHAR(7)					NOT NULL,
	plaatsnaam			CHAR(15)				NOT NULL,	-- WAS 12
	land				CHAR(20)				NOT NULL,	-- WAS 9
	geboortedatum		DATE					NOT NULL,	-- WAS CHAR(10)
	mailbox				VARCHAR(50)				NOT NULL,	-- WAS CHAR(18)
	wachtwoord			CHAR(100)				NOT NULL,	-- WAS 9
	vraag				INTEGER					NOT NULL,	-- 1
	antwoordtekst		CHAR(100)				NOT NULL,	-- WAS 6
	verkoper			BIT	DEFAULT 0			NOT NULL,	-- WAS CHAR(3)
	code				VARCHAR(32) DEFAULT 0	NOT NULL,	-- EIGEN
	actief				BIT DEFAULT 0			NOT NULL,	-- EIGEN
	isToegestaan		BIT DEFAULT 1			NOT NULL,	-- EIGEN
	verkopercode		VARCHAR(32) DEFAULT NULL	NULL,	-- EIGEN

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pkGebruiker PRIMARY KEY (gebruikersnaam),
	CONSTRAINT fkGebruikerVraag FOREIGN KEY (vraag) REFERENCES Vraag(vraagnummer)
		ON UPDATE CASCADE
		ON DELETE NO ACTION,
	-- Subset Constraint!!!
		/*CONSTRAINT fkGebruikerGebruikerstelefoon FOREIGN KEY (gebruikersnaam) REFERENCES Gebruikerstelefoon(gebruiker)
			--ON UPDATE
			--ON DELETE,*/
	/*--- Constraint Appendix B - Geldig emailadres ---*/
	CONSTRAINT ckEmail CHECK (mailbox LIKE '%_@__%.__%'),
	/*--- Eigen constraint - Uniek email adres ---*/
	CONSTRAINT akEmail UNIQUE (mailbox),
	/*--- Constraint Appendix B - Unieke gebruikersnaam ---*/
	CONSTRAINT akGebruikersnaam UNIQUE (gebruikersnaam),
	/*--- Constraint Appendix B - Wachtwoord minimaal 7 tekens, bestaande uit letters, cijfers --> Hoofdletters via site ---*/
	CONSTRAINT ckWachtwoord CHECK (wachtwoord LIKE '%[0-9]%' AND wachtwoord LIKE '%[A-Z]%' AND LEN(wachtwoord) >= 7),
	/*--- Eigen constraint - Geboortedatum <= vandaag ---*/
	CONSTRAINT ckGeboortedatum CHECK (geboortedatum <= CURRENT_TIMESTAMP)
)

CREATE TABLE Gebruikerstelefoon (
	volgnr			INTEGER		NOT NULL,	-- 2
	gebruiker		VARCHAR(20)	NOT NULL,	-- Gebruikersnaam	-- WAS CHAR(10)
	telefoon		CHAR(11)	NOT NULL,

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pkGebruikerstelefoon PRIMARY KEY (volgnr, gebruiker),
	CONSTRAINT fkGebruikerstelefoonGebruiker FOREIGN KEY (gebruiker) REFERENCES Gebruiker(gebruikersnaam)
		ON UPDATE CASCADE
		ON DELETE NO ACTION
)

CREATE TABLE Rubriek (
	rubrieknummer	INTEGER			NOT NULL,	-- 3
	rubrieknaam		VARCHAR(40)		NOT NULL,	-- WAS CHAR(24)
	rubriek			INTEGER				NULL,	-- 2
	volgnr			INTEGER				NULL,	-- 2	-- WAS NOT NULL
	isToegestaan	BIT DEFAULT 1	NOT NULL,	-- EIGEN

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pkRubriek PRIMARY KEY (rubrieknummer),
	CONSTRAINT fkRubriekRubriek FOREIGN KEY (rubriek) REFERENCES Rubriek(rubrieknummer)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
)

CREATE TABLE Verkoper (
	gebruiker			VARCHAR(20)	NOT NULL,	-- Gebruikersnaam	-- WAS CHAR(10)
	bank				VARCHAR(8)		NULL,	-- WAS CHAR
	bankrekening		INTEGER			NULL,	-- 7
	controleoptie		VARCHAR(10)	NOT NULL,	-- WAS CHAR
	creditcard			VARCHAR(19)		NULL,	-- WAS CHAR

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pkVerkoper PRIMARY KEY (gebruiker),
	CONSTRAINT fkVerkoperGebruiker FOREIGN KEY (gebruiker) REFERENCES Gebruiker(gebruikersnaam)
		ON UPDATE CASCADE
		ON DELETE NO ACTION,
	-- Subset Constraint?!!!
		/*CONSTRAINT fkVerkoperVoorwerp FOREIGN KEY (gebruiker) REFERENCES Voorwerp(verkoper)
			--ON UPDATE,
			--ON DELETE*/
	CONSTRAINT ckGebruikerIsVerkoper CHECK (dbo.fControleerGebruikerIsVerkoper(gebruiker) = 1),
	CONSTRAINT ckKaartgebruik CHECK (bankrekening IS NOT NULL AND creditcard IS NOT NULL),
	CONSTRAINT ckControleOptie CHECK (controleoptie IN ('creditcard', 'post'))
	--CONSTRAINT ckControleOptie CHECK (dbo.fControleoptieCreditcard(controleoptie))
)

CREATE TABLE Voorwerp (
	voorwerpnummer			NUMERIC(20)			NOT NULL,	-- WAS 10
	titel					CHAR(18)			NOT NULL,
	beschrijving			CHAR(22)			NOT NULL,
	startprijs				NUMERIC(20,2)		NOT NULL,	-- WAS CHAR(5)
	betalingswijze			CHAR(15)			NOT NULL,	-- WAS 9
	betalingsinstructie		CHAR(30)				NULL,	-- WAS 23
	plaatsnaam				CHAR(12)			NOT NULL,
	land					CHAR(20)			NOT NULL,	-- WAS CHAR(9)
	looptijd				INTEGER	DEFAULT 7	NOT NULL,	-- 1
	looptijdBeginDag		DATE				NOT NULL,	-- WAS CHAR(10)
	looptijdBeginTijdstip	TIME				NOT NULL,	-- WAS CHAR(8)
	verzendkosten			NUMERIC(20,2)			NULL,	-- WAS CHAR(5)
	verzendinstructies		CHAR(30)				NULL,	-- WAS 27
	verkoper				VARCHAR(20)			NOT NULL,	-- Gebruikersnaam	-- WAS CHAR(10)
	koper					VARCHAR(20)				NULL,	-- Gebruikersnaam	-- WAS CHAR(10)
	looptijdEindeDag		DATE				NOT NULL,	-- WAS CHAR(10)
	looptijdEindeTijdstip	TIME				NOT NULL,	-- WAS CHAR(8)
	veilingGesloten			BIT					NOT NULL,	-- WAS CHAR(3)
	verkoopprijs			NUMERIC(20,2)			NULL,	-- WAS CHAR(5)
	isToegestaan			BIT DEFAULT 1		NOT NULL,	-- EIGEN
	isMailVerstuurd			BIT DEFAULT 0		NOT NULL,	-- EIGEN

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pkVoorwerp PRIMARY KEY (voorwerpnummer),
	CONSTRAINT fkVoorwerpVerkoper FOREIGN KEY (verkoper) REFERENCES Verkoper(gebruiker)
		ON UPDATE CASCADE
		ON DELETE NO ACTION,
	CONSTRAINT fkVoorwerpGebruiker FOREIGN KEY (koper) REFERENCES Gebruiker(gebruikersnaam)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION,
	CONSTRAINT ckCheckVeiling CHECK (dbo.fCheckVeiling(voorwerpnummer, looptijdEindeDag, looptijdEindeTijdstip) = 1),
	-- Subset Constraint!!!
		/*CONSTRAINT fkVoorwerpVoorwerpInRubriek FOREIGN KEY (voorwerpnummer) REFERENCES VoorwerpInRubriek(voorwerp)
			--ON UPDATE,
			--ON DELETE*/
	CONSTRAINT ckEigenBod CHECK (verkoper NOT LIKE koper),
	/*--- Constraint Appendix B - Looptijd ---*/
	CONSTRAINT ckLooptijd CHECK (looptijd = 1 OR looptijd = 3 OR looptijd = 5 OR looptijd = 7 OR looptijd = 10),
	/*--- Constraint Appendix B - Hogere bieding ---*/
	CONSTRAINT ckHogereBieding CHECK (verkoopprijs >= startprijs),
	/*--- Eigen constraint - Looptijd begin < eind ---*/
	CONSTRAINT ckLooptijdBeginEind CHECK (looptijdEindeDag >= looptijdBeginDag AND looptijdEindeTijdstip >= looptijdBeginTijdstip),
	/*--- Eigen constraint - Startprijs > 1 ---*/
	CONSTRAINT ckStartprijs CHECK (startprijs > 1)
)

CREATE TABLE Feedback (
	voorwerp			NUMERIC(20)	NOT NULL,	-- WAS 10
	soortgebruiker		CHAR(8)		NOT NULL,
	feedbacksoort		CHAR(8)		NOT NULL,
	dag					DATE		NOT NULL,	-- WAS CHAR(10)
	tijdstip			TIME		NOT NULL,	-- WAS CHAR(8)
	commentaar			CHAR(12)		NULL,

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pkFeedback PRIMARY KEY (voorwerp, soortgebruiker),
	CONSTRAINT fkFeedbackVoorwerp FOREIGN KEY (voorwerp) REFERENCES Voorwerp(voorwerpnummer)
		ON UPDATE CASCADE
		ON DELETE NO ACTION,
	CONSTRAINT ckFeedbacksoort CHECK (feedbacksoort IN ('negatief', 'neutraal', 'positief')),
	CONSTRAINT ckSoortgebruiker CHECK (soortgebruiker IN ('koper', 'verkoper'))
)

CREATE TABLE Bod (
	voorwerp		NUMERIC(20)		NOT NULL,	-- WAS 10
	bodbedrag		NUMERIC(20,2)	NOT NULL,	-- WAS CHAR(5)
	gebruiker		VARCHAR(20)		NOT NULL,	-- Gebruikersnaam, WAS CHAR(10)
	boddag			DATE			NOT NULL,	-- WAS CHAR(10)
	bodtijdstip		TIME			NOT NULL,	-- WAS CHAR(8)
	
	/*--- Constraints Appendix D ---*/
	CONSTRAINT pkBod PRIMARY KEY (voorwerp, bodbedrag),
	CONSTRAINT fkBodVoorwerp FOREIGN KEY (voorwerp) REFERENCES Voorwerp(voorwerpnummer)
		ON UPDATE CASCADE
		ON DELETE NO ACTION,
	CONSTRAINT fkBodGebruiker FOREIGN KEY (gebruiker) REFERENCES Gebruiker(gebruikersnaam)
)

CREATE TABLE Bestand (
	filenaam	CHAR(25)		NOT NULL,	-- WAS CHAR(13)
	voorwerp	NUMERIC(20)		NOT NULL,	-- WAS 10

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pkBestand PRIMARY KEY (filenaam),
	CONSTRAINT fkBestandVoorwerp FOREIGN KEY (voorwerp) REFERENCES Voorwerp(voorwerpnummer)
		ON UPDATE CASCADE
		ON DELETE NO ACTION,
	CONSTRAINT ckMaxAfbeeldingen CHECK (dbo.fCKMaxAfbeeldingen(filenaam, voorwerp) = 1),
	/*--- Eigen constraint - Bestandtypes: jpg, png, jpeg en bmp ---*/
	CONSTRAINT ckBestandtype CHECK (filenaam LIKE '%.jpg' OR filenaam LIKE '%.png' OR filenaam LIKE '%.jpeg' OR filenaam LIKE '%.bmp')
)

CREATE TABLE VoorwerpInRubriek (
	voorwerp				NUMERIC(20)		NOT NULL,	-- WAS 10
	rubriekOpLaagsteNiveau	INTEGER			NOT NULL,	-- 3
	rubriekOpHoogsteNiveau	INTEGER			NOT NULL,	-- Zelf bij gemaakt

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pkVoorwerpInRubriek PRIMARY KEY (voorwerp, rubriekOpLaagsteNiveau, rubriekOpHoogsteNiveau),
	CONSTRAINT fkVoorwerpInRubriekVoorwerp FOREIGN KEY (voorwerp) REFERENCES Voorwerp(voorwerpnummer)
		ON UPDATE CASCADE
		ON DELETE NO ACTION,
	CONSTRAINT fkVoorwerpInRubriekRubriekLaagst FOREIGN KEY (rubriekOpLaagsteNiveau) REFERENCES Rubriek(rubrieknummer)
		ON UPDATE CASCADE
		ON DELETE NO ACTION,
	CONSTRAINT fkVoorwerpInRubriekRubriekHoogst	FOREIGN KEY (rubriekOpHoogsteNiveau) REFERENCES Rubriek(rubrieknummer)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
)

/* Tabellen voor conversie */
CREATE TABLE Users ( 
  Username VARCHAR(200),
  Postalcode VARCHAR(9),
  Location VARCHAR(MAX),
  Country VARCHAR(100),
  Rating NUMERIC(4,1) 
)

CREATE TABLE Categorieen (
	ID int NOT NULL,
	Name varchar(100) NULL,
	Parent int NULL,
	CONSTRAINT PK_Categorieen PRIMARY KEY (ID)
)

CREATE TABLE Items (
	ID bigint NOT NULL,
	Titel varchar(max) NULL,
	Beschrijving nvarchar(max) NULL,
	Categorie int NULL,
	Postcode varchar(max) NULL,
	Locatie varchar(max) NULL,
	Land varchar(max) NULL,
	Verkoper varchar(max) NULL,
	Prijs varchar(max) NULL,
	Valuta varchar(max) NULL,
	Conditie varchar(max) NULL,
	Thumbnail varchar(max) NULL,
	CONSTRAINT PK_Items PRIMARY KEY (ID),
	CONSTRAINT FK_Items_In_Categorie FOREIGN KEY (Categorie) REFERENCES Categorieen (ID)
)

CREATE TABLE Illustraties (
	ItemID bigint NOT NULL,
	IllustratieFile varchar(100) NOT NULL,
    CONSTRAINT PK_ItemPlaatjes PRIMARY KEY (ItemID, IllustratieFile),
	CONSTRAINT [ItemsVoorPlaatje] FOREIGN KEY(ItemID) REFERENCES Items (ID)
)

CREATE INDEX IX_Items_Categorie ON Items (Categorie)
CREATE INDEX IX_Categorieen_Parent ON Categorieen (Parent)

PRINT('Tables in iproject9 have been created')