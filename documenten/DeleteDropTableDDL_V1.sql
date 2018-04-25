USE iproject9

-- Maakt tabellen leeg
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

-- Verwijder tabellen
/*
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
*/