-- Creando base de datos
CREATE DATABASE dbPetHappy
GO

-- Poner en uso la base de datos
USE dbPetHappy
GO

-- Creamos la tabla cliente
CREATE TABLE CLIENTE (
    IDCLI int IDENTITY (1,1),
    CEDUCLI char(9),
    NOMCLI varchar(50),
    APECLI varchar(50),
    CORREOCLI varchar(50),
    CONCLI varchar(50),
    ESTCLI CHAR(1) DEFAULT 'A',
    CELCLI char(9),
    CODCUT char(5),
    DIRCLI varchar(50),
    CONSTRAINT CLIENTE_pk PRIMARY KEY (IDCLI)
)
GO

-- Creamos la tabla empleado
CREATE TABLE EMPLEADO (
    IDEMP int IDENTITY (1,1),
    CEDUEMP char(9),
    NOMEMP varchar(50),
    APEEMP varchar(50),
    CORREOEMP varchar(50),
    CONEMP varchar(50),
    ESTEMP CHAR(1) DEFAULT 'A',
    CELEMP char(9),
    CODCUT char(5),
    DIREMP varchar(50),
    CONSTRAINT EMPLEADO_pk PRIMARY KEY (IDEMP)
)
GO

-- Creamos la tabla producto
CREATE TABLE PRODUCTO (
    IDPRO int IDENTITY (1,1),
    NOMPRO varchar(50),
	DESCPRO varchar (300),
    PREPRO decimal(8,2),
    MARPRO varchar(50),
    STOCKPRO int,
    CONSTRAINT PRODUCTO_pk PRIMARY KEY (IDPRO)
)
GO

-- Creamos la tabla ubigeo
CREATE TABLE CUT (
    CODCUT char(5),
    REGCUT varchar(50),
    PROCUT varchar(50),
    COMCUT varchar(50),
    CONSTRAINT CUT_pk PRIMARY KEY (CODCUT)
)
GO

-- Creamos la tabla venta
CREATE TABLE VENTA (
    IDVENT int IDENTITY (1,1),
    FECHVENT  date DEFAULT GETDATE(),
    IDCLI int,
    IDEMP int,
    CONSTRAINT VENTA_pk PRIMARY KEY (IDVENT)
);

-- Creamos la tabla venta_detalle
CREATE TABLE VENTA_DETALLE (
    IDVENTDET  int IDENTITY (1,1),
    CANTVENTDET int,
    IDVENT int,
    IDPRO int,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY (IDVENTDET)
)
GO

-- RELACIONES

-- Relacion entre CUT a CLIENTE
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_CUT 
FOREIGN KEY (CODCUT)
    REFERENCES CUT (CODCUT)

-- Relacion entre CUT a EMPLEADO
ALTER TABLE EMPLEADO ADD CONSTRAINT EMPLEADO_CUT
    FOREIGN KEY (CODCUT)
    REFERENCES CUT (CODCUT)  
GO

-- Relacion entre CLIENTE a VENTA
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE
    FOREIGN KEY (IDCLI)
    REFERENCES CLIENTE (IDCLI)  
GO

-- Relacion entre PRODUCTO a VENTA DETALLE
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_PRODUCTO
    FOREIGN KEY (IDPRO)
    REFERENCES PRODUCTO (IDPRO)  
GO

-- Relacion entre VENTA_DETALLE a VENTA 
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_VENTA
    FOREIGN KEY (IDVENT)
    REFERENCES VENTA (IDVENT)  
GO


-- Relacion entre VENTA a EMPLEADO
ALTER TABLE VENTA ADD CONSTRAINT VENTA_EMPLEADO
    FOREIGN KEY (IDEMP)
    REFERENCES EMPLEADO (IDEMP)  
GO


-- Inserción de datos

-- Insertamos datos a la tabla CUT
INSERT INTO CUT
(CODCUT, REGCUT, PROCUT, COMCUT)
VALUES
('13110', 'Metropolitana de Santiago', 'Santiago', 'La Florida'),
('13132', 'Metropolitana de Santiago', 'Santiago', 'Vitacura'),
('13601', 'Metropolitana de Santiago', 'Talagante', 'Talagante'),
('13130', 'Metropolitana de Santiago', 'Santiago', 'San Miguel'),
('13107', 'Metropolitana de Santiago', 'Santiago', 'Huechuraba'),
('13125', 'Metropolitana de Santiago', 'Santiago', 'Quilicura'),
('13401', 'Metropolitana de Santiago', 'Maipo', 'San Bernardo'),
('13113', 'Metropolitana de Santiago', 'Santiago', 'La Reina'),
('13105', 'Metropolitana de Santiago', 'Santiago', 'El Bosque'),
('13301', 'Metropolitana de Santiago', 'Chacabuco', 'Colina')
GO


--Listamos los datos de la tabla CUT
select * from CUT
GO


-- Insertamos datos a la tabla CLIENTE
INSERT INTO CLIENTE
(CEDUCLI, NOMCLI, APECLI, CORREOCLI, CONCLI, CELCLI, CODCUT, DIRCLI )
VALUES
('100000001', 'Damian', 'Carriles', 'Damian.Carriles@vallegrande.edu.pe', 'Dami123sfas', '992970657', '13110', 'La Florida Calle 14 "Los Guerreros"'),
('100000002', 'Jeremy', 'Canales', 'Jeremy.Canales@gmail.com', 'jeremyCAN12asga', '992970346', '13132', 'Vitacura calle 12 Jr Perú'),
('100000003', 'Carlos', 'Martinez', 'Carlos.Martinez@vallegrande.edu.pe', 'car.marti251', '992974478', '13601', 'Talagante Calle 07 "Los Libertadores"'),
('100000004', 'Leonel', 'Messi', 'leo.Messi@gmail.com', 'Messi10.Goat', '995584478', '13130', 'San Miguel calle 10 El Campeón'),
('100000005', 'Karin', 'Benzema', 'Karin.Benzema@vallegrande.edu.pe', 'K09Benzema.Goal', '995524778', '13107', 'Huechuraba Jr Los Caimanes'),
('100000006', 'Luis', 'García', 'Luis.Garcia@hotmail.com', 'Garsa1900abc', '995522898', '13125', '"Quilicura" calle 09 La Libertad'),
('100000007', 'Carmen', 'Zapata', 'Carmen.Zapata@gmail.com', 'CarmenABC@', '993892898', '13401', '"San Bernardo" Jr Los Héroes'),
('100000008', 'Jhonn', 'Sotomayor', 'Jhonn.sotomayor@vallegrande.edu.pe', 'Jhonn123ASD', '925817281', '13113', '"La Reina" Calle Sur km 12'),
('100000009', 'Paolo', 'Maldini', 'Paolo.Maldini@gmail.com', 'Maldini.CAP.01', '996355181', '13105', 'El Bosque cruze con "La Reina" calle 22'),
('100000010', 'Miriam', 'Yactaco', 'Miriam.Yactaco@hotmail.com', 'M.Yactaco123', '983381974', '13301', 'Colina entrada a "La Colmena"')
GO



--Listamos los datos de la tabla CLIENTE
select * from CLIENTE
GO



-- Insertamos datos a la tabla EMPLEADO
INSERT INTO EMPLEADO
(CEDUEMP, NOMEMP, APEEMP, CORREOEMP, CONEMP, CELEMP, CODCUT, DIREMP )
VALUES
('100000011', 'Roy', 'Oliveros', 'Roy.Oliveros@vallegrande.edu.pe', 'R.Oliveroszxc123', '992970657', '13110', 'La Florida Calle 14 "Los Guerreros"'),
('100000012', 'Jeremy', 'Canales', 'Jeremy.Canales@gmail.com', 'jeremyCAN12asga', '992970346', '13132', 'Vitacura calle 12 Jr Perú'),
('100000013', 'Carlos', 'Martinez', 'Carlos.Martinez@vallegrande.edu.pe', 'car.marti251', '992974478', '13601', 'Talagante Calle 07 "Los Libertadores"'),
('100000014', 'Leonel', 'Messi', 'leo.Messi@gmail.com', 'Messi10.Goat', '995584478', '13130', 'San Miguel calle 10 El Campeón'),
('100000015', 'Karin', 'Benzema', 'Karin.Benzema@vallegrande.edu.pe', 'K09Benzema.Goal', '995524778', '13107', 'Huechuraba Jr Los Caimanes'),
('100000016', 'Luis', 'García', 'Luis.Garcia@hotmail.com', 'Garsa1900abc', '995522898', '13125', '"Quilicura" calle 09 La Libertad'),
('100000017', 'Carmen', 'Zapata', 'Carmen.Zapata@gmail.com', 'CarmenABC@', '993892898', '13401', '"San Bernardo" Jr Los Héroes'),
('100000018', 'Jhonn', 'Sotomayor', 'Jhonn.sotomayor@vallegrande.edu.pe', 'Jhonn123ASD', '925817281', '13113', '"La Reina" Calle Sur km 12'),
('100000019', 'Paolo', 'Maldini', 'Paolo.Maldini@gmail.com', 'Maldini.CAP.01', '996355181', '13105', 'El Bosque cruze con "La Reina" calle 22'),
('100000020', 'Miriam', 'Yactaco', 'Miriam.Yactaco@hotmail.com', 'M.Yactaco123', '983381974', '13301', 'Colina entrada a "La Colmena"')
GO


--Listamos los datos de la tabla EMPLEADO
select * from EMPLEADO
GO



-- Insertamos datos a la tabla PRODUCTO
INSERT INTO PRODUCTO
(NOMPRO, DESCPRO, PREPRO, MARPRO, STOCKPRO)
VALUES
('DRONTAL CATS', 'Antiparasitario interno de amplio espectro especialmente para gatos. Una tableta por cada 4 kilos, repetir a los 21 días.', '30.00', 'BAYER', '10'),
('ANTIPARASITARIO FRONTLINE SPRAY', 'Antiparasitario Frontline Spray es un antiparasitario para perros y gatos de acción inmediata, que actúa en las primeras 4 horas tras su aplicación, matando pulgas adultas, piojos y garrapatas.', '26.00', 'DRAG PHARMA', '18'),
('REVOLUTION GATO', 'Revolution Gato es un parasiticida de amplio espectro, que permite el control y tratamiento de lombrices intestinales, Dirofilarias, acaros de la sarna, pulgas adultas, larvas y huevos en perros y gatos.', '19.70', 'ZOETIS', '30'),
('POWER GATO', 'La pipeta para gatos, que brinda máxima protección contra las pulgas. Power Gatos viene en 2 presentaciones distintas correspondiente al peso de la mascota', '8.00', 'BROUWER', '06'),
('NATURALISTIC MEAT BALLS SALMON Y CAMOTE', 'Naturalistic Meatball Salmon & Sweet Potato son snack para perros con forma de albóndiga y sabroso sabor a salmón y camote. ', '4.00', 'NATURALISTIC', '15'),
('NATURALISTIC CHICKEN SUSHI', 'Naturalistic Chicken Sushi son premios para perros formulados con pechuga de pollo y bacalao en proporciones balanceadas.',  '3.00', 'NATURALISTIC', '07'),
('CHURU DOG POLLO', 'Tiene un alto contenido de humedad que los caninos necesitan para la salud.', '2.70', 'GRUPOMOR', '09'),
('DINGO MUNCHY STIX', 'Dingo Munchy Stix 50 pk son palitos masticables muy nutritivos y apetecibles, adecuado para perros de todas las edades y razas, relleno con pollo y otros ingredientes de alta calidad.', '2.60', 'GRUPOMOR ', '13'),
('ADIESTRADOR DE CACHORROS', 'Ayuda al cachorro a hacer sus necesidades en el lugar que nosotros deseamos.', '15.00', 'HAGEN ', '23'),
('ADAPTIL KIT ENCHUFE', 'Adaptil difusor ayuda a fortalecer la relación con tu perro creando un ambiente en el hogar de tranquilidad donde tu perro será feliz.', '39.00', ' DRAG PHARMA', '17')
GO


--Listamos los datos de la tabla PRODUCTO
select * from PRODUCTO
GO



-- Insertamos datos a la tabla VENTA
INSERT INTO VENTA
(IDCLI, IDEMP)
VALUES
('1', '1'),
('2', '2'),
('3', '3'),
('4', '4'),
('5', '5'),
('6', '6'),
('7', '7'),
('8', '8'),
('9', '9'),
('10', '10')
GO


--Listamos los datos de la tabla VENTA
select * from VENTA
GO



-- Insertamos datos a la tabla VENTA_DETALLE
INSERT INTO VENTA_DETALLE
(CANTVENTDET, IDVENT, IDPRO)
VALUES
('12', '1', '1'),
('12', '2', '2'),
('06', '3', '3'),
('04', '4', '4'),
('13', '5', '5'),
('15', '6', '6'),
('22', '7', '7'),
('11', '8', '8'),
('02', '9', '9'),
('03', '10', '10')
GO


--Listamos los datos de la tabla VENTA_DETALLE
select * from VENTA_DETALLE
GO
