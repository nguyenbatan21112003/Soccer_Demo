-- Tạo Database
CREATE DATABASE FootballFieldBooking1;
USE FootballFieldBooking1;

-- Bảng USERS
CREATE TABLE USERS (
    UserID int PRIMARY KEY,
    Username NVARCHAR(100) NOT NULL unique,   
    Role NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL,
    Address TEXT,
	FullName NVARCHAR(255) NOT NULL
);
-- Bảng TIME_SLOT
CREATE TABLE TIME_SLOT (
    SlotID int PRIMARY KEY,
    Time NVARCHAR(20)
);

-- Bảng FOOTBALL_FIELD
CREATE TABLE FOOTBALL_FIELD (
    FieldID int PRIMARY KEY,
    FieldName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    Location NVARCHAR(255),
	Price DECIMAL(10, 2),
    ImageURL NVARCHAR(255),
    Amenities NVARCHAR(255),
    
);
-- Bảng BOOKING
CREATE TABLE BOOKING (
    BookingID int PRIMARY KEY,
    UserID int,
    FieldID int,
	SlotID int,
	DateBooking date,
    BookingStatus NVARCHAR(50) DEFAULT 'Pending',
    
    FOREIGN KEY (UserID) REFERENCES USERS(UserID),
	 FOREIGN KEY (FieldID) REFERENCES FOOTBALL_FIELD(FieldID),
	  FOREIGN KEY (SlotID) REFERENCES TIME_SLOT(SlotID)
);
-- Bảng REVIEW
CREATE TABLE REVIEW (
    ReviewID int PRIMARY KEY,
    UserID int,
    FieldID int,
    BookingID int,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Content TEXT,
    TimeCmt DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(50) DEFAULT 'Not Yet',
    FOREIGN KEY (UserID) REFERENCES USERS(UserID),
    FOREIGN KEY (FieldID) REFERENCES FOOTBALL_FIELD(FieldID),
    FOREIGN KEY (BookingID) REFERENCES BOOKING(BookingID)
);



INSERT INTO FOOTBALL_FIELD (FieldID, FieldName, Description, Location, ImageURL, Amenities, Price) 
VALUES 
(1, N'Sân bóng An Phú', N'Sân cỏ nhân tạo chất lượng cao',  N'123 Đường An Phú, TP.HCM', 'https://hatinh.gov.vn/uploads/topics/15511679404796.jpg', N'Đèn chiếu sáng, Bãi đỗ xe',  200.0000),

(2, N'Sân thể thao Bình An', N'Sân bóng rộng rãi, thoáng mát',  N'456 Đường Bình An, Hà Nội', 'https://ledsaigon.net/upload/image/S%C3%82N%20BANH/z2362051233871_e70182af77a3215e0d8a3186d21ba199.jpg', N'Wifi miễn phí, Phòng thay đồ', 300.0000),

(3, N'Sân bóng Đoàn Kết', N'Sân bóng đạt chuẩn FIFA',  N'789 Đường Đoàn Kết, Đà Nẵng', 'https://connectland.vn/wp-content/uploads/2025/01/kinh-nghiem-thue-mat-bang-mo-san-bong-da-mini-2.png', N'Nhà vệ sinh, Ghế khán giả',  250.0000),

(4, N'Sân bóng Kim Sơn', N'Sân mới nâng cấp mặt cỏ',  N'101 Đường Kim Sơn, TP.HCM', 'https://santennis.com.vn/uploads/partner/2021/02/04/thi_cong_san_bong_da_11_nguoi_pho_bien_voi_den_led_400w_usa.jpg', N'Bãi giữ xe rộng rãi, Nước uống miễn phí',  220.0000),

(5, N'Sân bóng Hoàng Gia', N'Sân có hệ thống chiếu sáng hiện đại',  N'202 Đường Hoàng Gia, Hà Nội', 'https://img.thegioithethao.vn/media/san-bong-da/ho-chi-minh/quan-11/san-bong-da-mini-phu-tho-vn88/san-bong-da-mini-phu-tho-vn88-2.webp', N'Phòng thay đồ, Căng tin',  350.0000),

(6, N'Sân bóng Hòa Bình', N'Sân bóng phủ xanh, không gian thoáng',  N'303 Đường Hòa Bình, Cần Thơ', 'https://htsport.vn/wp-content/uploads/2020/06/danh-sach-san-bong-o-quan-phu-nhuan.jpg', N'Khu vực BBQ, Chỗ nghỉ ngơi',  280.0000),

(7, N'Sân bóng Nam Định', N'Sân tiêu chuẩn, mặt cỏ mềm',  N'404 Đường Nam Định, Nam Định', 'https://img.thegioithethao.vn/media/san-bong-da/ho-chi-minh/quan-phu-nhuan/san-bong-da-mini-quyen-dao-duy-anh/san-bong-da-mini-quyen-dao-duy-anh-3.webp', N'Wifi miễn phí, Đèn chiếu sáng',  270.0000),

(8, N'Sân bóng Phú Mỹ', N'Sân rộng, thích hợp tổ chức giải đấu',  N'505 Đường Phú Mỹ, TP.HCM', 'https://sanconhantao24h.com/wp-content/uploads/2016/12/luoi-bao-san-bong-da-5-nguoi.jpg', N'Khán đài, Máy bán nước tự động',  400.0000),

(9, N'Sân bóng Thanh Xuân', N'Sân mới, mặt cỏ xanh tự nhiên',  N'606 Đường Thanh Xuân, Hà Nội', 'https://htsport.vn/wp-content/uploads/2020/06/anh-bia-danh-sach-san-bong-o-quan-3.jpg', N'Chỗ đậu xe miễn phí, Phòng thay đồ',  230.0000)


INSERT INTO FOOTBALL_FIELD (FieldID, FieldName, Description, Location, ImageURL, Amenities, Price)
VALUES
(10, N'Sân bóng Bình Tân', N'Sân bóng nổi bật với không gian xanh', N'201 Đường Bình Tân, TP.HCM', 'https://bulbal.vn/wp-content/uploads/2023/01/TOP-10-SAN-BONG-DA-PHUI-TAI-TPHCM-NAM-2023.jpg', N'Dịch vụ thuê đồ, Ghế nghỉ ngơi', 200.0000),
(11, N'Sân bóng Tân Phú', N'Sân cỏ nhân tạo chất lượng cao', N'211 Đường Tân Phú, TP.HCM', 'https://bulbal.vn/wp-content/uploads/2023/01/TOP-10-SAN-BONG-DA-PHUI-TAI-TPHCM-NAM-2023-4.jpg', N'Wifi miễn phí, Phòng thay đồ', 250.0000),
(12, N'Sân bóng Củ Chi', N'Sân bóng với dịch vụ chuyên nghiệp', N'221 Đường Củ Chi, TP.HCM', 'https://bulbal.vn/wp-content/uploads/2023/01/TOP-10-SAN-BONG-DA-PHUI-TAI-TPHCM-NAM-2023-1.jpg', N'Bãi đỗ xe, Ghế nghỉ', 300.0000),
(13, N'Sân bóng Hóc Môn', N'Sân rộng rãi, thoáng mát', N'231 Đường Hóc Môn, TP.HCM', 'https://bulbal.vn/wp-content/uploads/2023/01/TOP-10-SAN-BONG-DA-PHUI-TAI-TPHCM-NAM-2023-3.jpg', N'Camera giám sát, Quầy lễ tân', 250.0000),
(14, N'Sân bóng Quận 3', N'Sân đạt chuẩn quốc tế', N'241 Đường Quận 3, TP.HCM', 'https://bulbal.vn/wp-content/uploads/2023/01/TOP-10-SAN-BONG-DA-PHUI-TAI-TPHCM-NAM-2023-7.jpg', N'Đèn chiếu sáng, Phòng thay đồ', 200.0000),
(15, N'Sân bóng Quận 5', N'Sân phục vụ mọi lứa tuổi', N'251 Đường Quận 5, TP.HCM', 'https://bulbal.vn/wp-content/uploads/2023/01/TOP-10-SAN-BONG-DA-PHUI-TAI-TPHCM-NAM-2023-9.jpg', N'Khu nghỉ ngơi, Wifi miễn phí', 350.0000),
(16, N'Sân bóng Quận 8', N'Sân thích hợp tổ chức giải đấu', N'261 Đường Quận 8, TP.HCM', 'https://nganvutelecom.vn/wp-content/uploads/2021/03/z2297541274357_ba08e54e1fa782f0561b540cd70d12e0-1.jpg', N'Dịch vụ thuê bóng, Ghế nghỉ', 200.0000),
(17, N'Sân bóng Quận 10', N'Sân chất lượng với đội ngũ hỗ trợ', N'271 Đường Quận 10, TP.HCM', 'https://top10tphcm.com/wp-content/uploads/2020/12/San-bong-da-o-go-vap.png', N'Bãi đỗ xe, Quầy bán nước', 250.0000),
(18, N'Sân bóng Quận 12', N'Sân được bảo trì thường xuyên', N'281 Đường Quận 12, TP.HCM', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPJp6YufoDcM-kV5lY5SQymHhQqgI7mBOTFQ&s', N'Ghế nghỉ ngơi, Camera giám sát', 200.0000);

insert into USERS values ( 1 , 'admin' , 'Admin' , 'admin@example.com' , '12345','HCM','Toi la Admin')
insert into TIME_SLOT values 
('1','7:00 - 9:00'),
('2','9:00 - 11:00'),
('3','11:00 - 13:00'),
('4','13:00 - 15:00'),
('5','15:00 - 17:00'),
('6','17:00 - 19:00'),
('7','19:00 - 21:00'),
('8','21:00 - 23:00')