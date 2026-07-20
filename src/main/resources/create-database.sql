-- ============================================================
-- BƯỚC 1: Chạy file này 1 LẦN DUY NHẤT trong SSMS
-- Mục đích: Tạo database và toàn bộ bảng
-- ============================================================

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'DormitoryManagement')
BEGIN
    CREATE DATABASE DormitoryManagement;
END
ELSE
BEGIN
    -- Kick hết connection đang dùng rồi mới cho thao tác
    ALTER DATABASE DormitoryManagement SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    ALTER DATABASE DormitoryManagement SET MULTI_USER;
END
GO

USE DormitoryManagement;
GO

-- Xóa bảng cũ nếu tồn tại
-- Thứ tự: bảng con (có FK) phải DROP trước bảng cha
IF OBJECT_ID('payment_transactions', 'U') IS NOT NULL DROP TABLE payment_transactions;
IF OBJECT_ID('bills',                'U') IS NOT NULL DROP TABLE bills;
IF OBJECT_ID('utility_usages',       'U') IS NOT NULL DROP TABLE utility_usages;
IF OBJECT_ID('contracts',            'U') IS NOT NULL DROP TABLE contracts;
IF OBJECT_ID('student_whitelists',   'U') IS NOT NULL DROP TABLE student_whitelists;
IF OBJECT_ID('student_profiles',     'U') IS NOT NULL DROP TABLE student_profiles;
IF OBJECT_ID('user_roles',           'U') IS NOT NULL DROP TABLE user_roles;
IF OBJECT_ID('role_permissions',     'U') IS NOT NULL DROP TABLE role_permissions;
IF OBJECT_ID('users',                'U') IS NOT NULL DROP TABLE users;
IF OBJECT_ID('addresses',            'U') IS NOT NULL DROP TABLE addresses;
IF OBJECT_ID('wards',                'U') IS NOT NULL DROP TABLE wards;
IF OBJECT_ID('cities',               'U') IS NOT NULL DROP TABLE cities;
IF OBJECT_ID('beds',                 'U') IS NOT NULL DROP TABLE beds;
IF OBJECT_ID('rooms',                'U') IS NOT NULL DROP TABLE rooms;
IF OBJECT_ID('room_types',           'U') IS NOT NULL DROP TABLE room_types;
IF OBJECT_ID('floors',               'U') IS NOT NULL DROP TABLE floors;
IF OBJECT_ID('dormitory_buildings',  'U') IS NOT NULL DROP TABLE dormitory_buildings;
IF OBJECT_ID('permissions',          'U') IS NOT NULL DROP TABLE permissions;
IF OBJECT_ID('roles',                'U') IS NOT NULL DROP TABLE roles;
IF OBJECT_ID('semesters',            'U') IS NOT NULL DROP TABLE semesters;
GO

-- Kỳ học
CREATE TABLE semesters (
    id           BIGINT IDENTITY(1,1) PRIMARY KEY,
    name         NVARCHAR(50)   NOT NULL UNIQUE,
    start_date   DATE           NOT NULL,
    end_date     DATE           NOT NULL,
    is_active    BIT            NOT NULL DEFAULT 0,
    created_by   NVARCHAR(100),
    created_at   DATETIMEOFFSET,
    updated_by   NVARCHAR(100),
    updated_at   DATETIMEOFFSET
);

-- Tòa nhà
CREATE TABLE dormitory_buildings (
    id           BIGINT IDENTITY(1,1) PRIMARY KEY,
    name         NVARCHAR(100)  NOT NULL UNIQUE,
    gender_type  VARCHAR(10)    NOT NULL CHECK (gender_type IN ('MALE','FEMALE','MIXED')),
    status       VARCHAR(20)    NOT NULL CHECK (status IN ('ACTIVE','INACTIVE')),
    created_by   NVARCHAR(100),
    created_at   DATETIMEOFFSET,
    updated_by   NVARCHAR(100),
    updated_at   DATETIMEOFFSET
);

-- Tầng
CREATE TABLE floors (
    id           BIGINT IDENTITY(1,1) PRIMARY KEY,
    building_id  BIGINT         NOT NULL REFERENCES dormitory_buildings(id),
    floor_number INT            NOT NULL,
    status       VARCHAR(20)    NOT NULL CHECK (status IN ('ACTIVE','INACTIVE')),
    created_by   NVARCHAR(100),
    created_at   DATETIMEOFFSET,
    updated_by   NVARCHAR(100),
    updated_at   DATETIMEOFFSET,
    UNIQUE (building_id, floor_number)
);

-- Loại phòng
CREATE TABLE room_types (
    id           BIGINT IDENTITY(1,1) PRIMARY KEY,
    type_name    NVARCHAR(100)  NOT NULL UNIQUE,
    price        DECIMAL(18,2)  NOT NULL,
    description  NVARCHAR(500),
    created_by   NVARCHAR(100),
    created_at   DATETIMEOFFSET,
    updated_by   NVARCHAR(100),
    updated_at   DATETIMEOFFSET
);

-- Phòng
CREATE TABLE rooms (
    id                BIGINT IDENTITY(1,1) PRIMARY KEY,
    floor_id          BIGINT        NOT NULL REFERENCES floors(id),
    room_type_id      BIGINT        NOT NULL REFERENCES room_types(id),
    room_number       VARCHAR(10)   NOT NULL,
    max_beds          INT           NOT NULL,
    current_occupancy INT           NOT NULL DEFAULT 0,
    status            VARCHAR(20)   NOT NULL CHECK (status IN ('ACTIVE','FULL','MAINTENANCE')),
    created_by        NVARCHAR(100),
    created_at        DATETIMEOFFSET,
    updated_by        NVARCHAR(100),
    updated_at        DATETIMEOFFSET,
    UNIQUE (floor_id, room_number)
);

-- Giường
CREATE TABLE beds (
    id          BIGINT IDENTITY(1,1) PRIMARY KEY,
    room_id     BIGINT        NOT NULL REFERENCES rooms(id),
    bed_number  INT           NOT NULL,
    status      VARCHAR(20)   NOT NULL CHECK (status IN ('AVAILABLE','OCCUPIED','MAINTENANCE')),
    created_by  NVARCHAR(100),
    created_at  DATETIMEOFFSET,
    updated_by  NVARCHAR(100),
    updated_at  DATETIMEOFFSET,
    UNIQUE (room_id, bed_number)
);

-- Thành phố
CREATE TABLE cities (
    id   BIGINT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL UNIQUE
);

-- Phường/xã
CREATE TABLE wards (
    id      BIGINT IDENTITY(1,1) PRIMARY KEY,
    name    NVARCHAR(255) NOT NULL,
    city_id BIGINT        NOT NULL REFERENCES cities(id)
);

-- Địa chỉ
CREATE TABLE addresses (
    id               BIGINT IDENTITY(1,1) PRIMARY KEY,
    ward_id          BIGINT        NOT NULL REFERENCES wards(id),
    specific_address NVARCHAR(500) NOT NULL
);

-- Người dùng
CREATE TABLE users (
    id            BIGINT IDENTITY(1,1) PRIMARY KEY,
    first_name    NVARCHAR(255)  NOT NULL,
    middle_name   NVARCHAR(255),
    last_name     NVARCHAR(255)  NOT NULL,
    email         VARCHAR(255)   NOT NULL UNIQUE,
    password_hash VARCHAR(255)   NOT NULL,
    phone         VARCHAR(15)    NOT NULL,
    gender        VARCHAR(10)    NOT NULL CHECK (gender IN ('MALE','FEMALE','OTHER')),
    dob           DATE,
    avatar        VARCHAR(500),
    is_active     BIT            NOT NULL DEFAULT 1,
    address_id    BIGINT         REFERENCES addresses(id),
    created_by    NVARCHAR(100),
    created_at    DATETIMEOFFSET,
    updated_by    NVARCHAR(100),
    updated_at    DATETIMEOFFSET
);

-- Hồ sơ sinh viên
CREATE TABLE student_profiles (
    user_id       BIGINT         PRIMARY KEY REFERENCES users(id),
    student_code  VARCHAR(20)    NOT NULL UNIQUE,
    major         NVARCHAR(200)  NOT NULL,
    academic_year VARCHAR(10),
    created_by    NVARCHAR(100),
    created_at    DATETIMEOFFSET,
    updated_by    NVARCHAR(100),
    updated_at    DATETIMEOFFSET
);

-- Vai trò
CREATE TABLE roles (
    id          BIGINT IDENTITY(1,1) PRIMARY KEY,
    role_name   VARCHAR(50)    NOT NULL UNIQUE,
    description NVARCHAR(500)  NOT NULL
);

-- Quyền hạn
CREATE TABLE permissions (
    id             BIGINT IDENTITY(1,1) PRIMARY KEY,
    permission_key VARCHAR(100)   NOT NULL UNIQUE,
    description    NVARCHAR(500)  NOT NULL
);

-- Gán vai trò cho người dùng
CREATE TABLE user_roles (
    id         BIGINT IDENTITY(1,1) PRIMARY KEY,
    user_id    BIGINT NOT NULL REFERENCES users(id),
    role_id    BIGINT NOT NULL REFERENCES roles(id),
    created_by NVARCHAR(100),
    created_at DATETIMEOFFSET,
    updated_by NVARCHAR(100),
    updated_at DATETIMEOFFSET,
    UNIQUE (user_id, role_id)
);

-- Phân quyền cho vai trò
CREATE TABLE role_permissions (
    id            BIGINT IDENTITY(1,1) PRIMARY KEY,
    role_id       BIGINT NOT NULL REFERENCES roles(id),
    permission_id BIGINT NOT NULL REFERENCES permissions(id),
    created_by    NVARCHAR(100),
    created_at    DATETIMEOFFSET,
    updated_by    NVARCHAR(100),
    updated_at    DATETIMEOFFSET,
    UNIQUE (role_id, permission_id)
);

-- Hợp đồng
CREATE TABLE contracts (
    id             BIGINT IDENTITY(1,1) PRIMARY KEY,
    contract_code  VARCHAR(50)    NOT NULL UNIQUE,
    student_id     BIGINT         NOT NULL REFERENCES users(id),
    bed_id         BIGINT         NOT NULL REFERENCES beds(id),
    semester_id    BIGINT         NOT NULL REFERENCES semesters(id),
    price          DECIMAL(18,2)  NOT NULL,
    status         VARCHAR(30)    NOT NULL CHECK (status IN ('PENDING_APPROVAL','ACTIVE','CHECKED_OUT','CANCELED')),
    checked_out_at DATETIME2,
    checked_out_by BIGINT         REFERENCES users(id),
    created_by     NVARCHAR(100),
    created_at     DATETIMEOFFSET,
    updated_by     NVARCHAR(100),
    updated_at     DATETIMEOFFSET
);

-- Whitelist sinh viên
CREATE TABLE student_whitelists (
    id            BIGINT IDENTITY(1,1) PRIMARY KEY,
    student_code  VARCHAR(20)    NOT NULL,
    email         VARCHAR(100)   NOT NULL,
    full_name     NVARCHAR(200)  NOT NULL,
    phone         VARCHAR(15)    NOT NULL,
    gender        VARCHAR(10)    NOT NULL CHECK (gender IN ('MALE','FEMALE','OTHER')),
    major         NVARCHAR(200)  NOT NULL,
    semester_id   BIGINT         NOT NULL REFERENCES semesters(id),
    is_registered BIT            NOT NULL DEFAULT 0,
    created_by    NVARCHAR(100),
    created_at    DATETIMEOFFSET,
    updated_by    NVARCHAR(100),
    updated_at    DATETIMEOFFSET,
    UNIQUE (student_code, semester_id),
    UNIQUE (email, semester_id)
);

-- Ghi số điện nước
CREATE TABLE utility_usages (
    id                BIGINT IDENTITY(1,1) PRIMARY KEY,
    room_id           BIGINT NOT NULL REFERENCES rooms(id),
    semester_id       BIGINT NOT NULL REFERENCES semesters(id),
    recorded_month    INT    NOT NULL,
    recorded_year     INT    NOT NULL,
    start_electricity INT    NOT NULL,
    end_electricity   INT    NOT NULL,
    start_water       INT    NOT NULL,
    end_water         INT    NOT NULL,
    recorded_by       BIGINT REFERENCES users(id),
    recorded_at       DATETIME2,
    created_by        NVARCHAR(100),
    created_at        DATETIMEOFFSET,
    updated_by        NVARCHAR(100),
    updated_at        DATETIMEOFFSET,
    UNIQUE (room_id, semester_id, recorded_month, recorded_year)
);

-- Hóa đơn
CREATE TABLE bills (
    id               BIGINT IDENTITY(1,1) PRIMARY KEY,
    bill_code        VARCHAR(50)    NOT NULL UNIQUE,
    student_id       BIGINT         NOT NULL REFERENCES users(id),
    semester_id      BIGINT         NOT NULL REFERENCES semesters(id),
    bill_type        VARCHAR(20)    NOT NULL CHECK (bill_type IN ('ROOM_BILL','UTILITY_BILL','PUNISH_BILL')),
    amount           DECIMAL(18,2)  NOT NULL,
    status           VARCHAR(20)    NOT NULL CHECK (status IN ('UNPAID','PAID','OVERDUE','REFUNDED')),
    issue_date       DATE           NOT NULL,
    payment_deadline DATE           NOT NULL,
    description      NVARCHAR(500),
    created_by       NVARCHAR(100),
    created_at       DATETIMEOFFSET,
    updated_by       NVARCHAR(100),
    updated_at       DATETIMEOFFSET
);

-- Giao dịch thanh toán
CREATE TABLE payment_transactions (
    id             BIGINT IDENTITY(1,1) PRIMARY KEY,
    bill_id        BIGINT         NOT NULL REFERENCES bills(id),
    payment_method VARCHAR(30)    NOT NULL,
    txn_ref        VARCHAR(100)   NOT NULL UNIQUE,
    amount         DECIMAL(18,2)  NOT NULL,
    status         VARCHAR(20)    NOT NULL,
    payment_date   DATETIME2      NOT NULL
);
GO

PRINT N'Tạo toàn bộ bảng thành công!';

-- ============================================================
-- DỮ LIỆU MẪU
-- ============================================================

-- Kỳ học
INSERT INTO semesters (name, start_date, end_date, is_active, created_by, created_at) VALUES
(N'Summer2026', '2026-05-01', '2026-08-31', 1, 'SYSTEM', SYSDATETIMEOFFSET()),
(N'Fall2026',   '2026-09-01', '2026-12-31', 0, 'SYSTEM', SYSDATETIMEOFFSET());

-- Tòa nhà
INSERT INTO dormitory_buildings (name, gender_type, status, created_by, created_at) VALUES
(N'Tòa A', 'FEMALE', 'ACTIVE', 'SYSTEM', SYSDATETIMEOFFSET()),
(N'Tòa B', 'MALE',   'ACTIVE', 'SYSTEM', SYSDATETIMEOFFSET()),
(N'Tòa C', 'FEMALE', 'ACTIVE', 'SYSTEM', SYSDATETIMEOFFSET()),
(N'Tòa D', 'MALE',   'ACTIVE', 'SYSTEM', SYSDATETIMEOFFSET());

-- Tầng (mỗi tòa 5 tầng → floor_id 1-20)
INSERT INTO floors (building_id, floor_number, status, created_by, created_at) VALUES
(1,1,'ACTIVE','SYSTEM',SYSDATETIMEOFFSET()),(1,2,'ACTIVE','SYSTEM',SYSDATETIMEOFFSET()),
(1,3,'ACTIVE','SYSTEM',SYSDATETIMEOFFSET()),(1,4,'ACTIVE','SYSTEM',SYSDATETIMEOFFSET()),
(1,5,'ACTIVE','SYSTEM',SYSDATETIMEOFFSET()),
(2,1,'ACTIVE','SYSTEM',SYSDATETIMEOFFSET()),(2,2,'ACTIVE','SYSTEM',SYSDATETIMEOFFSET()),
(2,3,'ACTIVE','SYSTEM',SYSDATETIMEOFFSET()),(2,4,'ACTIVE','SYSTEM',SYSDATETIMEOFFSET()),
(2,5,'ACTIVE','SYSTEM',SYSDATETIMEOFFSET()),
(3,1,'ACTIVE','SYSTEM',SYSDATETIMEOFFSET()),(3,2,'ACTIVE','SYSTEM',SYSDATETIMEOFFSET()),
(3,3,'ACTIVE','SYSTEM',SYSDATETIMEOFFSET()),(3,4,'ACTIVE','SYSTEM',SYSDATETIMEOFFSET()),
(3,5,'ACTIVE','SYSTEM',SYSDATETIMEOFFSET()),
(4,1,'ACTIVE','SYSTEM',SYSDATETIMEOFFSET()),(4,2,'ACTIVE','SYSTEM',SYSDATETIMEOFFSET()),
(4,3,'ACTIVE','SYSTEM',SYSDATETIMEOFFSET()),(4,4,'ACTIVE','SYSTEM',SYSDATETIMEOFFSET()),
(4,5,'ACTIVE','SYSTEM',SYSDATETIMEOFFSET());

-- Loại phòng
INSERT INTO room_types (type_name, price, description, created_by, created_at) VALUES
(N'Phòng đơn', 3200000, N'Điều hòa · Wi-Fi',                          'SYSTEM', SYSDATETIMEOFFSET()),
(N'Phòng đôi', 3500000, N'Điều hòa · Wi-Fi · Nhà vệ sinh',            'SYSTEM', SYSDATETIMEOFFSET()),
(N'Phòng ba',  2800000, N'Điều hòa · Wi-Fi',                          'SYSTEM', SYSDATETIMEOFFSET()),
(N'Phòng VIP', 4200000, N'Điều hòa · Wi-Fi · Nhà vệ sinh · Ban công', 'SYSTEM', SYSDATETIMEOFFSET());

-- Phòng mẫu
-- Tòa A tầng 3 = floor_id 3  | Tòa B tầng 5 = floor_id 10 | Tòa B tầng 2 = floor_id 7
-- Tòa C tầng 2 = floor_id 12 | Tòa C tầng 4 = floor_id 14 | Tòa D tầng 1 = floor_id 16
INSERT INTO rooms (floor_id, room_type_id, room_number, max_beds, current_occupancy, status, created_by, created_at) VALUES
(3,  1, '312', 2, 0, 'ACTIVE', 'SYSTEM', SYSDATETIMEOFFSET()),
(10, 2, '501', 4, 2, 'ACTIVE', 'SYSTEM', SYSDATETIMEOFFSET()),
(7,  1, '206', 2, 1, 'ACTIVE', 'SYSTEM', SYSDATETIMEOFFSET()),
(12, 4, '203', 2, 1, 'ACTIVE', 'SYSTEM', SYSDATETIMEOFFSET()),
(14, 2, '410', 4, 3, 'ACTIVE', 'SYSTEM', SYSDATETIMEOFFSET()),
(16, 3, '104', 6, 4, 'ACTIVE', 'SYSTEM', SYSDATETIMEOFFSET());

-- Giường mẫu (room_id 1=A-312, 2=B-501, 3=B-206, 4=C-203, 5=C-410, 6=D-104)
INSERT INTO beds (room_id, bed_number, status, created_by, created_at) VALUES
(1,1,'AVAILABLE','SYSTEM',SYSDATETIMEOFFSET()),(1,2,'AVAILABLE','SYSTEM',SYSDATETIMEOFFSET()),
(2,1,'OCCUPIED', 'SYSTEM',SYSDATETIMEOFFSET()),(2,2,'OCCUPIED', 'SYSTEM',SYSDATETIMEOFFSET()),
(2,3,'AVAILABLE','SYSTEM',SYSDATETIMEOFFSET()),(2,4,'AVAILABLE','SYSTEM',SYSDATETIMEOFFSET()),
(3,1,'OCCUPIED', 'SYSTEM',SYSDATETIMEOFFSET()),(3,2,'AVAILABLE','SYSTEM',SYSDATETIMEOFFSET()),
(4,1,'OCCUPIED', 'SYSTEM',SYSDATETIMEOFFSET()),(4,2,'AVAILABLE','SYSTEM',SYSDATETIMEOFFSET()),
(5,1,'OCCUPIED', 'SYSTEM',SYSDATETIMEOFFSET()),(5,2,'OCCUPIED', 'SYSTEM',SYSDATETIMEOFFSET()),
(5,3,'OCCUPIED', 'SYSTEM',SYSDATETIMEOFFSET()),(5,4,'AVAILABLE','SYSTEM',SYSDATETIMEOFFSET()),
(6,1,'OCCUPIED', 'SYSTEM',SYSDATETIMEOFFSET()),(6,2,'OCCUPIED', 'SYSTEM',SYSDATETIMEOFFSET()),
(6,3,'OCCUPIED', 'SYSTEM',SYSDATETIMEOFFSET()),(6,4,'OCCUPIED', 'SYSTEM',SYSDATETIMEOFFSET()),
(6,5,'AVAILABLE','SYSTEM',SYSDATETIMEOFFSET()),(6,6,'AVAILABLE','SYSTEM',SYSDATETIMEOFFSET());
GO

-- Địa chỉ
INSERT INTO cities (name) VALUES (N'Hà Nội'), (N'Hồ Chí Minh'), (N'Đà Nẵng');

INSERT INTO wards (name, city_id) VALUES
(N'Phường Dịch Vọng', 1),
(N'Phường Cầu Giấy',  1),
(N'Phường Bình Thạnh',2);

INSERT INTO addresses (ward_id, specific_address) VALUES
(1, N'Số 1 Đại Cồ Việt'),
(2, N'Số 10 Xuân Thủy'),
(3, N'123 Đinh Tiên Hoàng');

-- Vai trò & quyền hạn
INSERT INTO roles (role_name, description) VALUES
('ROLE_ADMIN',   N'Quản trị hệ thống'),
('ROLE_MANAGER', N'Quản lý ký túc xá'),
('ROLE_STUDENT', N'Sinh viên');

INSERT INTO permissions (permission_key, description) VALUES
('CAN_APPROVE_CONTRACT', N'Duyệt hợp đồng đăng ký giường'),
('CAN_VIEW_REPORT',      N'Xem báo cáo thống kê'),
('CAN_MANAGE_ROOM',      N'Quản lý phòng và giường'),
('CAN_CREATE_BILL',      N'Tạo hóa đơn cho sinh viên'),
('CAN_VIEW_OWN_BILL',    N'Xem hóa đơn của bản thân');

INSERT INTO role_permissions (role_id, permission_id, created_by, created_at) VALUES
(2,1,'SYSTEM',SYSDATETIMEOFFSET()),(2,2,'SYSTEM',SYSDATETIMEOFFSET()),
(2,3,'SYSTEM',SYSDATETIMEOFFSET()),(2,4,'SYSTEM',SYSDATETIMEOFFSET()),
(3,5,'SYSTEM',SYSDATETIMEOFFSET());

-- Tài khoản mẫu (password chưa mã hóa, chỉ để test)
INSERT INTO users (first_name, middle_name, last_name, email, password_hash, phone, gender, dob, is_active, address_id, created_by, created_at) VALUES
(N'Nguyễn',N'Văn', N'An',    'admin@dorm.edu.vn',   'password123','0901000001','MALE',  '1990-01-15',1,1,'SYSTEM',SYSDATETIMEOFFSET()),
(N'Trần',  N'Thị', N'Bình',  'manager@dorm.edu.vn', 'password123','0901000002','FEMALE','1992-03-20',1,2,'SYSTEM',SYSDATETIMEOFFSET()),
(N'Lê',    N'Văn', N'Cường', 'sv001@fpt.edu.vn',    'password123','0901000003','MALE',  '2003-07-10',1,3,'SYSTEM',SYSDATETIMEOFFSET()),
(N'Phạm',  N'Thị', N'Dung',  'sv002@fpt.edu.vn',    'password123','0901000004','FEMALE','2003-11-25',1,NULL,'SYSTEM',SYSDATETIMEOFFSET()),
(N'Hoàng', N'Văn', N'Em',    'sv003@fpt.edu.vn',    'password123','0901000005','MALE',  '2004-02-14',1,NULL,'SYSTEM',SYSDATETIMEOFFSET());

INSERT INTO student_profiles (user_id, student_code, major, academic_year) VALUES
(3,'SE150001',N'Kỹ thuật phần mềm','K19'),
(4,'SE150002',N'Kỹ thuật phần mềm','K19'),
(5,'SE150003',N'An toàn thông tin', 'K20');

INSERT INTO user_roles (user_id, role_id, created_by, created_at) VALUES
(1,1,'SYSTEM',SYSDATETIMEOFFSET()),
(2,2,'SYSTEM',SYSDATETIMEOFFSET()),
(3,3,'SYSTEM',SYSDATETIMEOFFSET()),
(4,3,'SYSTEM',SYSDATETIMEOFFSET()),
(5,3,'SYSTEM',SYSDATETIMEOFFSET());

INSERT INTO student_whitelists (student_code, email, full_name, phone, gender, major, semester_id, is_registered, created_by, created_at) VALUES
('SE150001','sv001@fpt.edu.vn',N'Lê Văn Cường',  '0901000003','MALE',  N'Kỹ thuật phần mềm',1,1,'SYSTEM',SYSDATETIMEOFFSET()),
('SE150002','sv002@fpt.edu.vn',N'Phạm Thị Dung', '0901000004','FEMALE',N'Kỹ thuật phần mềm',1,1,'SYSTEM',SYSDATETIMEOFFSET()),
('SE150003','sv003@fpt.edu.vn',N'Hoàng Văn Em',  '0901000005','MALE',  N'An toàn thông tin', 1,1,'SYSTEM',SYSDATETIMEOFFSET()),
('SE150004','sv004@fpt.edu.vn',N'Ngô Thị Fang',  '0901000006','FEMALE',N'Thiết kế đồ họa',   1,0,'SYSTEM',SYSDATETIMEOFFSET());
GO

PRINT N'Tạo database và dữ liệu mẫu thành công!';
