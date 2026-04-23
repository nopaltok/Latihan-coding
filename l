DELIMITER //
CREATE TRIGGER t_insert_[nim]
AFTER INSERT ON siswa
FOR EACH ROW
BEGIN
    INSERT INTO log_siswa (kegiatan, waktu)
    VALUES ('Add Data', NOW());
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER t_update_[nim]
AFTER UPDATE ON siswa
FOR EACH ROW
BEGIN
    INSERT INTO log_siswa (kegiatan, waktu)
    VALUES ('Update Data', NOW());
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER t_delete_[nim]
AFTER DELETE ON siswa
FOR EACH ROW
BEGIN
    INSERT INTO log_siswa (kegiatan, waktu)
    VALUES ('Delete Data', NOW());
END//
DELIMITER ;

INSERT INTO siswa (NoSiswa, nama) VALUES ('11', 'Joni');
INSERT INTO siswa (NoSiswa, nama) VALUES ('22', 'Smith');

-- Cek hasilnya
SELECT * FROM siswa;
SELECT * FROM log_siswa;

UPDATE siswa SET nama = 'Joni Updated' WHERE NoSiswa = '11';

-- Cek hasilnya
SELECT * FROM log_siswa;
DELETE FROM siswa WHERE NoSiswa = '22';

-- Cek hasilnya
SELECT * FROM log_siswa;
