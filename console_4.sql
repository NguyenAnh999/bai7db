Create Database QuanLyDiemSV CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci;
use QuanLyDiemSV;
/*=============DANH MUC KHOA==============*/
Create table DMKhoa
(
    MaKhoa  char(2) primary key,
    TenKhoa nvarchar(30) not null
);
/*==============DANH MUC SINH VIEN============*/
Create table DMSV
(
    MaSV     char(3)      not null primary key,
    HoSV     nvarchar(15) not null,
    TenSV    nvarchar(7)  not null,
    Phai     nchar(7),
    NgaySinh datetime     not null,
    NoiSinh  nvarchar(20),
    MaKhoa   char(2),
    HocBong  float
);
/*===================MON HOC========================*/
create table DMMH
(
    MaMH   char(2)      not null,
    TenMH  nvarchar(25) not null,
    SoTiet tinyint,
    Constraint DMMH_MaMH_pk primary key (MaMH)
);
/*=====================KET QUA===================*/
Create table KetQua
(
    MaSV   char(3) not null,
    MaMH   char(2) not null,
    LanThi tinyint,
    Diem   decimal(4, 2),
    Constraint KetQua_MaSV_MaMH_LanThi_pk primary key (MaSV, MaMH, LanThi)
);
/*==========================TAO KHOA NGOAI==============================*/
Alter table dmsv
    add Constraint DMKhoa_MaKhoa_fk foreign key (MaKhoa)
        References DMKhoa (MaKhoa);
Alter table KetQua
    add constraint KetQua_MaSV_fk foreign key (MaSV) references DMSV (MaSV);
Alter table KetQua
    add constraint DMMH_MaMH_fk foreign key (MaMH) references DMMH (MaMH);
/*==================NHAP DU LIEU====================*/
/*==============NHAP DU LIEU DMMH=============*/
Insert into DMMH(MaMH, TenMH, SoTiet)
values ('01', 'Cơ Sở Dữ Liệu', 45);
Insert into DMMH(MaMH, TenMH, SoTiet)
values ('02', 'Trí Tuệ Nhân Tạo', 45);
Insert into DMMH(MaMH, TenMH, SoTiet)
values ('03', 'Truyền Tin', 45);
Insert into DMMH(MaMH, TenMH, SoTiet)
values ('04', 'Đồ Họa', 60);
Insert into DMMH(MaMH, TenMH, SoTiet)
values ('05', 'Văn Phạm', 60);
/*==============NHAP DU LIEU DMKHOA=============*/
Insert into DMKhoa(MaKhoa, TenKhoa)
values ('AV', 'Anh Văn');
Insert into DMKhoa(MaKhoa, TenKhoa)
values ('TH', 'Tin Học');
Insert into DMKhoa(MaKhoa, TenKhoa)
values ('TR', 'Triết');
Insert into DMKhoa(MaKhoa, TenKhoa)
values ('VL', 'Vật Lý');
/*==============NHAP DU LIEU DMSV=============*/
Insert into DMSV
values ('A01', 'Nguyễn Thị', 'Hải', 'Nữ', '1990-03-20', 'Hà Nội', 'TH', 130000);
Insert into DMSV(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('A02', 'Trần Văn', 'Chính', 'Nam', '1992-12-24', 'Bình Định', 'VL', 150000);
Insert into DMSV(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('A03', 'Lê Thu Bạch', 'Yến', 'Nữ', '1990-02-21', 'TP Hồ Chí Minh', 'TH', 170000);
Insert into DMSV(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('A04', 'Trần Anh', 'Tuấn', 'Nam', '1990-12-20', 'Hà Nội', 'AV', 80000);
Insert into DMSV(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('B01', 'Trần Thanh', 'Mai', 'Nữ', '1991-08-12', 'Hải Phòng', 'TR', 0);
Insert into DMSV(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKhoa, HocBong)
values ('B02', 'Trần Thị Thu', 'Thủy', 'Nữ', '1991-01-02', 'TP Hồ Chí Minh', 'AV', 0);
/*==============NHAP DU LIEU BANG KET QUA=============*/
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A01', '01', 1, 3);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A01', '01', 2, 6);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A01', '02', 2, 6);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A01', '03', 1, 5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A02', '01', 1, 4.5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A02', '01', 2, 7);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A02', '03', 1, 10);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A02', '05', 1, 9);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A03', '01', 1, 2);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A03', '01', 2, 5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A03', '03', 1, 2.5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A03', '03', 2, 4);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('A04', '05', 2, 10);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B01', '01', 1, 7);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B01', '03', 1, 2.5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B01', '03', 2, 5);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B02', '02', 1, 6);
Insert into KetQua(MaSV, MaMH, LanThi, Diem)
values ('B02', '04', 1, 10);

# 1. Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh
# viên, Tên sinh viên, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã
# sinh viên tăng dần
select s.MaSV, s.HoSV, s.TenSV, s.HocBong
from DMSV s
order by s.MaSV;
# 2. Danh sách các sinh viên gồm thông tin sau: Mã sinh viên, họ tên sinh viên,
# Phái, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ.
select s.MaSV, s.HoSV, s.TenSV, s.Phai, s.NgaySinh
from DMSV s
order by s.Phai;
# 3. Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. Thông
# tin sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.
select s.MaSV, s.HoSV, s.TenSV, s.HocBong, s.NgaySinh
from DMSV s
order by s.NgaySinh, s.HocBong desc;
# 4. Danh sách các môn học có tên bắt đầu bằng chữ T, gồm các thông tin: Mã
# môn, Tên môn, Số tiết.
select m.MaMH, m.TenMH, m.SoTiet
from DMMH m
where m.TenMH like 'T%';
# 5. Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm
# các thông tin: Họ tên sinh viên, Ngày sinh, Phái.
select concat(s.HoSV, ' ', s.TenSV), s.NgaySinh, s.Phai
from dmsv s
where s.TenSV like '%I';
# 6. Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm
# các thông tin: Mã khoa, Tên khoa.
select k.MaKhoa, k.TenKhoa
from DMKhoa k
where k.TenKhoa like '_n%';
# 7. Liệt kê những sinh viên mà họ có chứa chữ Thị.
select *
from dmsv
where dmsv.HoSV like '%thi%';
# 8. Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000, gồm các
# thông tin: Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ
# được sắp xếp theo thứ tự Mã khoa giảm dần
select s.MaSV, s.HoSV, s.TenSV, s.HocBong
from dmsv s
where s.HocBong > 100000
order by s.MaKhoa desc;
# 9. Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm
# các thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.

select s.MaSV,  s.HoSV , s.TenSV, s.HocBong, s.MaKhoa, s.NoiSinh
from dmsv s
where s.HocBong >= 100000
  and s.NoiSinh = 'Hà Nội';
# 10. Danh sách các sinh viên của khoa Anh văn và khoa Vật lý, gồm các thông
# tin: Mã sinh viên, Mã khoa, Phái.
select DMSV.MaSV, DMSV.MaKhoa, DMSV.Phai
from dmsv
         join DMKhoa DK on dmsv.MaKhoa = DK.MaKhoa
where dk.TenKhoa = 'Anh văn'
   or dk.TenKhoa = 'Vật lý';
# 11. Cho biết những sinh viên có ngày sinh từ ngày 01/01/1991 đến ngày
# 05/06/1992 gồm các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học
# bổng.
select s.MaSV, s.NgaySinh, s.NoiSinh, s.HocBong
from dmsv s
where s.NgaySinh between '1991/01/01' and '1992/06/05';
# 12. Danh sách những sinh viên có học bổng từ 80.000 đến 150.000, gồm các
# thông tin: Mã sinh viên, Ngày sinh, Phái, Mã khoa.

select s.MaSV, s.HocBong, s.Phai, s.MaKhoa
from dmsv s
where s.HocBong between 80000 and 1500000;

# 13. Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45, gồm các thông
# tin: Mã môn học, Tên môn học, Số tiết.
select *
from DMMH
where DMMH.SoTiet between 30 and 45;
# 14. Liệt kê những sinh viên nam của khoa Anh văn và khoa tin học, gồm các
# thông tin: Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.

select DMSV.MaSV, DMSV.MaKhoa, DMSV.Phai
from dmsv
         join DMKhoa DK on dmsv.MaKhoa = DK.MaKhoa
where dk.TenKhoa = 'Anh văn'
   or dk.TenKhoa = 'tin học';
# 15. Liệt kê những sinh viên nữ, tên có chứa chữ N
select *
from DMSV s
where s.TenSV like '%n%'
  and s.Phai = 'nữ ';
# 16. Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 12, gồm các
# thông tin: Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.
select s.TenSV, s.NoiSinh, s.NgaySinh
from DMSV s
where NoiSinh = 'hà nội'
  and month(s.NgaySinh) = 12;
# 17. Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh
# viên, Tuổi,Học bổng.

select s.TenSV, s.NoiSinh, year(curdate()) - year(s.NgaySinh) age
from DMSV s
where year(curdate()) - year(s.NgaySinh) > 20;

# 18. Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh
# viên, Tuổi, Tên khoa.

select s.TenSV, s.NoiSinh, year(curdate()) - year(s.NgaySinh) age, dk.TenKhoa
from DMSV s
         join DMKhoa DK on s.MaKhoa = DK.MaKhoa
where year(curdate()) - year(s.NgaySinh) between 20 and 25;



# 19. Danh sách sinh viên sinh vào mùa xuân năm 1990, gồm các thông tin: Họ
# tên sinh viên,Phái, Ngày sinh.

select s.HoSV, s.TenSV, s.Phai, s.NgaySinh
from DMSV s
where NgaySinh between '1990/01/01' and '1990/04/01';

# 20. Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên,
# Phái, Mã khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học
# bổng cao” nếu giá trị của field học bổng lớn hơn 500,000 và ngược lại hiển
# thị là “Mức trung bình
select s.MaSV,
       s.Phai,
       s.MaKhoa,
       s.HocBong,
       if(s.HocBong > 500000, 'học bong lon', 'học bong trung binh') 'mức học bổng'
from DMSV s;

# 21. Cho biết tổng số sinh viên của toàn trường
select count(s.MaSV) as 'tổng số sv toàn trường'
from DMSV s;
# 22. Cho biết tổng sinh viên và tổng sinh viên nữ.
select (select count(phai)
        from DMSV
        where phai = 'nữ'
        group by Phai) as 'số hs nữ'
     , (select count(MaSV)
        from DMSV)     as 'tổng số hs';
# 23. Cho biết tổng số sinh viên của từng khoa.
select dk.TenKhoa, count(s.MaSV) 'số sv'
from DMSV s
         join DMKhoa DK on s.MaKhoa = DK.MaKhoa
group by dk.MaKhoa;
# 24. Cho biết số lượng sinh viên học từng môn.
select m.TenMH, count(kq.MaMH)
from DMMH m
         join KetQua KQ on m.MaMH = KQ.MaMH
group by m.MaMH;
# 25. Cho biết số lượng môn học mà sinh viên đã học(tức tổng số môn học có
# trong bảng kq)
select count(distinct k.MaMH)
from KetQua k;
# 26. Cho biết tổng số học bổng của mỗi khoa.
select dk.TenKhoa, count(s.MaSV) 'số sv'
from DMSV s
         join DMKhoa DK on s.MaKhoa = DK.MaKhoa
where s.HocBong > 0
group by dk.MaKhoa;
# 27. Cho biết học bổng cao nhất của mỗi khoa.
select k.*, max(d.HocBong)
from DMKhoa k
         join DMSV D on k.MaKhoa = D.MaKhoa
group by k.MaKhoa;
# 28. Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa.
select k.*, concat(count(d.MaSV), d.Phai) phái
from DMKhoa k
         join DMSV D on k.MaKhoa = D.MaKhoa
group by d.MaKhoa, d.Phai;
# 29. Cho biết số lượng sinh viên theo từng độ tuổi.
select year(curdate()) - year(s.NgaySinh) age, count(s.MaSV) quantyti
from DMSV s
group by age;
# 30. Cho biết những năm sinh nào có 2 sinh viên đang theo học tại trường.
select year(s.NgaySinh) year, count(s.MaSV) quantyti
from DMSV s
group by year
having quantyti =2;
# 31. Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường.
select s.NoiSinh queQuan, count(s.MaSV) quantyti
from DMSV s
group by queQuan
having quantyti =2;
# 32. Cho biết những môn nào có trên 3 sinh viên dự thi.

# 33. Cho biết những sinh viên thi lại trên 2 lần.

# 34. Cho biết những sinh viên nam có điểm trung bình lần 1 trên 7.0

# 35. Cho biết danh sách các sinh viên rớt trên 2 môn ở lần thi 1.

# 36. Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nam

# 37. Cho biết những khoa có 2 sinh đạt học bổng từ 200.000 đến 300.000.

# 38. Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn
# trong lần thi 1.

# 39. Cho biết sinh viên nào có học bổng cao nhất.

# 40. Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất.

# 41. Cho biết sinh viên khoa anh văn có tuổi lớn nhất.

# 42. Cho biết khoa nào có đông sinh viên nhất.

# 43. Cho biết khoa nào có đông nữ nhất.

# 44. Cho biết môn nào có nhiều sinh viên rớt lần 1 nhiều nhất.

# 45. Cho biết sinh viên không học khoa anh văn có điểm thi môn phạm lớn hơn

# điểm thi văncủa sinh viên học khoa anh văn.

# 46. Cho biết sinh viên có nơi sinh cùng với Hải.

# 47. Cho biết những sinh viên nào có học bổng lớn hơn tất cả học bổng của

# sinh viên thuộc khoa anh văn

# 48. Cho biết những sinh viên có học bổng lớn hơn bất kỳ học bổng của sinh viên

# học khóa anh văn

# 49. ho biết sinh viên nào có điểm thi môn cơ sở dữ liệu lần 2 lớn hơn tất cả điểm

# thi lần 1 môn cơ sở dữ liệu của những sinh viên khác.

# 50. Cho biết những sinh viên đạt điểm cao nhất trong từng môn.

# 51. Cho biết những khoa không có sinh viên học.

# 52. Cho biết sinh viên chưa thi môn cơ sở dữ liệu.

# 53. Cho biết sinh viên nào không thi lần 1 mà có dự thi lần 2.

# 54. Cho biết môn nào không có sinh viên khoa anh văn học.

# 55. Cho biết những sinh viên khoa anh văn chưa học môn văn phạm.

# 56. Cho biết những sinh viên không rớt môn nào.

# 57. Cho biết những sinh viên học khoa anh văn có học bổng và những sinh viên

# chưa bao giờ rớt.

# 58. Cho biết khoa nào có đông sinh viên nhận học bổng nhất và khoa nào khoa

# nào có ít sinh viên nhận học bổng nhất.

# 59. Cho biết 3 sinh viên có học nhiều môn nhất.

# 60. Cho biết những môn được tất cả các sinh viên theo học.

# 61. Cho biết những sinh viên học những môn giống sinh viên có mã số A02 học.

# 62. Cho biết những sinh viên học những môn bằng đúng những môn mà sinh

# viên A02 học.
