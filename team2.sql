-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 
-- サーバのバージョン： 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `team2`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `table_customer`
--

CREATE TABLE `table_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` int(8) NOT NULL,
  `sex` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='顧客情報';

--
-- テーブルのデータのダンプ `table_customer`
--

INSERT INTO `table_customer` (`id`, `name`, `age`, `sex`) VALUES
(1, 'あべ', 21, 0),
(2, 'いとう', 17, 1),
(3, 'えがわ', 59, 0),
(4, 'うえだ', 36, 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `table_iteme`
--

CREATE TABLE `table_iteme` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品情報テーブルです';

--
-- テーブルのデータのダンプ `table_iteme`
--

INSERT INTO `table_iteme` (`id`, `name`, `date`) VALUES
(1, 'テスト1商品', '2020-06-09'),
(2, 'テスト2商品', '2020-06-10'),
(3, 'テスト3商品', '2020-06-01'),
(4, 'テスト4商品', '2020-05-13');

-- --------------------------------------------------------

--
-- テーブルの構造 `table_sales`
--

CREATE TABLE `table_sales` (
  `number` int(11) NOT NULL,
  `iteme_id` int(11) NOT NULL,
  `sales_num` int(11) NOT NULL,
  `s_price` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='売上テーブル';

--
-- テーブルのデータのダンプ `table_sales`
--

INSERT INTO `table_sales` (`number`, `iteme_id`, `sales_num`, `s_price`, `c_id`, `date`) VALUES
(1, 1, 7, 300, 2, '2020-05-02'),
(2, 1, 5, 280, 4, '2020-05-18'),
(3, 3, 10, 500, 4, '2020-05-18'),
(4, 2, 1, 150, 3, '2020-05-26');

-- --------------------------------------------------------

--
-- テーブルの構造 `table_stocking`
--

CREATE TABLE `table_stocking` (
  `number` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `arrival` int(11) NOT NULL,
  `a_prise` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仕入れテーブル';

--
-- テーブルのデータのダンプ `table_stocking`
--

INSERT INTO `table_stocking` (`number`, `item_id`, `arrival`, `a_prise`, `date`) VALUES
(1, 3, 30, 150, '2020-05-10'),
(5, 1, 20, 200, '2020-05-18'),
(6, 1, 10, 100, '2020-06-12'),
(7, 2, 40, 80, '2020-06-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `table_customer`
--
ALTER TABLE `table_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_iteme`
--
ALTER TABLE `table_iteme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_sales`
--
ALTER TABLE `table_sales`
  ADD PRIMARY KEY (`number`,`iteme_id`),
  ADD KEY `c_id` (`c_id`),
  ADD KEY `iteme_id` (`iteme_id`);

--
-- Indexes for table `table_stocking`
--
ALTER TABLE `table_stocking`
  ADD PRIMARY KEY (`number`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `table_customer`
--
ALTER TABLE `table_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `table_iteme`
--
ALTER TABLE `table_iteme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `table_sales`
--
ALTER TABLE `table_sales`
  MODIFY `number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `table_stocking`
--
ALTER TABLE `table_stocking`
  MODIFY `number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `table_sales`
--
ALTER TABLE `table_sales`
  ADD CONSTRAINT `table_sales_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `table_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `table_sales_ibfk_2` FOREIGN KEY (`iteme_id`) REFERENCES `table_iteme` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- テーブルの制約 `table_stocking`
--
ALTER TABLE `table_stocking`
  ADD CONSTRAINT `table_stocking_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `table_iteme` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
