USE prslocal;
CREATE TABLE specialevents (   `regId` int NOT NULL AUTO_INCREMENT,
                                            `splEventId` int NOT NULL,
                                            `evtName` varchar(128) DEFAULT NULL,
                                            `fname` varchar(128) NOT NULL,
                                            `lname` varchar(128) NOT NULL,
                                            `email` varchar(128) NOT NULL,
                                            `dob` date DEFAULT NULL,
                                            `pPhone` varchar(15) NOT NULL,
                                            `sPhone` varchar(15) DEFAULT NULL,
                                            `address1` varchar(100) NOT NULL,
                                            `city` varchar(100) NOT NULL,
                                            `state` varchar(50) NOT NULL,
                                            `country` varchar(3) NOT NULL,
                                            `zip` varchar(15) NOT NULL,
                                            `gender` varchar(10) NOT NULL,
                                            `attendIE` tinyint DEFAULT '0',
                                            `hearFrom` varchar(30) NOT NULL,
                                            `noofGuest` smallint DEFAULT '1',
                                            `noofChild` smallint DEFAULT '0',
                                            `noofchild6` tinyint DEFAULT '0',
                                            `shuttle1` varchar(32) DEFAULT NULL,
                                            `shuttle2` varchar(32) DEFAULT NULL,
                                            `addStayday1` tinyint DEFAULT NULL,
                                            `addStayday2` tinyint DEFAULT NULL,
                                            `addStayday3` tinyint DEFAULT NULL,
                                            `payAmt` int DEFAULT NULL,
                                            `paymtDate` datetime DEFAULT NULL,
                                            `txnId` varchar(50) DEFAULT NULL,
                                            `regStatus` smallint DEFAULT '1',
                                            `regComment` varchar(250) DEFAULT NULL,
                                            `arriveDate` date DEFAULT NULL,
                                            `departDate` date DEFAULT NULL,
                                            `arriveTime` varchar(20) DEFAULT NULL,
                                            `departTime` varchar(20) DEFAULT NULL,
                                            `comments` text,
                                            `attendStatus` enum('Attended','NoShow','Cancel','Refund','Dropout','default') DEFAULT 'default',
                                            `ssoId` varchar(255) DEFAULT NULL,
                                            `ssoCountry` varchar(2) DEFAULT NULL,
                                            `createtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                            `SF_UPDATE` tinyint DEFAULT '0',
                                            PRIMARY KEY (`regId`)
);
CREATE TABLE splevents (
                                        `evtId` int NOT NULL AUTO_INCREMENT,
                                        `evtDesc` varchar(128) NOT NULL,
                                        `evtStTime` datetime NOT NULL,
                                        `evtEnTime` datetime NOT NULL,
                                        `evtStatus` tinyint NOT NULL DEFAULT '1',
                                        `evtPaidFlag` tinyint NOT NULL DEFAULT '1',
                                        `evtCenterId` int NOT NULL,
                                        `evntAddr1` varchar(128) NOT NULL,
                                        `evntAddr2` varchar(128) DEFAULT NULL,
                                        `evtCity` varchar(100) NOT NULL,
                                        `evtState` varchar(25) NOT NULL,
                                        `evtCountry` varchar(2) NOT NULL,
                                        `evtZip` varchar(10) NOT NULL,
                                        `evtEMContact` varchar(128) NOT NULL,
                                        `evtPhContact` varchar(25) NOT NULL,
                                        `evtFee` int NOT NULL,
                                        `evtCurr` varchar(5) NOT NULL,
                                        `evtSeating` int NOT NULL,
                                        `sanityId` varchar(128) DEFAULT NULL,
                                        PRIMARY KEY (`evtId`),
                                        KEY `splEvts_fk1` (`evtCenterId`)
);
/*
-- Query: SELECT * FROM prslocal.splevents
LIMIT 0, 1000

-- Date: 2022-12-09 09:50
*/
INSERT INTO `splevents` (`evtId`,`evtDesc`,`evtStTime`,`evtEnTime`,`evtStatus`,`evtPaidFlag`,`evtCenterId`,`evntAddr1`,`evntAddr2`,`evtCity`,`evtState`,`evtCountry`,`evtZip`,`evtEMContact`,`evtPhContact`,`evtFee`,`evtCurr`,`evtSeating`,`sanityId`) VALUES (1,'In the Lap of the Master - Jan 6 & 7th, 2018','2018-01-06 09:00:00','2018-01-07 15:00:00',1,1,25,'951 Isha Lane','','McMInnville','TN','US','37100','ilm@ishausa.org','931 668 1900',500,'USD',0,NULL);
INSERT INTO `splevents` (`evtId`,`evtDesc`,`evtStTime`,`evtEnTime`,`evtStatus`,`evtPaidFlag`,`evtCenterId`,`evntAddr1`,`evntAddr2`,`evtCity`,`evtState`,`evtCountry`,`evtZip`,`evtEMContact`,`evtPhContact`,`evtFee`,`evtCurr`,`evtSeating`,`sanityId`) VALUES (2,'In the Lap of the Master - Jan 5 & 6th, 2019','2019-01-05 06:00:00','2019-01-06 21:30:30',1,1,25,'951 Isha Lane','','McMinnville','TN','US','37100','ilm@ishausa.org','9316681900',500,'USD',0,NULL);
INSERT INTO `splevents` (`evtId`,`evtDesc`,`evtStTime`,`evtEnTime`,`evtStatus`,`evtPaidFlag`,`evtCenterId`,`evntAddr1`,`evntAddr2`,`evtCity`,`evtState`,`evtCountry`,`evtZip`,`evtEMContact`,`evtPhContact`,`evtFee`,`evtCurr`,`evtSeating`,`sanityId`) VALUES (3,'Christmas Celebration at Isha ','2018-12-25 18:00:00','2018-12-25 09:30:30',1,0,25,'951 Isha Lane','','McMinnville','TN','US','37100','info@ishausa.org','9316681900',0,'USD',0,NULL);
INSERT INTO `splevents` (`evtId`,`evtDesc`,`evtStTime`,`evtEnTime`,`evtStatus`,`evtPaidFlag`,`evtCenterId`,`evntAddr1`,`evntAddr2`,`evtCity`,`evtState`,`evtCountry`,`evtZip`,`evtEMContact`,`evtPhContact`,`evtFee`,`evtCurr`,`evtSeating`,`sanityId`) VALUES (4,'Darshan with Sadhguru - Dec 31','2018-12-31 18:00:00','2018-12-31 09:30:30',1,0,25,'951 Isha Lane','','McMinnville','TN','US','37100','info@ishausa.org','9316681900',0,'USD',0,NULL);
INSERT INTO `splevents` (`evtId`,`evtDesc`,`evtStTime`,`evtEnTime`,`evtStatus`,`evtPaidFlag`,`evtCenterId`,`evntAddr1`,`evntAddr2`,`evtCity`,`evtState`,`evtCountry`,`evtZip`,`evtEMContact`,`evtPhContact`,`evtFee`,`evtCurr`,`evtSeating`,`sanityId`) VALUES (5,'Darshan with Sadhguru - April ','2019-04-12 18:00:00','2019-04-12 09:30:30',1,0,25,'951 Isha Lane','','McMinnville','TN','US','37100','info@ishausa.org','9316681900',0,'USD',0,NULL);
INSERT INTO `splevents` (`evtId`,`evtDesc`,`evtStTime`,`evtEnTime`,`evtStatus`,`evtPaidFlag`,`evtCenterId`,`evntAddr1`,`evntAddr2`,`evtCity`,`evtState`,`evtCountry`,`evtZip`,`evtEMContact`,`evtPhContact`,`evtFee`,`evtCurr`,`evtSeating`,`sanityId`) VALUES (6,'SFOSathSang2019','2019-05-02 18:00:00','2019-05-02 23:00:00',1,0,25,'San Mateo County Event Center, Expo Hall','1346 Saratoga Drive,','San Mateo','CA','US','94403','sf@ishausa.org','9316681900',100,'USD',0,NULL);
INSERT INTO `splevents` (`evtId`,`evtDesc`,`evtStTime`,`evtEnTime`,`evtStatus`,`evtPaidFlag`,`evtCenterId`,`evntAddr1`,`evntAddr2`,`evtCity`,`evtState`,`evtCountry`,`evtZip`,`evtEMContact`,`evtPhContact`,`evtFee`,`evtCurr`,`evtSeating`,`sanityId`) VALUES (7,'Darshan with Sadhguru - Oct 25','2019-10-25 16:00:00','2019-11-25 21:30:30',1,0,25,'951 Isha Lane','','McMinnville','TN','US','37100','info@ishausa.org','9316681900',0,'USD',0,NULL);
INSERT INTO `splevents` (`evtId`,`evtDesc`,`evtStTime`,`evtEnTime`,`evtStatus`,`evtPaidFlag`,`evtCenterId`,`evntAddr1`,`evntAddr2`,`evtCity`,`evtState`,`evtCountry`,`evtZip`,`evtEMContact`,`evtPhContact`,`evtFee`,`evtCurr`,`evtSeating`,`sanityId`) VALUES (8,'Darshan with Sadhguru October 22, 2022 at Isha Institute of Inner-sciences','2022-10-22 17:00:00','2022-10-22 19:30:30',1,0,25,'951 Isha Lane','','McMinnville','TN','US','37100','info@ishausa.org','9316681900',0,'USD',2000,NULL);
COMMIT;
/*
-- Query: SELECT * FROM prslocal.specialevents
LIMIT 0, 1000

-- Date: 2022-12-09 09:49
*/
INSERT INTO `specialevents` (`regId`,`splEventId`,`evtName`,`fname`,`lname`,`email`,`dob`,`pPhone`,`sPhone`,`address1`,`city`,`state`,`country`,`zip`,`gender`,`attendIE`,`hearFrom`,`noofGuest`,`noofChild`,`noofchild6`,`shuttle1`,`shuttle2`,`addStayday1`,`addStayday2`,`addStayday3`,`payAmt`,`paymtDate`,`txnId`,`regStatus`,`regComment`,`arriveDate`,`departDate`,`arriveTime`,`departTime`,`comments`,`attendStatus`,`ssoId`,`ssoCountry`,`createtimestamp`,`SF_UPDATE`) VALUES (12690,8,'Darshan with Sadhguru October 22, 2022 at Isha Institute of Inner-sciences','Meenakshi Sundaram','Bhaskaran','koushi007@gmail.com','1988-10-26','8588882632',NULL,'951 Isha Lane','McMinnville','TN','US','37110','Male',1,'Yes',0,2,0,NULL,NULL,NULL,NULL,NULL,0,'2022-09-25 14:34:09',NULL,1,NULL,NULL,NULL,'By 11AM',NULL,NULL,'default','NpNMcyMGZjeZIJe6Jx9taGDIxzS2','US','2022-09-25 13:34:09',1);
INSERT INTO `specialevents` (`regId`,`splEventId`,`evtName`,`fname`,`lname`,`email`,`dob`,`pPhone`,`sPhone`,`address1`,`city`,`state`,`country`,`zip`,`gender`,`attendIE`,`hearFrom`,`noofGuest`,`noofChild`,`noofchild6`,`shuttle1`,`shuttle2`,`addStayday1`,`addStayday2`,`addStayday3`,`payAmt`,`paymtDate`,`txnId`,`regStatus`,`regComment`,`arriveDate`,`departDate`,`arriveTime`,`departTime`,`comments`,`attendStatus`,`ssoId`,`ssoCountry`,`createtimestamp`,`SF_UPDATE`) VALUES (12831,8,'Darshan with Sadhguru October 22, 2022 at Isha Institute of Inner-sciences','Omkar Rajendra','Palaskar','palaskaromkar@gmail.com','1992-09-07','6692819576',NULL,'10050 Great Hills Trail','Austin','TX','US','78759','Male',0,'No',0,0,0,NULL,NULL,NULL,NULL,NULL,10,'2022-09-26 13:40:48','7U859613FD747610F',1,NULL,NULL,NULL,'By 11AM',NULL,NULL,'default','1VXQkLaHDacZ1V6XT135jfhY7kX2','US','2022-09-26 12:40:48',1);
COMMIT;
