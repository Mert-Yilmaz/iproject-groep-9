/* Conversiescript */

/* Users in Gebruiker en Verkoper */
INSERT INTO iproject9.dbo.Gebruiker(gebruikersnaam, voornaam, achternaam, adresregel1, postcode, plaatsnaam, land, geboortedatum, mailbox, wachtwoord, vraag, antwoordtekst, verkoper, actief)
SELECT 	CAST(Username AS VARCHAR(20)) AS gebruikersnaam,
		CAST(Username AS CHAR(15)) AS voornaam,
		CAST(Username AS CHAR(20)) AS achternaam,
		CAST([Location] AS CHAR(28)) + ' 1' AS adresregel1,
		CAST(Postalcode AS CHAR(7)) AS postcode,
		CAST([Location] AS CHAR(15)) AS plaatsnaam,
		CAST([Location] AS CHAR(20)) AS land,
		geboortedatum = CONVERT(DATE, GETDATE()),
		CAST(Username AS VARCHAR(20)) + '@' + CAST(Username AS VARCHAR(20)) + '.com' AS mailbox,
		wachtwoord =  CONVERT(CHAR(100), NEWID()),
		vraag = 1,
		antwoordtekst = CONVERT(CHAR(100), NEWID()),
		verkoper = 1,
		actief = 1
FROM iproject9.dbo.Users

INSERT INTO iproject9.dbo.Verkoper(gebruiker, bank, bankrekening, controleoptie, creditcard)
SELECT	CAST(Username AS VARCHAR(20)) AS gebruiker,
		bank = 'Rabobank',
		bankrekening = 123456,
		controleoptie = 'Creditcard',
		creditcard = '12345-67890'
FROM iproject9.dbo.Users

/*
CREATE TABLE Users ( 
  --Username VARCHAR(200),
  --Postalcode VARCHAR(9),
  --Location VARCHAR(MAX),
  Country VARCHAR(100),
  Rating NUMERIC(4,1) 
)
*/

/* Categorieen in Rubriek */
/*
INSERT INTO iproject9.dbo.Rubriek
SELECT	ID AS rubrieknummer,
		LEFT(Name, 40) AS rubrieknaam,
		Parent AS rubriek
FROM iproject9.dbo.Categorieen
*/

/*
CREATE TABLE Categorieen (
	ID int NOT NULL,
	Name varchar(100) NULL,
	Parent int NULL,
	CONSTRAINT PK_Categorieen PRIMARY KEY (ID)
)
*/

/* Items en Illustraties in Voorwerp, VoorwerpInRubriek Bestand */
INSERT INTO iproject9.dbo.Voorwerp(voorwerpnummer, titel, beschrijving, land, verkoper, startprijs,  betalingswijze, plaatsnaam, looptijdBeginDag, looptijdBeginTijdstip, looptijdEindeDag, looptijdEindeTijdstip, veilingGesloten)
SELECT	CAST(ID AS NUMERIC(20)) AS voorwerpnummer,
		CAST(Titel AS CHAR(18)) AS titel,
		CAST(Beschrijving AS CHAR(22)) AS beschrijving,
		CAST(Locatie AS CHAR(20)) AS land,
		CAST(Verkoper AS VARCHAR(20)) AS verkoper,
		CAST(Prijs AS NUMERIC(20,2)) AS startprijs,
		
		betalingswijze = 'Overmaken', 
		CAST(Locatie AS CHAR(12)) AS plaatsnaam, 
		CONVERT(DATE, GETDATE()) AS looptijdBeginDag,
		CONVERT(TIME, CURRENT_TIMESTAMP) AS looptijdBeginTijd, 
		CONVERT(DATE, DATEADD(day, 7, GETDATE())) AS looptijdEindeDag,
		CONVERT(TIME, CURRENT_TIMESTAMP) AS looptijdEindeTijdstip,
		veilingGesloten = 0
FROM iproject9.dbo.Items

INSERT INTO iproject9.dbo.VoorwerpInRubriek(voorwerp, rubriekOpLaagsteNiveau, rubriekOpHoogsteNiveau)
SELECT	CAST(ID AS NUMERIC(20)) AS voorwerp,
		Categorie AS rubriekOpLaagsteNiveau,
		(SELECT rubriekOpHoogsteNiveau FROM Rubriek WHERE rubriek = 
			(SELECT rubriekOpHoogsteNiveau FROM Rubriek WHERE rubriek = 
				(SELECT rubriekOpHoogsteNiveau FROM Rubriek WHERE rubriek = -1))
FROM iproject9.dbo.Items

/*INSERT INTO iproject9.dbo.Bestand
SELECT	CAST(Thumbnail AS CHAR(25)) AS filenaam,
		CAST(ID AS NUMERIC(10)) AS voorwerp
FROM iproject9.dbo.Items*/

/*
CREATE TABLE Items (
	--ID bigint NOT NULL,
	--Titel varchar(max) NULL,
	--Beschrijving nvarchar(max) NULL,
	--Categorie int NULL,
	Postcode varchar(max) NULL,
	--Locatie varchar(max) NULL,
	Land varchar(max) NULL,
	--Verkoper varchar(max) NULL,
	--Prijs varchar(max) NULL,
	Valuta varchar(max) NULL,
	Conditie varchar(max) NULL,
	--?Thumbnail varchar(max) NULL,
	CONSTRAINT PK_Items PRIMARY KEY (ID),
	CONSTRAINT FK_Items_In_Categorie FOREIGN KEY (Categorie) REFERENCES Categorieen (ID)
)
*/

/* === OF === */
INSERT INTO iproject9.dbo.Bestand
SELECT	CAST(ItemID AS NUMERIC(20)) AS voorwerp,
		CAST(IllustratieFile AS CHAR(25)) AS filenaam
FROM iproject9.dbo.Illustraties

/*
CREATE TABLE Illustraties (
	ItemID bigint NOT NULL,
	IllustratieFile varchar(100) NOT NULL,
    CONSTRAINT PK_ItemPlaatjes PRIMARY KEY (ItemID, IllustratieFile),
	CONSTRAINT [ItemsVoorPlaatje] FOREIGN KEY(ItemID) REFERENCES Items (ID)
)
*/