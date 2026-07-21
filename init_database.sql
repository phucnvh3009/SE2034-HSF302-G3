USE master;
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'DormitoryManagement')
BEGIN
    ALTER DATABASE DormitoryManagement SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DormitoryManagement;
END;
GO

CREATE DATABASE DormitoryManagement;
GO
USE DormitoryManagement;
GO
SET NOCOUNT ON;
GO-- ==========================================
-- CREATE TABLES
-- ==========================================

-- 1. cities
CREATE TABLE cities (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL UNIQUE
);

-- 2. wards
CREATE TABLE wards (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    city_id BIGINT NOT NULL FOREIGN KEY REFERENCES cities(id)
);

-- 3. addresses
CREATE TABLE addresses (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    ward_id BIGINT NOT NULL FOREIGN KEY REFERENCES wards(id),
    specific_address NVARCHAR(500) NOT NULL
);

-- 4. users
CREATE TABLE users (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(255) NOT NULL,
    middle_name NVARCHAR(255),
    last_name NVARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    dob DATE,
    avatar VARCHAR(500),
    is_active BIT NOT NULL DEFAULT 1,
    address_id BIGINT FOREIGN KEY REFERENCES addresses(id),
    created_by VARCHAR(255) DEFAULT 'SYSTEM',
    created_at DATETIME2 DEFAULT SYSUTCDATETIME(),
    updated_by VARCHAR(255),
    updated_at DATETIME2
);

-- 5. student_profiles
CREATE TABLE student_profiles (
    user_id BIGINT PRIMARY KEY FOREIGN KEY REFERENCES users(id),
    student_code VARCHAR(20) NOT NULL UNIQUE,
    major NVARCHAR(200) NOT NULL,
    academic_year VARCHAR(10),
    created_by VARCHAR(255) DEFAULT 'SYSTEM',
    created_at DATETIME2 DEFAULT SYSUTCDATETIME(),
    updated_by VARCHAR(255),
    updated_at DATETIME2
);

-- 6. roles
CREATE TABLE roles (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL UNIQUE,
    description NVARCHAR(500) NOT NULL
);

-- 7. permissions
CREATE TABLE permissions (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    permission_key VARCHAR(100) NOT NULL UNIQUE,
    description NVARCHAR(500) NOT NULL
);

-- 8. role_permissions
CREATE TABLE role_permissions (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    role_id BIGINT NOT NULL FOREIGN KEY REFERENCES roles(id),
    permission_id BIGINT NOT NULL FOREIGN KEY REFERENCES permissions(id),
    created_by VARCHAR(255) DEFAULT 'SYSTEM',
    created_at DATETIME2 DEFAULT SYSUTCDATETIME(),
    updated_by VARCHAR(255),
    updated_at DATETIME2,
    CONSTRAINT UQ_role_permission UNIQUE (role_id, permission_id)
);

-- 9. user_roles
CREATE TABLE user_roles (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    user_id BIGINT NOT NULL FOREIGN KEY REFERENCES users(id),
    role_id BIGINT NOT NULL FOREIGN KEY REFERENCES roles(id),
    created_by VARCHAR(255) DEFAULT 'SYSTEM',
    created_at DATETIME2 DEFAULT SYSUTCDATETIME(),
    updated_by VARCHAR(255),
    updated_at DATETIME2,
    CONSTRAINT UQ_user_role UNIQUE (user_id, role_id)
);

-- 10. semesters
CREATE TABLE semesters (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50) NOT NULL UNIQUE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    is_active BIT NOT NULL DEFAULT 0,
    created_by VARCHAR(255) DEFAULT 'SYSTEM',
    created_at DATETIME2 DEFAULT SYSUTCDATETIME(),
    updated_by VARCHAR(255),
    updated_at DATETIME2
);

-- 11. student_whitelists
CREATE TABLE student_whitelists (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    student_code VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    full_name NVARCHAR(200) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    major NVARCHAR(200) NOT NULL,
    semester_id BIGINT NOT NULL FOREIGN KEY REFERENCES semesters(id),
    is_registered BIT NOT NULL DEFAULT 0,
    created_by VARCHAR(255) DEFAULT 'SYSTEM',
    created_at DATETIME2 DEFAULT SYSUTCDATETIME(),
    updated_by VARCHAR(255),
    updated_at DATETIME2,
    CONSTRAINT UQ_student_whitelist_code UNIQUE (student_code, semester_id),
    CONSTRAINT UQ_student_whitelist_email UNIQUE (email, semester_id)
);

-- 12. dormitory_buildings
CREATE TABLE dormitory_buildings (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL UNIQUE,
    gender_type VARCHAR(20) NOT NULL,
    status VARCHAR(20) NOT NULL,
    manager_id BIGINT FOREIGN KEY REFERENCES users(id),
    created_by VARCHAR(255) DEFAULT 'SYSTEM',
    created_at DATETIME2 DEFAULT SYSUTCDATETIME(),
    updated_by VARCHAR(255),
    updated_at DATETIME2
);

-- 13. floors
CREATE TABLE floors (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    building_id BIGINT NOT NULL FOREIGN KEY REFERENCES dormitory_buildings(id),
    floor_number INT NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_by VARCHAR(255) DEFAULT 'SYSTEM',
    created_at DATETIME2 DEFAULT SYSUTCDATETIME(),
    updated_by VARCHAR(255),
    updated_at DATETIME2,
    CONSTRAINT UQ_building_floor UNIQUE (building_id, floor_number)
);

-- 14. room_types
CREATE TABLE room_types (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    type_name NVARCHAR(100) NOT NULL UNIQUE,
    price DECIMAL(18,2) NOT NULL,
    description NVARCHAR(500),
    created_by VARCHAR(255) DEFAULT 'SYSTEM',
    created_at DATETIME2 DEFAULT SYSUTCDATETIME(),
    updated_by VARCHAR(255),
    updated_at DATETIME2
);

-- 15. rooms
CREATE TABLE rooms (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    floor_id BIGINT NOT NULL FOREIGN KEY REFERENCES floors(id),
    room_type_id BIGINT NOT NULL FOREIGN KEY REFERENCES room_types(id),
    room_number VARCHAR(10) NOT NULL,
    max_beds INT NOT NULL,
    current_occupancy INT NOT NULL DEFAULT 0,
    status VARCHAR(20) NOT NULL,
    created_by VARCHAR(255) DEFAULT 'SYSTEM',
    created_at DATETIME2 DEFAULT SYSUTCDATETIME(),
    updated_by VARCHAR(255),
    updated_at DATETIME2,
    CONSTRAINT UQ_floor_room UNIQUE (floor_id, room_number)
);

-- 16. beds
CREATE TABLE beds (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    room_id BIGINT NOT NULL FOREIGN KEY REFERENCES rooms(id),
    bed_number INT NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_by VARCHAR(255) DEFAULT 'SYSTEM',
    created_at DATETIME2 DEFAULT SYSUTCDATETIME(),
    updated_by VARCHAR(255),
    updated_at DATETIME2,
    CONSTRAINT UQ_room_bed UNIQUE (room_id, bed_number)
);

-- 17. contracts
CREATE TABLE contracts (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    contract_code VARCHAR(50) NOT NULL UNIQUE,
    student_id BIGINT NOT NULL FOREIGN KEY REFERENCES users(id),
    bed_id BIGINT NOT NULL FOREIGN KEY REFERENCES beds(id),
    semester_id BIGINT NOT NULL FOREIGN KEY REFERENCES semesters(id),
    price DECIMAL(18,2) NOT NULL,
    status VARCHAR(30) NOT NULL,
    checked_out_at DATETIME2,
    checked_out_by BIGINT FOREIGN KEY REFERENCES users(id),
    created_by VARCHAR(255) DEFAULT 'SYSTEM',
    created_at DATETIME2 DEFAULT SYSUTCDATETIME(),
    updated_by VARCHAR(255),
    updated_at DATETIME2
);

-- 18. bills
CREATE TABLE bills (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    bill_code VARCHAR(50) NOT NULL UNIQUE,
    student_id BIGINT NOT NULL FOREIGN KEY REFERENCES users(id),
    semester_id BIGINT NOT NULL FOREIGN KEY REFERENCES semesters(id),
    bill_type VARCHAR(20) NOT NULL,
    amount DECIMAL(18,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    issue_date DATE NOT NULL,
    payment_deadline DATE NOT NULL,
    description NVARCHAR(500),
    created_by VARCHAR(255) DEFAULT 'SYSTEM',
    created_at DATETIME2 DEFAULT SYSUTCDATETIME(),
    updated_by VARCHAR(255),
    updated_at DATETIME2
);

-- 19. payment_transactions
CREATE TABLE payment_transactions (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    bill_id BIGINT NOT NULL FOREIGN KEY REFERENCES bills(id),
    payment_method VARCHAR(30) NOT NULL,
    txn_ref VARCHAR(100) NOT NULL UNIQUE,
    amount DECIMAL(18,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    payment_date DATETIME2 NOT NULL
);

-- 20. utility_usages
CREATE TABLE utility_usages (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    room_id BIGINT NOT NULL FOREIGN KEY REFERENCES rooms(id),
    semester_id BIGINT NOT NULL FOREIGN KEY REFERENCES semesters(id),
    recorded_month INT NOT NULL,
    recorded_year INT NOT NULL,
    start_electricity INT NOT NULL,
    end_electricity INT NOT NULL,
    start_water INT NOT NULL,
    end_water INT NOT NULL,
    recorded_by BIGINT FOREIGN KEY REFERENCES users(id),
    recorded_at DATETIME2,
    created_by VARCHAR(255) DEFAULT 'SYSTEM',
    created_at DATETIME2 DEFAULT SYSUTCDATETIME(),
    updated_by VARCHAR(255),
    updated_at DATETIME2,
    CONSTRAINT UQ_room_semester_month_year UNIQUE (room_id, semester_id, recorded_month, recorded_year)
);

-- 21. staff_floor_assignments
CREATE TABLE staff_floor_assignments (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    staff_id BIGINT NOT NULL FOREIGN KEY REFERENCES users(id),
    floor_id BIGINT NOT NULL FOREIGN KEY REFERENCES floors(id),
    assigned_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_by VARCHAR(255) DEFAULT 'SYSTEM',
    created_at DATETIME2 DEFAULT SYSUTCDATETIME(),
    updated_by VARCHAR(255),
    updated_at DATETIME2
);

-- 22. issue_reports
CREATE TABLE issue_reports (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(255) NOT NULL,
    description NVARCHAR(1000) NOT NULL,
    category VARCHAR(50) NOT NULL,
    status VARCHAR(20) NOT NULL,
    staff_note NVARCHAR(1000),
    student_id BIGINT NOT NULL FOREIGN KEY REFERENCES users(id),
    room_id BIGINT NOT NULL FOREIGN KEY REFERENCES rooms(id),
    created_by VARCHAR(255) DEFAULT 'SYSTEM',
    created_at DATETIME2 DEFAULT SYSUTCDATETIME(),
    updated_by VARCHAR(255),
    updated_at DATETIME2
);

-- 23. student_requests
CREATE TABLE student_requests (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(255) NOT NULL,
    description NTEXT,
    type VARCHAR(50) NOT NULL,
    status VARCHAR(50) NOT NULL,
    student_id BIGINT NOT NULL FOREIGN KEY REFERENCES users(id),
    assigned_staff_id BIGINT FOREIGN KEY REFERENCES users(id),
    room_id BIGINT FOREIGN KEY REFERENCES rooms(id),
    created_by VARCHAR(255) DEFAULT 'SYSTEM',
    created_at DATETIME2 DEFAULT SYSUTCDATETIME(),
    updated_by VARCHAR(255),
    updated_at DATETIME2
);

-- ==========================================
-- INSERT SAMPLE DATA
-- ==========================================

-- =========================================================================
-- PHẦN 1: CÁC BẢNG DANH MỤC ĐỘC LẬP VÀ ÍT PHỤ THUỘC
-- =========================================================================

-- 1. cities
INSERT INTO cities (name) VALUES 
(N'Hà Nội'), (N'TP. Hồ Chí Minh'), (N'Đà Nẵng'), (N'Hải Phòng'), (N'Cần Thơ'), 
(N'Huế'), (N'Nha Trang'), (N'Đà Lạt'), (N'Vũng Tàu'), (N'Quy Nhơn');

-- 6. roles
INSERT INTO roles (role_name, description) VALUES 
('ROLE_ADMIN', N'Quản trị viên'), 
('ROLE_MANAGER', N'Quản lý tòa nhà'), 
('ROLE_STAFF', N'Nhân viên KTX'), 
('ROLE_STUDENT', N'Sinh viên');

-- 7. permissions
INSERT INTO permissions (permission_key, description) VALUES 
('DASHBOARD_VIEW', N'Xem tổng quan thống kê'),
('USER_MANAGE', N'Thêm sửa xóa người dùng'),
('ROOM_MANAGE', N'Quản lý phòng và giường'),
('CONTRACT_MANAGE', N'Quản lý hợp đồng lưu trú'),
('BILL_MANAGE', N'Quản lý hóa đơn và thanh toán');

-- 10. semesters
INSERT INTO semesters (name, start_date, end_date, is_active) VALUES 
(N'Học kỳ 1 (2026-2027)', '2026-08-15', '2027-01-15', 1),
(N'Học kỳ 2 (2026-2027)', '2027-02-15', '2027-07-15', 0);

-- 14. room_types
INSERT INTO room_types (type_name, price, description) VALUES 
(N'Phòng 2 Người', 3000000, N'Tối đa 2 giường'),
(N'Phòng 4 Người', 2000000, N'Tối đa 4 giường'),
(N'Phòng 6 Người', 1200000, N'Tối đa 6 giường');

-- 2. wards
INSERT INTO wards (name, city_id) VALUES (N'Phường Trung Tâm', 1);

-- 8. role_permissions 
INSERT INTO role_permissions (role_id, permission_id) VALUES 
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), -- Admin có toàn quyền (Permissions 1->5)
(2, 1), (2, 3), (2, 4),                 -- Manager xem dashboard, quản lý phòng, hợp đồng
(3, 3),                                 -- Staff chỉ quản lý phòng (báo cáo sự cố)
(4, 1);                                 -- Student chỉ có quyền xem cơ bản

-- 11. student_whitelists
INSERT INTO student_whitelists (student_code, email, full_name, phone, gender, major, semester_id, is_registered) VALUES 
('WL001', 'wl1@ktx.vn', N'Nguyễn Danh Sách Chờ 1', '0980000001', 'MALE', N'Kinh tế', 1, 0),
('WL002', 'wl2@ktx.vn', N'Trần Danh Sách Chờ 2', '0980000002', 'FEMALE', N'Ngôn ngữ Anh', 1, 0),
('WL003', 'wl3@ktx.vn', N'Lê Danh Sách Chờ 3', '0980000003', 'MALE', N'Công nghệ thông tin', 1, 0);

-- 3. addresses
INSERT INTO addresses (ward_id, specific_address) VALUES (1, N'Số 1 Đường KTX');


-- =========================================================================
-- PHẦN 2: TẠO 178 USERS & THÔNG TIN LIÊN QUAN
-- =========================================================================

-- 4. users (1 Admin + 3 Managers + 24 Staff + 150 Students)
INSERT INTO users (first_name, middle_name, last_name, email, password_hash, phone, gender, dob, is_active, address_id) VALUES
-- 1 ADMIN (ID: 1)
(N'Quản', N'Trị', N'Viên', 'admin@ktx.vn', 'hashed_pw', '0900000000', 'MALE', '1980-01-01', 1, 1),
-- 3 DORM MANAGERS (ID: 2, 3, 4)
(N'Quản lý', N'Tòa', N'A', 'mgr.a@ktx.vn', 'hashed_pw', '0900000001', 'MALE', '1985-01-01', 1, 1),
(N'Quản lý', N'Tòa', N'B', 'mgr.b@ktx.vn', 'hashed_pw', '0900000002', 'FEMALE', '1985-01-01', 1, 1),
(N'Quản lý', N'Tòa', N'C', 'mgr.c@ktx.vn', 'hashed_pw', '0900000003', 'MALE', '1985-01-01', 1, 1),
-- 24 STAFF (ID: 5 -> 28) - 8 người/tòa
(N'Nhân viên', N'A', N'01', 'staff.a01@ktx.vn', 'hashed_pw', '0910000001', 'MALE', '1990-01-01', 1, 1), (N'Nhân viên', N'A', N'02', 'staff.a02@ktx.vn', 'hashed_pw', '0910000002', 'FEMALE', '1990-01-01', 1, 1),
(N'Nhân viên', N'A', N'03', 'staff.a03@ktx.vn', 'hashed_pw', '0910000003', 'MALE', '1990-01-01', 1, 1), (N'Nhân viên', N'A', N'04', 'staff.a04@ktx.vn', 'hashed_pw', '0910000004', 'FEMALE', '1990-01-01', 1, 1),
(N'Nhân viên', N'A', N'05', 'staff.a05@ktx.vn', 'hashed_pw', '0910000005', 'MALE', '1990-01-01', 1, 1), (N'Nhân viên', N'A', N'06', 'staff.a06@ktx.vn', 'hashed_pw', '0910000006', 'FEMALE', '1990-01-01', 1, 1),
(N'Nhân viên', N'A', N'07', 'staff.a07@ktx.vn', 'hashed_pw', '0910000007', 'MALE', '1990-01-01', 1, 1), (N'Nhân viên', N'A', N'08', 'staff.a08@ktx.vn', 'hashed_pw', '0910000008', 'FEMALE', '1990-01-01', 1, 1),
(N'Nhân viên', N'B', N'01', 'staff.b01@ktx.vn', 'hashed_pw', '0920000001', 'MALE', '1990-01-01', 1, 1), (N'Nhân viên', N'B', N'02', 'staff.b02@ktx.vn', 'hashed_pw', '0920000002', 'FEMALE', '1990-01-01', 1, 1),
(N'Nhân viên', N'B', N'03', 'staff.b03@ktx.vn', 'hashed_pw', '0920000003', 'MALE', '1990-01-01', 1, 1), (N'Nhân viên', N'B', N'04', 'staff.b04@ktx.vn', 'hashed_pw', '0920000004', 'FEMALE', '1990-01-01', 1, 1),
(N'Nhân viên', N'B', N'05', 'staff.b05@ktx.vn', 'hashed_pw', '0920000005', 'MALE', '1990-01-01', 1, 1), (N'Nhân viên', N'B', N'06', 'staff.b06@ktx.vn', 'hashed_pw', '0920000006', 'FEMALE', '1990-01-01', 1, 1),
(N'Nhân viên', N'B', N'07', 'staff.b07@ktx.vn', 'hashed_pw', '0920000007', 'MALE', '1990-01-01', 1, 1), (N'Nhân viên', N'B', N'08', 'staff.b08@ktx.vn', 'hashed_pw', '0920000008', 'FEMALE', '1990-01-01', 1, 1),
(N'Nhân viên', N'C', N'01', 'staff.c01@ktx.vn', 'hashed_pw', '0930000001', 'MALE', '1990-01-01', 1, 1), (N'Nhân viên', N'C', N'02', 'staff.c02@ktx.vn', 'hashed_pw', '0930000002', 'FEMALE', '1990-01-01', 1, 1),
(N'Nhân viên', N'C', N'03', 'staff.c03@ktx.vn', 'hashed_pw', '0930000003', 'MALE', '1990-01-01', 1, 1), (N'Nhân viên', N'C', N'04', 'staff.c04@ktx.vn', 'hashed_pw', '0930000004', 'FEMALE', '1990-01-01', 1, 1),
(N'Nhân viên', N'C', N'05', 'staff.c05@ktx.vn', 'hashed_pw', '0930000005', 'MALE', '1990-01-01', 1, 1), (N'Nhân viên', N'C', N'06', 'staff.c06@ktx.vn', 'hashed_pw', '0930000006', 'FEMALE', '1990-01-01', 1, 1),
(N'Nhân viên', N'C', N'07', 'staff.c07@ktx.vn', 'hashed_pw', '0930000007', 'MALE', '1990-01-01', 1, 1), (N'Nhân viên', N'C', N'08', 'staff.c08@ktx.vn', 'hashed_pw', '0930000008', 'FEMALE', '1990-01-01', 1, 1),
-- 150 STUDENTS (ID: 29 -> 178)
(N'SV', N'', N'001', 'sv001@ktx.vn', 'pw', '0990000001', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'002', 'sv002@ktx.vn', 'pw', '0990000002', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'003', 'sv003@ktx.vn', 'pw', '0990000003', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'004', 'sv004@ktx.vn', 'pw', '0990000004', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'005', 'sv005@ktx.vn', 'pw', '0990000005', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'006', 'sv006@ktx.vn', 'pw', '0990000006', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'007', 'sv007@ktx.vn', 'pw', '0990000007', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'008', 'sv008@ktx.vn', 'pw', '0990000008', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'009', 'sv009@ktx.vn', 'pw', '0990000009', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'010', 'sv010@ktx.vn', 'pw', '099000010', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'011', 'sv011@ktx.vn', 'pw', '0990000011', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'012', 'sv012@ktx.vn', 'pw', '0990000012', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'013', 'sv013@ktx.vn', 'pw', '0990000013', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'014', 'sv014@ktx.vn', 'pw', '0990000014', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'015', 'sv015@ktx.vn', 'pw', '0990000015', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'016', 'sv016@ktx.vn', 'pw', '0990000016', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'017', 'sv017@ktx.vn', 'pw', '0990000017', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'018', 'sv018@ktx.vn', 'pw', '0990000018', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'019', 'sv019@ktx.vn', 'pw', '0990000019', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'020', 'sv020@ktx.vn', 'pw', '0990000020', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'021', 'sv021@ktx.vn', 'pw', '0990000021', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'022', 'sv022@ktx.vn', 'pw', '0990000022', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'023', 'sv023@ktx.vn', 'pw', '0990000023', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'024', 'sv024@ktx.vn', 'pw', '0990000024', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'025', 'sv025@ktx.vn', 'pw', '0990000025', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'026', 'sv026@ktx.vn', 'pw', '0990000026', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'027', 'sv027@ktx.vn', 'pw', '0990000027', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'028', 'sv028@ktx.vn', 'pw', '0990000028', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'029', 'sv029@ktx.vn', 'pw', '0990000029', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'030', 'sv030@ktx.vn', 'pw', '0990000030', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'031', 'sv031@ktx.vn', 'pw', '0990000031', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'032', 'sv032@ktx.vn', 'pw', '0990000032', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'033', 'sv033@ktx.vn', 'pw', '0990000033', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'034', 'sv034@ktx.vn', 'pw', '0990000034', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'035', 'sv035@ktx.vn', 'pw', '0990000035', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'036', 'sv036@ktx.vn', 'pw', '0990000036', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'037', 'sv037@ktx.vn', 'pw', '0990000037', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'038', 'sv038@ktx.vn', 'pw', '0990000038', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'039', 'sv039@ktx.vn', 'pw', '0990000039', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'040', 'sv040@ktx.vn', 'pw', '0990000040', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'041', 'sv041@ktx.vn', 'pw', '0990000041', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'042', 'sv042@ktx.vn', 'pw', '0990000042', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'043', 'sv043@ktx.vn', 'pw', '0990000043', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'044', 'sv044@ktx.vn', 'pw', '0990000044', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'045', 'sv045@ktx.vn', 'pw', '0990000045', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'046', 'sv046@ktx.vn', 'pw', '0990000046', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'047', 'sv047@ktx.vn', 'pw', '0990000047', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'048', 'sv048@ktx.vn', 'pw', '0990000048', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'049', 'sv049@ktx.vn', 'pw', '0990000049', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'050', 'sv050@ktx.vn', 'pw', '0990000050', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'051', 'sv051@ktx.vn', 'pw', '0990000051', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'052', 'sv052@ktx.vn', 'pw', '0990000052', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'053', 'sv053@ktx.vn', 'pw', '0990000053', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'054', 'sv054@ktx.vn', 'pw', '0990000054', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'055', 'sv055@ktx.vn', 'pw', '0990000055', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'056', 'sv056@ktx.vn', 'pw', '0990000056', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'057', 'sv057@ktx.vn', 'pw', '0990000057', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'058', 'sv058@ktx.vn', 'pw', '0990000058', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'059', 'sv059@ktx.vn', 'pw', '0990000059', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'060', 'sv060@ktx.vn', 'pw', '0990000060', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'061', 'sv061@ktx.vn', 'pw', '0990000061', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'062', 'sv062@ktx.vn', 'pw', '0990000062', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'063', 'sv063@ktx.vn', 'pw', '0990000063', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'064', 'sv064@ktx.vn', 'pw', '0990000064', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'065', 'sv065@ktx.vn', 'pw', '0990000065', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'066', 'sv066@ktx.vn', 'pw', '0990000066', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'067', 'sv067@ktx.vn', 'pw', '0990000067', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'068', 'sv068@ktx.vn', 'pw', '0990000068', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'069', 'sv069@ktx.vn', 'pw', '0990000069', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'070', 'sv070@ktx.vn', 'pw', '0990000070', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'071', 'sv071@ktx.vn', 'pw', '0990000071', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'072', 'sv072@ktx.vn', 'pw', '0990000072', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'073', 'sv073@ktx.vn', 'pw', '0990000073', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'074', 'sv074@ktx.vn', 'pw', '0990000074', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'075', 'sv075@ktx.vn', 'pw', '0990000075', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'076', 'sv076@ktx.vn', 'pw', '0990000076', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'077', 'sv077@ktx.vn', 'pw', '0990000077', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'078', 'sv078@ktx.vn', 'pw', '0990000078', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'079', 'sv079@ktx.vn', 'pw', '0990000079', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'080', 'sv080@ktx.vn', 'pw', '0990000080', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'081', 'sv081@ktx.vn', 'pw', '0990000081', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'082', 'sv082@ktx.vn', 'pw', '0990000082', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'083', 'sv083@ktx.vn', 'pw', '0990000083', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'084', 'sv084@ktx.vn', 'pw', '0990000084', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'085', 'sv085@ktx.vn', 'pw', '0990000085', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'086', 'sv086@ktx.vn', 'pw', '0990000086', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'087', 'sv087@ktx.vn', 'pw', '0990000087', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'088', 'sv088@ktx.vn', 'pw', '0990000088', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'089', 'sv089@ktx.vn', 'pw', '0990000089', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'090', 'sv090@ktx.vn', 'pw', '0990000090', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'091', 'sv091@ktx.vn', 'pw', '0990000091', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'092', 'sv092@ktx.vn', 'pw', '0990000092', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'093', 'sv093@ktx.vn', 'pw', '0990000093', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'094', 'sv094@ktx.vn', 'pw', '0990000094', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'095', 'sv095@ktx.vn', 'pw', '0990000095', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'096', 'sv096@ktx.vn', 'pw', '0990000096', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'097', 'sv097@ktx.vn', 'pw', '0990000097', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'098', 'sv098@ktx.vn', 'pw', '0990000098', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'099', 'sv099@ktx.vn', 'pw', '0990000099', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'100', 'sv100@ktx.vn', 'pw', '0990000100', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'101', 'sv101@ktx.vn', 'pw', '0990000101', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'102', 'sv102@ktx.vn', 'pw', '0990000102', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'103', 'sv103@ktx.vn', 'pw', '0990000103', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'104', 'sv104@ktx.vn', 'pw', '0990000104', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'105', 'sv105@ktx.vn', 'pw', '0990000105', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'106', 'sv106@ktx.vn', 'pw', '0990000106', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'107', 'sv107@ktx.vn', 'pw', '0990000107', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'108', 'sv108@ktx.vn', 'pw', '0990000108', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'109', 'sv109@ktx.vn', 'pw', '0990000109', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'110', 'sv110@ktx.vn', 'pw', '0990000110', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'111', 'sv111@ktx.vn', 'pw', '0990000111', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'112', 'sv112@ktx.vn', 'pw', '0990000112', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'113', 'sv113@ktx.vn', 'pw', '0990000113', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'114', 'sv114@ktx.vn', 'pw', '0990000114', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'115', 'sv115@ktx.vn', 'pw', '0990000115', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'116', 'sv116@ktx.vn', 'pw', '0990000116', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'117', 'sv117@ktx.vn', 'pw', '0990000117', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'118', 'sv118@ktx.vn', 'pw', '0990000118', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'119', 'sv119@ktx.vn', 'pw', '0990000119', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'120', 'sv120@ktx.vn', 'pw', '0990000120', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'121', 'sv121@ktx.vn', 'pw', '0990000121', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'122', 'sv122@ktx.vn', 'pw', '0990000122', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'123', 'sv123@ktx.vn', 'pw', '0990000123', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'124', 'sv124@ktx.vn', 'pw', '0990000124', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'125', 'sv125@ktx.vn', 'pw', '0990000125', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'126', 'sv126@ktx.vn', 'pw', '0990000126', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'127', 'sv127@ktx.vn', 'pw', '0990000127', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'128', 'sv128@ktx.vn', 'pw', '0990000128', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'129', 'sv129@ktx.vn', 'pw', '0990000129', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'130', 'sv130@ktx.vn', 'pw', '0990000130', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'131', 'sv131@ktx.vn', 'pw', '0990000131', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'132', 'sv132@ktx.vn', 'pw', '0990000132', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'133', 'sv133@ktx.vn', 'pw', '0990000133', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'134', 'sv134@ktx.vn', 'pw', '0990000134', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'135', 'sv135@ktx.vn', 'pw', '0990000135', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'136', 'sv136@ktx.vn', 'pw', '0990000136', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'137', 'sv137@ktx.vn', 'pw', '0990000137', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'138', 'sv138@ktx.vn', 'pw', '0990000138', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'139', 'sv139@ktx.vn', 'pw', '0990000139', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'140', 'sv140@ktx.vn', 'pw', '0990000140', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'141', 'sv141@ktx.vn', 'pw', '0990000141', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'142', 'sv142@ktx.vn', 'pw', '0990000142', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'143', 'sv143@ktx.vn', 'pw', '0990000143', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'144', 'sv144@ktx.vn', 'pw', '0990000144', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'145', 'sv145@ktx.vn', 'pw', '0990000145', 'MALE', '2004-01-01', 1, 1),
(N'SV', N'', N'146', 'sv146@ktx.vn', 'pw', '0990000146', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'147', 'sv147@ktx.vn', 'pw', '0990000147', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'148', 'sv148@ktx.vn', 'pw', '0990000148', 'MALE', '2004-01-01', 1, 1), (N'SV', N'', N'149', 'sv149@ktx.vn', 'pw', '0990000149', 'FEMALE', '2004-01-01', 1, 1), (N'SV', N'', N'150', 'sv150@ktx.vn', 'pw', '0990000150', 'MALE', '2004-01-01', 1, 1);

-- 9. user_roles
INSERT INTO user_roles (user_id, role_id) VALUES 
(1, 1), -- Admin
(2, 2), (3, 2), (4, 2), -- Managers
(5, 3), (6, 3), (7, 3), (8, 3), (9, 3), (10, 3), (11, 3), (12, 3), -- Staff Tòa A
(13, 3), (14, 3), (15, 3), (16, 3), (17, 3), (18, 3), (19, 3), (20, 3), -- Staff Tòa B
(21, 3), (22, 3), (23, 3), (24, 3), (25, 3), (26, 3), (27, 3), (28, 3), -- Staff Tòa C
(29, 4), (30, 4), (31, 4), (32, 4), (33, 4), (34, 4), (35, 4), (36, 4), (37, 4), (38, 4),
(39, 4), (40, 4), (41, 4), (42, 4), (43, 4), (44, 4), (45, 4), (46, 4), (47, 4), (48, 4),
(49, 4), (50, 4), (51, 4), (52, 4), (53, 4), (54, 4), (55, 4), (56, 4), (57, 4), (58, 4),
(59, 4), (60, 4), (61, 4), (62, 4), (63, 4), (64, 4), (65, 4), (66, 4), (67, 4), (68, 4),
(69, 4), (70, 4), (71, 4), (72, 4), (73, 4), (74, 4), (75, 4), (76, 4), (77, 4), (78, 4),
(79, 4), (80, 4), (81, 4), (82, 4), (83, 4), (84, 4), (85, 4), (86, 4), (87, 4), (88, 4),
(89, 4), (90, 4), (91, 4), (92, 4), (93, 4), (94, 4), (95, 4), (96, 4), (97, 4), (98, 4),
(99, 4), (100, 4), (101, 4), (102, 4), (103, 4), (104, 4), (105, 4), (106, 4), (107, 4), (108, 4),
(109, 4), (110, 4), (111, 4), (112, 4), (113, 4), (114, 4), (115, 4), (116, 4), (117, 4), (118, 4),
(119, 4), (120, 4), (121, 4), (122, 4), (123, 4), (124, 4), (125, 4), (126, 4), (127, 4), (128, 4),
(129, 4), (130, 4), (131, 4), (132, 4), (133, 4), (134, 4), (135, 4), (136, 4), (137, 4), (138, 4),
(139, 4), (140, 4), (141, 4), (142, 4), (143, 4), (144, 4), (145, 4), (146, 4), (147, 4), (148, 4),
(149, 4), (150, 4), (151, 4), (152, 4), (153, 4), (154, 4), (155, 4), (156, 4), (157, 4), (158, 4),
(159, 4), (160, 4), (161, 4), (162, 4), (163, 4), (164, 4), (165, 4), (166, 4), (167, 4), (168, 4),
(169, 4), (170, 4), (171, 4), (172, 4), (173, 4), (174, 4), (175, 4), (176, 4), (177, 4), (178, 4);

-- 5. student_profiles 
INSERT INTO student_profiles (user_id, student_code, major, academic_year)
SELECT id, 'SV' + CAST(id as varchar), N'Công nghệ', '2023-2024'
FROM users WHERE id >= 29 AND id <= 178;


-- =========================================================================
-- PHẦN 3: CẤU TRÚC KÝ TÚC XÁ (Tòa - Tầng - Phòng - Giường)
-- =========================================================================

-- 12. dormitory_buildings
INSERT INTO dormitory_buildings (name, gender_type, status, manager_id) VALUES 
(N'Tòa A', 'MALE', 'ACTIVE', 2), 
(N'Tòa B', 'FEMALE', 'ACTIVE', 3), 
(N'Tòa C', 'MALE', 'ACTIVE', 4);

-- 13. floors
INSERT INTO floors (building_id, floor_number, status) VALUES 
(1, 1, 'ACTIVE'), (1, 2, 'ACTIVE'), (1, 3, 'ACTIVE'), (1, 4, 'ACTIVE'),
(2, 1, 'ACTIVE'), (2, 2, 'ACTIVE'), (2, 3, 'ACTIVE'), (2, 4, 'ACTIVE'),
(3, 1, 'ACTIVE'), (3, 2, 'ACTIVE'), (3, 3, 'ACTIVE'), (3, 4, 'ACTIVE');

-- 15. rooms (120 Phòng)
INSERT INTO rooms (floor_id, room_type_id, room_number, max_beds, current_occupancy, status) VALUES
(1, 1, 'A-101', 2, 0, 'AVAILABLE'), (1, 1, 'A-102', 2, 0, 'AVAILABLE'), (1, 1, 'A-103', 2, 0, 'AVAILABLE'),
(1, 2, 'A-104', 4, 0, 'AVAILABLE'), (1, 2, 'A-105', 4, 0, 'AVAILABLE'), (1, 2, 'A-106', 4, 0, 'AVAILABLE'), (1, 2, 'A-107', 4, 0, 'AVAILABLE'),
(1, 3, 'A-108', 6, 0, 'AVAILABLE'), (1, 3, 'A-109', 6, 0, 'AVAILABLE'), (1, 3, 'A-110', 6, 0, 'AVAILABLE'),
(2, 1, 'A-201', 2, 0, 'AVAILABLE'), (2, 1, 'A-202', 2, 0, 'AVAILABLE'), (2, 1, 'A-203', 2, 0, 'AVAILABLE'),
(2, 2, 'A-204', 4, 0, 'AVAILABLE'), (2, 2, 'A-205', 4, 0, 'AVAILABLE'), (2, 2, 'A-206', 4, 0, 'AVAILABLE'), (2, 2, 'A-207', 4, 0, 'AVAILABLE'),
(2, 3, 'A-208', 6, 0, 'AVAILABLE'), (2, 3, 'A-209', 6, 0, 'AVAILABLE'), (2, 3, 'A-210', 6, 0, 'AVAILABLE'),
(3, 1, 'A-301', 2, 0, 'AVAILABLE'), (3, 1, 'A-302', 2, 0, 'AVAILABLE'), (3, 1, 'A-303', 2, 0, 'AVAILABLE'),
(3, 2, 'A-304', 4, 0, 'AVAILABLE'), (3, 2, 'A-305', 4, 0, 'AVAILABLE'), (3, 2, 'A-306', 4, 0, 'AVAILABLE'), (3, 2, 'A-307', 4, 0, 'AVAILABLE'),
(3, 3, 'A-308', 6, 0, 'AVAILABLE'), (3, 3, 'A-309', 6, 0, 'AVAILABLE'), (3, 3, 'A-310', 6, 0, 'AVAILABLE'),
(4, 1, 'A-401', 2, 0, 'AVAILABLE'), (4, 1, 'A-402', 2, 0, 'AVAILABLE'), (4, 1, 'A-403', 2, 0, 'AVAILABLE'),
(4, 2, 'A-404', 4, 0, 'AVAILABLE'), (4, 2, 'A-405', 4, 0, 'AVAILABLE'), (4, 2, 'A-406', 4, 0, 'AVAILABLE'), (4, 2, 'A-407', 4, 0, 'AVAILABLE'),
(4, 3, 'A-408', 6, 0, 'AVAILABLE'), (4, 3, 'A-409', 6, 0, 'AVAILABLE'), (4, 3, 'A-410', 6, 0, 'AVAILABLE'),
(5, 1, 'B-101', 2, 0, 'AVAILABLE'), (5, 1, 'B-102', 2, 0, 'AVAILABLE'), (5, 1, 'B-103', 2, 0, 'AVAILABLE'),
(5, 2, 'B-104', 4, 0, 'AVAILABLE'), (5, 2, 'B-105', 4, 0, 'AVAILABLE'), (5, 2, 'B-106', 4, 0, 'AVAILABLE'), (5, 2, 'B-107', 4, 0, 'AVAILABLE'),
(5, 3, 'B-108', 6, 0, 'AVAILABLE'), (5, 3, 'B-109', 6, 0, 'AVAILABLE'), (5, 3, 'B-110', 6, 0, 'AVAILABLE'),
(6, 1, 'B-201', 2, 0, 'AVAILABLE'), (6, 1, 'B-202', 2, 0, 'AVAILABLE'), (6, 1, 'B-203', 2, 0, 'AVAILABLE'),
(6, 2, 'B-204', 4, 0, 'AVAILABLE'), (6, 2, 'B-205', 4, 0, 'AVAILABLE'), (6, 2, 'B-206', 4, 0, 'AVAILABLE'), (6, 2, 'B-207', 4, 0, 'AVAILABLE'),
(6, 3, 'B-208', 6, 0, 'AVAILABLE'), (6, 3, 'B-209', 6, 0, 'AVAILABLE'), (6, 3, 'B-210', 6, 0, 'AVAILABLE'),
(7, 1, 'B-301', 2, 0, 'AVAILABLE'), (7, 1, 'B-302', 2, 0, 'AVAILABLE'), (7, 1, 'B-303', 2, 0, 'AVAILABLE'),
(7, 2, 'B-304', 4, 0, 'AVAILABLE'), (7, 2, 'B-305', 4, 0, 'AVAILABLE'), (7, 2, 'B-306', 4, 0, 'AVAILABLE'), (7, 2, 'B-307', 4, 0, 'AVAILABLE'),
(7, 3, 'B-308', 6, 0, 'AVAILABLE'), (7, 3, 'B-309', 6, 0, 'AVAILABLE'), (7, 3, 'B-310', 6, 0, 'AVAILABLE'),
(8, 1, 'B-401', 2, 0, 'AVAILABLE'), (8, 1, 'B-402', 2, 0, 'AVAILABLE'), (8, 1, 'B-403', 2, 0, 'AVAILABLE'),
(8, 2, 'B-404', 4, 0, 'AVAILABLE'), (8, 2, 'B-405', 4, 0, 'AVAILABLE'), (8, 2, 'B-406', 4, 0, 'AVAILABLE'), (8, 2, 'B-407', 4, 0, 'AVAILABLE'),
(8, 3, 'B-408', 6, 0, 'AVAILABLE'), (8, 3, 'B-409', 6, 0, 'AVAILABLE'), (8, 3, 'B-410', 6, 0, 'AVAILABLE'),
(9, 1, 'C-101', 2, 0, 'AVAILABLE'), (9, 1, 'C-102', 2, 0, 'AVAILABLE'), (9, 1, 'C-103', 2, 0, 'AVAILABLE'),
(9, 2, 'C-104', 4, 0, 'AVAILABLE'), (9, 2, 'C-105', 4, 0, 'AVAILABLE'), (9, 2, 'C-106', 4, 0, 'AVAILABLE'), (9, 2, 'C-107', 4, 0, 'AVAILABLE'),
(9, 3, 'C-108', 6, 0, 'AVAILABLE'), (9, 3, 'C-109', 6, 0, 'AVAILABLE'), (9, 3, 'C-110', 6, 0, 'AVAILABLE'),
(10, 1, 'C-201', 2, 0, 'AVAILABLE'), (10, 1, 'C-202', 2, 0, 'AVAILABLE'), (10, 1, 'C-203', 2, 0, 'AVAILABLE'),
(10, 2, 'C-204', 4, 0, 'AVAILABLE'), (10, 2, 'C-205', 4, 0, 'AVAILABLE'), (10, 2, 'C-206', 4, 0, 'AVAILABLE'), (10, 2, 'C-207', 4, 0, 'AVAILABLE'),
(10, 3, 'C-208', 6, 0, 'AVAILABLE'), (10, 3, 'C-209', 6, 0, 'AVAILABLE'), (10, 3, 'C-210', 6, 0, 'AVAILABLE'),
(11, 1, 'C-301', 2, 0, 'AVAILABLE'), (11, 1, 'C-302', 2, 0, 'AVAILABLE'), (11, 1, 'C-303', 2, 0, 'AVAILABLE'),
(11, 2, 'C-304', 4, 0, 'AVAILABLE'), (11, 2, 'C-305', 4, 0, 'AVAILABLE'), (11, 2, 'C-306', 4, 0, 'AVAILABLE'), (11, 2, 'C-307', 4, 0, 'AVAILABLE'),
(11, 3, 'C-308', 6, 0, 'AVAILABLE'), (11, 3, 'C-309', 6, 0, 'AVAILABLE'), (11, 3, 'C-310', 6, 0, 'AVAILABLE'),
(12, 1, 'C-401', 2, 0, 'AVAILABLE'), (12, 1, 'C-402', 2, 0, 'AVAILABLE'), (12, 1, 'C-403', 2, 0, 'AVAILABLE'),
(12, 2, 'C-404', 4, 0, 'AVAILABLE'), (12, 2, 'C-405', 4, 0, 'AVAILABLE'), (12, 2, 'C-406', 4, 0, 'AVAILABLE'), (12, 2, 'C-407', 4, 0, 'AVAILABLE'),
(12, 3, 'C-408', 6, 0, 'AVAILABLE'), (12, 3, 'C-409', 6, 0, 'AVAILABLE'), (12, 3, 'C-410', 6, 0, 'AVAILABLE');

-- 16. beds (Tự động sinh 480 giường)
INSERT INTO beds (room_id, bed_number, status)
SELECT r.id, b.bed_num, 'AVAILABLE' FROM rooms r
JOIN (
    SELECT 1 AS bed_num UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL 
    SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
) b ON b.bed_num <= r.max_beds;


-- =========================================================================
-- PHẦN 4: VẬN HÀNH (Phân công, Hợp đồng, Hóa đơn, Sự cố, Yêu cầu)
-- =========================================================================

-- 21. staff_floor_assignments
INSERT INTO staff_floor_assignments (staff_id, floor_id, assigned_date, status) VALUES 
(5, 1, '2026-07-01', 'ACTIVE'), (6, 1, '2026-07-01', 'ACTIVE'),   
(7, 2, '2026-07-01', 'ACTIVE'), (8, 2, '2026-07-01', 'ACTIVE'),   
(9, 3, '2026-07-01', 'ACTIVE'), (10, 3, '2026-07-01', 'ACTIVE'),  
(11, 4, '2026-07-01', 'ACTIVE'), (12, 4, '2026-07-01', 'ACTIVE'), 
(13, 5, '2026-07-01', 'ACTIVE'), (14, 5, '2026-07-01', 'ACTIVE'), 
(15, 6, '2026-07-01', 'ACTIVE'), (16, 6, '2026-07-01', 'ACTIVE'), 
(17, 7, '2026-07-01', 'ACTIVE'), (18, 7, '2026-07-01', 'ACTIVE'), 
(19, 8, '2026-07-01', 'ACTIVE'), (20, 8, '2026-07-01', 'ACTIVE'), 
(21, 9, '2026-07-01', 'ACTIVE'), (22, 9, '2026-07-01', 'ACTIVE'), 
(23, 10, '2026-07-01', 'ACTIVE'), (24, 10, '2026-07-01', 'ACTIVE'),
(25, 11, '2026-07-01', 'ACTIVE'), (26, 11, '2026-07-01', 'ACTIVE'),
(27, 12, '2026-07-01', 'ACTIVE'), (28, 12, '2026-07-01', 'ACTIVE');

-- 17. contracts
INSERT INTO contracts (contract_code, student_id, bed_id, semester_id, price, status) VALUES 
('HD-001', 29, 1, 1, 3000000, 'ACTIVE'), 
('HD-002', 30, 2, 1, 3000000, 'ACTIVE'), 
('HD-003', 31, 3, 1, 3000000, 'ACTIVE'), 
('HD-004', 32, 4, 1, 3000000, 'ACTIVE'), 
('HD-005', 33, 5, 1, 3000000, 'ACTIVE'), 
('HD-006', 34, 6, 1, 3000000, 'ACTIVE'), 
('HD-007', 35, 7, 1, 2000000, 'ACTIVE'), 
('HD-008', 36, 8, 1, 2000000, 'ACTIVE'), 
('HD-009', 37, 9, 1, 2000000, 'ACTIVE'), 
('HD-010', 38, 10, 1, 2000000, 'ACTIVE');

-- Cập nhật trạng thái phòng/giường cho khớp dữ liệu Hợp đồng
UPDATE beds SET status = 'OCCUPIED' WHERE id BETWEEN 1 AND 10;
UPDATE rooms SET current_occupancy = 2 WHERE id IN (1, 2, 3);
UPDATE rooms SET current_occupancy = 4 WHERE id = 4;

-- 18. bills
INSERT INTO bills (bill_code, student_id, semester_id, bill_type, amount, status, issue_date, payment_deadline, description) VALUES 
('BILL-001', 29, 1, 'ROOM_FEE', 3000000, 'PAID', '2026-08-01', '2026-08-15', N'Tiền phòng kỳ 1'),
('BILL-002', 30, 1, 'ROOM_FEE', 3000000, 'PAID', '2026-08-01', '2026-08-15', N'Tiền phòng kỳ 1'),
('BILL-003', 31, 1, 'ROOM_FEE', 3000000, 'PAID', '2026-08-01', '2026-08-15', N'Tiền phòng kỳ 1'),
('BILL-004', 32, 1, 'ROOM_FEE', 3000000, 'UNPAID', '2026-08-01', '2026-08-15', N'Tiền phòng kỳ 1'),
('BILL-005', 33, 1, 'ROOM_FEE', 3000000, 'UNPAID', '2026-08-01', '2026-08-15', N'Tiền phòng kỳ 1'),
('BILL-006', 34, 1, 'ROOM_FEE', 3000000, 'PAID', '2026-08-01', '2026-08-15', N'Tiền phòng kỳ 1'),
('BILL-007', 35, 1, 'ROOM_FEE', 2000000, 'UNPAID', '2026-08-01', '2026-08-15', N'Tiền phòng kỳ 1'),
('BILL-008', 36, 1, 'ROOM_FEE', 2000000, 'PAID', '2026-08-01', '2026-08-15', N'Tiền phòng kỳ 1'),
('BILL-009', 37, 1, 'ROOM_FEE', 2000000, 'UNPAID', '2026-08-01', '2026-08-15', N'Tiền phòng kỳ 1'),
('BILL-010', 38, 1, 'ROOM_FEE', 2000000, 'UNPAID', '2026-08-01', '2026-08-15', N'Tiền phòng kỳ 1');

-- 19. payment_transactions 
INSERT INTO payment_transactions (bill_id, payment_method, txn_ref, amount, status, payment_date) VALUES 
(1, 'MOMO', 'TXN-MOMO-001', 3000000, 'SUCCESS', '2026-08-05 10:00:00'),
(2, 'VNPAY', 'TXN-VNPAY-002', 3000000, 'SUCCESS', '2026-08-06 14:30:00'),
(3, 'BANK_TRANSFER', 'TXN-BANK-003', 3000000, 'SUCCESS', '2026-08-07 09:15:00'),
(6, 'BANK_TRANSFER', 'TXN-BANK-004', 3000000, 'SUCCESS', '2026-08-08 16:45:00'),
(8, 'CASH', 'TXN-CASH-005', 2000000, 'SUCCESS', '2026-08-10 08:30:00');

-- 20. utility_usages 
INSERT INTO utility_usages (room_id, semester_id, recorded_month, recorded_year, start_electricity, end_electricity, start_water, end_water, recorded_by) VALUES 
(1, 1, 8, 2026, 1200, 1350, 450, 470, 5),
(2, 1, 8, 2026, 800, 910, 300, 315, 5),
(3, 1, 8, 2026, 2100, 2280, 500, 530, 5),
(4, 1, 8, 2026, 500, 750, 200, 240, 5);

-- 22. issue_reports 
INSERT INTO issue_reports (title, description, category, status, student_id, room_id, staff_note) VALUES 
(N'Hỏng quạt trần', N'Quạt kêu to và không mát', 'ELECTRICAL', 'PENDING', 29, 1, NULL),
(N'Rỉ nước nhà tắm', N'Vòi hoa sen bị rỉ nước liên tục', 'PLUMBING', 'PROCESSING', 31, 3, N'Đã đặt mua vòi mới, chiều thay'),
(N'Kẹt cửa sổ', N'Cửa sổ giường số 2 không đóng được', 'FURNITURE', 'RESOLVED', 30, 2, N'Đã tra dầu và sửa bản lề');

-- 23. student_requests 
INSERT INTO student_requests (title, description, type, status, student_id, assigned_staff_id, room_id) VALUES 
(N'Xin chuyển phòng', N'Em muốn đổi sang phòng 4 người', 'ROOM_CHANGE', 'PENDING', 29, 5, 1),
(N'Xác nhận tạm trú', N'Xin giấy xác nhận để làm thẻ thư viện', 'DOCUMENT', 'APPROVED', 35, 6, 4),
(N'Đăng ký thẻ xe', N'Em mới mua xe máy, xin đăng ký vé tháng', 'PARKING', 'PROCESSING', 38, 5, 4);