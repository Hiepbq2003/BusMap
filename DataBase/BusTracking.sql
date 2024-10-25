CREATE DATABASE BusTracking;
GO

USE BusTracking;
GO

-- Create the Route table
CREATE TABLE Routes (
    RouteId INT IDENTITY(1,1) PRIMARY KEY,
    RouteName NVARCHAR(255) NOT NULL,
    Fare DECIMAL(10, 2) NOT NULL,
    Frequency TIME,  
    StartTime TIME,
    EndTime TIME,
    RouteNumber NVARCHAR(255)
);
GO

-- Create the Bus table with RouteId as a foreign key
CREATE TABLE Buses (
    BusId INT IDENTITY(1,1) PRIMARY KEY,
    Plate NVARCHAR(50) NOT NULL,
    Capacity INT NOT NULL,
    Model NVARCHAR(255),
    Color NVARCHAR(50),
    RouteId INT,
    FOREIGN KEY (RouteId) REFERENCES Routes(RouteId)
);
GO

-- Create the Stop table
CREATE TABLE Stops (
    StopId INT IDENTITY(1,1) PRIMARY KEY,
    StopName NVARCHAR(255) NOT NULL UNIQUE,
);
GO

-- Create the User table
CREATE TABLE Users (
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    UserName NVARCHAR(255) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    Role NVARCHAR(50)
);
GO

-- Create the Route_Stop relationship table with Direction, Role, and Ordered
CREATE TABLE Route_Stop (
    RouteId INT,
    StopId INT,
    Direction NVARCHAR(50),  -- Direction attribute
    Role NVARCHAR(50),       -- Role attribute
    Ordered INT,             -- Ordered attribute to maintain the sequence
    FOREIGN KEY (RouteId) REFERENCES Routes(RouteId),
    FOREIGN KEY (StopId) REFERENCES Stops(StopId)
);
GO

-- Insert into the Routes table with RouteNumber, StartTime, and EndTime
INSERT INTO Routes (RouteNumber,RouteName, Fare, Frequency, StartTime, EndTime )
VALUES (N'107', N'Kim Mã - Làng văn hóa du lịch các dân tộc VN', 9000.00, '00:20:00', '05:00:00', '22:00:00');

-- Insert stops into the Stops table (modified to prevent duplicates)
INSERT INTO Stops (StopName)
SELECT DISTINCT StopName
FROM (
    VALUES
    (N'Kim Mã (Tòa nhà PTA Kim Mã)'),
    (N'Bộ Y Tế'),
    (N'Đối diện 311 Kim Mã'),
    (N'Hồ Ngọc Khánh'),
    (N'Đối diện Đại học Luật Hà Nội'),
    (N'Trung tâm Kiểm soát bệnh tật Hà Nội'),
    (N'Đối diện Trường Đại học Lao động & Xã Hội'),
    (N'Đối diện Bộ Khoa học & Công nghệ'),
    (N'220 Trần Duy Hưng'),
    (N'Ngã 3 Miếu Đầm - Đại lộ Thăng Long'),
    (N'Chung cư CT3A - KĐT Mễ trì Thượng'),
    (N'Sân Golf Mỹ Đình Pearl - Đại lộ Thăng Long'),
    (N'Xóm La - Đại Mỗ'),
    (N'Qua đối diện lối vào THPT Đại Mỗ'),
    (N'Trụ sở Bộ tư lệnh Cảnh sát biển'),
    (N'Đối diện Thiên Đường Bảo Sơn'),
    (N'Tòa nhà CH103 đường nội bộ KĐT Spendora'),
    (N'Qua lối rẽ vào UBND xã An Khánh'),
    (N'Đông y dược Bảo Long'),
    (N'Chùa Bà'),
    (N'Trước 50m lối vào UBND huyện Hoài Đức'),
    (N'Cầu vượt Song Phương'),
    (N'Làng văn hóa thôn Quyết Tiến'),
    (N'Chùa Sơn Trung, xã Yên Sơn'),
    (N'Ngã 3 Chùa Thầy, gần cầu vượt Sài Sơn'),
    (N'Cầu vượt Hoàng Xá'),
    (N'KCN Thạch Thất'),
    (N'Ngã 3 tỉnh lộ 419 - Đại lộ Thăng Long'),
    (N'Cầu chui dân sinh số 11 - Đại lộ Thăng Long'),
    (N'Cty Sun House, xã Ngọc Liệp'),
    (N'Trước nhà máy thép Mỹ Thuật Hải Vân'),
    (N'Đường vào chùa Kim Long'),
    (N'Thôn Liệp Mai, xã Ngọc Liệp'),
    (N'Thôn Đồng Kho, xã Đồng Trúc'),
    (N'Qua khu Đồng Trúc resort 10m (Cầu chui dân sinh số 19), Đại lộ Thăng Long'),
    (N'Thôn Đồi Bông, xã Đồng Trúc'),
    (N'Trạm 110KV Thạch Thất'),
    (N'Đường vào KCN cao Hòa Lạc'),
    (N'Trường PTTH Hòa Lạc'),
    (N'Tòa Nhà Viettel Hòa Lạc'),
    (N'Trước 50m đường vào trường ĐH FPT, Hòa Lạc'),
    (N'Công ty TNHH Xây dựng Sungeun Plant'),
    (N'Công ty CP dịch vụ bảo vệ KCN Cao Hòa Lạc'),
    (N'Vòng xuyến gần KTX ĐHQG Hà Nội'),
    (N'Vòng xuyến gần Ban Quản lý Dự án ĐHQG Hà Nội'),
    (N'Qua lối vào Đại Học Quốc Gia Hà Nội 150m'),
    (N'Nhà hàng 5 Cửa Ô'),
    (N'Qua 50m đối diện đường vào thôn Trại mới xã Tiến Xuân'),
    (N'Đại lý sữa 379 Minh Nguyệt'),
    (N'Đối diện Cty CP An Thinh Group'),
    (N'Qua cổng trung tâm đào tạo lái xe Hùng Vương 30m, xã Bình Yên, Thạch Thất'),
    (N'Trước Ngã tư Yên Bình 50m'),
    (N'Xưởng thực hành'),
    (N'Làng văn hóa các dân tộc Việt Nam'),
    (N'Qua Cổng A Làng Văn Hóa Du Lịch Các Dân Tộc Việt Nam 30m'),
    (N'Trước 30 đối diện Xưởng thực hành Trường Cao đẳng công nghiệp kỹ thuật Trần Hưng Đạo'),
    (N'Qua Ngã 4 Yên Bình 70m'),
    (N'Trước cổng trung tâm đào tạo lái xe Hùng Vương 50m, xã Bình Yên, Thạch Thất'),
    (N'Qua 30m Cty CP An Thinh Group'),
    (N'Đại lý sữa Ất Thảo'),
    (N'Trước 30m đường vào thôn Trại Mới xã Tiến Xuân'),
    (N'Công ty CP xây dựng Tiến An'),
    (N'Đại lý sữa Lan Anh'),
    (N'Qua vòng xuyến gần KTX ĐHQG Hà Nội'),
    (N'Đối diện Ban Quản lý Dự án ĐHQG Hà Nội'),
    (N'Qua 30m đối diện công ty CP dịch vụ bảo vệ KCN Cao Hòa Lạc'),
    (N'Quầy thuốc số 15 - Thôn 7 xã Thạch Hòa'),
    (N'Qua 50m đối diện đường vào trường ĐH FPT, Hòa Lạc'),
    (N'Đối Diện Tòa Nhà Viettel Hòa Lạc'),
    (N'Đối diện trường PTTH Hòa Lạc'),
    (N'Khu CN cao Hòa Lạc'),
    (N'Cty Cám Trường Thọ'),
    (N'Thôn Khoang Mái, xã Đồng Trúc'),
    (N'Qua hầm chui dân sinh số 18 15m. Đại lộ Thăng Long'),
    (N'Thôn Đồng Kho, xã Đồng Trúc'),
    (N'Thôn Liệp Mai, xã Ngọc Liệp'),
    (N'Trường THCS Ngọc Liệp'),
    (N'Thôn Đồng Bụt, xã Ngọc Liệp'),
    (N'Thôn Ngọc Than, xã Ngọc Mỹ'),
    (N'Thôn Ngô Sài'),
    (N'Khu đô thị Ngôi nhà mới'),
    (N'Ngã 3 Chùa Thầy'),
    (N'Thôn Quảng Yên, Yên Sơn, Quốc Oai'),
    (N'Xã Vân Côn, Hoài Đức'),
    (N'Song Phương, Hoài Đức'),
    (N'Đê Phương Viên, Song Phương'),
    (N'KĐT Nam An Khánh'),
    (N'Cầu vượt An Khánh'),
    (N'Phố Chợ'),
    (N'Xóm chùa Đình Vân Lũng'),
    (N'Đối diện tòa nhà 18T1 - KĐT Sudico'),
    (N'KĐT Geleximco'),
    (N'Cổng Thiên Đường Bảo Sơn'),
    (N'Đường vào UBND Phường Tây Mỗ'),
    (N'Qua ngã 3 Làng Miêu Nha'),
    (N'Ngã 3 - Quang Tiến'),
    (N'Ngã 3 - Sa Đôi'),
    (N'Ngã 3 - ĐL Thăng Long - Lê Quang Đạo'),
    (N'Công ty Viễn thông Viettel'),
    (N'KĐT Vinhomes Green Bay'),
    (N'Tòa nhà Thăng Long Number One - Đại lộ Thăng Long'),
    (N'Đối diện 220 Trần Duy Hưng'),
    (N'Bộ Khoa học & Công nghệ - Ngã 3 Hoàng Đạo Thúy'),
    (N'Trường Đại học Lao động & Xã hội'),
    (N'99 Nguyễn Chí Thanh - Ký túc xá Đại học Giao thông'),
    (N'89 Nguyễn Chí Thanh'),
    (N'Học viện Hành chính Quốc gia'),
    (N'Hồ Ngọc Khánh'),
    (N'Ngã 3 Vạn Bảo - Khu Ngoại giao đoàn'),
    (N'Đối diện UBND phường Kim Mã')
) AS Stops(StopName);

-- Insert the route stops with direction and ordered attribute
DECLARE @RouteId INT;
SELECT @RouteId = RouteId FROM Routes WHERE RouteNumber = '107';

-- Forward direction stops
INSERT INTO Route_Stop (RouteId, StopId, Direction, Role, Ordered)
SELECT @RouteId, StopId, 'Forward', 'Stop', ROW_NUMBER() OVER (ORDER BY StopId)
FROM Stops
WHERE StopName IN (N'Kim Mã (Tòa nhà PTA Kim Mã)', N'Bộ Y Tế', N'Đối diện 311 Kim Mã', N'Hồ Ngọc Khánh', 
    N'Đối diện Đại học Luật Hà Nội', N'Trung tâm Kiểm soát bệnh tật Hà Nội', N'Đối diện Trường Đại học Lao động & Xã Hội', 
    N'Đối diện Bộ Khoa học & Công nghệ', N'220 Trần Duy Hưng', N'Ngã 3 Miếu Đầm - Đại lộ Thăng Long', N'Chung cư CT3A - KĐT Mễ trì Thượng', 
    N'Sân Golf Mỹ Đình Pearl - Đại lộ Thăng Long', N'Xóm La - Đại Mỗ', N'Qua đối diện lối vào THPT Đại Mỗ', N'Trụ sở Bộ tư lệnh Cảnh sát biển', 
    N'Đối diện Thiên Đường Bảo Sơn', N'Tòa nhà CH103 đường nội bộ KĐT Spendora', N'Qua lối rẽ vào UBND xã An Khánh', N'Đông y dược Bảo Long', 
    N'Chùa Bà', N'Trước 50m lối vào UBND huyện Hoài Đức', N'Cầu vượt Song Phương', N'Làng văn hóa thôn Quyết Tiến', N'Chùa Sơn Trung, xã Yên Sơn', 
    N'Ngã 3 Chùa Thầy, gần cầu vượt Sài Sơn', N'Cầu vượt Hoàng Xá', N'KCN Thạch Thất', N'Ngã 3 tỉnh lộ 419 - Đại lộ Thăng Long', 
    N'Cầu chui dân sinh số 11 - Đại lộ Thăng Long', N'Cty Sun House, xã Ngọc Liệp', N'Trước nhà máy thép Mỹ Thuật Hải Vân', N'Đường vào chùa Kim Long', 
    N'Thôn Liệp Mai, xã Ngọc Liệp', N'Thôn Đồng Kho, xã Đồng Trúc', N'Qua khu Đồng Trúc resort 10m (Cầu chui dân sinh số 19), Đại lộ Thăng Long', 
    N'Thôn Đồi Bông, xã Đồng Trúc', N'Trạm 110KV Thạch Thất', N'Đường vào KCN cao Hòa Lạc', N'Trường PTTH Hòa Lạc', N'Tòa Nhà Viettel Hòa Lạc', 
    N'Trước 50m đường vào trường ĐH FPT, Hòa Lạc', N'Công ty TNHH Xây dựng Sungeun Plant', N'Công ty CP dịch vụ bảo vệ KCN Cao Hòa Lạc', 
    N'Vòng xuyến gần KTX ĐHQG Hà Nội', N'Vòng xuyến gần Ban Quản lý Dự án ĐHQG Hà Nội', N'Qua lối vào Đại Học Quốc Gia Hà Nội 150m', N'Nhà hàng 5 Cửa Ô', 
    N'Qua 50m đối diện đường vào thôn Trại mới xã Tiến Xuân', N'Đại lý sữa 379 Minh Nguyệt', N'Đối diện Cty CP An Thinh Group', 
    N'Qua cổng trung tâm đào tạo lái xe Hùng Vương 30m, xã Bình Yên, Thạch Thất', N'Trước Ngã tư Yên Bình 50m', N'Xưởng thực hành',N'Làng văn hóa các dân tộc Việt Nam');

-- Backward direction stops
INSERT INTO Route_Stop (RouteId, StopId, Direction, Role, Ordered)
SELECT @RouteId, StopId, 'Backward', 'Stop', ROW_NUMBER() OVER (ORDER BY StopId)
FROM Stops
WHERE StopName IN (N'Làng văn hóa các dân tộc Việt Nam', N'Qua Cổng A Làng Văn Hóa Du Lịch Các Dân Tộc Việt Nam 30m', 
    N'Trước 30 đối diện Xưởng thực hành Trường Cao đẳng công nghiệp kỹ thuật Trần Hưng Đạo', N'Qua Ngã 4 Yên Bình 70m', 
    N'Trước cổng trung tâm đào tạo lái xe Hùng Vương 50m, xã Bình Yên, Thạch Thất', N'Qua 30m Cty CP An Thinh Group', 
    N'Đại lý sữa Ất Thảo', N'Trước 30m đường vào thôn Trại Mới xã Tiến Xuân', N'Công ty CP xây dựng Tiến An', N'Đại lý sữa Lan Anh', 
    N'Qua vòng xuyến gần KTX ĐHQG Hà Nội', N'Đối diện Ban Quản lý Dự án ĐHQG Hà Nội', N'Qua 30m đối diện công ty CP dịch vụ bảo vệ KCN Cao Hòa Lạc', 
    N'Quầy thuốc số 15 - Thôn 7 xã Thạch Hòa', N'Qua 50m đối diện đường vào trường ĐH FPT, Hòa Lạc', N'Đối Diện Tòa Nhà Viettel Hòa Lạc', 
    N'Đối diện trường PTTH Hòa Lạc', N'Khu CN cao Hòa Lạc', N'Cty Cám Trường Thọ', N'Thôn Khoang Mái, xã Đồng Trúc', 
    N'Qua hầm chui dân sinh số 18 15m. Đại lộ Thăng Long', N'Thôn Đồng Kho, xã Đồng Trúc', N'Thôn Liệp Mai, xã Ngọc Liệp', 
    N'Trường THCS Ngọc Liệp', N'Thôn Đồng Bụt, xã Ngọc Liệp', N'Thôn Ngọc Than, xã Ngọc Mỹ', N'Thôn Ngô Sài', N'Khu đô thị Ngôi nhà mới', 
    N'Ngã 3 Chùa Thầy', N'Thôn Quảng Yên, Yên Sơn, Quốc Oai', N'Xã Vân Côn, Hoài Đức', N'Song Phương, Hoài Đức', 
    N'Đê Phương Viên, Song Phương', N'KĐT Nam An Khánh', N'Cầu vượt An Khánh', N'Phố Chợ', N'Xóm chùa Đình Vân Lũng', 
    N'Đối diện tòa nhà 18T1 - KĐT Sudico', N'KĐT Geleximco', N'Cổng Thiên Đường Bảo Sơn', N'Đường vào UBND Phường Tây Mỗ', 
    N'Qua ngã 3 Làng Miêu Nha', N'Ngã 3 - Quang Tiến', N'Ngã 3 - Sa Đôi', N'Ngã 3 - ĐL Thăng Long - Lê Quang Đạo', 
    N'Công ty Viễn thông Viettel', N'KĐT Vinhomes Green Bay', N'Tòa nhà Thăng Long Number One - Đại lộ Thăng Long', 
    N'Đối diện 220 Trần Duy Hưng', N'Bộ Khoa học & Công nghệ - Ngã 3 Hoàng Đạo Thúy', N'Trường Đại học Lao động & Xã hội', 
    N'99 Nguyễn Chí Thanh - Ký túc xá Đại học Giao thông', N'89 Nguyễn Chí Thanh', N'Học viện Hành chính Quốc gia', 
    N'Hồ Ngọc Khánh', N'Ngã 3 Vạn Bảo - Khu Ngoại giao đoàn', N'Đối diện UBND phường Kim Mã',N'Kim Mã (Tòa nhà PTA Kim Mã)');


		-- Insert example data into the Users table
INSERT INTO Users (UserName, Email, Password, Role)
VALUES 
    (N'vuong', N'john.doe@example.com', N'123', N'admin'),
    (N'duc', N'jane.smith@example.com', N'456', N'employee'),
    (N'khue', N'alice.jones@example.com', N'789', N'customer'),
    (N'hoang', N'bob.brown@example.com', N'321', N'customer'),
    (N'hiep', N'charlie.davis@example.com', N'654', N'employee');


	-- Insert 10 buses into the Buses table
INSERT INTO Buses (Plate, Capacity, Model, Color, RouteId)
VALUES 
    (N'29A-12345', 45, N'Mercedes', N'White', 1),
    (N'30B-67890', 50, N'Toyota', N'Blue', 1),
    (N'31C-54321', 40, N'Hino', N'Red', 1),
    (N'32D-98765', 55, N'Hyundai', N'Green', 1),
    (N'33E-11111', 48, N'Isuzu', N'Yellow', 1),
    (N'34F-22222', 52, N'Mercedes', N'Silver', 1),
    (N'35G-33333', 44, N'Toyota', N'Black', 1),
    (N'36H-44444', 49, N'Hino', N'White', 1),
    (N'37I-55555', 53, N'Hyundai', N'Blue', 1),
    (N'38J-66666', 47, N'Isuzu', N'Red', 1);
GO
-- Thêm tuyến 74 vào bảng Routes
INSERT INTO Routes (RouteNumber, RouteName, Fare, Frequency, StartTime, EndTime)
VALUES (N'74', N'Bến xe An Sương - Bến xe Củ Chi', 9000.00, '00:45:00', '03:40:00', '21:00:00');

-- Lấy RouteId của tuyến 74
DECLARE @RouteId74 INT;
SELECT @RouteId74 = RouteId FROM Routes WHERE RouteNumber = '74';

-- Thêm các điểm dừng của tuyến 74 vào bảng Stops nếu chưa tồn tại
INSERT INTO Stops (StopName)
SELECT DISTINCT StopName
FROM (
    VALUES
    (N'BX Mỹ Đình'), (N'Tòa nhà Keangnam'), (N'Big C Thăng Long'), (N'Trung Kính'), 
    (N'Trần Duy Hưng'), (N'Nguyễn Chí Thanh'), (N'Kim Mã'), (N'Liễu Giai'), (N'Đội Cấn'), 
    (N'Văn Cao'), (N'Đường Láng'), (N'Cầu Giấy'), (N'Đường Bưởi'), (N'Trần Thái Tông'), 
    (N'Cầu vượt Mai Dịch'), (N'Khu đô thị Nam Thăng Long'), (N'Trường Đại học Tài chính')
) AS Stops(StopName)
WHERE StopName NOT IN (SELECT StopName FROM Stops);

-- Thêm các điểm dừng chuyến đi của tuyến 74 vào bảng Route_Stop
INSERT INTO Route_Stop (RouteId, StopId, Direction, Role, Ordered)
SELECT @RouteId74, StopId, 'Forward', 'Stop', ROW_NUMBER() OVER (ORDER BY StopId)
FROM Stops
WHERE StopName IN (N'BX Mỹ Đình', N'Tòa nhà Keangnam', N'Big C Thăng Long', N'Trung Kính', 
                   N'Trần Duy Hưng', N'Nguyễn Chí Thanh', N'Kim Mã', N'Liễu Giai', N'Đội Cấn', 
                   N'Văn Cao', N'Đường Láng', N'Cầu Giấy', N'Đường Bưởi', N'Trần Thái Tông', 
                   N'Cầu vượt Mai Dịch', N'Khu đô thị Nam Thăng Long', N'Trường Đại học Tài chính');

-- Thêm các điểm dừng chuyến về của tuyến 74
INSERT INTO Route_Stop (RouteId, StopId, Direction, Role, Ordered)
SELECT @RouteId74, StopId, 'Backward', 'Stop', ROW_NUMBER() OVER (ORDER BY StopId)
FROM Stops
WHERE StopName IN (N'Trường Đại học Tài chính', N'Khu đô thị Nam Thăng Long', N'Cầu vượt Mai Dịch', 
                   N'Trần Thái Tông', N'Đường Bưởi', N'Cầu Giấy', N'Đường Láng', N'Văn Cao', 
                   N'Đội Cấn', N'Liễu Giai', N'Kim Mã', N'Nguyễn Chí Thanh', N'Trần Duy Hưng', 
                   N'Trung Kính', N'Big C Thăng Long', N'Tòa nhà Keangnam', N'BX Mỹ Đình');
GO
-- Thêm tuyến 88 vào bảng Routes
INSERT INTO Routes (RouteNumber, RouteName, Fare, Frequency, StartTime, EndTime)
VALUES (N'88', N'Bến xe Tân Phú - Đại học Quốc gia', 9000.00, '00:10:00', '04:45:00', '19:00:00');

-- Lấy RouteId của tuyến 88
DECLARE @RouteId88 INT;
SELECT @RouteId88 = RouteId FROM Routes WHERE RouteNumber = '88';

-- Thêm các điểm dừng của tuyến 88 vào bảng Stops nếu chưa tồn tại
INSERT INTO Stops (StopName)
SELECT DISTINCT StopName
FROM (
    VALUES
    (N'Xuân Mai (trường Cao đẳng Cộng đồng Hà Tây)'), (N'Đường Hồ Chí Minh'), (N'Quốc lộ 21'), (N'Cầu vượt Hòa Lạc'), 
    (N'Đường B Khu công nghệ cao Hòa Lạc'), (N'Đường D Khu công nghệ cao Hòa Lạc'), (N'Đường A Khu công nghệ cao Hòa Lạc'), 
    (N'Đường C Khu công nghệ cao Hòa Lạc'), (N'Cầu vượt Phú Cát'), (N'Đại lộ Thăng Long (làn đường gom)'), (N'Lê Quang Đạo'), 
    (N'Mễ Trì'), (N'Phạm Hùng'), (N'Bến xe Mỹ Đình')
) AS Stops(StopName)
WHERE StopName NOT IN (SELECT StopName FROM Stops);

-- Thêm các điểm dừng của tuyến 88 chiều đi vào bảng Route_Stop
INSERT INTO Route_Stop (RouteId, StopId, Direction, Role, Ordered)
SELECT @RouteId88, StopId, 'Forward', 'Stop', ROW_NUMBER() OVER (ORDER BY StopId)
FROM Stops
WHERE StopName IN (N'Xuân Mai (trường Cao đẳng Cộng đồng Hà Tây)', N'Đường Hồ Chí Minh', N'Quốc lộ 21', N'Cầu vượt Hòa Lạc', 
                   N'Đường B Khu công nghệ cao Hòa Lạc', N'Đường D Khu công nghệ cao Hòa Lạc', N'Đường A Khu công nghệ cao Hòa Lạc', 
                   N'Đường C Khu công nghệ cao Hòa Lạc', N'Cầu vượt Phú Cát', N'Đại lộ Thăng Long (làn đường gom)', N'Lê Quang Đạo', 
                   N'Mễ Trì', N'Phạm Hùng', N'Bến xe Mỹ Đình');

-- Thêm các điểm dừng chiều về của tuyến 88
INSERT INTO Route_Stop (RouteId, StopId, Direction, Role, Ordered)
SELECT @RouteId88, StopId, 'Backward', 'Stop', ROW_NUMBER() OVER (ORDER BY StopId)
FROM Stops
WHERE StopName IN (N'Bến xe Mỹ Đình', N'Phạm Hùng', N'Mễ Trì', N'Lê Quang Đạo', N'Đại lộ Thăng Long (làn đường gom)', 
                   N'Đường D Khu công nghệ cao Hòa Lạc', N'Đường B Khu công nghệ cao Hòa Lạc', N'Quốc lộ 21', 
                   N'Đường Hồ Chí Minh', N'Xuân Mai (trường Cao đẳng Cộng đồng Hà Tây)');

GO
