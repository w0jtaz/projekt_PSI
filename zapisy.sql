-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 18 Sty 2023, 23:55
-- Wersja serwera: 10.4.25-MariaDB
-- Wersja PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `zapisy`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `accounts_user`
--

CREATE TABLE `accounts_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(80) NOT NULL,
  `username` varchar(45) NOT NULL,
  `permission` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `accounts_user`
--

INSERT INTO `accounts_user` (`id`, `password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `email`, `username`, `permission`) VALUES
(1, 'pbkdf2_sha256$390000$PCNpJmw0BB1woaA2oZumBp$yCM35zEzaHGck3M0wYnb7s2d2T+CPpQUUnQ9cDvgDkI=', NULL, 0, '', '', 0, 1, '2023-01-12 22:18:12.035558', 'test', 'test', ''),
(2, 'pbkdf2_sha256$390000$YvWTCk0LV9N6PeA130YVPu$OD+4aItEY3LDFFCpNCwH1P6hpFewpkyeN3TTp7C1GP8=', NULL, 0, '', '', 0, 1, '2023-01-12 22:19:03.610691', 'test1', 'test1', ''),
(3, 'pbkdf2_sha256$390000$NbTq1pGkRFXE0LVYgNWOGn$7a9tmCaXRXRy4/SqIhTx6+clCdUAPW4deQeYXv9Q0gw=', NULL, 0, '', '', 0, 1, '2023-01-13 17:32:27.249925', 'user2@gmail.com', 'user1234', ''),
(4, 'pbkdf2_sha256$390000$PQ42Ir8oKYMKffmUfOD0Mc$F6tzOROR4uQDu47HbF+eq3LDcJ5I+aohY2wydZ5NQpw=', NULL, 0, '', '', 0, 1, '2023-01-13 17:32:34.825335', 'user24@gmail.com', 'user1234', ''),
(5, 'pbkdf2_sha256$390000$OZbr67iHGvALYaltNEoB2z$zeS6bGgzrswnlYTjAWBfe87zqLIQnnyW1diDTYXMsfo=', '2023-01-18 20:44:49.375657', 1, '', '', 1, 1, '2023-01-13 18:07:03.289231', 'admin@admin.com', 'admin', ''),
(6, 'pbkdf2_sha256$390000$s0aIw6fJEIHnVPcxibBBna$xpyTM76/mCqO6yHNunWyeQWGbko+fnpJjhnng43PMAU=', '2023-01-18 20:25:24.202262', 1, '', '', 1, 1, '2023-01-18 20:24:24.101673', 'wojtaz@vp.pl', 'wojtaz', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `accounts_user_groups`
--

CREATE TABLE `accounts_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `accounts_user_user_permissions`
--

CREATE TABLE `accounts_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('720a28f7fad3e15caab3dc63f63d206927913764', '2023-01-13 17:32:27.442927', 3),
('740cb8a42ce3ad306f20b7d82509ec7bdbdf2f6e', '2023-01-13 17:32:35.005336', 4),
('b3922eac55e601925af811c0bd925b75547dc40b', '2023-01-12 22:18:12.227559', 1),
('fc80a55d5bd782e840f2c0267b700df873b2958e', '2023-01-12 22:19:03.789693', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add dystans', 6, 'add_dystans'),
(22, 'Can change dystans', 6, 'change_dystans'),
(23, 'Can delete dystans', 6, 'delete_dystans'),
(24, 'Can view dystans', 6, 'view_dystans'),
(25, 'Can add klient', 7, 'add_klient'),
(26, 'Can change klient', 7, 'change_klient'),
(27, 'Can delete klient', 7, 'delete_klient'),
(28, 'Can view klient', 7, 'view_klient'),
(29, 'Can add wydarzenie', 8, 'add_wydarzenie'),
(30, 'Can change wydarzenie', 8, 'change_wydarzenie'),
(31, 'Can delete wydarzenie', 8, 'delete_wydarzenie'),
(32, 'Can view wydarzenie', 8, 'view_wydarzenie'),
(33, 'Can add zawodnik', 9, 'add_zawodnik'),
(34, 'Can change zawodnik', 9, 'change_zawodnik'),
(35, 'Can delete zawodnik', 9, 'delete_zawodnik'),
(36, 'Can view zawodnik', 9, 'view_zawodnik'),
(37, 'Can add zapisy', 10, 'add_zapisy'),
(38, 'Can change zapisy', 10, 'change_zapisy'),
(39, 'Can delete zapisy', 10, 'delete_zapisy'),
(40, 'Can view zapisy', 10, 'view_zapisy'),
(41, 'Can add wyniki', 11, 'add_wyniki'),
(42, 'Can change wyniki', 11, 'change_wyniki'),
(43, 'Can delete wyniki', 11, 'delete_wyniki'),
(44, 'Can view wyniki', 11, 'view_wyniki'),
(45, 'Can add user', 12, 'add_user'),
(46, 'Can change user', 12, 'change_user'),
(47, 'Can delete user', 12, 'delete_user'),
(48, 'Can view user', 12, 'view_user'),
(49, 'Can add Token', 13, 'add_token'),
(50, 'Can change Token', 13, 'change_token'),
(51, 'Can delete Token', 13, 'delete_token'),
(52, 'Can view Token', 13, 'view_token'),
(53, 'Can add token', 14, 'add_tokenproxy'),
(54, 'Can change token', 14, 'change_tokenproxy'),
(55, 'Can delete token', 14, 'delete_tokenproxy'),
(56, 'Can view token', 14, 'view_tokenproxy');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(12, 'accounts', 'user'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(13, 'authtoken', 'token'),
(14, 'authtoken', 'tokenproxy'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(6, 'zapisy', 'dystans'),
(7, 'zapisy', 'klient'),
(8, 'zapisy', 'wydarzenie'),
(11, 'zapisy', 'wyniki'),
(10, 'zapisy', 'zapisy'),
(9, 'zapisy', 'zawodnik');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-01-12 22:07:15.586154'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-01-12 22:07:15.615154'),
(3, 'auth', '0001_initial', '2023-01-12 22:07:15.704154'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-01-12 22:07:15.727154'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-01-12 22:07:15.731154'),
(6, 'auth', '0004_alter_user_username_opts', '2023-01-12 22:07:15.734154'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-01-12 22:07:15.738155'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-01-12 22:07:15.739154'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-01-12 22:07:15.744154'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-01-12 22:07:15.747154'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-01-12 22:07:15.751153'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-01-12 22:07:15.758154'),
(13, 'auth', '0011_update_proxy_permissions', '2023-01-12 22:07:15.762153'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-01-12 22:07:15.766152'),
(15, 'accounts', '0001_initial', '2023-01-12 22:07:15.914153'),
(16, 'admin', '0001_initial', '2023-01-12 22:07:15.966153'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-01-12 22:07:15.971154'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-01-12 22:07:15.976153'),
(19, 'authtoken', '0001_initial', '2023-01-12 22:07:16.015153'),
(20, 'authtoken', '0002_auto_20160226_1747', '2023-01-12 22:07:16.030153'),
(21, 'authtoken', '0003_tokenproxy', '2023-01-12 22:07:16.033152'),
(22, 'sessions', '0001_initial', '2023-01-12 22:07:16.048154'),
(23, 'zapisy', '0001_initial', '2023-01-12 22:07:16.186153');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('26241xfnoqkwpb6o6491809hlw3xfhdm', '.eJxVjDkOwjAUBe_iGlle4viHkp4zWPZfcAAlUpxUiLtDpBTQvpl5L5Xytta0NV7SSOqsgjr9biXjg6cd0D1Pt1njPK3LWPSu6IM2fZ2Jn5fD_TuoudVvDbYLEowBEClkxCBR5OCEHJjADNa7ngyg7ztvEeIQMxeUoUPMEr16fwDnJjhC:1pHT1R:5krrqGVUVje5o5RyV8lycYymtweU8Dgw53zgMh0LQw8', '2023-01-30 17:11:49.546321'),
('akkenidavrz19awmb6x8b2kqw54a9ki4', '.eJxVjDkOwjAUBe_iGlle4viHkp4zWPZfcAAlUpxUiLtDpBTQvpl5L5Xytta0NV7SSOqsgjr9biXjg6cd0D1Pt1njPK3LWPSu6IM2fZ2Jn5fD_TuoudVvDbYLEowBEClkxCBR5OCEHJjADNa7ngyg7ztvEeIQMxeUoUPMEr16fwDnJjhC:1pH94S:QM1szX6Oq7sKezGy1VmjIS5kdE3KiTIe0ZDK4du9BdY', '2023-01-29 19:53:36.727651'),
('ht05ju96evred6c18l1bbh6mdcx8kid2', '.eJxVjDkOwjAUBe_iGlle4viHkp4zWPZfcAAlUpxUiLtDpBTQvpl5L5Xytta0NV7SSOqsgjr9biXjg6cd0D1Pt1njPK3LWPSu6IM2fZ2Jn5fD_TuoudVvDbYLEowBEClkxCBR5OCEHJjADNa7ngyg7ztvEeIQMxeUoUPMEr16fwDnJjhC:1pGOSJ:fc4x_N8_YoVwk5KLanR4BpFXo-olD5kRgI5ZBH-nuxY', '2023-01-27 18:07:07.527018'),
('njwi0sv8umunvrqod4962sv38y664abm', '.eJxVjDkOwjAUBe_iGlle4viHkp4zWPZfcAAlUpxUiLtDpBTQvpl5L5Xytta0NV7SSOqsgjr9biXjg6cd0D1Pt1njPK3LWPSu6IM2fZ2Jn5fD_TuoudVvDbYLEowBEClkxCBR5OCEHJjADNa7ngyg7ztvEeIQMxeUoUPMEr16fwDnJjhC:1pIFIf:MgmRYvD_6ZLNz547gywiO2zic6ptNqm0KFAaQMP7VaY', '2023-02-01 20:44:49.379655'),
('qyy1qrh99j8ct1rmq672ph1t56dnjppp', '.eJxVjDkOwjAUBe_iGlle4viHkp4zWPZfcAAlUpxUiLtDpBTQvpl5L5Xytta0NV7SSOqsgjr9biXjg6cd0D1Pt1njPK3LWPSu6IM2fZ2Jn5fD_TuoudVvDbYLEowBEClkxCBR5OCEHJjADNa7ngyg7ztvEeIQMxeUoUPMEr16fwDnJjhC:1pHRth:1no0LPuV59sLxcX-oG0U08aUXhQjN3je3AF-CQ2bwMo', '2023-01-30 15:59:45.588640'),
('zc40h9b85102u0fbc00hjcudie4olimw', '.eJxVjDkOwjAUBe_iGlle4viHkp4zWPZfcAAlUpxUiLtDpBTQvpl5L5Xytta0NV7SSOqsgjr9biXjg6cd0D1Pt1njPK3LWPSu6IM2fZ2Jn5fD_TuoudVvDbYLEowBEClkxCBR5OCEHJjADNa7ngyg7ztvEeIQMxeUoUPMEr16fwDnJjhC:1pHR9K:q1oCgbAWWvGMuiQkk18f4PDy5jSbVWenjCtoqiSdaXI', '2023-01-30 15:11:50.929746');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zapisy_dystans`
--

CREATE TABLE `zapisy_dystans` (
  `id` int(11) NOT NULL,
  `dystans` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zapisy_dystans`
--

INSERT INTO `zapisy_dystans` (`id`, `dystans`) VALUES
(1, 'mini'),
(2, 'mega'),
(3, 'giga');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zapisy_klient`
--

CREATE TABLE `zapisy_klient` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefon` varchar(9) NOT NULL,
  `adres` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zapisy_klient`
--

INSERT INTO `zapisy_klient` (`id`, `nazwa`, `email`, `telefon`, `adres`) VALUES
(1, 'Ośrodek Sportu Olsztyn', 'osir@olsztyn.pl', '666777888', 'Olsztyn ul. Sportowa 4'),
(3, 'Firma A', 'firmaa@example.com', '123456789', 'ul. Krakowska 1, Warszawa'),
(4, 'Firma B', 'firmab@example.com', '987654321', 'ul. Poznańska 2, Poznań'),
(5, 'Firma C', 'firmac@example.com', '111222333', 'ul. Gdańska 3, Gdańsk'),
(6, 'Firma D', 'firmad@example.com', '444455566', 'ul. Wrocławska 4, Wrocław'),
(7, 'Firma E', 'firmae@example.com', '777888999', 'ul. Katowicka 5, Katowice');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zapisy_wydarzenie`
--

CREATE TABLE `zapisy_wydarzenie` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(45) NOT NULL,
  `miasto` varchar(45) NOT NULL,
  `termin` date NOT NULL,
  `organizator_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zapisy_wydarzenie`
--

INSERT INTO `zapisy_wydarzenie` (`id`, `nazwa`, `miasto`, `termin`, `organizator_id`) VALUES
(1, 'MTB Las Miejski', 'Olsztyn', '2023-01-14', 1),
(2, 'Szybka trasa', 'Warszawa', '2023-01-28', 3),
(3, 'Szybka trasa 2', 'Warszawa', '2023-01-31', 3),
(4, 'Mocny tor', 'Poznań', '2023-02-05', 5),
(5, 'Mocny tor 2', 'Poznań', '2023-02-05', 5),
(6, 'Mocny tor 2', 'Poznań', '2023-02-05', 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zapisy_wyniki`
--

CREATE TABLE `zapisy_wyniki` (
  `id` int(11) NOT NULL,
  `dystans` varchar(45) NOT NULL,
  `czas` varchar(45) NOT NULL,
  `miejsce_open` varchar(45) NOT NULL,
  `zawodnik_id` int(11) NOT NULL,
  `zawody_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zapisy_wyniki`
--

INSERT INTO `zapisy_wyniki` (`id`, `dystans`, `czas`, `miejsce_open`, `zawodnik_id`, `zawody_id`) VALUES
(1, 'mini', '00', '00', 1, 1),
(2, '234', '1:00', '4', 1, 1),
(3, '22', '9:00', '6', 4, 1),
(4, '33', '9:00', '6', 4, 3),
(5, '666', '9:00', '6', 7, 5),
(6, '666', '9:00', '6', 4, 5),
(7, '77', '9:00', '6', 4, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zapisy_zapisy`
--

CREATE TABLE `zapisy_zapisy` (
  `id` int(11) NOT NULL,
  `dystans` varchar(45) NOT NULL,
  `id_zawodnik_id` int(11) NOT NULL,
  `zawody_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zapisy_zapisy`
--

INSERT INTO `zapisy_zapisy` (`id`, `dystans`, `id_zawodnik_id`, `zawody_id`) VALUES
(3, '23', 1, 1),
(4, '33', 1, 1),
(5, '123', 1, 1),
(6, '345', 1, 1),
(42, '124', 1, 1),
(56, '123', 1, 1),
(125, '12512', 2, 1),
(632, '12421', 1, 1),
(6236, '236', 1, 1),
(6332, '2532', 1, 1),
(6346, '346', 1, 1),
(346346, '346346', 1, 1),
(12521362, '1515', 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zapisy_zawodnik`
--

CREATE TABLE `zapisy_zawodnik` (
  `id` int(11) NOT NULL,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `klub` varchar(45) NOT NULL,
  `telefon` varchar(9) NOT NULL,
  `email` varchar(45) NOT NULL,
  `miasto` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zapisy_zawodnik`
--

INSERT INTO `zapisy_zawodnik` (`id`, `imie`, `nazwisko`, `klub`, `telefon`, `email`, `miasto`) VALUES
(1, 'Robert', 'Banach', 'BST', '555666777', 'banach@bst.pl', 'Gdańsk'),
(2, 'Karol', 'Przyłyski', 'KKK Dziki Team Kwidzyn', '555444333', 'karolp@wp.pl', '777666555'),
(3, 'Artur', 'Artur', 'KOP', '444444444', 'email@com.com', 'Olsztyn'),
(4, 'Artur1', 'Artur1', 'KOP1', '444444445', 'email@com.com', 'Olsztyn'),
(5, 'Artur2', 'Artur1', 'KOP1', '444444445', 'email@com.com', 'Olsztyn'),
(6, 'Artur2', 'Artur1', 'KOP1', '444444445', 'email@com.com', 'Olsztyn'),
(7, 'Artur3', 'Artur1', 'KOP1', '444444445', 'email@com.com', 'Olsztyn');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `accounts_user`
--
ALTER TABLE `accounts_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeksy dla tabeli `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  ADD KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`);

--
-- Indeksy dla tabeli `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  ADD KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`);

--
-- Indeksy dla tabeli `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeksy dla tabeli `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indeksy dla tabeli `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indeksy dla tabeli `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`);

--
-- Indeksy dla tabeli `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indeksy dla tabeli `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indeksy dla tabeli `zapisy_dystans`
--
ALTER TABLE `zapisy_dystans`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zapisy_klient`
--
ALTER TABLE `zapisy_klient`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zapisy_wydarzenie`
--
ALTER TABLE `zapisy_wydarzenie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zapisy_wydarzenie_organizator_id_42c6aa3b_fk_zapisy_klient_id` (`organizator_id`);

--
-- Indeksy dla tabeli `zapisy_wyniki`
--
ALTER TABLE `zapisy_wyniki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zapisy_wyniki_zawodnik_id_9ad36b1c_fk_zapisy_zawodnik_id` (`zawodnik_id`),
  ADD KEY `zapisy_wyniki_zawody_id_4f059e58_fk_zapisy_wydarzenie_id` (`zawody_id`);

--
-- Indeksy dla tabeli `zapisy_zapisy`
--
ALTER TABLE `zapisy_zapisy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zapisy_zapisy_id_zawodnik_id_070eb237_fk_zapisy_zawodnik_id` (`id_zawodnik_id`),
  ADD KEY `zapisy_zapisy_zawody_id_96a794a8_fk_zapisy_wydarzenie_id` (`zawody_id`);

--
-- Indeksy dla tabeli `zapisy_zawodnik`
--
ALTER TABLE `zapisy_zawodnik`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `accounts_user`
--
ALTER TABLE `accounts_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT dla tabeli `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT dla tabeli `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  ADD CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Ograniczenia dla tabeli `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  ADD CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Ograniczenia dla tabeli `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Ograniczenia dla tabeli `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ograniczenia dla tabeli `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ograniczenia dla tabeli `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Ograniczenia dla tabeli `zapisy_wydarzenie`
--
ALTER TABLE `zapisy_wydarzenie`
  ADD CONSTRAINT `zapisy_wydarzenie_organizator_id_42c6aa3b_fk_zapisy_klient_id` FOREIGN KEY (`organizator_id`) REFERENCES `zapisy_klient` (`id`);

--
-- Ograniczenia dla tabeli `zapisy_wyniki`
--
ALTER TABLE `zapisy_wyniki`
  ADD CONSTRAINT `zapisy_wyniki_zawodnik_id_9ad36b1c_fk_zapisy_zawodnik_id` FOREIGN KEY (`zawodnik_id`) REFERENCES `zapisy_zawodnik` (`id`),
  ADD CONSTRAINT `zapisy_wyniki_zawody_id_4f059e58_fk_zapisy_wydarzenie_id` FOREIGN KEY (`zawody_id`) REFERENCES `zapisy_wydarzenie` (`id`);

--
-- Ograniczenia dla tabeli `zapisy_zapisy`
--
ALTER TABLE `zapisy_zapisy`
  ADD CONSTRAINT `zapisy_zapisy_id_zawodnik_id_070eb237_fk_zapisy_zawodnik_id` FOREIGN KEY (`id_zawodnik_id`) REFERENCES `zapisy_zawodnik` (`id`),
  ADD CONSTRAINT `zapisy_zapisy_zawody_id_96a794a8_fk_zapisy_wydarzenie_id` FOREIGN KEY (`zawody_id`) REFERENCES `zapisy_wydarzenie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
