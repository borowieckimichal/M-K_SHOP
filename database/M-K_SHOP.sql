-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 02, 2017 at 03:53 PM
-- Server version: 5.5.50-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `M-K_SHOP`
--

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

CREATE TABLE IF NOT EXISTS `Admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `hashed_password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Admin`
--

INSERT INTO `Admin` (`id`, `name`, `email`, `hashed_password`) VALUES
(1, '', 'admin1@admin.pl', '$2y$10$rqZKTBh37Nutx1Q2Rfsv7enV6CZkGdKO7Ry7E79PUqedahpObegiO'),
(2, 'Admin', 'admin@admin', '$2y$10$u2w3q9.yWVirbzN9WWD2jOBqi2EKxrrpnUQi69EQcy8kE/MM2fQuq'),
(3, 'Admin drugi', '', '$2y$10$s2XTQaHmrraqZWM1PrxviurdHb2Dyz.EBbyNXBHeeq5PB.8Uf.V3a'),
(5, 'Admin2', 'admin@wp.pl', '$2y$10$c8Oei4DTa/ifgo8/aGKaWeANR427pHm/C69yu6Sse8d2e0IPNNN9C');

-- --------------------------------------------------------

--
-- Table structure for table `Groups`
--

CREATE TABLE IF NOT EXISTS `Groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `Groups`
--

INSERT INTO `Groups` (`id`, `group_name`) VALUES
(10, 'Dyski SSD'),
(11, 'Dyski FDSH'),
(12, 'Monitory'),
(13, 'PÅ‚yty gÅ‚Ã³wne'),
(14, 'Komputery'),
(16, 'Karty Graficzne');

-- --------------------------------------------------------

--
-- Table structure for table `Messages`
--

CREATE TABLE IF NOT EXISTS `Messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_receiver` int(11) NOT NULL,
  `id_sender` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text_message` text NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_sender` (`id_sender`),
  KEY `id_receiver` (`id_receiver`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `Messages`
--

INSERT INTO `Messages` (`id`, `id_receiver`, `id_sender`, `title`, `text_message`, `creation_date`) VALUES
(3, 15, 2, 'ZamÃ³wienie nr 20', 'Witam,hghghhg', '2016-12-29 12:01:23'),
(4, 15, 2, 'ZamÃ³wienie nr 20', 'Witam,\r\nsddfd\r\nsdfd\r\nsf\r\nsdfs', '2016-12-29 12:04:01'),
(5, 15, 2, 'ZamÃ³wienie nr 20', 'Witam,\r\ndssdf\r\nfsd\r\ns\r\nfds', '2016-12-29 12:04:30'),
(6, 13, 2, 'ZamÃ³wienie nr 21', 'Witam,\r\nZamÃ³wienie wysÅ‚ane', '2016-12-29 12:05:12'),
(7, 13, 2, 'ZamÃ³wienie nr 22', 'Witam\r\nTowar zostanie wysÅ‚any kiedyÅ› tam.\r\nPo co w ogÃ³le Ci ten towar???\r\nDaj sobie spokÃ³j  z nim!!!!!!!!!!', '2016-12-29 13:06:31'),
(8, 16, 2, 'ZamÃ³wienie nr 23', 'Witam,\r\nZamÃ³wienie zostaÅ‚o wstrzymane bo jebnÄ…Å‚ regaÅ‚.\r\nNo sorry', '2016-12-29 13:24:17');

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE IF NOT EXISTS `Orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `payment_method` varchar(100) NOT NULL,
  `amount` float NOT NULL,
  `adress_street` varchar(100) NOT NULL,
  `adress_local` varchar(100) NOT NULL,
  `postal_code` varchar(100) NOT NULL,
  `adress_city` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`id`, `id_user`, `status`, `creation_date`, `payment_method`, `amount`, `adress_street`, `adress_local`, `postal_code`, `adress_city`) VALUES
(3, 10, 0, '0000-00-00 00:00:00', 'Cash', 0, '', '', '', ''),
(4, 11, 0, '0000-00-00 00:00:00', 'Cash', 0, '', '', '', ''),
(9, 12, 3, '2017-01-02 11:44:02', '2', 0, 'Bulwar st', '10', '00-888', 'New Jork'),
(10, 12, 0, '2016-12-27 11:30:20', '', 0, '', '', '', ''),
(14, 13, 1, '2016-12-27 14:26:18', '2', 0, 'Main St', '1067b', '00-876', 'New Jork'),
(15, 13, 2, '2016-12-28 10:21:29', '2', 678.78, 'Main St', '1067b', '00-876', 'New Jork'),
(16, 14, 0, '2016-12-28 07:36:04', 'Cash', 0, '', '', '', ''),
(17, 13, 1, '2016-12-28 17:46:03', '2', 5185.45, 'Main Street', '1067b', '00-876', 'New Jork'),
(19, 15, 1, '2016-12-28 13:03:49', '2', 4670.1, 'Fawn Lane', '10', '60-451', 'New Lenox'),
(20, 15, 0, '2016-12-28 13:11:29', '', 1023, '', '', '', ''),
(21, 13, 1, '2016-12-28 18:22:03', '2', 16727.9, 'Main St', '1067b', '00-876', 'New Jork'),
(22, 13, 1, '2016-12-30 07:28:25', '1', 3614.12, 'Main Street', '10674', '00-876', 'New York'),
(23, 16, 1, '2016-12-29 13:22:49', '3', 678.78, 'London St', '34', '00-324', 'London'),
(24, 16, 0, '2016-12-29 14:37:26', '', 1357.56, '', '', '', ''),
(25, 13, 1, '2016-12-30 12:27:39', '2', 1922.45, 'Main Street', '10674', '00-876', 'New York'),
(26, 13, 1, '2016-12-30 13:01:14', '1', 2715.12, 'Main Street', '10674', '00-876', 'New York'),
(27, 13, 0, '2016-12-30 13:01:14', '', 0, '', '', '', ''),
(28, 17, 0, '2017-01-02 10:01:04', 'Cash', 1829, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `Photos`
--

CREATE TABLE IF NOT EXISTS `Photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `path` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE IF NOT EXISTS `Product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_group` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `description` text NOT NULL,
  `availability` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_group` (`id_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `Product`
--

INSERT INTO `Product` (`id`, `id_group`, `name`, `price`, `description`, `availability`, `deleted`) VALUES
(1, 10, 'PÅ‚yta MSI H81', 561.67, 'PÅ‚yta gÅ‚Ã³wna, Å›wietna i nowa i jest kosa.', 0, 0),
(2, 12, 'AEC 17 cali', 550.68, 'Super monitor gamingowy. Wysoki kontrast i rozdzielczoÅ›Ä‡', 0, 1),
(3, 14, 'Komputer Acer', 341, 'Bardzo wydajny komputer z wieloma fajnymi podzespoÅ‚ami', 64, 0),
(4, 14, 'MSI GAMING COMPUTER ', 105.98, 'MSI to jeden z najwiÄ™kszych i najbardziej znanych na Å›wiecie producentÃ³w sprzÄ™tu dla graczy. W swojej ofercie posiada rozwiÄ…zania przeznaczone dla mniej zaawansowanych uÅ¼ytkownikÃ³w, jak rÃ³wnieÅ¼ sprzÄ™t dla prawdziwych profesjonalistÃ³w. Jako jeden z niewielu producentÃ³w na Å›wiecie, oprÃ³cz klasycznych komputerÃ³w stacjonarnych, MSI oferuje takÅ¼e zaprojektowane specjalnie dla graczy komputery All-in-One.', 99, 0),
(5, 14, 'MSI GAMING COMPUTER ', 10258.9, 'MSI to jeden z najwiÄ™kszych i najbardziej znanych na Å›wiecie producentÃ³w sprzÄ™tu dla graczy. W swojej ofercie posiada rozwiÄ…zania przeznaczone dla mniej zaawansowanych uÅ¼ytkownikÃ³w, jak rÃ³wnieÅ¼ sprzÄ™t dla prawdziwych profesjonalistÃ³w. Jako jeden z niewielu producentÃ³w na Å›wiecie, oprÃ³cz klasycznych komputerÃ³w stacjonarnych, MSI oferuje takÅ¼e zaprojektowane specjalnie dla graczy komputery All-in-One.', 0, 1),
(6, 14, 'Acer Predator i7 - 4', 5231.99, 'cer Predator 17 to zaawansowany technologicznie laptop dla wymagajÄ…cych graczy. Jego nieprzeciÄ™tna stylistyka inspirowana byÅ‚a, jak podaje producent, wyobraÅ¼eniem miÄ™dzygalaktycznych krÄ…Å¼ownikÃ³w - ostre linie i kÄ…ty, agresywne elementy i specjalnie zaprojektowany system chÅ‚odzenia wpÅ‚ywajÄ… na efektowny wyglÄ…d notebooka. \r\n\r\nAcer Predator 17 zostaÅ‚ wyposaÅ¼ony w bardzo mocne procesory Intel Core i7 oraz karty graficzne nVidia GeForce GTX, dziÄ™ki ktÃ³rym rozgrywka oraz oprawa wizualna zawsze stojÄ… na najwyÅ¼szym poziomie. DostÄ™pne sÄ… modele z ekranami Full HD, jak rÃ³wnieÅ¼ 4K. CaÅ‚oÅ›Ä‡ uzupeÅ‚nia oprogramowanie Predator, podÅ›wietlana klawiatura oraz obsÅ‚uga technologii nVidia G-Sync. CiekawostkÄ… jest takÅ¼e specjalny system Dust Defender czyszczÄ…cy co jakiÅ› czas przewody wentylacyjne laptopa z kurzu.', 10, 0),
(7, 12, 'Monitor Acer', 789, 'Podstawowe cechy:\r\nProporcje wymiarÃ³w matrycy: 16:9\r\nRozdzielczoÅ›Ä‡: 1920 x 1080\r\nWbudowane gÅ‚oÅ›niki: Nie\r\nPrzekÄ…tna ekranu [cal]: 21.5\r\nPodstawowe zÅ‚Ä…cza: Cyfrowe (DVI), Cyfrowe (HDMI), Analogowe (D-Sub)', 0, 1),
(8, 16, 'Palit gtx 1050', 678.78, 'hsffhsjkfhjksmgcsdc\r\nfgddfg\r\nsgdf\r\ngdf\r\n\r\ngdf\r\ngdfsg\r\nfd\r\ngdf\r\ndgf\r\nsgdf\r\ng\r\ng\r\n\r\nfg', 57, 0),
(9, 12, 'Monitor LCD Eizo Col', 1005.99, 'Wbudowany czujnik do autokorekcji Do przeprowadzenia pierwszej kalibracji monitora konieczny jest zewnÄ™trzny kalibrator, natomiast wbudowany w ColorEdge CS230 czujnik wraz z dostÄ™pnym opcjonalnie oprogramowaniem ColorNavigator czuwa nad tym, aby wybrane ustawienia zachowywane byÅ‚y na tym samym poziomie. Czujnik ukryty jest w gÃ³rnej czÄ™Å›ci obudowy i wysuwa siÄ™ tylko wtedy, gdy zgodnie z harmonogramem sporzÄ…dzonym przez uÅ¼ytkownika, naleÅ¼y dokonaÄ‡ kontroli ustawieÅ„. Nawet jeÅ›li monitor jest wyÅ‚Ä…czony lub nie jest podÅ‚Ä…czony do komputera, czujnik wysunie siÄ™ samoczynnie o czasie i dokona samokontroli. Autorski ukÅ‚ad ASIC EIZO Wszystkie modele ColorEdge posiadajÄ… zaprojektowany przez EIZO ukÅ‚ad ASIC (application specific integrated circuit), dostosowany do potrzeb rynku graficznego. UkÅ‚ad korzysta z wÅ‚asnych algorytmÃ³w do bardzo dokÅ‚adnego przetwarzania kolorÃ³w, aby precyzyjnie reprodukowaÄ‡ poszczegÃ³lne odcienie. Kontrola rÃ³wnomiernoÅ›ci podÅ›wietlenia oraz koloru na caÅ‚ej powierzchni matrycy (DUE) Uzyskanie rÃ³wnomiernego podÅ›wietlenia oraz jednorodnego koloru na caÅ‚ej powierzchni matrycy byÅ‚o dotychczas niemal niemoÅ¼liwe w monitorach LCD. RozwiÄ…zaniem tego problemu jest kolejna wersja opracowanego przez inÅ¼ynierÃ³w EIZO ukÅ‚adu ASIC (Application Specific Integrated Circuit) dokonujÄ…ca w czasie rzeczywistym korekt wyÅ›wietlanego obrazu tak, aby w monitorach opuszczajÄ…cych fabrykÄ™ w Japonii, wspÃ³Å‚czynnik Delta-E opisujÄ…cy nierÃ³wnomiernoÅ›Ä‡, nie przekroczyÅ‚ wartoÅ›ci 3.   Krzywa gamma regulowana indywidualnie w fabryce   DokÅ‚adne odwzorowanie krzywej gamma kaÅ¼dej z barw podstawowych jest warunkiem poprawnego wyÅ›wietlania wszystkich kolorÃ³w. Monitory EIZO z serii ColorEdge juÅ¼ podczas procesu produkcji majÄ… precyzyjnie dobrane barwy skÅ‚adowe w caÅ‚ym zakresie od 0 do 255 odcienia. Dokonywane jest to poprzez pomiar wartoÅ›ci gamma dla kaÅ¼dego z kolorÃ³w podstawowych (Red, Green, Blue) oddzielnie, a nastÄ™pnie przy wykorzystaniu zaszytej w elektronice 16-bitowej tabeli barw Look-Up Table (LUT), wybÃ³r najbardziej pasujÄ…cych 256 odcieni. Jednoczesne wyÅ›wietlanie kolorÃ³w z palety 10-bitowej Przy podÅ‚Ä…czeniu poprzez DisplayPort przez zÅ‚Ä…cze sygnaÅ‚owe moÅ¼liwe jest dostarczanie do monitora 10-bitowej informacji o kolorze*. Monitor korzystajÄ…c z 16-bitowej tablicy LUT, przetwarza informacjÄ™ o kolorze z 16-bitowÄ… precyzjÄ…, co pozwala na uzyskanie bardziej pÅ‚ynnych przejÅ›Ä‡ tonalnych i zmniejszenia Delta-E pomiÄ™dzy poszczegÃ³lnymi punktami. To 64 razy wiÄ™ksza precyzja wiÄ™cej niÅ¼ w', 141, 0),
(10, 13, 'PÅ‚yta MSI Gaming 5', 467.01, 'Podstawowe cechy:\r\nPanel tylny: 4x USB 2.0, 4x USB 3.0, 6x wyjÅ›cie audio, 1x RJ-45, 1x PrzeÅ‚Ä…cznik Clear CMOS, 1x HDMI, 1x DVI-D, 1x PS/2 (klawiatura/mysz), 1x D-Sub (VGA)\r\nStandard pÅ‚yty: ATX\r\nGniazda pamiÄ™ci: DDR3\r\nCzÄ™stotliwoÅ›ci pracy pamiÄ™ci [MHz]: 1333, 1066, 1600, 2000, 1866, 2200, 2133, 2600, 2400, 2800, 2666, 3000, 3100, 3200, 3300\r\nGniazdo procesora: Socket 1150', 96, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Product_orders`
--

CREATE TABLE IF NOT EXISTS `Product_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_orders` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `real_price` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_orders` (`id_orders`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

--
-- Dumping data for table `Product_orders`
--

INSERT INTO `Product_orders` (`id`, `id_orders`, `id_product`, `quantity`, `real_price`) VALUES
(27, 3, 2, 132, 550.68),
(31, 4, 8, 10, 678.78),
(32, 4, 3, 14, 341),
(33, 4, 8, 15, 678.78),
(34, 4, 8, 3, 678.78),
(35, 4, 8, 4, 678.78),
(39, 9, 3, 3, 341),
(46, 14, 3, 3, 341),
(47, 14, 1, 7, 561.67),
(49, 15, 8, 1, 678.78),
(52, 19, 10, 10, 467.01),
(53, 20, 3, 3, 341),
(56, 17, 8, 1, 678.78),
(57, 17, 7, 3, 789),
(58, 21, 10, 3, 467.01),
(59, 21, 1, 1, 561.67),
(60, 21, 9, 4, 1005.99),
(61, 21, 10, 23, 467.01),
(67, 23, 8, 1, 678.78),
(68, 24, 8, 2, 678.78),
(69, 25, 1, 1, 561.67),
(70, 25, 8, 1, 678.78),
(71, 25, 3, 2, 341),
(74, 26, 8, 3, 678.78),
(75, 28, 7, 1, 789),
(76, 28, 10, 1, 467.01),
(77, 28, 10, 1, 467.01),
(78, 28, 4, 1, 105.98);

-- --------------------------------------------------------

--
-- Table structure for table `Statuses`
--

CREATE TABLE IF NOT EXISTS `Statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_name` (`status_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Statuses`
--

INSERT INTO `Statuses` (`id`, `status_name`) VALUES
(0, 'oczekujace'),
(2, 'oplacone'),
(1, 'zlozone'),
(3, 'zrealizowane');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `hashed_password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `adress_street` varchar(255) NOT NULL,
  `adress_local` varchar(20) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `adress_city` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `name`, `surname`, `hashed_password`, `email`, `adress_street`, `adress_local`, `postal_code`, `adress_city`) VALUES
(2, 'Karol', 'Kamil', '$2y$10$u2w3q9.yWVirbzN9WWD2jOBqi2EKxrrpnUQi69EQcy8kE/MM2fQuq', 'user@user.pl', 'Polna', '96', '96-200', 'Rawa'),
(4, 'Janusz', 'Handlarz', '$2y$10$tw74Uo0gqvuTnAFbK/G8P.px4hWMRhB7KOIVOgW00rxuiGgC9nrdK', 'user2@user.pl', 'Polska', '77', '89-547', 'IÅ‚k'),
(10, 'Ania', 'Alka', '$2y$10$Cj24JVHhv1ON9flDMR8KLe/CkVxKZDtPp9grWkV9kppm.TrKT3vVW', 'test1@te.pl', 'Polna', '1', '22-222', 'Polka'),
(11, 'MichaÅ‚', 'Betaa', '$2y$10$xicx7GMLDZzF7Epb0wegtuHYAPu4bT6m3LEBGam8sfH16VYFfHbqm', 'michal@pl.pl', 'Polna', '87/67b', '99-521', 'Warszawa'),
(12, 'Angelina', 'Joe', '$2y$10$Tr35l0Tjtf44qXSWvrfqRuFHm9Wo.vThvWZAwddwdnCz09OE6bXvG', 'angelina@wp.pl', 'Bulwar st', '10', '00-888', 'New Jork'),
(13, 'Vera', 'Farminga', '$2y$10$fR4pa1WdboHT/cLYS0hAAOnnf3XDWyKOlxD.EFs7P3ZuXwKVerb/y', 'vera@wp.pl', 'Main Street', '10674', '00-876', 'New York'),
(14, 'Katy', 'Perry', '$2y$10$MCM87GJ7tisJtpJkFrwQ4O5wwk082dUmSFANQPUTYI5XY9u9.wksy', 'katy@wp.pl', 'Washington St', '89/25l', '99-998', 'Washington DC'),
(15, 'Natalie', 'Dorman', '$2y$10$/q0PfdWsTuNUAi5HJf0SX./RGSq05V6oo2Z0eAzXPiRIlsulH4e4e', 'natalie@wp.pl', 'Fawn Lane', '10', '60-451', 'New Lenox'),
(16, 'Robin', 'Wright', '$2y$10$22LpMDHP5UuiSiwOf0.nnuFxJ4dMPHPA8t4p2rhMA6kWocgXIWRa2', 'robin@wp.pl', 'London St', '347', '00-324', 'London'),
(17, 'Iza', 'Izabella', '$2y$10$pa4OFoT/PpZECjU1ALaFaeBu0fS/RRtQgyF2IioTXTIaQ05uuWgi2', 'iza@wp.pl', 'Wodna', '24', '88-215', 'WisÅ‚a');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Messages`
--
ALTER TABLE `Messages`
  ADD CONSTRAINT `Messages_ibfk_2` FOREIGN KEY (`id_receiver`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Messages_ibfk_1` FOREIGN KEY (`id_sender`) REFERENCES `Admin` (`id`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`status`) REFERENCES `Statuses` (`id`),
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Product`
--
ALTER TABLE `Product`
  ADD CONSTRAINT `Product_ibfk_1` FOREIGN KEY (`id_group`) REFERENCES `Groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Product_orders`
--
ALTER TABLE `Product_orders`
  ADD CONSTRAINT `Product_orders_ibfk_1` FOREIGN KEY (`id_orders`) REFERENCES `Orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Product_orders_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `Product` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
