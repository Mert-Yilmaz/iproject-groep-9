USE iproject9

----- ----- ----- -----
--- Droppen tables ---
---- ----- ----- -----
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
-- Cre�ren en droppen functies --
---- ----- ----- ----- ----- ----
/*
IF OBJECT_ID ('fControleerGebruikerIsVerkoper') IS NOT NULL
DROP FUNCTION fControleerGebruikerIsVerkoper

IF OBJECT_ID ('fControleoptieCreditcard') IS NOT NULL
DROP FUNCTION fControleoptieCreditcard

IF OBJECT_ID ('fCKMaxAfbeeldingen') IS NOT NULL
DROP FUNCTION fCKMaxAfbeeldingen
*/
---------------------------------

GO
CREATE FUNCTION fControleerGebruikerIsVerkoper(@gebruiker VARCHAR(10))
RETURNS BIT
AS
BEGIN
	IF (@gebruiker = (SELECT gebruikersnaam FROM Gebruiker WHERE gebruikersnaam = @gebruiker AND verkoper = 1))
		RETURN 1 -- true
	ELSE 
		RETURN 0 -- false
	RETURN 0
END
GO

/*GO
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
CREATE FUNCTION fCKMaxAfbeeldingen(@filenaam CHAR(25), @voorwerp NUMERIC(10))
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
-- Cre�ren  tabellen --
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
	mailbox				CHAR(50)				NOT NULL,	-- WAS CHAR(18)
	wachtwoord			CHAR(100)				NOT NULL,	-- WAS 9
	vraag				INTEGER					NOT NULL,	-- 1
	antwoordtekst		CHAR(100)				NOT NULL,	-- WAS 6
	verkoper			BIT	DEFAULT 0			NOT NULL,	-- WAS CHAR(3)

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
	rubrieknummer	INTEGER		NOT NULL,	-- 3
	rubrieknaam		VARCHAR(40)	NOT NULL,	-- WAS CHAR(24)
	rubriek			INTEGER			NULL,	-- 2
	volgnr			INTEGER			NULL,	-- 2	-- WAS NOT NULL

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
	voorwerpnummer			NUMERIC(10)			NOT NULL,
	titel					CHAR(18)			NOT NULL,
	beschrijving			CHAR(22)			NOT NULL,
	startprijs				NUMERIC(8)			NOT NULL,	-- WAS CHAR(5)
	betalingswijze			CHAR(15)			NOT NULL,	-- WAS 9
	betalingsinstructie		CHAR(30)				NULL,	-- WAS 23
	plaatsnaam				CHAR(12)			NOT NULL,
	land					CHAR(20)			NOT NULL,	-- WAS CHAR(9)
	looptijd				INTEGER	DEFAULT 7	NOT NULL,	-- 1
	looptijdBeginDag		DATE				NOT NULL,	-- WAS CHAR(10)
	looptijdBeginTijdstip	TIME				NOT NULL,	-- WAS CHAR(8)
	verzendkosten			NUMERIC(5)				NULL,	-- WAS CHAR(5)
	verzendinstructies		CHAR(30)				NULL,	-- WAS 27
	verkoper				VARCHAR(20)			NOT NULL,	-- Gebruikersnaam	-- WAS CHAR(10)
	koper					VARCHAR(20)				NULL,	-- Gebruikersnaam	-- WAS CHAR(10)
	looptijdEindeDag		DATE				NOT NULL,	-- WAS CHAR(10)
	looptijdEindeTijdstip	TIME				NOT NULL,	-- WAS CHAR(8)
	veilingGesloten			BIT					NOT NULL,	-- WAS CHAR(3)
	verkoopprijs			NUMERIC(8)				NULL,	-- WAS CHAR(5)

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pkVoorwerp PRIMARY KEY (voorwerpnummer),
	CONSTRAINT fkVoorwerpVerkoper FOREIGN KEY (verkoper) REFERENCES Verkoper(gebruiker)
		ON UPDATE CASCADE
		ON DELETE NO ACTION,
	CONSTRAINT fkVoorwerpGebruiker FOREIGN KEY (koper) REFERENCES Gebruiker(gebruikersnaam)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION,
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
	CONSTRAINT ckLooptijdBeginEind CHECK (looptijdEindeDag >= looptijdBeginDag AND looptijdEindeTijdstip > looptijdBeginTijdstip),
	/*--- Eigen constraint - Startprijs > 1 ---*/
	CONSTRAINT ckStartprijs CHECK (startprijs > 1)
)

CREATE TABLE Feedback (
	voorwerp			NUMERIC(10)	NOT NULL,
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
	voorwerp		NUMERIC(10)	NOT NULL,
	bodbedrag		NUMERIC(8)	NOT NULL,	-- WAS CHAR(5)
	gebruiker		VARCHAR(20)	NOT NULL,	-- Gebruikersnaam, WAS CHAR(10)
	boddag			DATE		NOT NULL,	-- WAS CHAR(10)
	bodtijdstip		TIME		NOT NULL,	-- WAS CHAR(8)
	
	/*--- Constraints Appendix D ---*/
	CONSTRAINT pkBod PRIMARY KEY (voorwerp, bodbedrag),
	CONSTRAINT fkBodVoorwerp FOREIGN KEY (voorwerp) REFERENCES Voorwerp(voorwerpnummer)
		ON UPDATE CASCADE
		ON DELETE NO ACTION,
	CONSTRAINT fkBodGebruiker FOREIGN KEY (gebruiker) REFERENCES Gebruiker(gebruikersnaam)
)

CREATE TABLE Bestand (
	filenaam	CHAR(25)		NOT NULL,	-- WAS CHAR(13)
	voorwerp	NUMERIC(10)		NOT NULL,

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
	voorwerp				NUMERIC(10)		NOT NULL,
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

PRINT('Tables in iproject9 have been created')