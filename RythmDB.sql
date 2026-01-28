CREATE TABLE IF NOT EXISTS Artist
(
    ArtistId  INT PRIMARY KEY,
    Name    TEXT
);

CREATE TABLE IF NOT EXISTS Album
(
    AlbumId  INT PRIMARY KEY,
    Title    TEXT,
    ArtistId INT,
    FOREIGN KEY (ArtistId) REFERENCES Artist (ArtistId)
);

CREATE TABLE IF NOT EXISTS Playlist
(
    PlaylistId  INT PRIMARY KEY,
    Name    TEXT
);

CREATE TABLE IF NOT EXISTS Genre
(
    GenreId  INT PRIMARY KEY,
    Name    TEXT
);

CREATE TABLE IF NOT EXISTS MediaType
(
    MediaTypeId  INT PRIMARY KEY,
    Name    TEXT
);

CREATE TABLE IF NOT EXISTS Track
(
    TrackId      INT PRIMARY KEY,
    Name         TEXT,
    AlbumId      INT,
    MediaTypeId  INT,
    GenreID      INT,
    Composer     TEXT,
    Milliseconds INT,
    Bytes        INT,
    UnitPrice    REAL,
    FOREIGN KEY (AlbumId) REFERENCES Album (AlbumId),
    FOREIGN KEY (MediaTypeId) REFERENCES MediaType (MediaTypeId),
    FOREIGN KEY (GenreID) REFERENCES Genre (GenreId)
);

CREATE TABLE IF NOT EXISTS PlaylistTrack
(
    PlaylistId INT,
    TrackId    INT,
    FOREIGN KEY (PlaylistId) REFERENCES Playlist (PlaylistId),
    FOREIGN KEY (TrackId) REFERENCES Track (TrackId)
);

CREATE TABLE IF NOT EXISTS Employee
(
    EmployeeId INT PRIMARY KEY,
    LastName   TEXT,
    FirstName  TEXT,
    Title      TEXT,
    ReportsTo  INT,
    BirthDate  DATETIME,
    HireDate   DATETIME,
    Address    TEXT,
    City       TEXT,
    State      TEXT,
    Country    TEXT,
    PostalCode TEXT,
    Phone      TEXT,
    Fax        TEXT,
    Email      TEXT
);

CREATE TABLE IF NOT EXISTS Customer
(
    CustomerId   INT PRIMARY KEY,
    FirstName    TEXT,
    LastName     TEXT,
    Company      TEXT,
    Address      TEXT,
    City         TEXT,
    State        TEXT,
    Country      TEXT,
    PostalCode   TEXT,
    Phone        TEXT,
    Fax          TEXT,
    Email        TEXT,
    SupportRepId INT
);

CREATE TABLE IF NOT EXISTS Invoice
(
    InvoiceId    INT PRIMARY KEY,
    CustomerId   INT,
    InvoiceDate   DATETIME,
    FirstName    TEXT,
    BillingAddress      TEXT,
    BillingCity         TEXT,
    BillingState        TEXT,
    BillingCountry      TEXT,
    BillingPostalCode   TEXT,
    Total        REAL,
    FOREIGN KEY (CustomerId) REFERENCES Customer (CustomerId)
);

CREATE TABLE IF NOT EXISTS InvoiceLine
(
    InvoiceLineId    INT PRIMARY KEY,
    InvoiceId   INT,
    TrackId   INT,
    UnitPrice    REAL,
    Quantity      INT,
    FOREIGN KEY (InvoiceId) REFERENCES Invoice (InvoiceId),
    FOREIGN KEY (TrackId) REFERENCES Track (TrackId),
    FOREIGN KEY (UnitPrice) REFERENCES Track (UnitPrice)
);