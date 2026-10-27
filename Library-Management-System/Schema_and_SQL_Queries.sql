CREATE DATABASE IF NOT EXISTS `Library Management System`;
USE `Library Management System`;
-- schema
create table CATEGORY(
category_id int not null auto_increment,
name varchar(250) not null,
PRIMARY KEY(category_id)
);

create table PUBLISHER(
pub_id int not null auto_increment,
name varchar(250) not null,
address varchar(250) not null,
PRIMARY KEY(pub_id)
);

create table BOOK(
book_id int not null auto_increment,
title varchar(250) not null,
price float not null,
pub_id int not null,
category_id int not null,
PRIMARY KEY(book_id),
FOREIGN KEY(category_id) references CATEGORY(category_id),
FOREIGN KEY(pub_id) references PUBLISHER(pub_id)
);

create table MEMBER(
member_id int not null,
name varchar(250) not null,
address varchar(250) not null,
join_date datetime not null,
PRIMARY KEY(member_id)
);

create table BORROWING_BOOK(
member_id int not null,
book_id int not null,
borrow_date datetime not null,
due_date datetime not null,
return_date datetime not null,
PRIMARY KEY(member_id, book_id, borrow_date),
FOREIGN KEY(member_id) references MEMBER(member_id),
FOREIGN KEY(book_id) references BOOK(book_id)
);

-- sample data
INSERT INTO category(name) values ("Science Fiction");
INSERT INTO category(name) values ("Educational");
INSERT INTO category(name) values ("Drama");
INSERT INTO category(name) values ("History");
INSERT INTO category(name) values ("Novel");
INSERT INTO category(name) values ("Thriller");


INSERT INTO `publisher` VALUES
('1','Collier PLC','729 Kuphal Gateway\nPagacshire, WI 53412'),
('2','Grady, Walter and Bins','2379 Wisoky Field Apt. 761\nPort Orie, FL 97905-4869'),
('3','Kihn-Abernathy','9359 Gabe Burgs Suite 728\nWest Maxborough, OH 67016-0043'),
('4','Moen and Sons','3773 Stracke Drive Suite 718\nEvelinemouth, MN 87950-4818'),
('5','Roob Ltd','7212 Walker Centers\nNorth Uriahmouth, ID 16381'),
('6','Durgan, Kuhic and Walsh','9967 Donato Brooks Suite 759\nWebertown, MD 45717-8305'),
('7','Eichmann PLC','987 Godfrey Shoal Suite 985\nParkerland, WV 80370-5220'),
('8','Spencer, Dach and Shields','3613 Bashirian Extensions\nEast Cheyenne, MD 69786-7098'),
('9','Orn, Greenholt and Haag','548 Nat Cliff\nSouth Oma, AL 54451'),
('10','Crooks PLC','80013 Kunde Walk Apt. 771\nPourosside, VT 55551-1392'),
('11','Barton, Morar and Bashirian','05479 Jessika Stravenue Suite 768\nSouth Xavier, DE 13043'),
('12','Dietrich, Beahan and Hagenes','2879 Geovanny Skyway\nPort Quinten, KY 44251'),
('13','Adams-Schuster','0985 Grant Knoll Suite 031\nPort Nikolasshire, AR 36068-3976'),
('14','Deckow-Kuhn','42384 Leopoldo Spurs\nCartertown, WV 04262'),
('15','Little LLC','212 Howell Oval Suite 598\nSouth Edmundburgh, IA 45362'),
('16','Ondricka-Leuschke','96431 Smitham Keys Apt. 027\nEast Kelton, DE 83234'),
('17','Deckow, Koss and Lebsack','77002 Wilkinson Causeway Apt. 193\nLorenzoport, GA 49794'),
('18','Hagenes-Koss','63145 Okuneva River Suite 599\nBeattybury, ID 19307-0067'),
('19','Deckow LLC','53485 Medhurst Expressway Apt. 966\nWest Brionna, HI 98785'),
('20','Ritchie PLC','04339 Gerhard Islands Apt. 748\nConnport, TN 09361');



INSERT INTO book(title, price, pub_id, category_id) values
("Hamlet", 19.5 ,2 ,3),
("Macbeth", 19.5 ,3 ,3),
("Tale of two cities", 13.5, 1, 3),
("Introduction To Algorithms", 15.5 ,2 ,2),
("Cracking the code interview", 15.5, 2, 2),
("harry potter and the sorcerer's stone", 10.7 ,1 ,1),
("harry potter and the chamber of secrets", 8.5 ,1 ,1),
("harry potter and the chamber of secrets", 8.5 ,1 ,1),
("The prisoner", 10.5 ,1 ,1),
("The Art of war", 20.5 ,1 ,4),
("Salt", 40.5 ,10 ,3),
("The Art of war", 10.5 ,7 ,4),
("The Crusades", 10.5 ,15 ,4),
("The Marchant", 10.5 ,10 ,3),
(" The Death of Lucy Kyte ", 50.5 ,11 ,3),
("Marley and me ", 25.4 ,11 ,6),
(" My world ", 39.5 ,11 ,6),
("Stay with me", 20.5 ,11 ,3),
(" The History of the Ancient World ", 13.5 ,11 ,4),
(" A World Lit Only by Fire ", 40.5 ,11 ,3);





INSERT INTO `member` VALUES ('1','Gerhard Roberts','14492 Bode Neck Apt. 916\nWest Lorenaport, NY 42896','1983-09-14 11:39:02'),
('2','Melany Emard','1524 Yasmeen Centers Apt. 085\nCamrenbury, WV 34023','1986-01-18 18:43:04'),
('3','Mariane Hegmann','02651 Hipolito Ford Apt. 144\nLake Arden, ID 37085-7038','2011-06-01 11:27:02'),
('4','Ericka Rice','447 Bradtke Mission Apt. 112\nSchadenmouth, LA 65578','2014-04-23 19:13:08'),
('5','Sylvan Rath DDS','694 Daniela Cove Suite 766\nArmandoshire, MA 34776','1974-10-03 02:28:08'),
('6','Margaretta Effertz','405 Constance Row Apt. 992\nNew Dorian, NJ 46795','2016-09-10 23:27:50'),
('7','Felton Baumbach','77683 Swift Square\nNorth Enos, UT 78052-0974','1972-02-07 00:32:02'),
('8','Mrs. Gabriella Price Sr.','636 Kayden Expressway\nAlfonsoside, MA 00163','1989-08-02 19:51:16'),
('9','Aiden Roberts II','4584 Reggie Locks\nNorth Monicaton, KS 65286-1749','1995-02-28 04:55:06'),
('10','Mrs. Sadie Bernhard III','19050 Johns Tunnel Suite 513\nTrompberg, DE 12406-5241','1982-06-16 08:01:11'),
('11','Prof. Brett Turner','35675 Jessica Springs\nPort Della, NY 82118-7428','2015-03-10 02:28:30'),
('12','Eunice Purdy','6890 Obie Pines\nEast Rociotown, IL 74590-3583','2019-10-01 07:33:27'),
('13','Darrion Raynor','95047 Kertzmann Route Apt. 402\nNorth Priscillaville, ID 43846-9217','1992-12-01 13:53:03'),
('14','Alessia Crooks','220 Kristina Lake\nBrisaton, WA 45295','1982-07-15 11:26:42'),
('15','Queenie Brown','41360 Jewell Shoals\nEast Gennaro, NE 69026','1980-10-21 14:26:40'),
('16','Jevon Gottlieb','768 Rebeca Harbors Apt. 159\nBoganville, IA 35650-7584','1980-02-29 16:55:51'),
('17','Connie Dickens','161 Nia Lane\nEast Myra, LA 19349','2006-07-15 22:57:20'),
('18','Ciara Hessel','73279 Lehner Forks\nPort Michaelatown, VT 71256','2006-12-02 11:25:19'),
('19','Kane Parker I','25314 Naomie Mission\nWest Amie, UT 94743','1996-08-23 13:29:36'),
('20','Mr. Daron Carter Jr.','97787 Schuppe Crossing Suite 230\nNew Myrtice, NM 69670','2007-10-05 00:47:09'),
('21','Jeanette Franecki Jr.','995 Murazik Extensions\nSouth Armand, RI 14061','1974-07-30 09:44:21'),
('22','Presley Swaniawski','0381 Karl Landing\nEast Johann, ND 96968-3266','2017-01-31 18:42:05'),
('23','Kayli Dietrich','416 Schoen Plain\nSouth Raymundofort, RI 70517-4977','1974-12-23 18:59:03'),
('24','Mohamed Rempel','80889 Bernhard Wells\nEast Sheila, DC 02535','1996-07-13 00:07:07'),
('25','Tamia Kautzer','729 Kilback Springs Apt. 709\nShakirashire, AR 78020-7570','2018-07-11 07:15:43'),
('26','Prof. Kitty Romaguera','7443 Sporer Hills\nNew Hazlehaven, TN 62783-3058','2000-05-23 16:52:55'),
('27','Chesley Rodriguez','016 Douglas Cliffs Suite 320\nNedrabury, TX 25757-0831','2014-08-16 01:14:08'),
('28','Scot Reinger','414 McCullough Square\nLake Tracystad, DE 93855','1995-11-12 05:49:42'),
('29','Ms. Ciara Stoltenberg','129 Kuvalis Brooks\nKunzefurt, CA 40473','1993-05-03 22:03:23'),
('30','Henriette Glover','3222 Grayson Grove\nNorashire, WI 95814-1478','1991-05-07 14:14:44'),
('31','Dr. Cristian Gislason V','67711 Sophia Fork Suite 279\nNorth Einar, IL 29982-2943','1986-04-19 00:39:15'),
('32','Hayley Howell','37691 Mann Passage\nSouth Kiarra, AR 17204','1977-01-13 21:26:19'),
('33','Prof. Emilie Bergnaum','5462 Pietro Stream Suite 956\nLefflerland, WI 77138','1986-12-26 23:00:11'),
('34','Prof. Ray O\'Connell','627 Edwardo Lights Suite 989\nPort Vadachester, VT 70483-6281','2012-05-11 12:21:35'),
('35','Prof. Gerald Price','0907 Buckridge Mountain Apt. 919\nMorissettefort, WV 34788','2003-12-01 06:42:42'),
('36','Travon Stokes','189 Jerde Ridges\nElmiraside, NE 35384','1991-03-12 04:36:53'),
('37','Anastasia Spencer','0926 Tatyana Branch\nEmmerichland, PA 43674','1987-04-10 12:50:23'),
('38','Dedric Gleason','012 Rodrigo Manors\nSouth Eldridgetown, WI 77254-6124','1983-04-10 22:34:38'),
('39','Benny Mitchell','57007 Gusikowski Gardens Suite 805\nEast Dockshire, NH 24773','2003-07-01 14:09:59'),
('40','Domenic Casper','6269 Melvina Flats\nRyanchester, LA 54030-9264','2012-10-27 23:15:32'),
('41','Mariana McCullough II','43125 Fleta Skyway Suite 828\nHuelsfort, PA 70700-0884','1984-03-29 18:21:31'),
('42','Dagmar Orn','286 Drake Ramp Apt. 961\nLake Estellmouth, WY 80668','1992-11-10 22:16:35'),
('43','Dedrick Daugherty','14019 Chelsey Inlet Suite 960\nEveport, GA 72203','1971-01-17 11:54:44'),
('44','Alisa Gerlach','84718 Loma Points\nLake Cecil, VT 72207','1975-07-04 20:13:09'),
('45','Hailee Legros','948 Jast Ville Apt. 665\nEast Jon, VT 15306','1972-09-01 07:54:34'),
('46','Brett Dare','44490 Russ Green Apt. 995\nBrakusburgh, FL 16836-3556','1971-11-24 00:14:29'),
('47','Mr. Art Hilpert II','80042 Clint Curve Apt. 635\nGerlachmouth, ID 76589','1980-10-30 19:29:15'),
('48','Rylan Cummerata','8841 Zetta Curve Suite 196\nNew Cassidy, WY 98133-9393','2008-09-25 20:41:27'),
('49','Summer Heaney','34939 Carter Wall Apt. 604\nLabadietown, NJ 34876-7327','1987-07-08 17:58:50'),
('50','Herman Dach','9700 Zieme Lane Suite 151\nTiaramouth, SD 17056-9953','2014-11-10 06:19:42');



INSERT INTO `borrowing_book` (`member_id`, `book_id`,`borrow_date`, `due_date`, `return_date`) VALUES
(1, 1,'1976-03-29 20:31:19', '1976-07-28 22:33:23', '2005-05-24 07:43:52'),
(1, 11, '1990-06-07 09:40:40', '1990-07-06 08:45:50', '1990-06-30 16:44:25'),
(2, 2, '2013-07-21 23:40:19', '2013-09-20 23:47:19', '2013-08-06 18:05:29'),
(2, 12, '1974-09-03 19:09:08','1974-10-04 18:09:08', '1974-09-02 06:51:22'),
(3, 3, '2004-10-13 02:05:15', '2004-12-12 02:05:15', '2004-11-02 19:49:41'),
(3, 13, '1972-02-04 12:52:46', '1972-05-05 12:52:46', '1972-04-28 06:30:17'),
(4, 4, '2009-01-25 00:54:13', '2009-03-24 00:54:13', '2009-03-12 22:39:26'),
(4, 14, '1989-05-22 07:36:38', '1989-09-21 07:36:38', '1989-08-16 20:37:27'),
(5, 5, '2001-01-04 02:18:56', '2001-05-06 02:18:56', '2001-10-18 11:56:28'),
(5, 15, '1982-07-12 18:26:42', '1982-11-11 18:26:42', '1982-08-09 17:24:26'),
(6, 6, '1994-02-11 23:21:41', '1994-07-10 23:21:41', '1994-06-13 18:05:18'),
(6, 16, '1993-01-01 21:10:46', '1993-04-02 21:10:46', '1993-04-02 10:16:38'),
(7, 7, '2007-01-19 18:20:51', '2007-03-18 18:20:51', '2007-02-23 12:55:53'),
(8, 8, '2010-03-20 16:04:01', '2010-05-19 16:04:01', '2010-04-26 09:05:52'),
(7, 17, '1998-01-18 12:57:53', '1998-03-17 12:57:53', '1998-02-28 16:15:11'),
(8, 18, '2006-07-15 14:44:36', '2006-09-14 14:44:36', '2006-08-30 05:42:36'),
(9, 9, '2010-04-22 11:22:43', '2010-07-21 11:22:43', '2010-06-15 04:14:02'),
(9, 19, '1992-09-05 17:06:48', '1993-01-04 17:06:48', '1993-01-01 03:46:37'),
(10, 10, '1993-10-05 05:38:14', '1993-12-04 05:38:14', '1993-09-30 18:06:22'),
(10, 20, '1982-01-21 06:43:29', '1982-03-20 06:43:29', '1982-10-02 13:50:22'),
(11, 1, '1977-06-15 04:05:34', '1977-08-14 04:05:34', '1977-08-04 12:05:09'),
(11, 11, '2019-01-03 12:45:32', '2019-03-02 12:45:32', '2019-03-02 10:55:41'),
(12, 2, '1978-05-02 17:46:28', '1978-09-01 17:46:28', '1978-06-30 22:15:26'),
(12, 12, '2007-05-05 19:48:51', '2007-06-04 19:48:51', '2007-06-03 21:45:02'),
(13, 3, '1973-04-02 18:12:14', '1973-06-01 18:12:14', '1973-04-23 21:36:48'),
(13, 13, '1972-09-11 14:17:56', '1972-11-10 14:17:56', '1972-10-06 05:45:54'),
(14, 4, '1982-10-28 07:38:41', '1982-11-27 07:38:41', '1982-11-16 09:12:42'),
(14, 14, '1998-02-27 02:43:57', '1998-03-26 02:43:57', '1998-03-05 02:57:35'),
(15, 5, '1971-06-18 20:49:44', '1971-07-19 20:49:44', '1971-06-17 15:59:28'),
(15, 15, '2005-10-17 03:00:31', '2005-12-16 03:00:31', '2005-12-15 06:44:06'),
(16, 6, '1991-11-09 00:43:24', '1992-01-08 00:43:24', '1992-01-05 00:40:59'),
(16, 16, '1986-01-29 10:08:24', '1986-04-28 10:08:24', '1986-04-26 17:30:37'),
(17, 7, '2015-06-23 07:20:34', '2015-08-22 07:20:34', '2015-08-11 10:09:00'),
(17, 17, '1996-02-05 13:25:44', '1996-04-04 13:25:44', '1996-04-03 01:00:55'),
(18, 8, '1994-05-25 18:08:26', '1994-06-24 18:08:26', '1994-06-24 10:32:50'),
(18, 18, '2019-03-30 08:21:43', '2019-05-30 08:21:43', '2019-05-01 09:55:19'),
(19, 9, '1970-08-29 16:21:17', '1970-09-28 16:21:17', '1970-09-01 03:42:12'),
(19, 19, '1984-01-06 21:53:06', '1984-02-05 21:53:06', '1984-02-01 23:47:37'),
(20, 10, '2011-09-05 14:34:56', '2011-10-04 14:34:56', '2011-10-03 20:41:26'),
(20, 20, '2014-02-21 22:47:19', '2014-03-20 22:47:19', '2014-03-18 08:30:46'),
(21, 1, '1975-01-11 07:39:46', '1975-02-10 07:39:46', '1975-02-01 01:14:12'),
(21, 11, '1972-07-03 05:41:36', '1972-08-02 05:41:36', '1972-07-29 01:02:51'),
(22, 2, '1998-07-01 10:26:43', '1998-07-07 10:26:43', '1998-07-06 18:42:34'),
(22, 12, '1989-11-17 07:57:39', '1989-12-16 07:57:39', '1989-12-10 08:06:03'),
(23, 3, '1995-12-12 20:15:01', '1995-12-22 20:15:01', '1995-12-20 10:40:49'),
(23, 13, '2005-07-10 09:39:03', '2005-08-09 09:39:03', '2005-08-01 16:07:23'),
(24, 4, '1980-03-01 00:46:55', '1980-03-18 00:46:55', '1980-03-10 11:24:52'),
(24, 14, '2000-03-14 15:18:47', '2000-04-13 15:18:47', '2000-04-09 06:33:35'),
(25, 5, '1994-10-01 07:57:44', '1994-10-16 07:57:44', '1994-10-12 22:10:22'),
(25, 15, '1995-10-15 01:37:27', '1995-10-31 01:37:27', '1995-10-28 17:49:27'),
(26, 6, '2018-09-15 11:01:03', '2018-10-01 11:01:03', '2018-09-30 21:05:04'),
(26, 16, '1984-06-01 20:59:45', '1984-06-14 20:59:45', '1984-06-11 05:57:21'),
(27, 7, '1975-06-20 01:26:31', '1975-06-27 01:26:31', '1975-06-25 21:53:47'),
(27, 17, '1992-02-19 18:41:48', '1992-02-26 18:41:48', '1992-06-25 07:35:04'),
(28, 8, '2017-03-01 16:08:19', '2017-03-26 16:08:19', '2017-03-20 13:58:52'),
(28, 18, '1984-11-03 19:08:14', '1984-12-02 19:08:14', '1984-11-25 08:59:45'),
(29, 9, '1997-03-04 06:30:29', '1997-03-18 06:30:29', '1997-03-16 02:15:47'),
(29, 19, '1972-07-02 15:23:02', '1972-07-23 15:23:02', '1972-07-20 18:40:57'),
(30, 10, '1983-03-13 11:47:54', '1983-03-17 11:47:54', '1983-03-16 12:34:50'),
(30, 20, '2006-01-01 05:55:59', '2006-01-26 05:55:59', '2006-01-14 04:49:18'),
(31, 1, '1978-07-01 10:21:19', '1978-07-07 10:21:19', '1978-07-07 04:11:30'),
(31, 11, '1976-04-01 11:49:43', '1976-04-14 11:49:43', '1976-04-13 08:54:12'),
(32, 2, '1987-01-17 00:32:16', '1987-02-16 00:32:16', '1987-02-14 02:11:14'),
(32, 12, '1990-07-16 08:56:51', '1990-08-01 08:56:51', '1990-07-30 17:34:31'),
(33, 3, '1984-12-01 06:35:50', '1984-12-11 06:35:50', '1984-12-09 12:57:36'),
(33, 13, '1981-11-17 22:26:40', '1981-12-16 22:26:40', '1981-12-01 12:51:44'),
(34, 4, '2008-07-10 06:55:37', '2008-08-09 06:55:37', '2008-08-01 13:52:24'),
(34, 14, '1983-01-18 17:19:28', '1983-02-17 17:19:28', '1983-01-30 15:23:02'),
(35, 5, '1974-04-05 02:35:33', '1974-05-03 02:35:33', '1974-04-28 22:06:34'),
(35, 15, '2009-09-19 17:31:29', '2009-09-26 17:31:29', '2009-09-25 15:15:21'),
(36, 6, '2000-06-01 00:55:07', '2000-06-22 00:55:07', '2000-06-12 15:26:35'),
(36, 16, '2005-11-02 17:22:06', '2005-11-18 17:22:06', '2005-11-11 12:24:41'),
(37, 7, '1975-05-05 05:16:57', '1975-05-20 05:16:57', '1975-05-16 10:24:58'),
(37, 17, '1975-11-10 06:21:23', '1975-12-09 06:21:23', '1975-12-01 21:13:34'),
(38, 8, '2018-09-01 09:19:42', '2018-09-30 09:19:42', '2018-09-22 15:14:44'),
(38, 18, '1997-07-15 01:27:20', '1997-07-30 01:27:20', '1997-07-25 05:06:10'),
(39, 9, '1981-07-01 08:04:22', '1981-07-12 08:04:22', '1981-07-10 14:15:12'),
(39, 19, '2014-09-20 17:59:36', '2014-09-27 17:59:36', '2015-09-27 04:43:59'),
(40, 10, '1994-02-01 02:57:30', '1994-02-21 02:57:30', '1994-02-18 20:24:32'),
(40, 20, '1989-08-05 03:51:44', '1989-08-25 03:51:44', '1989-08-14 17:03:10'),
(41, 1, '1990-07-01 21:22:59', '1990-07-15 21:22:59', '1990-07-13 05:55:43'),
(41, 11, '1996-03-05 15:22:18', '1996-04-04 15:22:18', '1996-03-30 03:04:39'),
(42, 2, '1998-07-10 07:56:32', '1998-08-09 07:56:32', '1998-07-29 02:29:09'),
(42, 12, '1989-12-04 11:09:12', '1989-12-24 11:09:12', '1989-12-23 05:42:14'),
(43, 3, '2019-10-04 03:53:11', '2019-10-24 03:53:11', '2019-10-20 20:45:48'),
(43, 13, '1985-11-16 09:51:51', '1985-11-26 09:51:51', '1985-11-25 04:22:02'),
(44, 4, '1992-04-11 22:52:13', '1992-05-10 22:52:13', '1992-05-05 01:05:07'),
(44, 14, '2000-01-06 14:55:02', '2000-02-05 14:55:02', '2000-01-28 09:14:01'),
(45, 5, '2002-07-01 04:40:46', '2002-07-30 04:40:46', '2002-07-15 04:27:42'),
(45, 15, '1975-08-09 10:46:07', '1975-09-08 10:46:07', '1975-08-30 09:29:28'),
(46, 6, '2000-08-04 08:39:01', '2000-08-19 08:39:01', '2000-08-16 20:33:44'),
(46, 16, '1973-10-15 17:50:35', '1973-10-29 17:50:35', '1973-10-23 20:23:21'),
(47, 7, '1998-01-15 07:03:37', '1998-01-30 07:03:37', '1998-01-28 20:04:00'),
(47, 17, '2003-10-02 16:45:31', '2003-10-22 16:45:31', '2003-10-20 06:03:43'),
(48, 8, '1988-06-15 00:06:47', '1988-06-30 00:06:47', '1988-06-22 07:02:25'),
(48, 18, '2012-09-01 21:26:51', '2012-09-21 21:26:51', '2012-09-19 14:33:52'),
(49, 9, '1986-02-03 09:11:16', '1986-02-18 09:11:16', '1986-02-16 05:34:25'),
(49, 19, '1991-05-01 14:43:14', '1991-05-12 14:43:14', '1991-05-11 14:33:50'),
(50, 10, '2003-01-02 14:01:13', '2003-02-01 14:01:13', '2003-01-16 22:31:36'),
(50, 20, '1979-03-20 19:33:11', '1979-03-27 19:33:11', '1979-03-26 02:34:02');

-- SQL queries

-- Query 1
SELECT name
FROM MEMBER
WHERE join_date > '2000-09-01';

-- Query 2
SELECT name, pub_id
FROM PUBLISHER;

-- Query 3
SELECT member_id, name, address, join_date
FROM MEMBER
WHERE join_date >= '1995-10-01' and join_date <= '2019-10-01';

-- Query 4
SELECT book_id, title, price, pub_id, category_id
FROM BOOK
WHERE pub_id = '2' or price >= 15 and price <= 20;

-- Query 5
SELECT member_id, book_id, borrow_date, due_date, return_date
FROM BORROWING_BOOK
WHERE member_id = 5;