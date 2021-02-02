-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2021-02-03 02:55:22
-- 服务器版本： 5.7.29-log
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `98xzw`
--

-- --------------------------------------------------------

--
-- 表的结构 `system_node_log`
--

CREATE TABLE `system_node_log` (
  `id` int(11) NOT NULL,
  `node` varchar(256) NOT NULL,
  `uptime` varchar(256) NOT NULL,
  `load_1` varchar(256) NOT NULL,
  `load_5` varchar(256) NOT NULL,
  `load_15` varchar(256) NOT NULL,
  `memory_total` varchar(256) NOT NULL,
  `memory_used` varchar(256) NOT NULL,
  `swap_total` varchar(256) NOT NULL,
  `swap_used` varchar(256) NOT NULL,
  `hdd_total` varchar(256) NOT NULL,
  `hdd_used` varchar(256) NOT NULL,
  `cpu` varchar(256) NOT NULL,
  `network_rx` varchar(256) NOT NULL,
  `network_tx` varchar(256) NOT NULL,
  `network_in` varchar(256) NOT NULL,
  `network_out` varchar(256) NOT NULL,
  `ip_status` varchar(256) NOT NULL,
  `ping_10010` varchar(256) NOT NULL,
  `ping_189` varchar(256) NOT NULL,
  `ping_10086` varchar(256) NOT NULL,
  `time_10010` varchar(256) NOT NULL,
  `time_189` varchar(256) NOT NULL,
  `time_10086` varchar(256) NOT NULL,
  `tcp` varchar(256) NOT NULL,
  `udp` varchar(256) NOT NULL,
  `online4` int(11) NOT NULL DEFAULT '1',
  `online6` int(11) NOT NULL DEFAULT '1',
  `process` varchar(256) NOT NULL,
  `thread` varchar(256) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `system_node_log`
--
ALTER TABLE `system_node_log`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `system_node_log`
--
ALTER TABLE `system_node_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
