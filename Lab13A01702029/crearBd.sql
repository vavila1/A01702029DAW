DROP TABLE Entregan
DROP TABLE Materiales
Drop TABLE Proyectos
DROP TABLE Proveedores

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Materiales')



DROP TABLE Materiales 

CREATE TABLE Materiales 
( 
  Clave numeric(5) not null, 
  Descripcion varchar(50), 
  Costo numeric (8,2) 
)

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proveedores')

DROP TABLE Proveedores

CREATE TABLE Proveedores 
( 
  RFC char(13) not null, 
  RazonSocial varchar(50) 
) 
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proyectos')

DROP TABLE Proyectos

CREATE TABLE Proyectos 
( 
  Numero numeric(5) not null, 
  Denominacion varchar(50) 
) 
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Entregan')

DROP TABLE Entregan

CREATE TABLE Entregan 
( 
  Clave numeric(5) not null, 
  RFC char(13) not null, 
  Numero numeric(5) not null, 
  Fecha DateTime not null, 
  Cantidad numeric (8,2) 
) 

BULK INSERT a1702029.a1702029.[Materiales]
   FROM 'e:\wwwroot\rcortese\materiales.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )
BULK INSERT a1702029.a1702029.[Proyectos]
   FROM 'e:\wwwroot\rcortese\proyectos.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )
BULK INSERT a1702029.a1702029.[Proveedores]
   FROM 'e:\wwwroot\rcortese\proveedores.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )
SET DATEFORMAT dmy
BULK INSERT a1702029.a1702029.[Entregan]
   FROM 'e:\wwwroot\rcortese\entregan.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )
      
 INSERT INTO Materiales values(1000, 'xxx', 1000) 
 Delete from Materiales where Clave = 1000 and Costo = 1000
 ALTER TABLE Materiales add constraint llaveMateriales PRIMARY KEY (Clave)
 sp_helpconstraint Entregan 
 ALTER TABLE Proveedores add constraint llaveProveedores PRIMARY KEY (RFC)
  sp_helpconstraint Proveedores
 ALTER TABLE Proyectos add constraint llaveProyectos
 PRIMARY KEY (Numero)
  sp_helpconstraint Proyectos
  ALTER TABLE Entregan add constraint llavesEntregan
 PRIMARY KEY (Clave,RFC,Numero,Fecha)
 sp_helpconstraint Entregan
 
 INSERT INTO Entregan values (0, 'xxx', 0, '1-jan-02', 0)
 Delete from Entregan where Clave = 0 
 ALTER TABLE entregan add constraint cfentreganclave 
  foreign key (clave) references materiales(clave)
 ALTER TABLE entregan add constraint cfentregannumero 
  foreign key (Numero) references Proyectos(Numero)
ALTER TABLE entregan add constraint cfentreganrfc 
  foreign key (RFC) references Proveedores(RFC)
  sp_helpconstraint Entregan
 INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), 0)
 Delete from Entregan where Cantidad = 0 
 ALTER TABLE entregan add constraint cantidad check (cantidad > 0)