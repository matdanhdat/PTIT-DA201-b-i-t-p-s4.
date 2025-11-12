CREATE DATABASE IF NOT EXISTS QuanLyNhanSu;
USE QuanLyNhanSu;
CREATE TABLE IF NOT EXISTS PhongBan (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ten_phong_ban VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS NhanVien (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ho_ten VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    ngay_vao_lam DATE,
    phong_ban_id INT
);
ALTER TABLE NhanVien 
ADD CONSTRAINT fk_nhanvien_phongban 
FOREIGN KEY (phong_ban_id) 
REFERENCES PhongBan(id);
INSERT INTO PhongBan (ten_phong_ban) VALUES 
('Nhân sự'),
('Kế toán'),
('IT');
INSERT INTO NhanVien (ho_ten, email, ngay_vao_lam, phong_ban_id) VALUES 
('Nguyễn Văn A', 'a.nguyen@email.com', '2023-01-15', 1),
('Phạm Thị B', 'b.pham@email.com', '2023-02-20', 2);
SELECT nv.* 
FROM NhanVien nv
JOIN PhongBan pb ON nv.phong_ban_id = pb.id
WHERE pb.ten_phong_ban = 'IT';
UPDATE NhanVien 
SET phong_ban_id = (
    SELECT id FROM PhongBan WHERE ten_phong_ban = 'Nhân sự'
) 
WHERE ho_ten = 'Trần Văn An';
DELETE FROM NhanVien 
WHERE ho_ten = 'Lê Thị Bích';
SELECT '=== DANH SÁCH PHÒNG BAN ===' as '';
SELECT * FROM PhongBan;
SELECT '=== DANH SÁCH NHÂN VIÊN ===' as '';
SELECT nv.*, pb.ten_phong_ban 
FROM NhanVien nv 
LEFT JOIN PhongBan pb ON nv.phong_ban_id = pb.id;