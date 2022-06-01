CREATE TABLE AUCTION (
    Id integer,
    Expiry string,
    VehicleId integer,
    WinnerId integer,
    EmployeeId integer,
    PRIMARY KEY (Id)
) ;

CREATE TABLE Address (
    Id integer,
    Street string,
    StreetNumber string,
    City string,
    PostalCode string,
    Country string,
    PRIMARY KEY (Id)
) ;

CREATE TABLE BID (
    Id integer,
    Bid double,
    AuctionId integer,
    CustomerId integer,
    Creation string,
    PRIMARY KEY (Id)
) ;

CREATE TABLE CUSTOMER (
    Id integer,
    Name string,
    Surname string,
    AddressId integer,
    PRIMARY KEY (Id)
) ;

CREATE TABLE DEALERSHIP (
    Id integer,
    Name string,
    AddressId integer,
    PRIMARY KEY (Id)
) ;

CREATE TABLE EMPLOYEE (
    Id integer,
    Name string,
    Surname string,
    AddressId integer,
    DealershipId integer,
    PRIMARY KEY (Id)
) ;

CREATE TABLE FEEDBACK (
    Id integer,
    Description string,
    EmployeeId integer,
    CustomerId integer,
    PRIMARY KEY (Id)
) ;

CREATE TABLE INVOICE (
    Id integer,
    Selldate string,
    EmployeeId integer,
    CustomerId integer,
    TIN string,
    PRIMARY KEY (Id)
) ;

CREATE TABLE INVOICE_ITEM (
    Id integer,
    NetValue double,
    Tax double,
    GrossValue double,
    InvoiceId integer,
    VehicleId integer,
    PRIMARY KEY (Id)
) ;

CREATE TABLE Parking (
    Id integer,
    AddressId integer,
    DealershipId integer,
    PRIMARY KEY (Id)
) ;

CREATE TABLE VEHICLE (
    Id integer,
    Name string,
    Manufacturedate string,
    Manufacturer string,
    CountryOfOrigin string,
    OwnersCount integer,
    ParkingId integer,
    PRIMARY KEY (Id)
) ;
