/*Create table script for usa participants*/
DROP TABLE IF EXISTS `usa_participants`;
CREATE TABLE IF NOT EXISTS `usa_participants` (
  `partId` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(128) NOT NULL,
  `pass` varchar(128) DEFAULT NULL,
  `pPhone` varchar(15) NOT NULL,
  `sPhone` varchar(15) DEFAULT NULL,
  `sex` varchar(10) NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip` varchar(12) NOT NULL,
  `country` varchar(3) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `userRegion` enum('USCA','EUUK','APAC','OTH') DEFAULT NULL,
  `medType` enum('MED','VOL','CVOL','ISHA','NONE') DEFAULT NULL,
  `ethnicity` varchar(20) DEFAULT NULL,
  `occupation` varchar(128) DEFAULT NULL,
  `sFId` varchar(20) DEFAULT NULL,
  `ssoId` varchar(255) DEFAULT NULL,
  `ssoCountry` varchar(2) DEFAULT NULL COMMENT 'sso country of residence',
  `lastUpd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `usa_participants`
  ADD PRIMARY KEY (`partId`),
  ADD KEY `usa_participant_fk2` (`email`);


ALTER TABLE `usa_participants`
  MODIFY `partId` int(11) NOT NULL AUTO_INCREMENT;

INSERT INTO `usa_participants` (`partId`, `fname`, `lname`, `prefName`, `email`, `pass`, `pPhone`, `sPhone`, `sex`, `dob`, `address1`, `address2`, `city`, `state`, `zip`, `country`, `age`, `userRegion`, `medType`, `ethnicity`, `occupation`, `sFId`, `ssoId`, `ssoCountry`, `lastUpd`) VALUES
(28476, 'first-28476', 'last-28476', NULL, '28476@28476.com', NULL, '', '', 'Female', NULL, '', '', 'Sandy', 'UT', '84092', 'US', 18, NULL, NULL, NULL, NULL, NULL, NULL, 'US', '2019-01-19 17:10:25'),
(28477, 'first-28477', 'last-28477', NULL, '28477@28477.com', NULL, '', '', 'Female', NULL, '', '', 'Riverton', 'UT', '84065', 'US', 39, NULL, NULL, NULL, NULL, NULL, NULL, 'US', '2019-01-19 17:10:25'),
(28478, 'first-28478', 'last-28478', NULL, '28478@28478.com', NULL, '', '', 'Female', NULL, '', '', 'Sandy', 'UT', '84092', 'US', 14, NULL, NULL, NULL, NULL, NULL, NULL, 'US', '2019-01-19 17:10:25'),
(28479, 'first-28479', 'last-28479', NULL, '28479@28479.com', NULL, '', '', 'Male', NULL, '', '', 'South Jordan', 'UT', '84009', 'US', 34, NULL, NULL, NULL, NULL, NULL, NULL, 'US', '2019-01-19 17:10:25'),
(28480, 'first-28480', 'last-28480', NULL, '28480@28480.com', NULL, '', '', 'Male', NULL, '', '', 'Taylorsville', 'UT', '84129', 'AF', 68, NULL, NULL, NULL, NULL, NULL, NULL, 'US', '2019-01-19 17:10:25'),
(28481, 'first-28481', 'last-28481', NULL, '28481@28481.com', NULL, '', '', 'Male', NULL, '', '', 'Las Vegas', 'NV', '89149-4640', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US', '2019-01-19 17:10:25'),
(28482, 'first-28482', 'last-28482', NULL, '28482@28482.com', NULL, '', '', 'Male', NULL, '', '', 'Chandler', 'AZ', '85249', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US', '2019-01-19 17:10:25'),
(28483, 'first-28483', 'last-28483', NULL, '28483@28483.com', NULL, '', '', 'Female', NULL, '', '', 'Chandler', 'AZ', '85249', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US', '2019-01-19 17:10:25'),
(28484, 'first-28484', 'last-28484', NULL, '28484@28484.com', NULL, '', '', 'Female', NULL, '', '', 'Getmantown', 'TN', '38139', 'US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'US', '2019-01-19 17:10:25');


/*Create table script for usa participants*/
  DROP TABLE IF EXISTS `partprogram`;
CREATE TABLE IF NOT EXISTS `partprogram` (
  `pgmPartId` int(11) NOT NULL,
  `partId` int(11) DEFAULT NULL,
  `childId` int(11) DEFAULT NULL,
  `pgmId` int(11) DEFAULT NULL,
  `pgmType` smallint(6) DEFAULT NULL,
  `cmeOption` tinyint(4) DEFAULT NULL,
  `pgmAmt` int(11) DEFAULT NULL,
  `pgmCurr` varchar(3) DEFAULT NULL,
  `pgmCtry` varchar(2) NOT NULL DEFAULT 'US',
  `regDate` datetime DEFAULT NULL,
  `pgmGrp` tinyint(4) DEFAULT NULL,
  `pgmGrpId` int(11) DEFAULT NULL,
  `txnId` varchar(20) DEFAULT NULL,
  `corrId` varchar(255) DEFAULT NULL,
  `pmtStatus` tinyint(4) DEFAULT '1',
  `cStatus` char(1) DEFAULT 'A',
  `comment` text,
  `offline` varchar(100) DEFAULT NULL,
  `offlineCode` smallint(6) DEFAULT NULL,
  `couponCode` varchar(25) DEFAULT NULL,
  `partAge` smallint(6) DEFAULT NULL,
  `accomType` smallint(6) DEFAULT NULL,
  `shuttle1` varchar(32) DEFAULT NULL,
  `shuttle2` varchar(32) DEFAULT NULL,
  `shuttlePrice` int(11) DEFAULT NULL,
  `acommStDate` datetime DEFAULT NULL,
  `acommEnDate` datetime DEFAULT NULL,
  `acommPrice` int(11) DEFAULT NULL,
  `acommTxnId` varchar(20) DEFAULT NULL,
  `shmMMYYYY` varchar(15) DEFAULT NULL,
  `shmCity` varchar(100) DEFAULT NULL,
  `shmCenter` varchar(50) DEFAULT NULL,
  `teachName` varchar(50) DEFAULT NULL,
  `oldPgmId` int(11) DEFAULT NULL,
  `retAmt` int(11) DEFAULT NULL,
  `retDate` datetime DEFAULT NULL,
  `tagLocation` varchar(10) DEFAULT NULL,
  `zoneInfo` varchar(10) DEFAULT NULL,
  `lastUpd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SF_UPDATE` tinyint(1) DEFAULT '0',
  `salesforce_ppr_id` varchar(30) DEFAULT NULL,
  `attendStatus` enum('Attended','NoShow','Cancel','Refund','Dropout','default','PValidated','Reschedule','CQComplete','CTComplete','CDenied') DEFAULT 'default',
  `attUpdDate` datetime DEFAULT NULL,
  `paymentType` enum('Partial','Full') NOT NULL DEFAULT 'Full',
  `nofInstallments` int(6) NOT NULL DEFAULT '0',
  `amountToPayEveryMonth` int(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `partprogram`
  ADD PRIMARY KEY (`pgmPartId`),
  ADD KEY `partId` (`partId`),
  ADD KEY `childId` (`childId`),
  ADD KEY `pgmId` (`pgmId`),
  ADD KEY `pgmType` (`pgmType`);


ALTER TABLE `partprogram`
  MODIFY `pgmPartId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `partprogram`
  ADD CONSTRAINT `partprogram_ibfk_1` FOREIGN KEY (`partId`) REFERENCES `usa_participants` (`partId`),
  ADD CONSTRAINT `partprogram_ibfk_2` FOREIGN KEY (`childId`) REFERENCES `child_participants` (`childId`),
  ADD CONSTRAINT `partprogram_ibfk_3` FOREIGN KEY (`pgmId`) REFERENCES `ref_usa_program` (`pgmId`),
  ADD CONSTRAINT `partprogram_ibfk_4` FOREIGN KEY (`pgmType`) REFERENCES `programtype` (`pgmTypeId`);

  INSERT INTO `partprogram` (`pgmPartId`, `partId`, `childId`, `pgmId`, `pgmType`, `cmeOption`, `pgmAmt`, `pgmCurr`, `pgmCtry`, `regDate`, `pgmGrp`, `pgmGrpId`, `txnId`, `corrId`, `pmtStatus`, `cStatus`, `comment`, `offline`, `offlineCode`, `couponCode`, `partAge`, `accomType`, `shuttle1`, `shuttle2`, `shuttlePrice`, `acommStDate`, `acommEnDate`, `acommPrice`, `acommTxnId`, `shmMMYYYY`, `shmCity`, `shmCenter`, `teachName`, `oldPgmId`, `retAmt`, `retDate`, `tagLocation`, `zoneInfo`, `lastUpd`, `SF_UPDATE`, `salesforce_ppr_id`, `attendStatus`, `attUpdDate`, `paymentType`, `nofInstallments`, `amountToPayEveryMonth`) VALUES
(36509, 28476, NULL, 20234, 38, 0, 225, 'USD', 'US', '2021-02-12 12:02:03', NULL, NULL, 'IEC-1613149627-23781', 'pi_1IK56mJeNI5DoF5bC', 1, 'A', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', NULL, NULL, '2021-02-12 17:07:38', 0, NULL, 'default', NULL, 'Full', 0, 0),
(36510, 28477, NULL, 20235, 38, 0, 225, 'USD', 'US', '2021-02-12 00:00:00', NULL, NULL, 'IEC-1613149627-23781', 'pi_1IK56mJeNI5DoF5bC', 1, 'A', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', NULL, NULL, '2021-02-12 17:07:37', 0, NULL, 'PValidated', NULL, 'Full', 0, 0),
(36517, 28478, NULL, 20236, 38, 0, 225, 'USD', 'US', '2021-02-12 15:02:42', NULL, NULL, 'IEC-1613161965-27830', 'pi_1IK8JlJeNI5DoF5bh', 1, 'A', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', NULL, NULL, '2021-02-12 20:34:13', 0, NULL, 'default', NULL, 'Full', 0, 0),
(36518, 28479, NULL, 20237, 38, 0, 225, 'USD', 'US', '2021-02-12 00:00:00', NULL, NULL, 'IEC-1613161965-27830', 'pi_1IK8JlJeNI5DoF5bh', 1, 'A', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', NULL, NULL, '2021-02-12 20:34:13', 0, NULL, 'PValidated', NULL, 'Full', 0, 0),
(36521, 28480, NULL, 20238, 38, 0, 225, 'USD', 'US', '2021-02-12 17:02:01', NULL, NULL, 'IEC-1613169124-24435', 'pi_1IKABEJeNI5DoF5bq', 1, 'A', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', NULL, NULL, '2021-02-12 22:36:30', 0, NULL, 'default', NULL, 'Full', 0, 0),
(36522, 28481, NULL, 20239, 38, 0, 225, 'USD', 'US', '2021-02-12 00:00:00', NULL, NULL, 'IEC-1613169124-24435', 'pi_1IKABEJeNI5DoF5bq', 1, 'A', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', NULL, NULL, '2021-02-12 22:36:29', 0, NULL, 'PValidated', NULL, 'Full', 0, 0),
(36525, 28482, NULL, 20240, 38, 0, 225, 'USD', 'US', '2021-02-13 12:02:31', NULL, NULL, 'IEC-1613236296-23136', 'pi_1IKReeJeNI5DoF5bs', 1, 'A', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', NULL, NULL, '2021-02-13 17:12:30', 0, NULL, 'default', NULL, 'Full', 0, 0);

  /*Create table for ref usa program*/
  DROP TABLE IF EXISTS `ref_usa_program`;
CREATE TABLE IF NOT EXISTS `ref_usa_program` (
  `pgmId` int(11) NOT NULL,
  `programDate` date DEFAULT NULL,
  `programType` smallint(6) DEFAULT '0',
  `language` varchar(5) NOT NULL DEFAULT 'EN',
  `resProgram` tinyint(4) DEFAULT '0',
  `location` tinytext NOT NULL,
  `centerId` int(11) NOT NULL,
  `timezoneid` int(11) NOT NULL DEFAULT '9',
  `pgmName` varchar(100) NOT NULL,
  `pmtCurr` varchar(3) NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zipcode` varchar(11) NOT NULL,
  `country` varchar(2) NOT NULL,
  `noOfDays` tinyint(4) DEFAULT NULL,
  `day1timing` varchar(100) NOT NULL,
  `day2timing` varchar(100) DEFAULT NULL,
  `day3timing` varchar(100) DEFAULT NULL,
  `day4timung` varchar(100) DEFAULT NULL,
  `refPgmId` int(11) DEFAULT '0',
  `addDetail` text,
  `programFee` int(11) DEFAULT NULL,
  `priceGroups` tinyint(4) DEFAULT NULL,
  `pGrp1user` varchar(50) DEFAULT NULL,
  `pGrp1amt` int(11) DEFAULT NULL,
  `pGrp2user` varchar(50) DEFAULT NULL,
  `pGrp2amt` int(11) DEFAULT NULL,
  `pGrp3user` varchar(50) DEFAULT NULL,
  `pGrp3amt` int(11) DEFAULT NULL,
  `pGrp4user` varchar(50) DEFAULT NULL,
  `pGrp4amt` int(11) DEFAULT NULL,
  `pGrp5user` varchar(50) DEFAULT NULL,
  `pGrp5amt` int(11) DEFAULT NULL,
  `pGrp6user` varchar(50) DEFAULT NULL,
  `pGrp6amt` int(11) DEFAULT NULL,
  `pGrp7user` varchar(50) DEFAULT NULL,
  `pGrp7amt` int(11) DEFAULT NULL,
  `pPay1` int(6) NOT NULL,
  `pPayN` int(6) NOT NULL,
  `pPayActive` tinyint(1) NOT NULL DEFAULT '0',
  `termPolicy` text,
  `cancelPolicy` text,
  `email` varchar(120) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `contactNumber` varchar(20) DEFAULT NULL,
  `cmeRequired` tinyint(4) DEFAULT '0',
  `cme1Text` varchar(100) DEFAULT NULL,
  `cme1Price` tinyint(4) DEFAULT '50',
  `cme2Text` varchar(100) DEFAULT NULL,
  `cme2Price` tinyint(4) DEFAULT '10',
  `comments` text,
  `ebird1Text` varchar(100) DEFAULT NULL,
  `ebird1Days` smallint(6) DEFAULT NULL,
  `ebird1Price` int(11) DEFAULT NULL,
  `ebird2Text` varchar(100) DEFAULT NULL,
  `ebird2Days` smallint(6) DEFAULT NULL,
  `ebird2Price` int(11) DEFAULT NULL,
  `accomReq` tinyint(4) DEFAULT '0',
  `accom1Text` varchar(512) DEFAULT NULL,
  `accom1Price` smallint(6) DEFAULT NULL,
  `accom1Rooms` smallint(6) DEFAULT NULL,
  `accom2Text` varchar(512) DEFAULT NULL,
  `accom2Price` smallint(6) DEFAULT NULL,
  `accom2Rooms` smallint(6) DEFAULT NULL,
  `accom3Text` varchar(512) DEFAULT NULL,
  `accom3Price` smallint(6) DEFAULT NULL,
  `accom3Rooms` smallint(6) DEFAULT NULL,
  `accom4Text` varchar(512) DEFAULT NULL,
  `accom4Price` smallint(6) DEFAULT NULL,
  `accom4Rooms` smallint(6) DEFAULT NULL,
  `shuttReq` tinyint(4) DEFAULT '0',
  `shuttle1Desc` varchar(100) DEFAULT NULL,
  `shuttle1Price` smallint(6) DEFAULT NULL,
  `shuttle2Desc` varchar(100) DEFAULT NULL,
  `shuttle2Price` smallint(6) DEFAULT NULL,
  `shuttle3Desc` varchar(100) DEFAULT NULL,
  `shuttle3Price` smallint(6) DEFAULT NULL,
  `shuttle4Desc` varchar(100) DEFAULT NULL,
  `shuttle4Price` smallint(6) DEFAULT NULL,
  `limitCapacity` smallint(6) DEFAULT NULL,
  `opMode` tinyint(4) DEFAULT NULL,
  `lat` float(10,6) DEFAULT NULL,
  `lng` float(10,6) DEFAULT NULL,
  `wListOption` tinyint(4) DEFAULT '0',
  `wListLimit` smallint(6) DEFAULT '0',
  `volRegStatus` tinyint(4) DEFAULT '0',
  `volRegFee` smallint(6) DEFAULT NULL,
  `volStDate` datetime DEFAULT NULL,
  `volEnDate` datetime DEFAULT NULL,
  `volLimit` int(11) DEFAULT NULL,
  `intro_evt_id` int(11) DEFAULT NULL,
  `form_version` int(6) DEFAULT '1',
  `conductedBy` tinyint(4) DEFAULT '0',
  `programGender` tinyint(2) NOT NULL DEFAULT '2',
  `mkto_pgm_id` varchar(20) DEFAULT '0',
  `joomlaId` varchar(20) DEFAULT NULL,
  `lastUpdtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `minArrDate` date DEFAULT NULL,
  `maxArrDate` date DEFAULT NULL,
  `minDepDate` date DEFAULT NULL,
  `maxDepDate` date DEFAULT NULL,
  `sanityId` varchar(128) DEFAULT NULL,
  `arrivalTime` varchar(60) DEFAULT NULL,
  `departureTime` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `ref_usa_program`
  ADD PRIMARY KEY (`pgmId`),
  ADD KEY `programType` (`programType`),
  ADD KEY `sanityId` (`sanityId`);

ALTER TABLE `ref_usa_program`
  MODIFY `pgmId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `ref_usa_program`
  ADD CONSTRAINT `ref_usa_program_ibfk_1` FOREIGN KEY (`programType`) REFERENCES `programtype` (`pgmTypeId`);

  INSERT INTO `ref_usa_program` (`pgmId`, `programDate`, `programType`, `language`, `resProgram`, `location`, `centerId`, `timezoneid`, `pgmName`, `pmtCurr`, `address1`, `address2`, `city`, `state`, `zipcode`, `country`, `noOfDays`, `day1timing`, `day2timing`, `day3timing`, `day4timung`, `refPgmId`, `addDetail`, `programFee`, `priceGroups`, `pGrp1user`, `pGrp1amt`, `pGrp2user`, `pGrp2amt`, `pGrp3user`, `pGrp3amt`, `pGrp4user`, `pGrp4amt`, `pGrp5user`, `pGrp5amt`, `pGrp6user`, `pGrp6amt`, `pGrp7user`, `pGrp7amt`, `pPay1`, `pPayN`, `pPayActive`, `termPolicy`, `cancelPolicy`, `email`, `active`, `contactNumber`, `cmeRequired`, `cme1Text`, `cme1Price`, `cme2Text`, `cme2Price`, `comments`, `ebird1Text`, `ebird1Days`, `ebird1Price`, `ebird2Text`, `ebird2Days`, `ebird2Price`, `accomReq`, `accom1Text`, `accom1Price`, `accom1Rooms`, `accom2Text`, `accom2Price`, `accom2Rooms`, `accom3Text`, `accom3Price`, `accom3Rooms`, `accom4Text`, `accom4Price`, `accom4Rooms`, `shuttReq`, `shuttle1Desc`, `shuttle1Price`, `shuttle2Desc`, `shuttle2Price`, `shuttle3Desc`, `shuttle3Price`, `shuttle4Desc`, `shuttle4Price`, `limitCapacity`, `opMode`, `lat`, `lng`, `wListOption`, `wListLimit`, `volRegStatus`, `volRegFee`, `volStDate`, `volEnDate`, `volLimit`, `intro_evt_id`, `form_version`, `conductedBy`, `programGender`, `mkto_pgm_id`, `joomlaId`, `lastUpdtimestamp`, `arrivalTime`, `departureTime`, `minArrDate`, `maxArrDate`, `minDepDate`, `maxDepDate`, `sanityId`) VALUES
(20216, '2022-12-08', 38, 'EN', 0, 'Online', 25, 16, 'IECSO - Preliminary class', '', '', '', '', '', '', 'US', 2, '18:30', '18:30', NULL, NULL, 20206, NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 'iecsupport@innerengineering.com', 1, '931-488-8448', 0, NULL, 50, NULL, 10, NULL, '', 0, 0, '', 0, 0, 1, 'General Seating', NULL, 500, 'Reserved Seating', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 500, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 2, '0', '0-0', '2022-07-08 17:54:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20234, '2022-11-13', 38, 'EN', 0, 'Online', 25, 24, 'Sadhguru Offers Inner Engineering Completion Online', 'USD', '', '', '', '', '', 'IN', 7, '08:30', '11:00', '', '', 0, NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, '', 1, '', 0, NULL, 50, NULL, 10, NULL, 'Early Bird Offer', 40, 15, 'Special Offer', 32, 7, 1, 'General Seating', 0, 5518, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5518, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 2, '0', NULL, '2022-08-12 06:22:46', NULL, NULL, NULL, NULL, NULL, NULL, '963e3ee6-9e12-4c5e-a94f-610455b063a0'),
(20235, '2022-11-07', 38, 'EN', 0, 'Online', 25, 24, 'IECO - Preliminary class', '', '', '', '', '', '', 'IN', 2, '06:00', '06:00', '', '', 20234, '', 0, 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, 0, 0, 0, '', '', '', 1, '', 0, '', 50, '', 10, '', '', 0, 0, '', 0, 0, 1, 'General Seating', 0, 500, '', 0, 0, '', 0, 0, '', 0, 0, 0, '', 0, '', 0, '', 0, '', 0, 500, 0, 0.000000, 0.000000, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0, 2, '0', '', '2022-08-12 07:27:41', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '4972e78f-7c0e-47d1-97c6-903d96f33445'),
(20236, '2022-11-09', 38, 'EN', 0, 'Online', 25, 24, 'IECO - Preliminary class', '', '', '', '', '', '', 'IN', 2, '06:00', '06:00', '', '', 20234, '', 0, 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, 0, 0, 0, '', '', '', 1, '', 0, '', 50, '', 10, '', '', 0, 0, '', 0, 0, 1, 'General Seating', 0, 500, '', 0, 0, '', 0, 0, '', 0, 0, 0, '', 0, '', 0, '', 0, '', 0, 500, 0, 0.000000, 0.000000, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0, 2, '0', '', '2022-08-12 08:11:18', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '52bac1a8-f6c5-416a-b295-a2cfed0c97bc'),
(20237, '2022-11-11', 38, 'EN', 0, 'Online', 25, 24, 'IECO - Preliminary class', '', '', '', '', '', '', 'IN', 2, '06:00', '06:00', '', '', 20234, '', 0, 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, 0, 0, 0, '', '', '', 1, '', 0, '', 50, '', 10, '', '', 0, 0, '', 0, 0, 1, 'General Seating', 0, 500, '', 0, 0, '', 0, 0, '', 0, 0, 0, '', 0, '', 0, '', 0, '', 0, 500, 0, 0.000000, 0.000000, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0, 2, '0', '', '2022-08-12 08:19:54', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'eb88881b-a789-4229-b425-6d56b01c61a0'),
(20238, '2022-11-07', 38, 'EN', 0, 'Online', 25, 24, 'IECO - Preliminary class', '', '', '', '', '', '', 'IN', 2, '18:30', '18:30', '', '', 20234, '', 0, 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, 0, 0, 0, '', '', '', 1, '', 0, '', 50, '', 10, '', '', 0, 0, '', 0, 0, 1, 'General Seating', 0, 500, '', 0, 0, '', 0, 0, '', 0, 0, 0, '', 0, '', 0, '', 0, '', 0, 500, 0, 0.000000, 0.000000, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0, 2, '0', '', '2022-08-12 08:22:06', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'a4b5fa0b-eb6c-4981-961a-efbf47addd56'),
(20239, '2022-11-09', 38, 'EN', 0, 'Online', 25, 24, 'IECO - Preliminary class', '', '', '', '', '', '', 'IN', 2, '18:30', '18:30', '', '', 20234, '', 0, 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, 0, 0, 0, '', '', '', 1, '', 0, '', 50, '', 10, '', '', 0, 0, '', 0, 0, 1, 'General Seating', 0, 500, '', 0, 0, '', 0, 0, '', 0, 0, 0, '', 0, '', 0, '', 0, '', 0, 500, 0, 0.000000, 0.000000, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0, 2, '0', '', '2022-08-12 08:23:04', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'b16c0c0b-32a9-4a94-8ab0-a606496e51c0'),
(20240, '2022-11-11', 38, 'EN', 0, 'Online', 25, 24, 'IECO - Preliminary class', '', '', '', '', '', '', 'IN', 2, '18:30', '18:30', '', '', 20234, '', 0, 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, 0, 0, 0, '', '', '', 1, '', 0, '', 50, '', 10, '', '', 0, 0, '', 0, 0, 1, 'General Seating', 0, 500, '', 0, 0, '', 0, 0, '', 0, 0, 0, '', 0, '', 0, '', 0, '', 0, 500, 0, 0.000000, 0.000000, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0, 2, '0', '', '2022-08-12 08:23:49', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '5655fa9b-4b72-481e-bcb4-09c376f233c5'),
(20244, '2022-10-11', 38, 'EN', 0, 'Online', 25, 9, 'Sadhguru Offers Inner Engineering Completion Online', 'USD', '', '', '', '', '', 'US', 9, '08:00', '10:30', '', '', 0, '', 35, 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, 0, 0, 0, '', '', '', 1, '', 0, '', 50, '', 10, '', 'Early Bird Offer', 31, 15, 'Special Offer', 16, 11, 1, 'General Seating', 0, 5500, '', 0, 0, '', 0, 0, '', 0, 0, 0, '', 0, '', 0, '', 0, '', 0, 5500, 0, 0.000000, 0.000000, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0, 2, '0', '', '2022-08-15 04:45:48', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', 'ba241a5a-8fe1-4a78-ae16-970e254f8263'),
(20245, '2022-11-11', 38, 'EN', 0, 'Online', 25, 24, 'IECO - Preliminary class', '', '', '', '', '', '', 'IN', 2, '08:00', '08:00', '', '', 20234, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 1, NULL, 0, NULL, 50, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'General Seating', 0, 500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 500, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 2, '0', NULL, '2022-08-17 19:42:51', NULL, NULL, NULL, NULL, NULL, NULL, '8f2e4356-7ca6-4ef4-a94c-a445adbb8663');


/*Create table script for country region mapping*/
DROP TABLE IF EXISTS `country_region_mapping`;
CREATE TABLE IF NOT EXISTS `country_region_mapping` (
  `id` int(11) NOT NULL,
  `country_name` varchar(256) NOT NULL,
  `country_code_2` varchar(2) NOT NULL,
  `country_code_3` varchar(3) NOT NULL,
  `continent` varchar(50) NOT NULL,
  `sub_region` varchar(256) NOT NULL,
  `isha_region` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Isha Region Mapping';
ALTER TABLE `country_region_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_code_2` (`country_code_2`);
ALTER TABLE `country_region_mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

  INSERT INTO `country_region_mapping` (`id`, `country_name`, `country_code_2`, `country_code_3`, `continent`, `sub_region`, `isha_region`) VALUES
(8, 'Anguilla', 'AI', 'AIA', 'Americas', 'Latin America and the Caribbean', 'North America'),
(9, 'Antigua and Barbuda', 'AG', 'ATG', 'Americas', 'Latin America and the Caribbean', 'North America'),
(10, 'Argentina', 'AR', 'ARG', 'Americas', 'Latin America and the Caribbean', 'North America'),
(12, 'Aruba', 'AW', 'ABW', 'Americas', 'Latin America and the Caribbean', 'North America'),
(16, 'Bahamas', 'BS', 'BHS', 'Americas', 'Latin America and the Caribbean', 'North America'),
(19, 'Barbados', 'BB', 'BRB', 'Americas', 'Latin America and the Caribbean', 'North America'),
(22, 'Belize', 'BZ', 'BLZ', 'Americas', 'Latin America and the Caribbean', 'North America'),
(24, 'Bermuda', 'BM', 'BMU', 'Americas', 'Northern America', 'North America'),
(26, 'Bolivia (Plurinational State of)', 'BO', 'BOL', 'Americas', 'Latin America and the Caribbean', 'North America'),
(27, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', 'Americas', 'Latin America and the Caribbean', 'North America'),
(30, 'Bouvet Island', 'BV', 'BVT', 'Americas', 'Latin America and the Caribbean', 'North America'),
(31, 'Brazil', 'BR', 'BRA', 'Americas', 'Latin America and the Caribbean', 'North America'),
(40, 'Canada', 'CA', 'CAN', 'Americas', 'Northern America', 'North America'),
(41, 'Cayman Islands', 'KY', 'CYM', 'Americas', 'Latin America and the Caribbean', 'North America'),
(44, 'Chile', 'CL', 'CHL', 'Americas', 'Latin America and the Caribbean', 'North America'),
(48, 'Colombia', 'CO', 'COL', 'Americas', 'Latin America and the Caribbean', 'North America'),
(53, 'Costa Rica', 'CR', 'CRI', 'Americas', 'Latin America and the Caribbean', 'North America'),
(56, 'Cuba', 'CU', 'CUB', 'Americas', 'Latin America and the Caribbean', 'North America'),
(57, 'Cura̤ao', 'CW', 'CUW', 'Americas', 'Latin America and the Caribbean', 'North America'),
(62, 'Dominica', 'DM', 'DMA', 'Americas', 'Latin America and the Caribbean', 'North America'),
(63, 'Dominican Republic', 'DO', 'DOM', 'Americas', 'Latin America and the Caribbean', 'North America'),
(64, 'Ecuador', 'EC', 'ECU', 'Americas', 'Latin America and the Caribbean', 'North America'),
(66, 'El Salvador', 'SV', 'SLV', 'Americas', 'Latin America and the Caribbean', 'North America'),
(72, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 'Americas', 'Latin America and the Caribbean', 'North America'),
(77, 'French Guiana', 'GF', 'GUF', 'Americas', 'Latin America and the Caribbean', 'North America'),
(87, 'Greenland', 'GL', 'GRL', 'Americas', 'Northern America', 'North America'),
(88, 'Grenada', 'GD', 'GRD', 'Americas', 'Latin America and the Caribbean', 'North America'),
(89, 'Guadeloupe', 'GP', 'GLP', 'Americas', 'Latin America and the Caribbean', 'North America'),
(91, 'Guatemala', 'GT', 'GTM', 'Americas', 'Latin America and the Caribbean', 'North America'),
(95, 'Guyana', 'GY', 'GUY', 'Americas', 'Latin America and the Caribbean', 'North America'),
(96, 'Haiti', 'HT', 'HTI', 'Americas', 'Latin America and the Caribbean', 'North America'),
(99, 'Honduras', 'HN', 'HND', 'Americas', 'Latin America and the Caribbean', 'North America'),
(111, 'Jamaica', 'JM', 'JAM', 'Americas', 'Latin America and the Caribbean', 'North America'),
(140, 'Martinique', 'MQ', 'MTQ', 'Americas', 'Latin America and the Caribbean', 'North America'),
(144, 'Mexico', 'MX', 'MEX', 'Americas', 'Latin America and the Caribbean', 'North America'),
(150, 'Montserrat', 'MS', 'MSR', 'Americas', 'Latin America and the Caribbean', 'North America'),
(160, 'Nicaragua', 'NI', 'NIC', 'Americas', 'Latin America and the Caribbean', 'North America'),
(172, 'Panama', 'PA', 'PAN', 'Americas', 'Latin America and the Caribbean', 'North America'),
(174, 'Paraguay', 'PY', 'PRY', 'Americas', 'Latin America and the Caribbean', 'North America'),
(175, 'Peru', 'PE', 'PER', 'Americas', 'Latin America and the Caribbean', 'North America'),
(180, 'Puerto Rico', 'PR', 'PRI', 'Americas', 'Latin America and the Caribbean', 'North America'),
(186, 'Saint Barth̩lemy', 'BL', 'BLM', 'Americas', 'Latin America and the Caribbean', 'North America'),
(188, 'Saint Kitts and Nevis', 'KN', 'KNA', 'Americas', 'Latin America and the Caribbean', 'North America'),
(189, 'Saint Lucia', 'LC', 'LCA', 'Americas', 'Latin America and the Caribbean', 'North America'),
(190, 'Saint Martin (French part)', 'MF', 'MAF', 'Americas', 'Latin America and the Caribbean', 'North America'),
(191, 'Saint Pierre and Miquelon', 'PM', 'SPM', 'Americas', 'Northern America', 'North America'),
(192, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 'Americas', 'Latin America and the Caribbean', 'North America'),
(202, 'Sint Maarten (Dutch part)', 'SX', 'SXM', 'Americas', 'Latin America and the Caribbean', 'North America'),
(208, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 'Americas', 'Latin America and the Caribbean', 'North America'),
(213, 'Suriname', 'SR', 'SUR', 'Americas', 'Latin America and the Caribbean', 'North America'),
(226, 'Trinidad and Tobago', 'TT', 'TTO', 'Americas', 'Latin America and the Caribbean', 'North America'),
(230, 'Turks and Caicos Islands', 'TC', 'TCA', 'Americas', 'Latin America and the Caribbean', 'North America'),
(236, 'United States of America', 'US', 'USA', 'Americas', 'Northern America', 'North America'),
(238, 'Uruguay', 'UY', 'URY', 'Americas', 'Latin America and the Caribbean', 'North America'),
(241, 'Venezuela (Bolivarian Republic of)', 'VE', 'VEN', 'Americas', 'Latin America and the Caribbean', 'North America'),
(243, 'Virgin Islands (British)', 'VG', 'VGB', 'Americas', 'Latin America and the Caribbean', 'North America'),
(244, 'Virgin Islands (U.S.)', 'VI', 'VIR', 'Americas', 'Latin America and the Caribbean', 'North America');

