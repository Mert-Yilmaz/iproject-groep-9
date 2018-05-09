USE iproject9

---- ----- ----- ----- ----- ----
-- Creëren en droppen functies --
---- ----- ----- ----- ----- ----
IF OBJECT_ID ('fControleerGebruikerIsVerkoper') IS NOT NULL
DROP FUNCTION fControleerGebruikerIsVerkoper

IF OBJECT_ID ('fControleoptieCreditcard') IS NOT NULL
DROP FUNCTION fControleoptieCreditcard

IF OBJECT_ID ('fCKMaxAfbeeldingen') IS NOT NULL
DROP FUNCTION fCKMaxAfbeeldingen

IF OBJECT_ID ('fCKBodEnMinimaleVerhoging') IS NOT NULL
DROP FUNCTION fCKBodEnMinimaleVerhoging

IF OBJECT_ID ('fCKWachtwoord') IS NOT NULL
DROP FUNCTION fCKWachtwoord
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
BEGIN
	IF (@controleoptie LIKE 'Creditcard')
		ALTER TABLE Verkoper
		ALTER COLUMN creditcard CHAR(19) NOT NULL
	ELSE
		ALTER TABLE Verkoper
		ALTER COLUMN creditcar CHAR(19) NULL
END
GO*/

GO
CREATE FUNCTION fCKMaxAfbeeldingen(@filenaam CHAR(25))
RETURNS BIT
AS
BEGIN
	IF (COUNT(@filenaam) <= 4 AND COUNT(@filenaam) >= 1)
		RETURN 1 -- true
	ELSE
		RETURN 0 -- false
	RETURN 0
END
GO

GO
CREATE FUNCTION fCKBodEnMinimaleVerhoging(@bodbedrag NUMERIC(5), @voorwerp NUMERIC(10))
RETURNS BIT
AS
BEGIN
	IF (((SELECT MAX(bodbedrag) FROM Bod WHERE voorwerp = @voorwerp) >= 1.00 AND (SELECT MAX(bodbedrag) FROM Bod WHERE voorwerp = @voorwerp) <= 49.99) AND @bodbedrag-(SELECT MAX(bodbedrag) FROM Bod WHERE voorwerp = @voorwerp) >= 0.50)
		RETURN 1 -- true
	ELSE IF (((SELECT MAX(bodbedrag) FROM Bod WHERE voorwerp = @voorwerp) >= 50.00 AND (SELECT MAX(bodbedrag) FROM Bod WHERE voorwerp = @voorwerp) <= 499.99) AND @bodbedrag-(SELECT MAX(bodbedrag) FROM Bod WHERE voorwerp = @voorwerp) >= 1.00)
		RETURN 1 -- true
	ELSE IF (((SELECT MAX(bodbedrag) FROM Bod WHERE voorwerp = @voorwerp) >= 500.00 AND (SELECT MAX(bodbedrag) FROM Bod WHERE voorwerp = @voorwerp) <= 999.99) AND @bodbedrag-(SELECT MAX(bodbedrag) FROM Bod WHERE voorwerp = @voorwerp) >= 5.00)
		RETURN 1 -- true
	ELSE IF (((SELECT MAX(bodbedrag) FROM Bod WHERE voorwerp = @voorwerp) >= 1000.00 AND (SELECT MAX(bodbedrag) FROM Bod WHERE voorwerp = @voorwerp) <= 4999.99) AND @bodbedrag-(SELECT MAX(bodbedrag) FROM Bod WHERE voorwerp = @voorwerp) >= 10.00)
		RETURN 1 -- true
	ELSE IF ((SELECT MAX(bodbedrag) FROM Bod WHERE voorwerp = @voorwerp) >= 5000.00 AND @bodbedrag-(SELECT MAX(bodbedrag) FROM Bod WHERE voorwerp = @voorwerp) >= 50.00)
		RETURN 1 -- true
	ELSE IF ((SELECT bodbedrag FROM Bod WHERE voorwerp = @voorwerp) = NULL AND @bodbedrag >= 0.01 AND @bodbedrag > (SELECT startprijs FROM Voorwerp WHERE voorwerpnummer = @voorwerp))
		RETURN 1 -- true
	ELSE
		RETURN 0 -- false
	RETURN 0
END
GO

/* HOOFDLETTERS CHECKEN! */
/*GO
CREATE FUNCTION fCKWachtwoord(@wachtwoord CHAR(16))
RETURNS BIT
AS
BEGIN
	IF((SELECT * FROM Gebruiker WHERE @wachtwoord LIKE '%[A-Z]%' COLLATE Latin1_General_CS_AS
	/*SELECT
		CASE
			WHEN @wachtwoord LIKE '%[A-Z]%' COLLATE Latin1_General_CS_AI AND
				 @wachtwoord LIKE '%[a-z]%' COLLATE Latin1_General_CS_AI AND
				 @wachtwoord LIKE '%[0-9]%' AND
				 LEN(@wachtwoord) >= 7
					THEN 1
			ELSE 0
		END*/
	/*IF (@wachtwoord LIKE '%[0-9]%' AND @wachtwoord LIKE '%[a-z]%' COLLATE Latin1_General_CS_AI AND @wachtwoord LIKE '%[A-Z]%' COLLATE Latin1_General_CS_AI AND LEN(@wachtwoord) >= 7)
		RETURN 1
	ELSE
		RETURN 0
	RETURN 0*/
END
GO*/
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
	gebruikersnaam		VARCHAR(10)	NOT NULL,	-- WAS CHAR(10)
	voornaam			CHAR(15)	NOT NULL,	-- WAS 5
	achternaam			CHAR(8)		NOT NULL,
	adresregel1			CHAR(15)	NOT NULL,
	adresregel2			CHAR(15)		NULL,
	postcode			CHAR(7)		NOT NULL,
	plaatsnaam			CHAR(12)	NOT NULL,
	land				CHAR(9)		NOT NULL,
	geboortedatum		DATE		NOT NULL,	-- WAS CHAR(10)
	mailbox				CHAR(25)	NOT NULL,	-- WAS CHAR(18)
	wachtwoord			CHAR(16)	NOT NULL,	-- WAS 9
	vraag				INTEGER		NOT NULL,	-- 1
	antwoordtekst		CHAR(20)	NOT NULL,	-- WAS 6
	verkoper			BIT			NOT NULL,	-- WAS CHAR(3)

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pkGebruiker PRIMARY KEY (gebruikersnaam),
	CONSTRAINT fkGebruikerVraag FOREIGN KEY (vraag) REFERENCES Vraag(vraagnummer),
	-- Subset Constraint!!!
		/*CONSTRAINT fkGebruikerGebruikerstelefoon FOREIGN KEY (gebruikersnaam) REFERENCES Gebruikerstelefoon(gebruiker)
		--ON UPDATE,
		--ON DELETE*/
	/*--- Constraint Appendix B - Geldig emailadres ---*/
	CONSTRAINT ckEmail CHECK (mailbox LIKE '%_@__%.__%'),
	/*--- Constraint Appendix B - Unieke gebruikersnaam ---*/
	CONSTRAINT akGebruikersnaam UNIQUE (gebruikersnaam),
	/*--- Constraint Appendix B - Wachtwoord minimaal 7 tekens, bestaande uit letters, cijfers en hoofdlettergevoelig ---*/
	------------------WACHTWOORD HOOFDLETTER GEVOELIG M.B.V. FUNCTIE----------------------
		--CONSTRAINT ckWachtwoord CHECK (dbo.fCKWachtwoord(wachtwoord) = 1),
		CONSTRAINT ckWachtwoord CHECK (wachtwoord LIKE '%[0-9]%' AND wachtwoord LIKE '%[A-Z]%' AND LEN(wachtwoord) >= 7),
	/*--- Eigen constraint - Geboortedatum <= vandaag ---*/
	CONSTRAINT ckGeboortedatum CHECK (geboortedatum <= CURRENT_TIMESTAMP)
)

CREATE TABLE Gebruikerstelefoon (
	volgnr			INTEGER		NOT NULL,	-- 2
	gebruiker		VARCHAR(10)	NOT NULL,	-- Gebruikersnaam	-- WAS CHAR(10)
	telefoon		CHAR(11)	NOT NULL,

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pkGebruikerstelefoon PRIMARY KEY (volgnr, gebruiker),
	CONSTRAINT fkGebruikerstelefoonGebruiker FOREIGN KEY (gebruiker) REFERENCES Gebruiker(gebruikersnaam)
		--ON UPDATE,
		--ON DELETE
)

CREATE TABLE Rubriek (
	rubrieknummer	INTEGER		NOT NULL,	-- 3
	rubrieknaam		CHAR(40)	NOT NULL,	-- WAS 24
	rubriek			INTEGER			NULL,	-- 2
	volgnr			INTEGER			NULL,	-- 2	-- WAS NOT NULL

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pkRubriek PRIMARY KEY (rubrieknummer),
	--CONSTRAINT fkRubriekRubriek FOREIGN KEY (rubriek) REFERENCES Rubriek(rubrieknummer)
		--ON UPDATE,
		--ON DELETE
)

CREATE TABLE Verkoper (
	gebruiker			VARCHAR(10)	NOT NULL,	-- Gebruikersnaam	-- WAS CHAR(10)
	bank				CHAR(8)			NULL,
	bankrekening		INTEGER			NULL,	-- 7
	controleoptie		CHAR(10)	NOT NULL,
	creditcard			CHAR(19)		NULL,

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pkVerkoper PRIMARY KEY (gebruiker),
	CONSTRAINT fkVerkoperGebruiker FOREIGN KEY (gebruiker) REFERENCES Gebruiker(gebruikersnaam),
		--ON UPDATE,
		--ON DELETE,
	CONSTRAINT ckGebruikerIsVerkoper CHECK (dbo.fControleerGebruikerIsVerkoper(gebruiker) = 1),
	CONSTRAINT ckKaartgebruik CHECK (bankrekening IS NOT NULL AND creditcard IS NOT NULL),
	CONSTRAINT ckControleOptie CHECK (controleoptie IN ('Creditcard', 'Post'))
		-- Subset Constraint!!!
		/*CONSTRAINT fkVerkoperVoorwerp FOREIGN KEY (gebruiker) REFERENCES Voorwerp(verkoper)
			--ON UPDATE,
			--ON DELETE*/
	--CONSTRAINT ckControleOptie CHECK (dbo.fControleoptieCreditcard(controleoptie)),
)

CREATE TABLE Voorwerp (
	voorwerpnummer			NUMERIC(10)			NOT NULL,
	titel					CHAR(18)			NOT NULL,
	beschrijving			CHAR(22)			NOT NULL,
	startprijs				NUMERIC(8)			NOT NULL,	-- WAS CHAR(5)
	betalingswijze			CHAR(15)			NOT NULL,	-- WAS 9
	betalingsinstructie		CHAR(30)				NULL,	-- WAS 23
	plaatsnaam				CHAR(12)			NOT NULL,
	land					CHAR(9)				NOT NULL,
	looptijd				INTEGER	DEFAULT 7	NOT NULL,	-- 1
	looptijdBeginDag		DATE				NOT NULL,	-- WAS CHAR(10)
	looptijdBeginTijdstip	TIME				NOT NULL,	-- WAS CHAR(8)
	verzendkosten			NUMERIC(5)				NULL,	-- WAS CHAR(5)
	verzendinstructies		CHAR(30)				NULL,	-- WAS 27
	verkoper				VARCHAR(10)			NOT NULL,	-- Gebruikersnaam	-- WAS CHAR(10)
	koper					VARCHAR(10)				NULL,	-- Gebruikersnaam	-- WAS CHAR(10)
	looptijdEindeDag		DATE				NOT NULL,	-- WAS CHAR(10)
	looptijdEindeTijdstip	TIME				NOT NULL,	-- WAS CHAR(8)
	veilingGesloten			BIT					NOT NULL,	-- WAS CHAR(3)
	verkoopprijs			NUMERIC(8)				NULL,	-- WAS CHAR(5)

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pkVoorwerp PRIMARY KEY (voorwerpnummer),
	CONSTRAINT fkVoorwerpVerkoper FOREIGN KEY (verkoper) REFERENCES Verkoper(gebruiker),
		--ON UPDATE,
		--ON DELETE,
	CONSTRAINT fkVoorwerpGebruiker FOREIGN KEY (koper) REFERENCES Gebruiker(gebruikersnaam),
		--ON UPDATE,
		--ON DELETE,
	-- Subset Constraint!!!
		/*CONSTRAINT fkVoorwerpVoorwerpInRubriek FOREIGN KEY (voorwerpnummer) REFERENCES VoorwerpInRubriek(voorwerp)
			--ON UPDATE,
			--ON DELETE*/
	CONSTRAINT ckEigenBod CHECK (verkoper NOT LIKE koper),
	/*--- Constraint Appendix B - Looptijd ---*/
	CONSTRAINT ckLooptijd CHECK (looptijd = 1 OR looptijd = 3 OR looptijd = 5 OR looptijd = 7 OR looptijd = 10),

	/*--- Constraint Appendix B - Hogere bieding ---
		--CONSTRAINT ckHogereBieding CHECK (verkoopprijs > startprijs), STAAT IN FUNCTIE (IN COMMENTAAR BIJ BOD?)*/
	/*--- Constraint Appendix B - Veiling sluiten ---
		if looptijd voorbij
			verander veilingGesloten = 1*/

	/*--- Eigen constraint - Looptijd dag en tijd niet groter dan vandaag ---*/						-- Aparte functie voor if(looptijdbegindag == today) check tijdstip <= nu
	CONSTRAINT ckLooptijdDagEnTijd CHECK (looptijdBeginDag <= (CONVERT (DATE, GETDATE())) /*AND looptijdBeginTijdstip <= (CONVERT (TIME, GETDATE()))*/),
	/*--- Eigen constraint - Looptijd begin < eind ---*/
	CONSTRAINT ckLooptijdBeginEind CHECK (looptijdEindeDag >= looptijdBeginDag AND looptijdEindeTijdstip > looptijdBeginTijdstip)
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
	CONSTRAINT fkFeedbackVoorwerp FOREIGN KEY (voorwerp) REFERENCES Voorwerp(voorwerpnummer),
		--ON UPDATE,
		--ON DELETE
	CONSTRAINT ckFeedbacksoort CHECK (feedbacksoort IN ('Negatief', 'Neutraal', 'Positief')),
	CONSTRAINT ckSoortgebruiker CHECK (soortgebruiker IN ('Koper', 'Verkoper')),
	/*--- Eigen constraint - Dag en tijd niet groter dan vandaag ---*/
	CONSTRAINT ckDagEnTijdstip CHECK (dag <= (CONVERT (DATE, GETDATE()))/* AND tijdstip < (CONVERT (TIME, GETDATE()))*/)
)

CREATE TABLE Bod (
	voorwerp		NUMERIC(10)	NOT NULL,
	bodbedrag		NUMERIC(8)	NOT NULL,	-- WAS CHAR(5)
	gebruiker		VARCHAR(10)	NOT NULL,	-- Gebruikersnaam, WAS CHAR(10)
	boddag			DATE		NOT NULL,	-- WAS CHAR(10)
	bodtijdstip		TIME		NOT NULL,	-- WAS CHAR(8)
	
	/*--- Constraints Appendix D ---*/
	CONSTRAINT pkBod PRIMARY KEY (voorwerp, bodbedrag),
	CONSTRAINT fkBodVoorwerp FOREIGN KEY (voorwerp) REFERENCES Voorwerp(voorwerpnummer),
		--ON UPDATE,
		--ON DELETE,
	CONSTRAINT fkBodGebruiker FOREIGN KEY (gebruiker) REFERENCES Gebruiker(gebruikersnaam),
	/*CONSTRAINT ckBod CHECK (dbo.fCKBodEnMinimaleVerhoging(bodbedrag, voorwerp) = 1),*/
	/*--- Eigen constraint - Bod dag en tijd niet groter dan vandaag ---*/
	CONSTRAINT ckBodDagEnTijd CHECK (boddag <= (CONVERT (DATE, GETDATE())) /*AND bodtijdstip < (CONVERT (TIME, GETDATE()))*/)
)

CREATE TABLE Bestand (
	filenaam	CHAR(25)		NOT NULL,	-- WAS CHAR(13)
	voorwerp	NUMERIC(10)		NOT NULL,

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pkBestand PRIMARY KEY (filenaam),
	CONSTRAINT fkBestandVoorwerp FOREIGN KEY (voorwerp) REFERENCES Voorwerp(voorwerpnummer),
		--ON UPDATE,
		--ON DELETE
	CONSTRAINT ckMaxAfbeeldingen CHECK (dbo.fCKMaxAfbeeldingen(filenaam) = 1),	-- Maximaal 4 afbeeldingen, minimaal 1
	/*--- Eigen constraint - Bestandtypes: jpg, png, jpeg en bmp ---*/
	CONSTRAINT ckBestandtype CHECK (filenaam LIKE '%.jpg' OR filenaam LIKE '%.png' OR filenaam LIKE '%.jpeg' OR filenaam LIKE '%.bmp')
)

CREATE TABLE VoorwerpInRubriek (
	voorwerp				NUMERIC(10)		NOT NULL,
	rubriekOpLaagsteNiveau	INTEGER			NOT NULL,	-- 3
	rubriekOpHoogsteNiveau	INTEGER			NOT NULL,	-- Zelf bij gemaakt

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pkVoorwerpInRubriek PRIMARY KEY (voorwerp, rubriekOpLaagsteNiveau, rubriekOpHoogsteNiveau),
	CONSTRAINT fkVoorwerpInRubriekVoorwerp FOREIGN KEY (voorwerp) REFERENCES Voorwerp(voorwerpnummer),
		--ON UPDATE,
		--ON DELETE,
	CONSTRAINT fkVoorwerpInRubriekRubriekLaagst FOREIGN KEY (rubriekOpLaagsteNiveau) REFERENCES Rubriek(rubrieknummer),
		--ON UPDATE,
		--ON DELETE
	CONSTRAINT fkVoorwerpInRubriekRubriekHoogst	FOREIGN KEY (rubriekOpHoogsteNiveau) REFERENCES Rubriek(rubrieknummer)
		--ON UPDATE,
		--ON DELETE
)

PRINT('Tables in iproject9 have been created')