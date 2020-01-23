-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-12-02 08:45:25.841

-- tables
-- Table: Category
CREATE TABLE Category (
    IdCategory integer  NOT NULL,
    CategoryName varchar2(20)  NOT NULL,
    CONSTRAINT Category_pk PRIMARY KEY (IdCategory)
) ;

-- Table: Guest
CREATE TABLE Guest (
    IdGuest integer  NOT NULL,
    FirstName varchar2(50)  NOT NULL,
    LastName varchar2(50)  NOT NULL,
    PhoneNumber varchar2(15)  NOT NULL,
    CONSTRAINT Guest_pk PRIMARY KEY (IdGuest)
) ;

-- Table: Reservation
CREATE TABLE Reservation (
    IdReservation integer  NOT NULL,
    IdGuest integer  NOT NULL,
    IdCategory integer  NOT NULL,
    NumbOfRooms integer  NOT NULL,
    DateStart date  NOT NULL,
    DateEnd date  NOT NULL,
    CONSTRAINT Reservation_pk PRIMARY KEY (IdReservation)
) ;

-- Table: ReservationConfirmed
CREATE TABLE ReservationConfirmed (
    IdReservation integer  NOT NULL,
    ConfirmationDate date  NOT NULL,
    DatePaid date  NULL,
    CONSTRAINT ReservationConfirmed_pk PRIMARY KEY (IdReservation)
) ;

-- Table: Room
CREATE TABLE Room (
    IdRoom integer  NOT NULL,
    RoomNumber varchar2(10)  NOT NULL,
    IdCategory integer  NOT NULL,
    CONSTRAINT Room_pk PRIMARY KEY (IdRoom)
) ;

-- Table: RoomAssigned
CREATE TABLE RoomAssigned (
    IdRoomAssigned integer  NOT NULL,
    IdRoom integer  NOT NULL,
    IdReservation integer  NOT NULL,
    CONSTRAINT RoomAssigned_pk PRIMARY KEY (IdRoomAssigned)
) ;

-- foreign keys
-- Reference: ReservationConf_Reservation (table: ReservationConfirmed)
ALTER TABLE ReservationConfirmed ADD CONSTRAINT ReservationConf_Reservation
    FOREIGN KEY (IdReservation)
    REFERENCES Reservation (IdReservation);

-- Reference: Reservation_Category (table: Reservation)
ALTER TABLE Reservation ADD CONSTRAINT Reservation_Category
    FOREIGN KEY (IdCategory)
    REFERENCES Category (IdCategory);

-- Reference: Reservation_Guest (table: Reservation)
ALTER TABLE Reservation ADD CONSTRAINT Reservation_Guest
    FOREIGN KEY (IdGuest)
    REFERENCES Guest (IdGuest);

-- Reference: RoomAssigned_ReservationConf (table: RoomAssigned)
ALTER TABLE RoomAssigned ADD CONSTRAINT RoomAssigned_ReservationConf
    FOREIGN KEY (IdReservation)
    REFERENCES ReservationConfirmed (IdReservation);

-- Reference: RoomAssigned_Room (table: RoomAssigned)
ALTER TABLE RoomAssigned ADD CONSTRAINT RoomAssigned_Room
    FOREIGN KEY (IdRoom)
    REFERENCES Room (IdRoom);

-- Reference: Room_Category (table: Room)
ALTER TABLE Room ADD CONSTRAINT Room_Category
    FOREIGN KEY (IdCategory)
    REFERENCES Category (IdCategory);

-- End of file.

