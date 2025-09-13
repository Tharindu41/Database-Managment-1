CREATE DATABASE MarsColonyDB;
GO

USE MarsColonyDB;
GO
-- Step 2: Create Tables
CREATE TABLE Pilot (
    PilotID INT PRIMARY KEY,
    Name NVARCHAR(100),
    SpaceHours INT,
    Rank NVARCHAR(50)
);

CREATE TABLE Qualification (
    QualID INT PRIMARY KEY,
    QualName NVARCHAR(100),
    Level NVARCHAR(50)
);

CREATE TABLE PilotQualification (
    PilotID INT,
    QualID INT,
    PRIMARY KEY (PilotID, QualID),
    FOREIGN KEY (PilotID) REFERENCES Pilot(PilotID),
    FOREIGN KEY (QualID) REFERENCES Qualification(QualID)
);

CREATE TABLE EJet (
    JetCode INT PRIMARY KEY,
    NumPassengerSeats INT,
    NuclearEnginePower INT,
    MadeYear INT,
    Weight DECIMAL(10,2),
    PowerSource NVARCHAR(100),
    Type NVARCHAR(50)
);

CREATE TABLE Trip (
    TripID INT PRIMARY KEY,
    JetCode INT FOREIGN KEY REFERENCES EJet(JetCode),
    LaunchDate DATE,
    ReturnDate DATE
);

CREATE TABLE Colonist (
    MCID INT PRIMARY KEY,
    TripID INT FOREIGN KEY REFERENCES Trip(TripID),
    FirstName NVARCHAR(50),
    MiddleName NVARCHAR(50),
    Surname NVARCHAR(50),
    DOB DATE,
    Qualification NVARCHAR(100),
    EarthAddress NVARCHAR(200),
    Gender NVARCHAR(10),
    ContactNo NVARCHAR(20),
    CivilStatus NVARCHAR(20)
);

CREATE TABLE Dependent (
    DepID INT PRIMARY KEY,
    Colonist_MCID INT FOREIGN KEY REFERENCES Colonist(MCID),
    Name NVARCHAR(100),
    DOB DATE,
    Relationship NVARCHAR(50)
);

CREATE TABLE Job (
    JobName NVARCHAR(100) PRIMARY KEY,
    Description NVARCHAR(200)
);

CREATE TABLE ColonistJob (
    MCID INT,
    JobName NVARCHAR(100),
    PRIMARY KEY (MCID, JobName),
    FOREIGN KEY (MCID) REFERENCES Colonist(MCID),
    FOREIGN KEY (JobName) REFERENCES Job(JobName)
);

CREATE TABLE House (
    ColonyLotNumber INT PRIMARY KEY,
    NumRooms INT,
    SquareFeet INT
);

CREATE TABLE HouseAssignment (
    MCID INT,
    ColonyLotNumber INT,
    PRIMARY KEY (MCID, ColonyLotNumber),
    FOREIGN KEY (MCID) REFERENCES Colonist(MCID),
    FOREIGN KEY (ColonyLotNumber) REFERENCES House(ColonyLotNumber)
);

-- Step 3: Insert Records

-- Pilot
INSERT INTO Pilot VALUES (1, 'John Carter', 500, 'Captain');
INSERT INTO Pilot VALUES (2, 'Jane Smith', 300, 'Lieutenant');
INSERT INTO Pilot VALUES (3, 'Sam Wilson', 450, 'Commander');
INSERT INTO Pilot VALUES (4, 'Lisa Ray', 200, 'Officer');
INSERT INTO Pilot VALUES (5, 'Mark Lee', 600, 'Major');

-- Qualification
INSERT INTO Qualification VALUES (1, 'Astronomy', 'Advanced');
INSERT INTO Qualification VALUES (2, 'Engineering', 'Intermediate');
INSERT INTO Qualification VALUES (3, 'Medicine', 'Advanced');
INSERT INTO Qualification VALUES (4, 'Physics', 'Basic');
INSERT INTO Qualification VALUES (5, 'Biology', 'Advanced');
-- Select all columns from House table


-- PilotQualification
INSERT INTO PilotQualification VALUES (1, 1);
INSERT INTO PilotQualification VALUES (1, 2);
INSERT INTO PilotQualification VALUES (2, 3);
INSERT INTO PilotQualification VALUES (3, 4);
INSERT INTO PilotQualification VALUES (4, 5);

-- EJet
INSERT INTO EJet VALUES (101, 50, 2000, 2035, 50000, 'Nuclear', 'Passenger');
INSERT INTO EJet VALUES (102, 30, 1800, 2036, 45000, 'Solar', 'Cargo');
INSERT INTO EJet VALUES (103, 40, 2100, 2037, 47000, 'Nuclear', 'Explorer');
INSERT INTO EJet VALUES (104, 60, 2500, 2038, 60000, 'Hybrid', 'Passenger');
INSERT INTO EJet VALUES (105, 20, 1600, 2039, 42000, 'Solar', 'Research');

-- Trip
INSERT INTO Trip VALUES (1, 101, '2040-01-10', '2040-06-15');
INSERT INTO Trip VALUES (2, 102, '2040-02-20', '2040-07-30');
INSERT INTO Trip VALUES (3, 103, '2040-03-05', '2040-08-10');
INSERT INTO Trip VALUES (4, 104, '2040-04-12', '2040-09-01');
INSERT INTO Trip VALUES (5, 105, '2040-05-25', '2040-10-05');

-- Colonist

INSERT INTO Colonist VALUES (1, 1, 'Madusha', 'M.', 'Niroshan', '2000-05-12', 'Biology', 'Earth City A', 'Male', '0765433321', 'Single');
INSERT INTO Colonist VALUES (2, 2, 'Lakindu', NULL, 'Semal', '1995-08-23', 'Engineering', 'Earth City B', 'Male', '0776543789', 'Married');
INSERT INTO Colonist VALUES (3, 3, 'Shamal', 'L.', 'Ridma', '1990-03-11', 'Medicine', 'Earth City C', 'Male', '0654324567', 'Single');
INSERT INTO Colonist VALUES (4, 4, 'Duvindu', NULL, 'Ushan', '1988-07-19', 'Physics', 'Earth City D', 'Male', '0715657893', 'Married');
INSERT INTO Colonist VALUES (5, 5, 'Prabath', 's.', 'Udaya', '2002-11-30', 'Astronomy', 'Earth City E', 'Male', '0745673456', 'Single');

SELECT * 
FROM House Assignment ;

-- Dependent
INSERT INTO Dependent VALUES (1, 2, 'Tom Taylor', '2015-01-20', 'Son');
INSERT INTO Dependent VALUES (2, 2, 'Mary Taylor', '2017-03-15', 'Daughter');
INSERT INTO Dependent VALUES (3, 4, 'Sophia Brown', '2012-09-10', 'Daughter');
INSERT INTO Dependent VALUES (4, 4, 'Mike Brown', '2014-12-25', 'Son');
INSERT INTO Dependent VALUES (5, 3, 'Anna Smith', '2018-07-08', 'Daughter');

-- Job
INSERT INTO Job VALUES ('Engineer', 'Responsible for technical maintenance');
INSERT INTO Job VALUES ('Doctor', 'Provides medical support');
INSERT INTO Job VALUES ('Scientist', 'Conducts research and experiments');
INSERT INTO Job VALUES ('Farmer', 'Manages agriculture in Mars colony');
INSERT INTO Job VALUES ('Teacher', 'Educates colonists and dependents');

-- ColonistJob
INSERT INTO ColonistJob VALUES (1, 'Scientist');
INSERT INTO ColonistJob VALUES (2, 'Engineer');
INSERT INTO ColonistJob VALUES (3, 'Doctor');
INSERT INTO ColonistJob VALUES (4, 'Farmer');
INSERT INTO ColonistJob VALUES (5, 'Teacher');

-- House
INSERT INTO House VALUES (1001, 4, 1200);
INSERT INTO House VALUES (1002, 3, 1000);
INSERT INTO House VALUES (1003, 5, 1500);
INSERT INTO House VALUES (1004, 2, 800);
INSERT INTO House VALUES (1005, 6, 1600);

-- HouseAssignment
INSERT INTO HouseAssignment VALUES (1, 1001);
INSERT INTO HouseAssignment VALUES (2, 1002);
INSERT INTO HouseAssignment VALUES (3, 1003);
INSERT INTO HouseAssignment VALUES (4, 1004);
INSERT INTO HouseAssignment VALUES (5, 1005);
GO

-- Step 4: User Creation and Roles
CREATE LOGIN user11 WITH PASSWORD = 'User1Pass@123';
GO

USE MarsColonyDB;
GO

CREATE USER user1 FOR LOGIN user1;
GO

-- Assign Roles
ALTER ROLE db_datareader ADD MEMBER user1;
ALTER ROLE db_datawriter ADD MEMBER user1;
ALTER ROLE db_owner ADD MEMBER sa; -- sa already has this

-- Demonstrate ROLLBACK scenario with user1 (who has only SELECT permission)
-- First, let's see what user1 can do
EXECUTE AS USER = 'user1';
GO

-- This will fail because user1 only has SELECT permission
BEGIN TRANSACTION;
    DELETE FROM Colonist WHERE MCID = 1;
    -- The above command will fail with permission error
    -- Check if we're in a transaction and rollback if needed
    IF @@TRANCOUNT > 0
    BEGIN
        ROLLBACK TRANSACTION;
        PRINT 'Transaction rolled back due to permission error';
    END
GO

-- Switch back to admin user
REVERT;
GO
select*From  Colonist WHERE MCID = 1;


--Task 4
-- 1. List all colonists with their trip details and E-Jet information
SELECT 
    c.MCID, 
    c.FirstName + ' ' + c.Surname AS FullName,
    t.TripID,
    t.LaunchDate,
    t.ReturnDate,
    e.JetCode,
    e.Type AS JetType
FROM Colonist c
INNER JOIN Trip t ON c.TripID = t.TripID
INNER JOIN EJet e ON t.JetCode = e.JetCode;

-- 2. Show all colonists with their jobs and house assignments
SELECT 
    c.MCID,
    c.FirstName + ' ' + c.Surname AS FullName,
    j.JobName,
    h.ColonyLotNumber,
    h.NumRooms,
    h.SquareFeet
FROM Colonist c
LEFT JOIN ColonistJob cj ON c.MCID = cj.MCID
LEFT JOIN Job j ON cj.JobName = j.JobName
LEFT JOIN HouseAssignment ha ON c.MCID = ha.MCID
LEFT JOIN House h ON ha.ColonyLotNumber = h.ColonyLotNumber;

-- 3. List pilots with their qualifications and assigned E-Jets
SELECT 
    p.PilotID,
    p.Name AS PilotName,
    p.Rank,
    q.QualName,
    q.Level,
    e.JetCode,
    e.Type AS JetType
FROM Pilot p
LEFT JOIN PilotQualification pq ON p.PilotID = pq.PilotID
LEFT JOIN Qualification q ON pq.QualID = q.QualID
LEFT JOIN (
    SELECT JetCode, Type FROM EJet
) e ON 1=1; -- This is a simplified join, you might need to adjust based on your actual relationships