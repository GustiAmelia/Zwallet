-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Okt 2020 pada 00.17
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zwallet`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `category`) VALUES
(1, 'Transfer'),
(2, 'Top Up'),
(3, 'Subscription');

-- --------------------------------------------------------

--
-- Struktur dari tabel `code_otp`
--

CREATE TABLE `code_otp` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `code_otp`
--

INSERT INTO `code_otp` (`id`, `email`, `code`) VALUES
(1, 'gusti_amelia@apps.ipb.ac.id', 796852);

-- --------------------------------------------------------

--
-- Struktur dari tabel `receiver`
--

CREATE TABLE `receiver` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `receiver`
--

INSERT INTO `receiver` (`id`, `name`, `phone`, `avatar`) VALUES
(1, 'Samuel Suhi', '+62 813-8492-9994', 'http://localhost:5000/images/1601221119988-avatar.png'),
(2, 'Juliana', '+62 812-3942-3656', 'http://localhost:5000/images/1601221220375-avatar.png'),
(3, 'Bobi Sammy', '+62 813-5982-2940', 'http://localhost:5000/images/1601221270844-avatar.png'),
(4, 'Juliana Rich', '+62 811-6212-5663', 'http://localhost:5000/images/1601221289512-avatar.png'),
(5, 'Michi Mei', '+62 813-3891-3838', 'http://localhost:5000/images/1601221341651-avatar.png'),
(6, 'Dody Besari', '+62 0812-4334-3561', 'http://localhost:5000/images/1601221365546-avatar.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaction`
--

INSERT INTO `transaction` (`id`, `category`, `amount`, `sender_id`, `receiver_id`, `date`, `note`) VALUES
(18, 'Transfer', 100000, 1, 56, '2020-10-01 02:25:22', 'Beli tiket konser BTS'),
(19, 'Transfer', 100000, 1, 55, '2020-10-01 02:29:20', 'Beli tiket konser BTS'),
(20, 'Transfer', 100000, 1, 55, '2020-10-01 02:59:48', 'Beli tiket konser BTS'),
(21, 'Transfer', 100000, 1, 55, '2020-10-01 03:03:01', 'Beli tiket konser BTS'),
(22, 'Transfer', 100000, 1, 59, '2020-10-01 03:04:27', 'Beli tiket konser BTS'),
(23, 'Transfer', 100000, 1, 59, '2020-10-01 03:04:53', 'Beli tiket konser BTS'),
(24, 'Transfer', 100000, 1, 57, '2020-10-01 03:05:46', 'Beli tiket konser BTS'),
(25, 'Transfer', 100000, 1, 57, '2020-10-01 03:08:36', 'Beli tiket konser BTS'),
(26, 'Transfer', 100000, 1, 57, '2020-10-01 03:08:58', 'Beli tiket konser BTS'),
(27, 'Transfer', 100000, 1, 60, '2020-10-01 03:10:10', 'Beli tiket konser BTS'),
(28, 'Transfer', 100000, 1, 61, '2020-10-01 03:12:00', 'Beli tiket konser BTS'),
(29, 'Transfer', 100000, 1, 62, '2020-10-01 03:13:50', 'Beli tiket konser BTS'),
(30, 'Transfer', 15000, 54, 1, '2020-10-01 12:02:32', 'Tiket konser'),
(31, 'Transfer', 4000, 54, 1, '2020-10-01 12:15:05', 'Kembalian'),
(32, 'Transfer', 2000, 54, 57, '2020-10-01 13:10:48', 'Apa aja'),
(33, 'Transfer', 2000, 54, 58, '2020-10-01 13:19:43', NULL),
(34, 'Transfer', 2000, 54, 59, '2020-10-01 13:38:33', NULL),
(35, 'Transfer', 3000, 54, 65, '2020-10-01 13:39:02', NULL),
(36, 'Transfer', 2000, 54, 59, '2020-10-01 13:45:55', NULL),
(37, 'Transfer', 1000, 54, 55, '2020-10-02 01:01:12', NULL),
(38, 'Transfer', 1000, 54, 1, '2020-10-02 01:02:41', NULL),
(39, 'Transfer', 1000, 54, 58, '2020-10-02 01:04:24', NULL),
(40, 'Transfer', 1000, 54, 1, '2020-10-02 01:25:57', NULL),
(41, 'Transfer', 1000, 54, 55, '2020-10-02 01:50:24', NULL),
(42, 'Transfer', 1000, 54, 56, '2020-10-02 01:53:03', NULL),
(43, 'Transfer', 1000, 54, 58, '2020-10-04 13:28:06', NULL),
(44, 'Transfer', 200000, 1, 54, '2020-10-05 14:29:16', NULL),
(45, 'Transfer', 63000, 54, 57, '2020-10-05 15:11:48', NULL),
(46, 'Transfer', 100000, 55, 62, '2020-10-06 03:34:03', NULL),
(47, 'Transfer', 100000, 55, 62, '2020-10-06 03:34:09', NULL),
(48, 'Transfer', 100000, 55, 62, '2020-10-06 03:34:19', NULL),
(49, 'Transfer', 100000, 55, 62, '2020-10-06 03:34:42', NULL),
(50, 'Transfer', 1000, 55, 60, '2020-10-06 03:35:40', NULL),
(51, 'Transfer', 1000, 60, 64, '2020-10-06 03:36:44', NULL),
(52, 'Transfer', 1000, 60, 64, '2020-10-06 03:37:07', NULL),
(53, 'Transfer', 1000, 54, 62, '2020-10-06 03:38:08', NULL),
(54, 'Transfer', 1000, 56, 63, '2020-10-06 03:41:38', 'Traktir'),
(55, 'Transfer', 5000, 56, 65, '2020-10-06 03:43:46', NULL),
(56, 'Transfer', 10000, 56, 59, '2020-10-06 07:39:41', NULL),
(57, 'Transfer', 10000, 56, 58, '2020-10-06 07:41:47', NULL),
(58, 'Transfer', 80000, 54, 55, '2020-10-06 09:33:25', ''),
(59, 'Transfer', 100000, 59, 55, '2020-10-06 09:38:04', NULL),
(60, 'Transfer', 5000, 56, 66, '2020-10-06 11:58:11', NULL),
(61, 'Transfer', 5000, 56, 63, '2020-10-06 12:02:12', NULL),
(62, 'Transfer', 5000, 56, 62, '2020-10-06 12:06:45', NULL),
(63, 'Transfer', 5000, 56, 65, '2020-10-06 12:13:59', NULL),
(64, 'Transfer', 10000, 54, 56, '2020-10-08 07:46:25', NULL),
(65, 'Transfer', 10000, 54, 56, '2020-10-08 07:46:40', NULL),
(66, 'Transfer', 5000, 54, 62, '2020-10-08 07:48:00', NULL),
(67, 'Transfer', 1000, 56, 66, '2020-10-20 11:23:38', NULL),
(68, 'Transfer', 1000, 56, 58, '2020-10-20 11:31:32', NULL),
(69, 'Transfer', 10000, 56, 55, '2020-10-20 11:39:22', NULL),
(70, 'Transfer', 1000, 58, 75, '2020-10-22 08:56:15', NULL),
(71, 'Transfer', 1000, 58, 75, '2020-10-22 08:57:00', NULL),
(72, 'Transfer', 1000, 58, 75, '2020-10-22 08:57:02', NULL),
(73, 'Transfer', 1000, 58, 75, '2020-10-22 08:57:14', NULL),
(74, 'Transfer', 1000, 58, 75, '2020-10-22 08:57:18', NULL),
(75, 'Transfer', 1000, 56, 74, '2020-10-22 08:58:37', NULL),
(76, 'Transfer', 1000, 56, 68, '2020-10-22 08:59:37', NULL),
(77, 'Transfer', 1000, 56, 68, '2020-10-22 09:07:12', NULL),
(78, 'Transfer', 100, 74, 71, '2020-10-25 07:00:26', NULL),
(79, 'Transfer', 100, 74, 71, '2020-10-25 07:00:28', NULL),
(80, 'Transfer', 1000, 56, 74, '2020-10-30 15:32:07', 'Jajan'),
(81, 'Transfer', 1000, 56, 91, '2020-10-30 18:20:47', NULL),
(82, 'Transfer', 1000, 56, 68, '2020-10-30 18:21:59', NULL),
(83, 'Transfer', 1000, 56, 85, '2020-10-30 18:23:50', NULL),
(84, 'Transfer', 1000, 56, 89, '2020-10-30 18:24:42', NULL),
(85, 'Transfer', 100, 91, 68, '2020-10-30 18:28:09', NULL),
(86, 'Transfer', 100, 91, 88, '2020-10-30 18:29:34', NULL),
(87, 'Transfer', 100, 91, 76, '2020-10-30 18:35:01', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `pin` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `balance` int(11) NOT NULL,
  `avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `email`, `phone`, `pin`, `password`, `balance`, `avatar`) VALUES
(1, 'Gusti ', 'Amelia', 'Gusti Amelia', 'amel@gmail.com', '+62 813-9387-7946', '$2b$10$ucRg/xzs8BJnVvLDfB/J4Ot47BK7ht8X7nL/2ClmLpBk3dKe/3g.C', '$2b$10$lG8qQb5oG5Roue6BNJsUSOExTdfB2cjArFVToNnj2Bt8xYQ.INVs.', 18621000, 'http://localhost:5000/images/1602102241639-avatar.jpg'),
(54, 'Joen', 'Jungkook', 'Joen Jungkook', 'jungkook@gmail.com', '+62 813-9387-7946', '$2b$10$BgAqpLdorL2wf3USKUaY7ehRMjOwWwJJ5IUkn7ych285sOHTgvBYq', '$2b$10$WU2z8zExIgy1VJPs/L9U3.WlMikJJvVVcTT5sGOMgJZvIUJ.tI7HO', 94000, 'http://localhost:5000/images/1602143701698-avatar.jpg'),
(55, '', '', 'Min Yongi', 'suga@gmail.com', '+62 813-9387-7946', '$2b$10$rcTKZMXt8zkc1Gj6IpE6ZOIL0wiIw3ZVnf6fxWh17fd.AzhBsz53W', '$2b$10$ljXicI.QIDKsxY.L4J3KMuCI51.uXomNrfoSBosXhT9ipAh95foDW', 91000, 'http://localhost:5000/images/1601973406003-avatar.jpg'),
(56, '', '', 'Kim Namjoon', 'namjoon@gmail.com', '+62 813-9387-7946', '$2b$10$h1tB56PgdUxe6Jwo2b8Mvu1SGFufoVi78aa0mMmB7OBR8w6tIaASS', '$2b$10$dTss105WtfKkqqAKPv3TQ.t.CXESKcuCcZeOWmNri7wKEe9zwLzHW', 55000, 'http://localhost:5000/images/1603441726815-avatar.jpg'),
(57, '', '', 'Kim Soekjin', 'soekjin@gmail.com', '+62 813-9387-7946', '', '$2b$10$hnBZpq9gnswq5QMO/cmSruIryy/TLI24gCr2De05rpVq03cYduxlK', 365000, 'http://localhost:5000/images/1601973460304-avatar.jpg'),
(58, '', '', 'Park Jimin', 'jimin@gmail.com', '+62 813-9387-7946', '', '$2b$10$BOb4hC4vhTAGkAybBFWG1O9bJxoqerGp6MLHnKqQhc9HAN3rqjhue', 10000, 'http://localhost:5000/images/1601973485132-avatar.jpg'),
(59, '', '', 'Kim Taehyung', 'taehyung@gmail.com', '+62 813-9387-7946', '', '$2b$10$9OJEC4QDpU5N94l7nPoedOTLOdhohNsvpNANdsbP2KjfmKyuNZkoe', 114000, 'http://localhost:5000/images/1601973504210-avatar.jpg'),
(60, '', '', 'Justin Bieber', 'justin@gmail.com', '+62 813-9387-7946', '', '$2b$10$EEkrnGbyxzW3r331YBa3iugDE6tFYLETycSF0S1765bH1ytBydg6W', 99000, 'http://localhost:5000/images/1601973539570-avatar.jpg'),
(61, '', '', 'Selena Gomez', 'selena@gmail.com', '+62 813-9387-7946', '', '$2b$10$K5pOBAnz1MrgitI9D7bUaOzHygfCg1a7Qy01tYuIaPmsW4kL2Sknu', 100000, 'http://localhost:5000/images/1601973564428-avatar.jpg'),
(62, '', '', 'Ariana Grande', 'ariana@gmail.com', '+62 813-9387-7946', '$2b$10$lywnKaWg98Yv5B/IYiIh7eK1FNY46Jq.MItLZScusu63uclX6VmS.', '$2b$10$8D08.aFA.HIp9QxWJxWuz.rPWs0stNHwQZmD39i/5VBAWz/Q/uBBG', 511000, 'http://localhost:5000/images/1601973615904-avatar.jpg'),
(63, '', '', 'Shawn Mendes', 'shawn@gmail.com', '+62 813-9387-7946', '$2b$10$4lXtf78hPnwCtC7HdcalkOV5qIGzBQWE3AOYfBV4afROggkGK0pDS', '$2b$10$XmXoM9EU36vIYCrfB5iKR.F02k.U7dbCmNUjb3sJpG8z7NEtE2PIu', 6000, 'http://localhost:5000/images/1601973646815-avatar.jpg'),
(64, '', '', 'Austin Mahone', 'austin@gmail.com', '+62 813-9387-7946', '$2b$10$8MXpH0eLogZEP90B2wqgmO28PuchwHghomY5YCbtpjwps2/By2j7G', '$2b$10$Yh0x21UR.U.QH5SgTYdJu.R/HcKRUqhOWsgMQ97qdqtjkXNywy6AG', 2000, 'http://localhost:5000/images/1601973670835-avatar.jpeg'),
(65, '', '', 'Demi Lovato', 'demi@gmail.com', '+62 813-9387-7946', '$2b$10$soHjleJR0lZc5iZcmczUGul32532.qxgT5GmHkAUsFEsE0kCV4sLa', '$2b$10$.oqM1gJYADp2dkMDEJAeTeORCwuEh4TDIuWCWkb1K3PsaYdAe0m.y', 13000, 'http://localhost:5000/images/1601973701697-avatar.jpg'),
(66, '', '', 'Kang Haneul', 'haneul@gmail.com', '+62 813-9387-7946', '', '$2b$10$m1DDHhXe7emqkiIzsc7Gv.K.XcmuL6Fr0wuR/8pl0fisyxGKhKoci', 6000, 'http://localhost:5000/images/1601973717970-avatar.jpg'),
(67, '', '', 'amel', 'amelia', '', '', '$2b$10$22G3Ver6WOPUoqn9ce361uYAsAg4Fmz75DPOCH0v1Rc96tET/2Ug6', 0, ''),
(68, '', '', 'Cha Eun Woo', 'eunwoo@gmail.com', '', '', '$2b$10$oTjwg94v3XNYXswYcgoHluyJEAvcLw9ajHjtD15wag8UTwCdWQaYy', 3100, ''),
(69, '', '', 'Namjoon', 'rm@gmail.com', '', '', '$2b$10$51xlXKsm3boHIEwnNy/aI.z1jefPL6WHk/N8aK9PKNdZEMc1v1P9a', 0, ''),
(70, '', '', 'Najwa Sihab', 'najwa@gmail.com', '', '$2b$10$9zJ5XhhB.a3QpB4ckkAsIuJnQepCyRFNlcrEvSLaZgXxr8MlJHiVm', '$2b$10$dtHOD8.PZSoVtyUXC7123.ogL7ymi9rBKESnXoglrlvBwhIviJ4fS', 0, 'http://localhost:5000/images/1603340623844-avatar.jpg'),
(71, '', '', 'Park Soejoon', 'soejoon@gmail.com', '', '$2b$10$dHE.Qdq0JujxK5k9SWyvcuOVE9qI97hGPB.JUtPWsoh1RJEQwacfu', '$2b$10$zeAkn.gA.DNAG63BXKg1YOHqI/eD2B324JNhhA44goc6x7TfqB4i.', 200, ''),
(72, '', '', 'Khairana', 'khaira@gmail.com', '', '$2b$10$tkR75s5xt342qhcoEL//uO6ah8kjpKuwGVozgL2Xdi5Xxr2dh4H5K', '$2b$10$HZmwZv8QkDIjFy5BhmNLXuXP0hKF6IMp/hSGuB0xQ2zMAzXLo.d66', 0, ''),
(73, '', '', 'Firdaus', 'daus@gmail.com', '', '$2b$10$kVSV3ZNGceXyrwWemT2GZe3tFl.WMJDC6RCh8D9.Fm85DZMrv7zvC', '$2b$10$QSQ4zcYMEeI84oIova6lieC6lPjt33jbTaWFIpQac6Me.v3S0vmE2', 0, ''),
(74, '', '', 'Amelia', 'amelia@gmail.com', '', '$2b$10$DtR3FbAU6fgfb27Szkw3UuP2rCA2ficYYodl/xGXN7ktq0DgNcqUu', '$2b$10$5QtV6vLTycoyf6Yug2N/TOxWJt2C2BYdjcZhVkDhSBkuTFG4UKvg2', 1800, ''),
(75, '', '', 'Kim Woo Bin', 'woobin@gmail.com', '', '$2b$10$RB.GaXGNCYnelHqTGJcu7.42FkPY3WuaJBXxiKEWxmkJ3zCw6yJMa', '$2b$10$LaL9MPuoNipASEejIdLDBuVKfseD6Yn2tn4gDgwUofHDsKYFDH1zi', 5000, ''),
(76, '', '', 'Kim Min jae', 'minjae@gmail.com', '', '$2b$10$0B6/jWuFAK7G6.NYicTkmOnSx0PApi4TYpCo8w3I3HXigCfdF5daK', '$2b$10$te.6yQ0ZcajLgnWzZKUtZ.7hwwDoBjPa7uOxGoGh6V6BsqYa17O9O', 100, ''),
(77, '', '', 'Lee Suho', 'suho@gmail.com', '', '$2b$10$z60pVWvRulOavBwa5c42Q.Z/aKr2zY78kLJg/JSg2goGqsTIJyHJa', '$2b$10$QDJ.sUBObl1UswyCTbLcCOySHd4zQGkhl4PN8RjPJK16ciPjXh3RS', 0, ''),
(78, '', '', 'park bogoum', 'park@gmail.com', '', '$2b$10$2sBTmDQfZLGB1ZKZ.TChyeVWYTmTwWkNikIf58Pt8kRunKXqEydQm', '$2b$10$XunYIgcD4yOtzflnRNwkUOF2ds4UHuo8zW1l6ZMBq1WwCFHmTOhN.', 0, ''),
(79, '', '', 'Lala Lili', 'lala@gmail.com', '', '$2b$10$hWczoB3PyDczHt8bZIoY9us7xqGlEJZHs2jYb5TBQaRUBGIef1ujm', '$2b$10$x.QWoMr6mKkgAzxrLQ6P6uKoLgIXZmREp4azfB.tQGNRWwz2Z.as.', 0, ''),
(80, '', '', 'Lulu', 'lulu@gmail.com', '', '$2b$10$X1sAx.OI7sEyrl5JZ6NYtO1qlX.txjegtHGMAp2nEOyVu.Slnb3uu', '$2b$10$Iojp79Ag3ALXTxzTb2H/FOsGgT475gemjY9r1IsYIckWv7OFiD1MW', 0, ''),
(81, '', '', 'kiki', 'kiki@gmail.com', '', '$2b$10$bypSACkxNXVk3XBhxbaIXeG9w5WVQr.caQwxzHaM0xzw6eHxAK4z6', '$2b$10$4cM8CG8guQuddxKwbaaQH.CmfDwdHPkIRAaAxjAPMnBEn5IGwBBqi', 0, ''),
(82, '', '', 'nana', 'nana@gmail.com', '', '$2b$10$Of1gct401mVROWQgsc2mHe44rORKP2QgcpKXlcRtdTlklNHKqHJHO', '$2b$10$OnIA3tEKl7nQ6IFpSxYLju/fUplg4mH4NqzeHqFL4BlNc2LfIIA/S', 0, ''),
(83, '', '', 'Amelia Gusti', 'amel@apps.ipb.ac.id', '', '', '$2b$10$bXQjfxmUc8oaLy.YOKcjI.lBIIDjIAROIKvY3pbj0nSx.EhhZAVi2', 0, ''),
(84, '', '', 'Gusti Amel', 'amelia@apps.ipb.ac.id', '', '$2b$10$iCTyPwk53w0ZIiw08L1gf.PNxftjL1JKworBfUy9cmZ6WRuhVwymO', '$2b$10$0MW6qveHN5aXXBZnr3Tfx.EEVpazkAP.WQSwL02svI192BLV4KESa', 0, ''),
(85, '', '', 'Jesica Jung', 'jesica@gmail.com', '', '$2b$10$hT/c8xqCKYkcUl2t0ZqKlOH2wHlhjdD4h4eETG4KB7SO59pH4St5y', '$2b$10$qJnaWI9UevGkzQg/rLnjj.SIQCLWBRTAWeY3jj24ynCVdHzSWE2IC', 1000, ''),
(86, '', '', 'Kristal Jung', 'kristal@gmail.com', '', '$2b$10$/ycGn0l54C5D7/Q0/QCqd.Ps3zbmwOybkOr8tXuSxcFLi6gsRZDs.', '$2b$10$HugVCjK7XUVpXU2m5hXKkeBFpAVJW.6PQZWRO7J6HHjNlzmJsmAiS', 0, ''),
(87, '', '', 'Taemin NCT', 'taemin@gmail.com', '', '$2b$10$ZrP6WFBTu34VJLDvCpNVw.cp1VgOmUeNXjjIhVdr9eWpQNpTWxs9O', '$2b$10$x4eSXWlSJU3/6BlBF8ohhezPgRtUOSCJNLdVuiohcYhKKXnHHJ7Cy', 0, ''),
(88, '', '', 'Jaehyun NCT', 'jaehyun@gmail.com', '', '$2b$10$LcAfveJ5UAb5IlOWLWIQBeQvfNoNadyJKInOw.otWrUG4x3XHLihe', '$2b$10$f3voceDzLsZ0Se/ynuGlvOfjYt2oEAvHU6ih1OcEjsu8m5EXULsve', 100, ''),
(89, '', '', 'Kang Gery', 'gery@gmail.com', '', '$2b$10$zxnKxF0NQdv//i9TxDCvSednfGmxjCevvA.INaS1Bkdr9PZzgMW7m', '$2b$10$WAlySiIOZ3VwyJMClcN/9umwF7bD31FEae5LOi5lPJqRs44cPqobC', 1000, ''),
(90, '', '', 'Wildan Dhya', 'wildan@gmail.com', '', '$2b$10$30uZFMSSFzYiSvT1Ry1VhOBVzVLbIc95DdlJGg7D1ALm8gzd9Rci.', '$2b$10$eXA7XSl9pIXg.oFqVwcxEOOWSy/tTAGN2jIsUcQPSsQraWNhMyGLi', 0, ''),
(91, '', '', 'Gana', 'gana@gmail.com', '', '$2b$10$jjybGHXkqQot.BB2Wa.C4O.RzwBs6gx3DpYaXohUmRAZsEM3X1zIm', '$2b$10$Q9aZ20nU8q.GRPepiMpFRObhhLqYe45nR19c.WqZ8pO31MvXDYDuq', 700, ''),
(92, '', '', 'nawi', 'nawi@gmail.com', '', '$2b$10$wBuEInZQXZ1Iri9UvKl.Zuz4U4z9eAj.k77GuOrONC3oXQfAjIIUa', '$2b$10$RPIKkwCH.o6UfajpOEUvO.Vluz3XtCQJNIaBY0t9Rq4tiuKWmWkFy', 0, ''),
(93, '', '', 'soleh', 'soleh@gmail.com', '', '$2b$10$bqjy/zbwMUd.hGAG7Dmt7u2dkPV4xcZi5cFQTd7dsqboUFhBlm5.C', '$2b$10$Zs2nF.PU/n7/1BgEMXY4QuY1rVCuvJhVSHeL5eIk5AHaTnUrObW.q', 0, ''),
(94, '', '', 'taufiq', 'taufiq@gmail.com', '', '$2b$10$Z0edzaQrD1IF.PEi7LHWxuvRQzUIHvyZfiHGuwgrkraStjoAMqfBW', '$2b$10$RYTVFqyF3LFuqgu5h1v.O.h6bPMd5KeeLaH.JDNPt9RkJ2x2bOOwm', 0, ''),
(95, '', '', 'Zwallet App', 'zwallett97@gmail.com', '', '$2b$10$M8XlxmFLFhayxWBv1PvqVOLmKDnwkEjjqmgJwkjr8nYqStjIJ2QDy', '$2b$10$oPpgz4WcK8d/xGU4pgPn5uiHmih/qNklUjCU4OfjxDNLog/ZmQa/G', 0, 'http://localhost:5000/images/1604095938435-avatar.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `code_otp`
--
ALTER TABLE `code_otp`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `receiver`
--
ALTER TABLE `receiver`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `code_otp`
--
ALTER TABLE `code_otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `receiver`
--
ALTER TABLE `receiver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
