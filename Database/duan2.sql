-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th5 28, 2018 lúc 06:03 PM
-- Phiên bản máy phục vụ: 10.1.30-MariaDB
-- Phiên bản PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `HieuBoyStruts`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_users`
--

INSERT INTO `admin_users` (`id`, `name`, `email`, `password`, `level`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '123', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Điện thoại\r\n', 'diedn-thoadi', 0, NULL, '2018-05-26 16:44:50'),
(2, 'Máy tính để bàn', NULL, NULL, NULL, NULL),
(3, 'Tai nghe', NULL, NULL, NULL, NULL),
(4, 'Laptop', NULL, NULL, NULL, NULL),
(5, 'Máy tính bảng', NULL, NULL, NULL, NULL),
(6, 'Ốp điện thoại', NULL, NULL, NULL, NULL),
(7, 'Chuột', NULL, NULL, NULL, NULL),
(8, 'Thẻ nhớ', NULL, NULL, NULL, NULL),
(9, 'Pin sạc dự phòng', NULL, NULL, NULL, NULL),
(10, 'Loa', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detail_imgs`
--

CREATE TABLE `detail_imgs` (
  `id` int(11) NOT NULL,
  `images_url` text COLLATE utf8_unicode_ci,
  `pro_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `sub_total` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `qty`, `sub_total`, `total`, `status`, `type`, `note`, `created_at`, `updated_at`, `user_id`) VALUES
(1, NULL, NULL, 24000000, NULL, NULL, NULL, '2018-05-28 21:50:11', NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `o_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `pro_id`, `qty`, `o_id`, `created_at`, `updated_at`) VALUES
(1, 24, 4, 1, '2018-05-28 21:50:11', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `packet` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `promo1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `promo2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `promo3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `review` text COLLATE utf8_unicode_ci,
  `cat_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `intro`, `packet`, `promo1`, `promo2`, `promo3`, `images`, `price`, `tag`, `status`, `review`, `cat_id`, `created_at`, `updated_at`) VALUES
(1, 'Iphon 6 Plus', 'iphon-6-plus', 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', '', 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'T?ng mi?ng dán màn hình', 'Gi?m ngay 1 tri?u khi thanh toán Online b?ng th? tín d?ng (T? 10/04 - 30/04)', NULL, 30000000, '', 1, 'Siêu ph?m smartphone hàng ??u trong th? gi?i Android ?ã ra m?t v?i màn hình vô c?c, \r\ncamera chuyên nghi?p nh? máy ?nh và hàng lo?t nh?ng tính n?ng cao c?p ??y h?p d?n', 1, NULL, '2018-05-26 16:45:25'),
(2, 'Iphon 5', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 2999000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(3, 'Lumia 530', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 1700000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(4, 'Lumia 535', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 2000000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(5, 'lumia 640', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 2500000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(6, 'Nokia 3', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 3000000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(7, 'Nokia 5', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 4800000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(8, 'Lumia 930', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 4000000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(9, 'OPPO F3', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 6000000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(10, 'OPPO R7', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 3000000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(11, 'OPPO A37', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 2600000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(12, 'OPPO Find 7', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 3000000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(13, 'OPPO R9s', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 5000000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(14, 'Sonny XLS', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 4000000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(15, 'Iphon X', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 37000000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(16, 'Iphon 6 Plus', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 3000000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(17, 'Iphon 5', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 2999000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(18, 'Lumia 530', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 1700000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(19, 'Lumia 535', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 2000000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(20, 'lumia 640', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 2500000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(21, 'Nokia 3', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 3000000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(22, 'Nokia 5', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 4800000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(23, 'Lumia 930', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 4000000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(24, 'OPPO F3', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 6000000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(25, 'OPPO R7', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 3000000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(26, 'OPPO A37', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 2600000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(27, 'OPPO Find 7', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 3000000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(28, 'OPPO R9s', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 5000000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(29, 'Sonny XLS', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 4000000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL),
(30, 'Iphon X', NULL, 'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện', NULL, 'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS', 'Tặng miếng dán màn hình', 'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)', NULL, 37000000, NULL, 1, 'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, \r\ncamera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pro_details`
--

CREATE TABLE `pro_details` (
  `id` int(11) NOT NULL,
  `cpu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vga` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `storage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exten_memmory` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cam1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cam2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connect` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `os` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `pro_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sim` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `pro_details`
--

INSERT INTO `pro_details` (`id`, `cpu`, `ram`, `screen`, `vga`, `storage`, `exten_memmory`, `cam1`, `cam2`, `connect`, `pin`, `os`, `note`, `pro_id`, `created_at`, `updated_at`, `sim`) VALUES
(1, 'Apple A9 2 nhân 64-bit', '2GB', 'LED-backlit IPS LCD, 5.5\", Retina HD', '', '32 GB', 'Không có', '12 MP', '5 MP', 'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot', '2750 mAh', 'IOS 11', NULL, 1, NULL, '2018-05-26 16:45:25', '1 Nano SIM, H? tr? 4G'),
(2, 'Apple A9 2 nhân 64-bit', '2GB', 'LED-backlit IPS LCD, 5.5\", Retina HD', NULL, '32 GB', 'Không có', '12 MP', '5 MP', 'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot', '2750 mAh', 'IOS 11', NULL, 2, NULL, NULL, '1 Nano SIM, Hỗ trợ 4G'),
(3, 'Apple A9 2 nhân 64-bit', '2GB', 'LED-backlit IPS LCD, 5.5\", Retina HD', NULL, '32 GB', 'Không có', '12 MP', '5 MP', 'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot', '2750 mAh', 'IOS 11', NULL, 3, NULL, NULL, '1 Nano SIM, Hỗ trợ 4G'),
(4, 'Apple A9 2 nhân 64-bit', '2GB', 'LED-backlit IPS LCD, 5.5\", Retina HD', NULL, '32 GB', 'Không có', '12 MP', '5 MP', 'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot', '2750 mAh', 'IOS 11', NULL, 4, NULL, NULL, '1 Nano SIM, Hỗ trợ 4G'),
(5, 'Apple A9 2 nhân 64-bit', '2GB', 'LED-backlit IPS LCD, 5.5\", Retina HD', NULL, '32 GB', 'Không có', '12 MP', '5 MP', 'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot', '2750 mAh', 'IOS 11', NULL, 5, NULL, NULL, '1 Nano SIM, Hỗ trợ 4G'),
(6, 'Apple A9 2 nhân 64-bit', '2GB', 'LED-backlit IPS LCD, 5.5\", Retina HD', NULL, '32 GB', 'Không có', '12 MP', '5 MP', 'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot', '2750 mAh', 'IOS 11', NULL, 6, NULL, NULL, '1 Nano SIM, Hỗ trợ 4G'),
(7, 'Apple A9 2 nhân 64-bit', '2GB', 'LED-backlit IPS LCD, 5.5\", Retina HD', NULL, '32 GB', 'Không có', '12 MP', '5 MP', 'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot', '2750 mAh', 'IOS 11', NULL, 7, NULL, NULL, '1 Nano SIM, Hỗ trợ 4G'),
(8, 'Apple A9 2 nhân 64-bit', '2GB', 'LED-backlit IPS LCD, 5.5\", Retina HD', NULL, '32 GB', 'Không có', '12 MP', '5 MP', 'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot', '2750 mAh', 'IOS 11', NULL, 8, NULL, NULL, '1 Nano SIM, Hỗ trợ 4G'),
(9, 'Apple A9 2 nhân 64-bit', '2GB', 'LED-backlit IPS LCD, 5.5\", Retina HD', NULL, '32 GB', 'Không có', '12 MP', '5 MP', 'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot', '2750 mAh', 'IOS 11', NULL, 9, NULL, NULL, '1 Nano SIM, Hỗ trợ 4G'),
(10, 'Apple A9 2 nhân 64-bit', '2GB', 'LED-backlit IPS LCD, 5.5\", Retina HD', NULL, '32 GB', 'Không có', '12 MP', '5 MP', 'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot', '2750 mAh', 'IOS 11', NULL, 10, NULL, NULL, '1 Nano SIM, Hỗ trợ 4G'),
(11, 'Apple A9 2 nhân 64-bit', '2GB', 'LED-backlit IPS LCD, 5.5\", Retina HD', NULL, '32 GB', 'Không có', '12 MP', '5 MP', 'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot', '2750 mAh', 'IOS 11', NULL, 1, NULL, NULL, '1 Nano SIM, Hỗ trợ 4G'),
(12, 'Apple A9 2 nhân 64-bit', '2GB', 'LED-backlit IPS LCD, 5.5\", Retina HD', NULL, '32 GB', 'Không có', '12 MP', '5 MP', 'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot', '2750 mAh', 'IOS 11', NULL, 11, NULL, NULL, '1 Nano SIM, Hỗ trợ 4G'),
(13, 'Apple A9 2 nhân 64-bit', '2GB', 'LED-backlit IPS LCD, 5.5\", Retina HD', NULL, '32 GB', 'Không có', '12 MP', '5 MP', 'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot', '2750 mAh', 'IOS 11', NULL, 12, NULL, NULL, '1 Nano SIM, Hỗ trợ 4G'),
(14, 'Apple A9 2 nhân 64-bit', '2GB', 'LED-backlit IPS LCD, 5.5\", Retina HD', NULL, '32 GB', 'Không có', '12 MP', '5 MP', 'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot', '2750 mAh', 'IOS 11', NULL, 13, NULL, NULL, '1 Nano SIM, Hỗ trợ 4G'),
(15, 'Apple A9 2 nhân 64-bit', '2GB', 'LED-backlit IPS LCD, 5.5\", Retina HD', NULL, '32 GB', 'Không có', '12 MP', '5 MP', 'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot', '2750 mAh', 'IOS 11', NULL, 14, NULL, NULL, '1 Nano SIM, Hỗ trợ 4G'),
(16, 'Apple A9 2 nhân 64-bit', '2GB', 'LED-backlit IPS LCD, 5.5\", Retina HD', NULL, '32 GB', 'Không có', '12 MP', '5 MP', 'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot', '2750 mAh', 'IOS 11', NULL, 15, NULL, NULL, '1 Nano SIM, Hỗ trợ 4G');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `address`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Hiếu Boy', 'hieuboyfc@gmail.com', '123', '01213321897', 'Ngõ 58/23 Trần Bình, Mai Dịch, Cầu Giấy, Hà Nội', NULL, NULL, NULL, NULL),
(2, 'Đỗ Trung Hiếu', 'hieudtph04388@fpt.edu.vn', '123', '01213321897', 'Tiên Lãng, Hải Phòng', NULL, NULL, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `detail_imgs`
--
ALTER TABLE `detail_imgs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pro_id` (`pro_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pro_id` (`pro_id`),
  ADD KEY `o_id` (`o_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Chỉ mục cho bảng `pro_details`
--
ALTER TABLE `pro_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pro_id` (`pro_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `detail_imgs`
--
ALTER TABLE `detail_imgs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `pro_details`
--
ALTER TABLE `pro_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `detail_imgs`
--
ALTER TABLE `detail_imgs`
  ADD CONSTRAINT `detail_imgs_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`o_id`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `pro_details`
--
ALTER TABLE `pro_details`
  ADD CONSTRAINT `pro_details_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
