SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE BADGEMAP;
DROP TABLE BADGES;
DROP TABLE COMMENTS;
DROP TABLE USERFAVORITES;
DROP TABLE USERIDEAMAP;
DROP TABLE IDEAS;
DROP TABLE USERS;




/* Create Tables */

CREATE TABLE BADGEMAP
(
	USERNAME VARCHAR(16) NOT NULL,
	BADGEID INT NOT NULL,
	PRIMARY KEY (USERNAME, BADGEID)
);


CREATE TABLE BADGES
(
	BADGEID INT NOT NULL,
	BADGENAME VARCHAR(16) NOT NULL,
	BADGEDESC TEXT,
	BADGEPATH VARCHAR(512) NOT NULL,
	PRIMARY KEY (BADGEID)
);


CREATE TABLE COMMENTS
(
	ID INT NOT NULL AUTO_INCREMENT,
	IDEAID INT NOT NULL,
	COMMENTTEXT TEXT NOT NULL,
	AUTHOR VARCHAR(16) NOT NULL,
	TIMSTMP TIMESTAMP NOT NULL,
	UPVOTES INT DEFAULT 0,
	DOWNVOTES INT DEFAULT 0,
	ISFLAGGED TINYINT DEFAULT 0,
	PRIMARY KEY (ID, IDEAID)
);


CREATE TABLE IDEAS
(
	IDEAID INT NOT NULL AUTO_INCREMENT,
	IDEA TEXT NOT NULL,
	USERNAME VARCHAR(16) NOT NULL,
	TMSTMP TIMESTAMP NOT NULL,
	UPVOTE INT DEFAULT 0,
	DOWNVOTE INT DEFAULT 0,
	ISIMPORTANT TINYINT NOT NULL,
	ISFLAGGED TINYINT,
	TAG VARCHAR(16) NOT NULL,
	ISIMPLEMENTED TINYINT,
	PRIMARY KEY (IDEAID)
);


CREATE TABLE USERFAVORITES
(
	USERNAME VARCHAR(16) NOT NULL,
	IDEAID INT NOT NULL,
	PRIMARY KEY (USERNAME, IDEAID)
);


CREATE TABLE USERIDEAMAP
(
	USERNAME VARCHAR(16) NOT NULL,
	IDEAID INT NOT NULL,
	PRIMARY KEY (USERNAME, IDEAID)
);


CREATE TABLE USERS
(
	FIRSTNAME VARCHAR(16),
	LASTNAME VARCHAR(0),
	TITLE VARBINARY(4),
	GENDER CHAR(6),
	STREET VARCHAR(256),
	CITY VARCHAR(128),
	STATE VARCHAR(16),
	EMAIL VARCHAR(128),
	PASSWORD VARCHAR(0),
	MD5HASH CHAR(32),
	SHAHASH CHAR(40),
	PHONE VARCHAR(20),
	CELL VARCHAR(20),
	SSN VARCHAR(20),
	PICTURE VARCHAR(256),
	USERNAME VARCHAR(16) NOT NULL,
	POINTS INT,
	LEVEL SMALLINT,
	ISADMIN TINYINT,
	ISHERO TINYINT,
	PRIMARY KEY (USERNAME)
);



/* Create Foreign Keys */

ALTER TABLE BADGEMAP
	ADD FOREIGN KEY (BADGEID)
	REFERENCES BADGES (BADGEID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE COMMENTS
	ADD FOREIGN KEY (IDEAID)
	REFERENCES IDEAS (IDEAID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE USERFAVORITES
	ADD FOREIGN KEY (IDEAID)
	REFERENCES IDEAS (IDEAID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE USERIDEAMAP
	ADD FOREIGN KEY (IDEAID)
	REFERENCES IDEAS (IDEAID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE BADGEMAP
	ADD FOREIGN KEY (USERNAME)
	REFERENCES USERS (USERNAME)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE USERFAVORITES
	ADD FOREIGN KEY (USERNAME)
	REFERENCES USERS (USERNAME)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE USERIDEAMAP
	ADD FOREIGN KEY (USERNAME)
	REFERENCES USERS (USERNAME)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



