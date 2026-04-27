/*
=============================== Initiating Database =====================================

Scripts Purpose:
	This script drops Database "RetailDB" if existis and create it.

WARNING:
	If the Database Exists and Holds Data, it's going to be deleted perminantly.
	So, Be sure for making a backup
*/

USE master;

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'RetailDB')
BEGIN
	DROP DATABASE RetailDB;
END;

GO

CREATE DATABASE RetailDB;

GO

USE RetailDB;

GO

CREATE SCHEMA Bronze;

GO

CREATE SCHEMA Silver;

GO

CREATE SCHEMA Gold;

GO
