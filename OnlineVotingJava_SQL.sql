create database onlinevoting;
use onlinevoting;
create table user (username varchar(20) primary key,
password varchar(20) not null,
role varchar(20) not null); 
ALTER TABLE user
ADD COLUMN name VARCHAR(20) NOT NULL,
ADD COLUMN phone VARCHAR(20) NOT NULL,
ADD COLUMN dob DATE NOT NULL,
ADD COLUMN email VARCHAR(50) NOT NULL,
ADD COLUMN id varchar(20) NOT NULL;
ALTER TABLE user
DROP PRIMARY KEY,
ADD PRIMARY KEY (id);
desc user;
alter table user drop column username;
select * from user;

create table election (electid varchar(20) primary key,
name varchar(20) not null); 

DELIMITER //
CREATE TRIGGER UpdateCandidateOrVoter
AFTER INSERT ON User
FOR EACH ROW
BEGIN
    IF NEW.role = 'Candidate' THEN
        INSERT INTO Candidate (CandidateID) VALUES (NEW.id);
    ELSEIF NEW.role = 'Voter' THEN
        INSERT INTO Voter (VoterID) VALUES (NEW.id);
    END IF;
END//
DELIMITER ;

create table Cadidate(CandidateID varchar(20) Primary Key,electionid varchar(10),status varchar(5));
Rename table Cadidate to Candidate;
create table Voter(VoterID varchar(20) Primary Key,electionid varchar(10),status varchar(5));


select * from voter;
select * from candidate;
select * from user;
select * from election;

desc candidate;

ALTER TABLE election RENAME COLUMN electid TO electionid;
ALTER TABLE election Add COLUMN status varchar(20);

ALTER TABLE election MODIFY COLUMN status varchar(20) DEFAULT "Running";

UPDATE election SET status = "Running";

UPDATE election SET status = 'Running' where electionid= "Test001706";

DELIMITER //
CREATE TRIGGER UpdateCandidateStatus
AFTER UPDATE ON Candidate
FOR EACH ROW
BEGIN
    IF NEW.electionid != null THEN
        UPDATE Candidate set status="Pending";
    END IF;
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER UpdateVoterStatus
AFTER UPDATE ON Voter
FOR EACH ROW
BEGIN
    IF NEW.electionid != null THEN
        UPDATE Voter set status="P";
    END IF;
END//
DELIMITER ;

Drop Trigger UpdateVoterStatus;
Drop Trigger UpdateCandidateStatus;


DELIMITER //
CREATE TRIGGER UpdateVoterStatus
AFTER UPDATE ON Voter
FOR EACH ROW
BEGIN
    IF NEW.electionid != null THEN
        UPDATE Voter set status="P";
    END IF;
END//
DELIMITER ;


DELIMITER //
CREATE TRIGGER UpdateCandidateStatus
AFTER UPDATE ON Candidate
FOR EACH ROW
BEGIN
    IF NEW.electionid != null THEN
        UPDATE Candidate set status="P";
    END IF;
END//
DELIMITER ;