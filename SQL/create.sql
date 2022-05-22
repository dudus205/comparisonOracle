-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-05-22 06:43:21.241

-- tables
-- Table: AUCTION
CREATE TABLE AUCTION (
    Id integer  NOT NULL,
    Expiry date  NOT NULL,
    VehicleId integer  NOT NULL,
    WinnerId integer  NOT NULL,
    EmployeeId integer  NOT NULL,
    CONSTRAINT AUCTION_pk PRIMARY KEY (Id)
) ;

-- Table: Address
CREATE TABLE Address (
    Id integer  NOT NULL,
    Street varchar2(50)  NOT NULL,
    StreetNumber varchar2(10)  NOT NULL,
    City varchar2(50)  NOT NULL,
    PostalCode varchar2(10)  NOT NULL,
    Country varchar2(50)  NOT NULL,
    CONSTRAINT Address_pk PRIMARY KEY (Id)
) ;

-- Table: BID
CREATE TABLE BID (
    Id integer  NOT NULL,
    Bid number(19,4)  NOT NULL,
    AuctionId integer  NOT NULL,
    CustomerId integer  NOT NULL,
    Creation date  NOT NULL,
    CONSTRAINT BID_pk PRIMARY KEY (Id)
) ;

-- Table: CUSTOMER
CREATE TABLE CUSTOMER (
    Id integer  NOT NULL,
    Name varchar2(50)  NOT NULL,
    Surname varchar2(50)  NOT NULL,
    AddressId integer  NOT NULL,
    CONSTRAINT CUSTOMER_pk PRIMARY KEY (Id)
) ;

-- Table: DEALERSHIP
CREATE TABLE DEALERSHIP (
    Id integer  NOT NULL,
    Name varchar2(50)  NOT NULL,
    AddressId integer  NOT NULL,
    CONSTRAINT DEALERSHIP_pk PRIMARY KEY (Id)
) ;

-- Table: EMPLOYEE
CREATE TABLE EMPLOYEE (
    Id integer  NOT NULL,
    Name varchar2(50)  NOT NULL,
    Surname varchar2(50)  NOT NULL,
    AddressId integer  NOT NULL,
    DealershipId integer  NOT NULL,
    CONSTRAINT EMPLOYEE_pk PRIMARY KEY (Id)
) ;

-- Table: FEEDBACK
CREATE TABLE FEEDBACK (
    Id integer  NOT NULL,
    Description varchar2(500)  NOT NULL,
    EmployeeId integer  NOT NULL,
    CustomerId integer  NOT NULL,
    CONSTRAINT FEEDBACK_pk PRIMARY KEY (Id)
) ;

-- Table: INVOICE
CREATE TABLE INVOICE (
    Id integer  NOT NULL,
    SellDate date  NOT NULL,
    EmployeeId integer  NOT NULL,
    CustomerId integer  NOT NULL,
    TIN varchar2(10)  NOT NULL,
    CONSTRAINT INVOICE_pk PRIMARY KEY (Id)
) ;

-- Table: INVOICE_ITEM
CREATE TABLE INVOICE_ITEM (
    Id integer  NOT NULL,
    NetValue number(19,4)  NOT NULL,
    Tax number(19,4)  NOT NULL,
    GrossValue number(19,4)  NOT NULL,
    InvoiceId integer  NOT NULL,
    VehicleId integer  NOT NULL,
    CONSTRAINT INVOICE_ITEM_pk PRIMARY KEY (Id)
) ;

-- Table: Parking
CREATE TABLE Parking (
    Id integer  NOT NULL,
    AddressId integer  NOT NULL,
    DealershipId integer  NOT NULL,
    CONSTRAINT Parking_pk PRIMARY KEY (Id)
) ;

-- Table: VEHICLE
CREATE TABLE VEHICLE (
    Id integer  NOT NULL,
    Name varchar2(50)  NOT NULL,
    ManufactureDate date  NOT NULL,
    Manufacturer varchar2(50)  NOT NULL,
    CountryOfOrigin varchar2(50)  NOT NULL,
    OwnersCount integer  NOT NULL,
    ParkingId integer  NOT NULL,
    CONSTRAINT VEHICLE_pk PRIMARY KEY (Id)
) ;

-- foreign keys
-- Reference: ADDRESS_CUSTOMER (table: CUSTOMER)
ALTER TABLE CUSTOMER ADD CONSTRAINT ADDRESS_CUSTOMER
    FOREIGN KEY (AddressId)
    REFERENCES Address (Id);

-- Reference: ADDRESS_DEALERSHIP (table: DEALERSHIP)
ALTER TABLE DEALERSHIP ADD CONSTRAINT ADDRESS_DEALERSHIP
    FOREIGN KEY (AddressId)
    REFERENCES Address (Id);

-- Reference: BID_AUCTION (table: BID)
ALTER TABLE BID ADD CONSTRAINT BID_AUCTION
    FOREIGN KEY (AuctionId)
    REFERENCES AUCTION (Id);

-- Reference: BID_CUSTOMER (table: BID)
ALTER TABLE BID ADD CONSTRAINT BID_CUSTOMER
    FOREIGN KEY (CustomerId)
    REFERENCES CUSTOMER (Id);

-- Reference: CUSTOMER_AUCTION (table: AUCTION)
ALTER TABLE AUCTION ADD CONSTRAINT CUSTOMER_AUCTION
    FOREIGN KEY (WinnerId)
    REFERENCES CUSTOMER (Id);

-- Reference: EMPLOYEE_AUCTION (table: AUCTION)
ALTER TABLE AUCTION ADD CONSTRAINT EMPLOYEE_AUCTION
    FOREIGN KEY (EmployeeId)
    REFERENCES EMPLOYEE (Id);

-- Reference: EMPLOYEE_DEALERSHIP (table: EMPLOYEE)
ALTER TABLE EMPLOYEE ADD CONSTRAINT EMPLOYEE_DEALERSHIP
    FOREIGN KEY (DealershipId)
    REFERENCES DEALERSHIP (Id);

-- Reference: FEEDBACK_CUSTOMER (table: FEEDBACK)
ALTER TABLE FEEDBACK ADD CONSTRAINT FEEDBACK_CUSTOMER
    FOREIGN KEY (CustomerId)
    REFERENCES CUSTOMER (Id);

-- Reference: FEEDBACK_SELLER (table: FEEDBACK)
ALTER TABLE FEEDBACK ADD CONSTRAINT FEEDBACK_SELLER
    FOREIGN KEY (EmployeeId)
    REFERENCES EMPLOYEE (Id);

-- Reference: INVOICE_CUSTOMER (table: INVOICE)
ALTER TABLE INVOICE ADD CONSTRAINT INVOICE_CUSTOMER
    FOREIGN KEY (CustomerId)
    REFERENCES CUSTOMER (Id);

-- Reference: INVOICE_ITEM_INVOICE (table: INVOICE_ITEM)
ALTER TABLE INVOICE_ITEM ADD CONSTRAINT INVOICE_ITEM_INVOICE
    FOREIGN KEY (InvoiceId)
    REFERENCES INVOICE (Id);

-- Reference: INVOICE_ITEM_VEHICLE (table: INVOICE_ITEM)
ALTER TABLE INVOICE_ITEM ADD CONSTRAINT INVOICE_ITEM_VEHICLE
    FOREIGN KEY (VehicleId)
    REFERENCES VEHICLE (Id);

-- Reference: INVOICE_SELLER (table: INVOICE)
ALTER TABLE INVOICE ADD CONSTRAINT INVOICE_SELLER
    FOREIGN KEY (EmployeeId)
    REFERENCES EMPLOYEE (Id);

-- Reference: VEHICLE_AUCTION (table: AUCTION)
ALTER TABLE AUCTION ADD CONSTRAINT VEHICLE_AUCTION
    FOREIGN KEY (VehicleId)
    REFERENCES VEHICLE (Id);

-- Reference: VEHICLE_Parking (table: VEHICLE)
ALTER TABLE VEHICLE ADD CONSTRAINT VEHICLE_Parking
    FOREIGN KEY (ParkingId)
    REFERENCES Parking (Id);

-- sequences
-- Sequence: INVOICE_ITEM_seq
CREATE SEQUENCE INVOICE_ITEM_seq
      INCREMENT BY 1
      NOMINVALUE
      NOMAXVALUE
      START WITH 1
      NOCACHE
      NOCYCLE;

-- End of file.

