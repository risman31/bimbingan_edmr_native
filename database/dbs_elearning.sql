-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2022 at 03:23 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbs_elearning`
--

-- --------------------------------------------------------

--
-- Table structure for table `bimbingan_capture`
--

CREATE TABLE `bimbingan_capture` (
  `kd_capture` int(11) NOT NULL,
  `kd_bimbingan` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `dentry` datetime NOT NULL,
  `thn_akademik` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bimbingan_capture`
--

INSERT INTO `bimbingan_capture` (`kd_capture`, `kd_bimbingan`, `keterangan`, `photo`, `dentry`, `thn_akademik`) VALUES
(1, 1, 'Revisi Bab 2', 'hore.png', '2022-10-26 20:20:57', '2022/2023'),
(18, 1, 'Nyobain Revisi', 'finkom2.png', '2022-11-03 14:29:00', '2022/2023'),
(22, 1, 'Revisi Bab 3', 'skripsi.png', '2022-11-04 13:21:00', '2022/2023'),
(25, 2, 'Revisi Laporan Gotham', 'kota.png', '2021-11-03 13:59:00', '2021/2022'),
(26, 2, 'Coba Coba Revisi', 'skripsi.png', '2021-11-06 14:00:00', '2021/2022'),
(31, 1, 'Nyobain', 'hore.png', '2022-11-03 15:43:00', '2022/2023');

-- --------------------------------------------------------

--
-- Table structure for table `bimbingan_data`
--

CREATE TABLE `bimbingan_data` (
  `kd_bimbingan` int(11) NOT NULL,
  `thn_akademik` varchar(9) NOT NULL,
  `npm` varchar(12) NOT NULL,
  `nama_mhs` varchar(75) NOT NULL,
  `judul` text NOT NULL,
  `topik` varchar(255) NOT NULL,
  `nip` varchar(12) NOT NULL,
  `nama_dosen` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bimbingan_data`
--

INSERT INTO `bimbingan_data` (`kd_bimbingan`, `thn_akademik`, `npm`, `nama_mhs`, `judul`, `topik`, `nip`, `nama_dosen`) VALUES
(1, '2022/2023', '15200019', 'Risman', 'Pengembangan Aplikasi Mobile', 'Aplikasi Mobile', '1234567890', 'Lis Utari, S.E., M.Kom.'),
(2, '2021/2022', '15200100', 'Batman', 'Pengembangan Aplikasi Berbasis Web', 'Aplikasi Web Base', '123456789', 'Tony Stark');

-- --------------------------------------------------------

--
-- Table structure for table `bimbingan_informasi`
--

CREATE TABLE `bimbingan_informasi` (
  `kd_informasi` int(11) NOT NULL,
  `fakultas_info` text DEFAULT NULL,
  `prodi_info` text DEFAULT NULL,
  `dentry` datetime NOT NULL,
  `thn_akademik` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bimbingan_informasi`
--

INSERT INTO `bimbingan_informasi` (`kd_informasi`, `fakultas_info`, `prodi_info`, `dentry`, `thn_akademik`) VALUES
(1, 'Founded to accelerate the nation’s industrial revolution, MIT is profoundly American. With ingenuity and drive, our graduates have invented fundamental technologies, launched new industries, and created millions of American jobs. At the same time, and without the slightest sense of contradiction, MIT is profoundly global. Our community gains tremendous strength as a magnet for talent from around the world. Through teaching, research, and innovation, MIT’s exceptional community pursues its mission of service to the nation and the world.', 'MIT is an integral part of its host city of Cambridge, a diverse and vibrant community noted for its intellectual life, history, and thriving innovation climate. With a campus nestled between Central and Kendall Squares, and across the Charles River from Boston’s Back Bay, the Institute is optimally positioned to collaborate with its neighbors and to contribute to its community.', '2022-10-26 20:17:33', '2022/2023'),
(2, 'Fakultas info 1', NULL, '2022-11-02 09:10:12', '2022/2023'),
(3, NULL, 'Prodi Informasi', '2022-11-02 09:15:32', '2022/2023'),
(4, 'Fakultas info 2023/2024', 'Prodi info 2023/2024', '2022-11-02 09:34:06', '2023/2024');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `thn_akademik` varchar(9) NOT NULL,
  `status` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `thn_akademik`, `status`) VALUES
(1, '2022/2023', '1'),
(2, '2023/2024', '0'),
(3, '2024.2025', '0');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `npm` int(10) NOT NULL,
  `nama` varchar(75) NOT NULL,
  `aktif` char(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`npm`, `nama`, `aktif`, `password`, `photo`) VALUES
(15200019, 'Risman', '1', '15200019', 'manris.jpg'),
(15200100, 'Batman', '0', '15200100', 'batmanface.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bimbingan_capture`
--
ALTER TABLE `bimbingan_capture`
  ADD PRIMARY KEY (`kd_capture`);

--
-- Indexes for table `bimbingan_data`
--
ALTER TABLE `bimbingan_data`
  ADD PRIMARY KEY (`kd_bimbingan`);

--
-- Indexes for table `bimbingan_informasi`
--
ALTER TABLE `bimbingan_informasi`
  ADD PRIMARY KEY (`kd_informasi`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`npm`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bimbingan_capture`
--
ALTER TABLE `bimbingan_capture`
  MODIFY `kd_capture` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `bimbingan_data`
--
ALTER TABLE `bimbingan_data`
  MODIFY `kd_bimbingan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bimbingan_informasi`
--
ALTER TABLE `bimbingan_informasi`
  MODIFY `kd_informasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `npm` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15200101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
