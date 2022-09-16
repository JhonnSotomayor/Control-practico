-- Creando base de datos

CREATE DATABASE dbPetHappy
GO

-- Poner en uso la base de datos

USE dbPetHappy
GO

-- Creamos la tabla cliente

CREATE TABLE CLIENTE (
    IDCLI int IDENTITY (1,1),
    DNICLI varchar(8),
    USUCLI varchar(50),
    NOMCLI varchar(50),
    APECLI varchar(50), 
    CORREOCLI varchar(50),
    CELCLI char(9), 
    DIRCLI varchar(50),
    CODUBI char(6), 
    CONSTRAINT CLIENTE_pk PRIMARY KEY (IDCLI)
)
GO

-- Creamos la tabla empleado
CREATE TABLE EMPLEADO (
    IDEMP int IDENTITY (1,1),
    DNIEMP char(8),
    USUEMP varchar(50),
    NOMEMP varchar(50),
    APEEMP varchar(50),
    CORREOEMP varchar(50),
    CELEMP char(9),
    DIREMP varchar(50),
    CODUBI char(6),
    CONSTRAINT EMPLEADO_pk PRIMARY KEY (IDEMP)
)
GO

-- Creamos la tabla PRODUCTO
CREATE TABLE PRODUCTO (
    IDPRO int IDENTITY (1,1),
    NOMPRO varchar(50),
    PREPRO decimal(8,2),
    MARPRO varchar(50),
    STOCKPRO int,
    CONSTRAINT PRODUCTO_pk PRIMARY KEY (IDPRO)
)
GO

-- Creamos la tabla UBIGEO
CREATE TABLE UBIGEO (
    CODUBI char(6),
    PROUBI varchar(50),
    DEPUBI varchar(50),
    DISUBI varchar(50),
    CONSTRAINT UBIGEO_pk PRIMARY KEY (CODUBI)
)
GO
-- Creamos la tabla VENTA
CREATE TABLE VENTA (
    IDVENT int IDENTITY (1,1),
    FECHVENT  date DEFAULT GETDATE(),
    IDCLI int,
    IDEMP int,
    CONSTRAINT VENTA_pk PRIMARY KEY (IDVENT)
)
GO

-- Creamos la tabla VENTA_dETALLE
CREATE TABLE VENTA_DETALLE (
    IDVENTDET  int IDENTITY (1,1),
    CANTVENTDET int,
    IDVENT int,
    IDPRO int,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY (IDVENTDET)
)
GO

-- RELACIONES
-- Relacion entre ubigeo a cliente
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI)  
GO

-- Relacion entre ubigeo a empleado
ALTER TABLE EMPLEADO ADD CONSTRAINT EMPLEADO_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI)  
GO

-- Relacion entre cliente y venta
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE
    FOREIGN KEY (IDCLI)
    REFERENCES CLIENTE (IDCLI)  
GO

-- Relacion entre PRODUCTO Y VENTA DETALLE
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_PRODUCTO
    FOREIGN KEY (IDPRO)
    REFERENCES PRODUCTO (IDPRO)  
GO

-- Relacion entre VENTA_DETALLE y VENTA 
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_VENTA
    FOREIGN KEY (IDVENT)
    REFERENCES VENTA (IDVENT)  
GO


-- Relacion entre VENTA Y EMPLEADO
ALTER TABLE VENTA ADD CONSTRAINT VENTA_EMPLEADO
    FOREIGN KEY (IDEMP)
    REFERENCES EMPLEADO (IDEMP)  
GO


-- INSERTAR REGISTROS DE UBIGEO
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150501','LIMA','CA�ETE','SAN VICENTE');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150502','LIMA','CA�ETE','ASIA');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150503','LIMA','CA�ETE','CALANGO');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150504','LIMA','CA�ETE','CERRO AZUL');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150505','LIMA','CA�ETE','CHILCA');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150506','LIMA','CA�ETE','COAYLLO');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150507','LIMA','CA�ETE','IMPERIAL');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150508','LIMA','CA�ETE','LUNAHUANA');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150509','LIMA','CA�ETE','MALA');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150510','LIMA','CA�ETE','NUEVO IMPERIAL');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150511','LIMA','CA�ETE','PACARAN');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150512','LIMA','CA�ETE','QUILMANA');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150513','LIMA','CA�ETE','SAN ANTONIO');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150514','LIMA','CA�ETE','SAN LUIS');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150515','LIMA','CA�ETE','SANTA CRUZ DE FLORES');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150516','LIMA','CA�ETE','ZU�IGA');
GO

-- Listar registro de ubigeo

Select * from Ubigeo
GO

