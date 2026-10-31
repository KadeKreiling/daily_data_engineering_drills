CREATE TABLE dbo.providerIdentity(
    providerBusinessID int IDENTITY(1,1) PRIMARY KEY,
    legacyID int,
    sourceSystem VARCHAR(150)
);

CREATE TABLE dbo.dimProvider(
    providerKey int IDENTITY(1,1) PRIMARY KEY,
    providerBusinessID int NOT NULL,
    providerFirstName VARCHAR(100) NOT NULL,
    providerLastName VARCHAR(100) NOT NULL,
    specialty VARCHAR(100) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE,
    isCurrent BIT NOT NULL DEFAULT 1,

    CONSTRAINT FK_dimProvider_providerIdentity
        FOREIGN KEY (providerBusinessID)
        REFERENCES dbo.providerIdentity(providerBusinessID)
);

CREATE UNIQUE INDEX UX_dimProvider_Current
ON dbo.dimProvider(providerBusinessID)
WHERE isCurrent = 1;
