-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 09 Sty 2023, 18:05
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
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add klient', 7, 'add_klient'),
(26, 'Can change klient', 7, 'change_klient'),
(27, 'Can delete klient', 7, 'delete_klient'),
(28, 'Can view klient', 7, 'view_klient'),
(29, 'Can add wydarzenie', 8, 'add_wydarzenie'),
(30, 'Can change wydarzenie', 8, 'change_wydarzenie'),
(31, 'Can delete wydarzenie', 8, 'delete_wydarzenie'),
(32, 'Can view wydarzenie', 8, 'view_wydarzenie'),
(33, 'Can add wyniki', 9, 'add_wyniki'),
(34, 'Can change wyniki', 9, 'change_wyniki'),
(35, 'Can delete wyniki', 9, 'delete_wyniki'),
(36, 'Can view wyniki', 9, 'view_wyniki'),
(37, 'Can add zapisy', 10, 'add_zapisy'),
(38, 'Can change zapisy', 10, 'change_zapisy'),
(39, 'Can delete zapisy', 10, 'delete_zapisy'),
(40, 'Can view zapisy', 10, 'view_zapisy'),
(41, 'Can add zawodnik', 11, 'add_zawodnik'),
(42, 'Can change zawodnik', 11, 'change_zawodnik'),
(43, 'Can delete zawodnik', 11, 'delete_zawodnik'),
(44, 'Can view zawodnik', 11, 'view_zawodnik'),
(45, 'Can add dystans', 12, 'add_dystans'),
(46, 'Can change dystans', 12, 'change_dystans'),
(47, 'Can delete dystans', 12, 'delete_dystans'),
(48, 'Can view dystans', 12, 'view_dystans');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$OYEm4qDEUmmaqAmxD067gw$NVp/t7ouaMMXJhJEIDgKLzV88kWk7c4NDATzDIajSts=', '2022-12-19 08:55:18.125627', 1, 'admin', '', '', 'wojtaz@vp.pl', 1, 1, '2022-11-14 08:18:15.024833'),
(2, 'pbkdf2_sha256$390000$yPh39WAIJDkYLSKDNezn5P$nJSxKavluQndraa0yZc24wVkCFPT4i1l2Dg+nDdyfIY=', NULL, 1, 'wojtaz', '', '', 'wojtaz@vp.pl', 1, 1, '2022-11-28 08:14:01.385402');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-12-19 09:03:46.867566', '1', 'klient object (1)', 1, '[{\"added\": {}}]', 7, 1),
(2, '2022-12-19 09:05:35.582976', '1', 'zawodnik object (1)', 1, '[{\"added\": {}}]', 11, 1),
(3, '2022-12-19 09:06:12.845489', '2', 'zawodnik object (2)', 1, '[{\"added\": {}}]', 11, 1),
(4, '2022-12-19 09:14:38.192262', '1', 'wydarzenie object (1)', 1, '[{\"added\": {}}]', 8, 1),
(5, '2022-12-19 09:30:07.622850', '1', 'mini', 1, '[{\"added\": {}}]', 12, 1),
(6, '2022-12-19 09:30:13.061764', '2', 'mega', 1, '[{\"added\": {}}]', 12, 1),
(7, '2022-12-19 09:30:19.444680', '3', 'giga', 1, '[{\"added\": {}}]', 12, 1),
(8, '2022-12-19 09:30:54.873607', '1', 'zapisy object (1)', 1, '[{\"added\": {}}]', 10, 1);

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
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(12, 'zapisy', 'dystans'),
(7, 'zapisy', 'klient'),
(8, 'zapisy', 'wydarzenie'),
(9, 'zapisy', 'wyniki'),
(10, 'zapisy', 'zapisy'),
(11, 'zapisy', 'zawodnik');

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
(1, 'contenttypes', '0001_initial', '2022-11-14 07:59:42.727210'),
(2, 'auth', '0001_initial', '2022-11-14 07:59:43.392519'),
(3, 'admin', '0001_initial', '2022-11-14 07:59:43.531587'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-11-14 07:59:43.543582'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-11-14 07:59:43.557573'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-11-14 07:59:43.631340'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-11-14 07:59:43.693877'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-11-14 07:59:43.715865'),
(9, 'auth', '0004_alter_user_username_opts', '2022-11-14 07:59:43.727731'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-11-14 07:59:43.783476'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-11-14 07:59:43.788475'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-11-14 07:59:43.800466'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-11-14 07:59:43.827448'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-11-14 07:59:43.849434'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-11-14 07:59:43.869302'),
(16, 'auth', '0011_update_proxy_permissions', '2022-11-14 07:59:43.880544'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-11-14 07:59:43.898800'),
(18, 'sessions', '0001_initial', '2022-11-14 07:59:43.939125'),
(19, 'zapisy', '0001_initial', '2022-11-28 07:51:50.222688'),
(20, 'zapisy', '0002_remove_klient_zawody_alter_wydarzenie_organizator_and_more', '2022-12-05 11:02:06.852041'),
(21, 'zapisy', '0003_klient_adres_klient_telefon', '2022-12-19 09:02:58.483126'),
(22, 'zapisy', '0004_zawodnik_klub', '2022-12-19 09:04:54.931458'),
(23, 'zapisy', '0005_alter_wydarzenie_termin', '2022-12-19 09:14:01.265692'),
(24, 'zapisy', '0006_wyniki_miejsce_open', '2022-12-19 09:16:39.104331'),
(25, 'zapisy', '0007_dystans', '2022-12-19 09:21:57.950754');

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
('k6ju8bluq0vfni0my8s7042pvdf2a63e', '.eJxVjEsOwiAUAO_C2hAe9vFx6b5nIHweUjWQlHZlvLuSdKHbmcm8mPP7VtzeaXVLYhcG7PTLgo8PqkOku6-3xmOr27oEPhJ-2M7nluh5Pdq_QfG9jC2AsBp8gCxIyGQIFOB5mnyCIIwwpBTmAKgkaoxfj0bbJK0JBGQze38Atuo3FA:1ouUhS:qJoE2z3i-VRxex-yY9bRY9set38bBwRy_GH5YYEjBnk', '2022-11-28 08:20:14.762986'),
('ldm2be7fbggbi06dr1yrvwmf3oezwuez', '.eJxVjEsOwiAUAO_C2hAe9vFx6b5nIHweUjWQlHZlvLuSdKHbmcm8mPP7VtzeaXVLYhcG7PTLgo8PqkOku6-3xmOr27oEPhJ-2M7nluh5Pdq_QfG9jC2AsBp8gCxIyGQIFOB5mnyCIIwwpBTmAKgkaoxfj0bbJK0JBGQze38Atuo3FA:1p7Bva:PK4RT0tMnnL8uLqX7Kh7c-gGXFASh5one8wJr1oo3j4', '2023-01-02 08:55:18.129628'),
('w8tha29uguym6fgynd4r8gc7cxexvwal', '.eJxVjEsOwiAUAO_C2hAe9vFx6b5nIHweUjWQlHZlvLuSdKHbmcm8mPP7VtzeaXVLYhcG7PTLgo8PqkOku6-3xmOr27oEPhJ-2M7nluh5Pdq_QfG9jC2AsBp8gCxIyGQIFOB5mnyCIIwwpBTmAKgkaoxfj0bbJK0JBGQze38Atuo3FA:1ozae5:bkeQvnjeA-XVkRtsh695cX3HO1GB2qqR0Exita48xo0', '2022-12-12 09:41:49.372223');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zapisy_dystans`
--

CREATE TABLE `zapisy_dystans` (
  `id` bigint(20) NOT NULL,
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
  `id` bigint(20) NOT NULL,
  `nazwa` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `adres` varchar(45) NOT NULL,
  `telefon` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zapisy_klient`
--

INSERT INTO `zapisy_klient` (`id`, `nazwa`, `email`, `adres`, `telefon`) VALUES
(1, 'Ośrodek Sportu Olsztyn', 'osir@olsztyn.pl', 'Olsztyn ul. Sportowa 4', '666777888');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zapisy_wydarzenie`
--

CREATE TABLE `zapisy_wydarzenie` (
  `id` bigint(20) NOT NULL,
  `nazwa` varchar(45) NOT NULL,
  `organizator_id` bigint(20) NOT NULL,
  `miasto` varchar(45) NOT NULL,
  `termin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zapisy_wydarzenie`
--

INSERT INTO `zapisy_wydarzenie` (`id`, `nazwa`, `organizator_id`, `miasto`, `termin`) VALUES
(1, 'MTB Las Miejski', 1, 'Olsztyn', '2023-01-14');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zapisy_wyniki`
--

CREATE TABLE `zapisy_wyniki` (
  `id` bigint(20) NOT NULL,
  `zawodnik_id` bigint(20) NOT NULL,
  `zawody_id` bigint(20) NOT NULL,
  `dystans` varchar(45) NOT NULL,
  `czas` varchar(45) NOT NULL,
  `miejsce_open` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zapisy_zapisy`
--

CREATE TABLE `zapisy_zapisy` (
  `id` bigint(20) NOT NULL,
  `id_zawodnik_id` bigint(20) NOT NULL,
  `zawody_id` bigint(20) NOT NULL,
  `dystans` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zapisy_zapisy`
--

INSERT INTO `zapisy_zapisy` (`id`, `id_zawodnik_id`, `zawody_id`, `dystans`) VALUES
(1, 1, 1, 'mini');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zapisy_zawodnik`
--

CREATE TABLE `zapisy_zawodnik` (
  `id` bigint(20) NOT NULL,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `telefon` varchar(9) NOT NULL,
  `email` varchar(45) NOT NULL,
  `miasto` varchar(45) NOT NULL,
  `klub` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zapisy_zawodnik`
--

INSERT INTO `zapisy_zawodnik` (`id`, `imie`, `nazwisko`, `telefon`, `email`, `miasto`, `klub`) VALUES
(1, 'Robert', 'Banach', '555666777', 'banach@bst.pl', 'Gdańsk', 'BST'),
(2, 'Karol', 'Przyłyski', '555444333', 'karolp@wp.pl', '777666555', 'KKK Dziki Team Kwidzyn');

--
-- Indeksy dla zrzutów tabel
--

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
-- Indeksy dla tabeli `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeksy dla tabeli `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indeksy dla tabeli `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indeksy dla tabeli `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

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
  ADD KEY `zapisy_wydarzenie_organizator_id_42c6aa3b` (`organizator_id`);

--
-- Indeksy dla tabeli `zapisy_wyniki`
--
ALTER TABLE `zapisy_wyniki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zapisy_wyniki_zawodnik_id_9ad36b1c` (`zawodnik_id`),
  ADD KEY `zapisy_wyniki_zawody_id_4f059e58` (`zawody_id`);

--
-- Indeksy dla tabeli `zapisy_zapisy`
--
ALTER TABLE `zapisy_zapisy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zapisy_zapisy_id_zawodnik_id_070eb237` (`id_zawodnik_id`),
  ADD KEY `zapisy_zapisy_zawody_id_96a794a8` (`zawody_id`);

--
-- Indeksy dla tabeli `zapisy_zawodnik`
--
ALTER TABLE `zapisy_zawodnik`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT dla tabeli `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT dla tabeli `zapisy_dystans`
--
ALTER TABLE `zapisy_dystans`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `zapisy_klient`
--
ALTER TABLE `zapisy_klient`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `zapisy_wydarzenie`
--
ALTER TABLE `zapisy_wydarzenie`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `zapisy_wyniki`
--
ALTER TABLE `zapisy_wyniki`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `zapisy_zapisy`
--
ALTER TABLE `zapisy_zapisy`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `zapisy_zawodnik`
--
ALTER TABLE `zapisy_zawodnik`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ograniczenia dla zrzutów tabel
--

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
-- Ograniczenia dla tabeli `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ograniczenia dla tabeli `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

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
