USE iproject9

CREATE TABLE Vraag (
	vraagnummer	INTEGER		NOT NULL,	-- 1
	tekstvraag	CHAR(21)	NOT NULL,

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pk_Vraag PRIMARY KEY (vraagnummer)
)

CREATE TABLE Gebruiker (
	gebruikersnaam		CHAR(10)	NOT NULL,
	voornaam			CHAR(5)		NOT NULL,
	achternaam			CHAR(8)		NOT NULL,
	adresregel1			CHAR(15)	NOT NULL,
	adresregel2			CHAR(15)		NULL,
	postcode			CHAR(7)		NOT NULL,
	plaatsnaam			CHAR(12)	NOT NULL,
	land				CHAR(9)		NOT NULL,
	geboortedatum		CHAR(10)	NOT NULL,
	mailbox				CHAR(18)	NOT NULL,
	wachtwoord			CHAR(9)		NOT NULL,
	vraag				INTEGER		NOT NULL,	-- 1
	antwoordtekst		CHAR(6)		NOT NULL,
	verkoper			BIT			NOT NULL,	-- WAS CHAR(3)

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pk_Gebruiker PRIMARY KEY (gebruikersnaam),
	CONSTRAINT fk_GebruikerVraag FOREIGN KEY (vraag) REFERENCES Vraag(vraagnummer),
		-- Subset Constraint
		/*CONSTRAINT fk_GebruikerGebruikerstelefoon FOREIGN KEY (gebruikersnaam) REFERENCES Gebruikerstelefoon(gebruiker)
			--ON UPDATE,
			--ON DELETE*/
	/*--- Constraint Appendix B - Geldig emailadres ---*/
	CONSTRAINT ckEmail CHECK (mailbox LIKE '%_@__%.__%'),
	/*--- ???Constraint Appendix B - Controle??? ---*/

	/*--- Constraint Appendix B - Unieke gebruikersnaam ---*/
	CONSTRAINT akGebruikersnaam UNIQUE (gebruikersnaam),
	/*--- Constraint Appendix B - Wachtwoord minimaal 7 tekens, bestaande uit letters, cijfers en hoofdlettergevoelig ---*/
	CONSTRAINT ckWachtwoord CHECK (wachtwoord LIKE '%[0-9]%' AND wachtwoord LIKE '%[A-Z]%' AND LEN(wachtwoord) >= 7),
	/*--- Eigen constraint - Geboortedatum <= vandaag ---*/
	CONSTRAINT ckGeboortedatum CHECK (geboortedatum <= CURRENT_TIMESTAMP)
)

CREATE TABLE Gebruikerstelefoon (
	volgnr			INTEGER		NOT NULL,	-- 2
	gebruiker		CHAR(10)	NOT NULL,	-- Gebruikersnaam
	telefoon		CHAR(11)	NOT NULL,

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pk_Gebruikerstelefoon PRIMARY KEY (volgnr, gebruiker),
	CONSTRAINT fk_GebruikerstelefoonGebruiker FOREIGN KEY (gebruiker) REFERENCES Gebruiker(gebruikersnaam)
		--ON UPDATE,
		--ON DELETE
)

CREATE TABLE Rubriek (
	rubrieknummer	INTEGER		NOT NULL,	-- 3
	rubrieknaam		CHAR(24)	NOT NULL,
	rubriek			INTEGER			NULL,	-- 2
	volgnr			INTEGER		NOT NULL,	-- 2

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pk_Rubriek PRIMARY KEY (rubrieknummer),
	CONSTRAINT fk_RubriekRubriek FOREIGN KEY (rubriek) REFERENCES Rubriek(rubrieknummer)
		--ON UPDATE,
		--ON DELETE
)

CREATE TABLE Verkoper (
	gebruiker			CHAR(10)	NOT NULL,	-- Gebruikersnaam
	bank				CHAR(8)			NULL,
	bankrekening		INTEGER			NULL,	-- 7
	controleoptie		CHAR(10)	NOT NULL,
	creditcard			CHAR(19)		NULL,

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pk_Verkoper PRIMARY KEY (gebruiker),
	CONSTRAINT fk_VerkoperGebruiker FOREIGN KEY (gebruiker) REFERENCES Gebruiker(gebruikersnaam),
		--ON UPDATE,
		--ON DELETE,
	CONSTRAINT ckGebruikerIsVerkoper CHECK (gebruiker IN (SELECT gebruikersnaam FROM Gebruiker WHERE verkoper = 'ja')),
	CONSTRAINT ckKaartgebruik CHECK (bankrekening IS NOT NULL AND creditcard IS NOT NULL),
	CONSTRAINT ckControleOptie CHECK (controleoptie IN ('Creditcard', 'Post'))
		-- Subset Constraint
			/*CONSTRAINT fk_VerkoperVoorwerp FOREIGN KEY (gebruiker) REFERENCES Voorwerp(verkoper)
				--ON UPDATE,
				--ON DELETE*/
			/*IN FUNCTIE*/
			/*IF controleoptie LIKE 'Creditcard'
				ALTER TABLE Verkoper
				ALTER COLUMN creditcard CHAR(19) NOT NULL
			  ELSE 
				ALTER TABLE Verkoper
				ALTER COLUMN creditcard CHAR(19) NULL*/
)

CREATE TABLE Voorwerp (
	voorwerpnummer			NUMERIC(10)		NOT NULL,
	titel					CHAR(18)		NOT NULL,
	beschrijving			CHAR(22)		NOT NULL,
	startprijs				CHAR(5)			NOT NULL,
	betalingswijze			CHAR(9)			NOT NULL,
	betalingsinstructie		CHAR(23)			NULL,
	plaatsnaam				CHAR(12)		NOT NULL,
	land					CHAR(9)			NOT NULL,
	looptijd				INTEGER			NOT NULL,	-- 1
	looptijdBeginDag		CHAR(10)		NOT NULL,
	looptijdBeginTijdstip	CHAR(8)			NOT NULL,
	verzendkosten			CHAR(5)				NULL,
	verzendinstructies		CHAR(27)			NULL,
	verkoper				CHAR(10)		NOT NULL,	-- Gebruikersnaam
	koper					CHAR(10)			NULL,	-- Gebruikersnaam
	looptijdEindeDag		CHAR(10)		NOT NULL,
	looptijdEindeTijdstip	CHAR(8)			NOT NULL,
	veilingGesloten			BIT				NOT NULL,	-- WAS CHAR(3)
	verkoopprijs			CHAR(5)				NULL,

	/*--- Constraints Appendix D ---*/
	CONSTRAINT pk_Voorwerp PRIMARY KEY (voorwerpnummer),
	CONSTRAINT fk_VoorwerpVerkoper FOREIGN KEY (verkoper) REFERENCES Verkoper(gebruiker),
		--ON UPDATE,
		--ON DELETE,
	CONSTRAINT fk_VoorwerpGebruiker FOREIGN KEY (koper) REFERENCES Gebruiker(gebruikersnaam),
	-- Subset Constraint
		--ON UPDATE,
		--ON DELETE,
	/*CONSTRAINT fk_VoorwerpVoorwerpInRubriek FOREIGN KEY (voorwerpnummer) REFERENCES VoorwerpInRubriek(voorwerp)
		--ON UPDATE,
		--ON DELETE*/
	CONSTRAINT ckEigenBod CHECK (verkoper NOT LIKE koper)

)

CREATE TABLE Feedback (
	voorwerp			NUMERIC(10)	NOT NULL,
	soortgebruiker		CHAR(8)		NOT NULL,	-- Koper/verkoper
	feedbacksoort		CHAR(8)		NOT NULL,
	dag					CHAR(10)	NOT NULL,
	tijdstip			CHAR(8)		NOT NULL,
	commentaar			CHAR(12)		NULL,

	-- Constraints Appendix D
	CONSTRAINT pk_Feedback PRIMARY KEY (voorwerp, soortgebruiker),
	CONSTRAINT fk_FeedbackVoorwerp FOREIGN KEY (voorwerp) REFERENCES Voorwerp(voorwerpnummer)
		--ON UPDATE,
		--ON DELETE
)

CREATE TABLE Bod (
	voorwerp		NUMERIC(10)	NOT NULL,
	bodbedrag		CHAR(5)		NOT NULL,
	gebruiker		CHAR(10)	NOT NULL,	-- Gebruikersnaam
	boddag			CHAR(10)	NOT NULL,
	bodtijdstip		CHAR(8)		NOT NULL,
	
	-- Constraints Appendix D
	CONSTRAINT pk_Bod PRIMARY KEY (voorwerp, bodbedrag),
	CONSTRAINT fk_BodVoorwerp FOREIGN KEY (voorwerp) REFERENCES Voorwerp(voorwerpnummer),
		--ON UPDATE,
		--ON DELETE,
	CONSTRAINT fk_BodGebruiker FOREIGN KEY (gebruiker) REFERENCES Gebruiker(gebruikersnaam),
	/*CONSTRAINT ckBod CHECK
		(bod > bestanande geboden bedragen AND
		 (IF (huidig hoogste bod >= 1,00 AND huidig hoogste bod <= 49,99)
			verhoging >= 0,50
		 ELSE IF (" 50,00 - 499,99)
			verhoging >= 1.00
		 ELSE IF (" 500,00 - 999,99)
			verhoging >= 5,00
		 ELSE IF (" 1000,00 - 4999,99)
			verhoging >= 10,00
		 ELSE IF (huidig hoogste bod >= 5000,00)
			verhoging >= 50,00))*/
)

CREATE TABLE Bestand (
	filenaam	CHAR(13)		NOT NULL,
	voorwerp	NUMERIC(10)		NOT NULL,

	-- Constraints Appendix D
	CONSTRAINT pk_Bestand PRIMARY KEY (filenaam),
	CONSTRAINT fk_BestandVoorwerp FOREIGN KEY (voorwerp) REFERENCES Voorwerp(voorwerpnummer),
		--ON UPDATE,
		--ON DELETE
	CONSTRAINT ckMaxAfbeeldingen CHECK (COUNT(filenaam) <= 4 AND COUNT(filenaam) >= 1)	-- Maximaal 4 afbeeldingen, minimaal 1
)

CREATE TABLE VoorwerpInRubriek (
	voorwerp				NUMERIC(10)		NOT NULL,
	rubriekOpLaagsteNiveau	INTEGER			NOT NULL,	-- 3

	-- Constraints Appendix D
	CONSTRAINT pk_VoorwerpInRubriek PRIMARY KEY (voorwerp, rubriekOpLaagsteNiveau),
	CONSTRAINT fk_VoorwerpInRubriekVoorwerp FOREIGN KEY (voorwerp) REFERENCES Voorwerp(voorwerpnummer),
		--ON UPDATE,
		--ON DELETE,
	CONSTRAINT fk_VoorwerpInRubriekRubriek FOREIGN KEY (rubriekOpLaagsteNiveau) REFERENCES Rubriek(rubrieknummer)
		--ON UPDATE,
		--ON DELETE
)

PRINT('Tables in iproject9 have been created')