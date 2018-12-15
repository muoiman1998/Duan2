--Delete the QLBH database if it exists.  
IF EXISTS(SELECT * from sys.databases WHERE name='HieuBoyStruts')  
BEGIN
	ALTER DATABASE HieuBoyStruts SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE HieuBoyStruts;  
END


--Create a new database called QLBH.  
CREATE DATABASE HieuBoyStruts;  
GO

USE HieuBoyStruts;  
GO

-- CREATE TABLE admin_users
CREATE TABLE admin_users(
    id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    name NVARCHAR(255),
    email NVARCHAR(255),
    password NVARCHAR(255),
    level NVARCHAR(255),
    remember_token NVARCHAR(255),
    created_at DATETIME,
    updated_at DATETIME
);
GO
-- CREATE TABLE categories
CREATE TABLE categories (
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    name NVARCHAR(255),
    slug NVARCHAR(255),
    parent_id int,
    created_at DATETIME,
    updated_at DATETIME
);
GO

-- CREATE TABLE users
CREATE TABLE users(
    id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    name NVARCHAR(255),
    email NVARCHAR(255),
    password NVARCHAR(255),
    phone NVARCHAR(255),
    address NVARCHAR(255),
    status int, 
    remember_token NVARCHAR(255),
    created_at DATETIME,
    updated_at DATETIME
);
GO

-- CREATE TABLE orders
CREATE TABLE orders(
    id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    qty int,
    sub_total float,
    total float,
    status int, 
    type NVARCHAR(50),
    note text,
    created_at DATETIME,
    updated_at DATETIME,
    user_id int not null,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
GO

-- CREATE TABLE products
CREATE TABLE products(
    id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    name NVARCHAR(255),
    slug NVARCHAR(255),
    intro NVARCHAR(255),
    packet NVARCHAR(255),
    promo1 NVARCHAR(255),
    promo2 NVARCHAR(255),
    promo3 NVARCHAR(255),    
    images NVARCHAR(255),  
    price Float,
    tag NVARCHAR(255),    
    status int,
    review ntext,
    cat_id int not null,
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY (cat_id) REFERENCES categories(id)
);
GO
-- CREATE TABLE order_details
CREATE TABLE order_details(
    id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    pro_id int not null,
    qty int,
    o_id int not null,
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY (pro_id) REFERENCES products(id),
    FOREIGN KEY (o_id) REFERENCES orders(id)
);
GO

-- CREATE TABLE detail_imgs
CREATE TABLE detail_imgs(
    id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    images_url text,
    pro_id int not null,
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY (pro_id) REFERENCES products(id)
    
);
GO
-- CREATE TABLE pro_details
CREATE TABLE pro_details(
    id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    cpu NVARCHAR(255), 
	ram NVARCHAR(255), 
	screen NVARCHAR(255), 
	vga NVARCHAR(255), 
	storage NVARCHAR(255), 
	exten_memmory NVARCHAR(255), 
	cam1 NVARCHAR(255), 
	cam2 NVARCHAR(255), 
	connect NVARCHAR(255), 
	pin NVARCHAR(255), 
	os NVARCHAR(255), 
	note ntext,
	pro_id	 int not null,
	created_at DATETIME,
    updated_at DATETIME,
    sim NVARCHAR(255), 
    FOREIGN KEY (pro_id) REFERENCES products(id)    
);
GO
-----Dữ liệu demo sẵn
----Bảng admin_users
INSERT INTO admin_users (name,email,password)  
VALUES ('Admin', 'admin@gmail.com', '123');

----Bảng users
INSERT INTO users (name,email,password,phone,address)  
VALUES (N'Đỗ Trung Hiếu', 'hieuboyfc@gmail.com', '123','01213321897',N'Ngõ 58/23 Trần Bình, Mai Dịch, Cầu Giấy, Hà Nội');
INSERT INTO users (name,email,password,phone,address)  
VALUES (N'Hiếu Boy', 'hieudtph04388@fpt.edu.vn', '123','01213321897',N'Tiên Lãng - Hải Phòng');

----Bảng categories
INSERT INTO categories(name)  
VALUES (N'Điện thoại');
INSERT INTO categories(name)  
VALUES (N'Máy tính để bàn');
INSERT INTO categories(name)  
VALUES (N'Tai nghe');
INSERT INTO categories(name)  
VALUES (N'Laptop');
INSERT INTO categories(name)  
VALUES (N'Máy tính bảng');
INSERT INTO categories(name)  
VALUES (N'Ốp điện thoại');
INSERT INTO categories(name)  
VALUES (N'Chuột');
INSERT INTO categories(name)  
VALUES (N'Thẻ nhớ');
INSERT INTO categories(name)  
VALUES (N'Pin sạc dự phòng');
INSERT INTO categories(name)  
VALUES (N'Loa');
----Bảng products
INSERT INTO products(name,intro,promo1,promo2,promo3,price,status,review,cat_id)  
VALUES (N'Iphon 6 Plus',N'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện'
,N'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS',N'Tặng miếng dán màn hình'
,N'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)'
,3000000,1,N'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, 
camera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn',1);
INSERT INTO products(name,intro,promo1,promo2,promo3,price,status,review,cat_id)  
VALUES (N'Iphon 5',N'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện'
,N'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS',N'Tặng miếng dán màn hình'
,N'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)'
,2999000,1,N'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, 
camera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn',1);
INSERT INTO products(name,intro,promo1,promo2,promo3,price,status,review,cat_id)  
VALUES (N'Lumia 530',N'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện'
,N'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS',N'Tặng miếng dán màn hình'
,N'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)'
,1700000,1,N'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, 
camera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn',1);
INSERT INTO products(name,intro,promo1,promo2,promo3,price,status,review,cat_id)  
VALUES (N'Lumia 535',N'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện'
,N'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS',N'Tặng miếng dán màn hình'
,N'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)'
,2000000,1,N'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, 
camera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn',1);
INSERT INTO products(name,intro,promo1,promo2,promo3,price,status,review,cat_id)  
VALUES (N'lumia 640',N'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện'
,N'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS',N'Tặng miếng dán màn hình'
,N'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)'
,2500000,1,N'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, 
camera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn',1);
INSERT INTO products(name,intro,promo1,promo2,promo3,price,status,review,cat_id)  
VALUES (N'Nokia 3',N'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện'
,N'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS',N'Tặng miếng dán màn hình'
,N'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)'
,3000000,1,N'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, 
camera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn',1);
INSERT INTO products(name,intro,promo1,promo2,promo3,price,status,review,cat_id)  
VALUES (N'Nokia 5',N'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện'
,N'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS',N'Tặng miếng dán màn hình'
,N'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)'
,4800000,1,N'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, 
camera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn',1);
INSERT INTO products(name,intro,promo1,promo2,promo3,price,status,review,cat_id)  
VALUES (N'Lumia 930',N'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện'
,N'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS',N'Tặng miếng dán màn hình'
,N'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)'
,4000000,1,N'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, 
camera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn',1);
INSERT INTO products(name,intro,promo1,promo2,promo3,price,status,review,cat_id)  
VALUES (N'OPPO F3',N'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện'
,N'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS',N'Tặng miếng dán màn hình'
,N'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)'
,6000000,1,N'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, 
camera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn',1);
INSERT INTO products(name,intro,promo1,promo2,promo3,price,status,review,cat_id)  
VALUES (N'OPPO R7',N'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện'
,N'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS',N'Tặng miếng dán màn hình'
,N'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)'
,3000000,1,N'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, 
camera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn',1);
INSERT INTO products(name,intro,promo1,promo2,promo3,price,status,review,cat_id)  
VALUES (N'OPPO A37',N'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện'
,N'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS',N'Tặng miếng dán màn hình'
,N'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)'
,2600000,1,N'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, 
camera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn',1);
INSERT INTO products(name,intro,promo1,promo2,promo3,price,status,review,cat_id)  
VALUES (N'OPPO Find 7',N'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện'
,N'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS',N'Tặng miếng dán màn hình'
,N'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)'
,3000000,1,N'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, 
camera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn',1);
INSERT INTO products(name,intro,promo1,promo2,promo3,price,status,review,cat_id)  
VALUES (N'OPPO R9s',N'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện'
,N'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS',N'Tặng miếng dán màn hình'
,N'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)'
,5000000,1,N'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, 
camera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn',1);
INSERT INTO products(name,intro,promo1,promo2,promo3,price,status,review,cat_id)  
VALUES (N'Sonny XLS',N'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện'
,N'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS',N'Tặng miếng dán màn hình'
,N'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)'
,4000000,1,N'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, 
camera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn',1);
INSERT INTO products(name,intro,promo1,promo2,promo3,price,status,review,cat_id)  
VALUES (N'Iphon X',N'Truy cập mạng tốc độ cao, nghe nhạc, nhắn tin, gọi điện'
,N'Tặng phiếu mua hàng 1 triệu mua Apple Watch S3 GPS',N'Tặng miếng dán màn hình'
,N'Giảm ngay 1 triệu khi thanh toán Online bằng thẻ tín dụng (Từ 10/04 - 30/04)'
,37000000,1,N'Siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, 
camera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn',1);
----Bảng pro_details
INSERT INTO pro_details(cpu,ram,screen,vga,storage,exten_memmory,cam1,cam2,connect,pin,os,pro_id,sim)  
VALUES (N'Apple A9 2 nhân 64-bit','2GB',N'LED-backlit IPS LCD, 5.5", Retina HD',null,
'32 GB',N'Không có','12 MP','5 MP',N'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot',
'2750 mAh','IOS 11',1,N'1 Nano SIM, Hỗ trợ 4G')
INSERT INTO pro_details(cpu,ram,screen,vga,storage,exten_memmory,cam1,cam2,connect,pin,os,pro_id,sim)  
VALUES (N'Apple A9 2 nhân 64-bit','2GB',N'LED-backlit IPS LCD, 5.5", Retina HD',null,
'32 GB',N'Không có','12 MP','5 MP',N'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot',
'2750 mAh','IOS 11',2,N'1 Nano SIM, Hỗ trợ 4G')
INSERT INTO pro_details(cpu,ram,screen,vga,storage,exten_memmory,cam1,cam2,connect,pin,os,pro_id,sim)  
VALUES (N'Apple A9 2 nhân 64-bit','2GB',N'LED-backlit IPS LCD, 5.5", Retina HD',null,
'32 GB',N'Không có','12 MP','5 MP',N'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot',
'2750 mAh','IOS 11',3,N'1 Nano SIM, Hỗ trợ 4G')
INSERT INTO pro_details(cpu,ram,screen,vga,storage,exten_memmory,cam1,cam2,connect,pin,os,pro_id,sim)  
VALUES (N'Apple A9 2 nhân 64-bit','2GB',N'LED-backlit IPS LCD, 5.5", Retina HD',null,
'32 GB',N'Không có','12 MP','5 MP',N'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot',
'2750 mAh','IOS 11',4,N'1 Nano SIM, Hỗ trợ 4G')
INSERT INTO pro_details(cpu,ram,screen,vga,storage,exten_memmory,cam1,cam2,connect,pin,os,pro_id,sim)  
VALUES (N'Apple A9 2 nhân 64-bit','2GB',N'LED-backlit IPS LCD, 5.5", Retina HD',null,
'32 GB',N'Không có','12 MP','5 MP',N'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot',
'2750 mAh','IOS 11',5,N'1 Nano SIM, Hỗ trợ 4G')
INSERT INTO pro_details(cpu,ram,screen,vga,storage,exten_memmory,cam1,cam2,connect,pin,os,pro_id,sim)  
VALUES (N'Apple A9 2 nhân 64-bit','2GB',N'LED-backlit IPS LCD, 5.5", Retina HD',null,
'32 GB',N'Không có','12 MP','5 MP',N'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot',
'2750 mAh','IOS 11',6,N'1 Nano SIM, Hỗ trợ 4G')
INSERT INTO pro_details(cpu,ram,screen,vga,storage,exten_memmory,cam1,cam2,connect,pin,os,pro_id,sim)  
VALUES (N'Apple A9 2 nhân 64-bit','2GB',N'LED-backlit IPS LCD, 5.5", Retina HD',null,
'32 GB',N'Không có','12 MP','5 MP',N'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot',
'2750 mAh','IOS 11',7,N'1 Nano SIM, Hỗ trợ 4G')
INSERT INTO pro_details(cpu,ram,screen,vga,storage,exten_memmory,cam1,cam2,connect,pin,os,pro_id,sim)  
VALUES (N'Apple A9 2 nhân 64-bit','2GB',N'LED-backlit IPS LCD, 5.5", Retina HD',null,
'32 GB',N'Không có','12 MP','5 MP',N'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot',
'2750 mAh','IOS 11',8,N'1 Nano SIM, Hỗ trợ 4G')
INSERT INTO pro_details(cpu,ram,screen,vga,storage,exten_memmory,cam1,cam2,connect,pin,os,pro_id,sim)  
VALUES (N'Apple A9 2 nhân 64-bit','2GB',N'LED-backlit IPS LCD, 5.5", Retina HD',null,
'32 GB',N'Không có','12 MP','5 MP',N'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot',
'2750 mAh','IOS 11',9,N'1 Nano SIM, Hỗ trợ 4G')
INSERT INTO pro_details(cpu,ram,screen,vga,storage,exten_memmory,cam1,cam2,connect,pin,os,pro_id,sim)  
VALUES (N'Apple A9 2 nhân 64-bit','2GB',N'LED-backlit IPS LCD, 5.5", Retina HD',null,
'32 GB',N'Không có','12 MP','5 MP',N'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot',
'2750 mAh','IOS 11',10,N'1 Nano SIM, Hỗ trợ 4G')
INSERT INTO pro_details(cpu,ram,screen,vga,storage,exten_memmory,cam1,cam2,connect,pin,os,pro_id,sim)  
VALUES (N'Apple A9 2 nhân 64-bit','2GB',N'LED-backlit IPS LCD, 5.5", Retina HD',null,
'32 GB',N'Không có','12 MP','5 MP',N'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot',
'2750 mAh','IOS 11',1,N'1 Nano SIM, Hỗ trợ 4G')
INSERT INTO pro_details(cpu,ram,screen,vga,storage,exten_memmory,cam1,cam2,connect,pin,os,pro_id,sim)  
VALUES (N'Apple A9 2 nhân 64-bit','2GB',N'LED-backlit IPS LCD, 5.5", Retina HD',null,
'32 GB',N'Không có','12 MP','5 MP',N'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot',
'2750 mAh','IOS 11',11,N'1 Nano SIM, Hỗ trợ 4G')
INSERT INTO pro_details(cpu,ram,screen,vga,storage,exten_memmory,cam1,cam2,connect,pin,os,pro_id,sim)  
VALUES (N'Apple A9 2 nhân 64-bit','2GB',N'LED-backlit IPS LCD, 5.5", Retina HD',null,
'32 GB',N'Không có','12 MP','5 MP',N'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot',
'2750 mAh','IOS 11',12,N'1 Nano SIM, Hỗ trợ 4G')
INSERT INTO pro_details(cpu,ram,screen,vga,storage,exten_memmory,cam1,cam2,connect,pin,os,pro_id,sim)  
VALUES (N'Apple A9 2 nhân 64-bit','2GB',N'LED-backlit IPS LCD, 5.5", Retina HD',null,
'32 GB',N'Không có','12 MP','5 MP',N'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot',
'2750 mAh','IOS 11',13,N'1 Nano SIM, Hỗ trợ 4G')
INSERT INTO pro_details(cpu,ram,screen,vga,storage,exten_memmory,cam1,cam2,connect,pin,os,pro_id,sim)  
VALUES (N'Apple A9 2 nhân 64-bit','2GB',N'LED-backlit IPS LCD, 5.5", Retina HD',null,
'32 GB',N'Không có','12 MP','5 MP',N'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot',
'2750 mAh','IOS 11',14,N'1 Nano SIM, Hỗ trợ 4G')
INSERT INTO pro_details(cpu,ram,screen,vga,storage,exten_memmory,cam1,cam2,connect,pin,os,pro_id,sim)  
VALUES (N'Apple A9 2 nhân 64-bit','2GB',N'LED-backlit IPS LCD, 5.5", Retina HD',null,
'32 GB',N'Không có','12 MP','5 MP',N'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot',
'2750 mAh','IOS 11',15,N'1 Nano SIM, Hỗ trợ 4G')
