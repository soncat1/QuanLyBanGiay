DROP database QLG
create database QLG
use QLG

create table NHANVIEN
(
	IDNV			varchar(10) not null,
	TenNV			nvarchar(50) not null,
	ngaysinh date,
	cmt				varchar(12) NOT NULL,
	diachi			varchar(50) not null,
	dienthoai		varchar(11) not null,
	bophan			varchar(20) not null,
	gioitinh		bit NOT NULL,
	taikhoan		varchar(20) not null,
	--IDCV			nvarchar(50) not null,
	constraint pk_NHANVIEN_IDNV primary key (IDNV)
	)
create table KHACHHANG
(
	IDKH			varchar(10) not null,
	tenkhachang		nvarchar(50) NOT NULL,
	gioitinh		bit NOT NULL,
	diachi			nvarchar(50) not null,
	sodienthoai		varchar(11) not null,
	email			varchar(50) not null,
	constraint pk_KHACHHANG_makhachhang primary key (IDKH)	
)
create table NCC
(
IDNCC varchar(10) not null,
TenNCC nvarchar(50) not null,
diachi nvarchar(50) not null,
dienthoai varchar(11) not null,
constraint pk_NCC_IDNCC primary key (IDNCC)
)
--create table CHUCVU
--(
	--IDCV			nvarchar(50) not null,
	--chucvu			varchar(20) not null,
	--luong           int not null,
	--constraint pk_CHUCVU_chucvu primary key (IDCV)
--)
--create table GIABAN
--(
 --MaGB nvarchar(20) not null primary key, 
-- MucGB int not null,
-- NgayAD datetime not null,
-- IDGIAY nvarchar(50) not null
--)
create table GIAY
(
  IDGIAY nvarchar(50) not null primary key,
  Tengiay varchar(20) not null,
  Loaigiay varchar (10) not null,
  Soluong int,
  Size varchar(10) not null,
  Mausac varchar(10) not null,
  IDNCC varchar(10) not null,
  DongiaN int,
  DongiaB int,
  Anh varchar(50) not null,
)
create table CTHDN
(
IDN nvarchar(50) not null primary key,
MaHDN nvarchar(50) not null,
IDGIAY nvarchar(50) not null,
Donvi varchar(10) not null,
DongiaN int,
Soluong int,
Thanhtien int
)
create table CTHDB
(
IDB nvarchar(50) not null primary key,
MaHDB nvarchar(50) not null,
IDGIAY nvarchar(50) not null,
Donvi varchar(10) not null,
DongiaB int,
Soluong int,
Thanhtien int
)
create table HDB
(
MaHDB nvarchar(50) not null primary key,
Ngaylap datetime not null,
MaThe nvarchar(50) not null,
IDNV	varchar(10) not null,
Chietkhau int,
Thanhtien int
)
create table HDN
(
MaHDN nvarchar(50) not null primary key,
Ngaylap datetime not null,
IDNV	varchar(10) not null,
IDNCC varchar(10) not null,
Thanhtien int
)
create table THEKH
(
MaThe nvarchar(50) not null primary key,
IDKH varchar(10) not null,
MaLoai nvarchar(50) not null,
Ngaycap datetime
)
create table LOAITHE
(
MaLoai nvarchar(50) not null primary key,
Tenloai nvarchar(50) not null,
DT nvarchar(50) not null
)
create table DONHANG
(
MaDDH varchar(10) not null primary key,
IDKH	varchar(10) not null,
IDGIAY nvarchar(50) not null,
IDNV	varchar(10) not null,
Soluong int,
NgayDat datetime,
NgayGH datetime
)
create table DOITRA
(
MaDTra varchar(10) not null primary key,
IDKH	varchar(10) not null,
IDGIAY nvarchar(50) not null,
MaHDB nvarchar(50) not null,
Soluong int,
NgayDoitra datetime,
Xuly nvarchar(10) not null,
)
alter table HDN
ADD constraint fk_HDN_IDNCC foreign key(IDNCC) references NCC(IDNCC)
on delete cascade
on update cascade
alter table HDN
ADD constraint fk_HDN_IDNV foreign key(IDNV) references NHANVIEN(IDNV)
on delete cascade
on update cascade
alter table CTHDN
 ADD constraint fk_CTHDN_IDGIAY foreign key(IDGIAY) references GIAY(IDGIAY)
on delete cascade
on update cascade
alter table CTHDN
 ADD constraint fk_CTHDN_MaHDN foreign key(MaHDN) references HDN(MaHDN)
 on delete cascade
 on update cascade
 alter table CTHDB
 ADD constraint fk_CTHDB_MaHDB foreign key(MaHDB) references HDB(MaHDB)
 on delete cascade
 on update cascade
alter table CTHDB
 ADD constraint fk_CTHDB_IDGIAY foreign key(IDGIAY) references GIAY(IDGIAY)
 on delete cascade
 on update cascade
 alter table HDB
 ADD constraint fk_HDB_IDNV foreign key(IDNV) references NHANVIEN(IDNV )
 on delete cascade
 on update cascade
 alter table HDB
 ADD constraint fk_HDB_Mathe foreign key(Mathe) references THEKH(Mathe)
 on delete cascade
 on update cascade
alter table DOITRA
ADD constraint fk_DOITRA_IDGIAY foreign key(IDGIAY) references GIAY(IDGIAY)
 on delete cascade
 on update cascade
 alter table DOITRA
ADD constraint fk_DOITRA_IDKH foreign key(IDKH) references KHACHHANG(IDKH)
 on delete cascade
 on update cascade
 alter table DOITRA
 ADD constraint fk_DOITRA_MaHDB foreign key(MaHDB) references HDB(MaHDB)
 on delete cascade
 on update cascade
 alter table DONHANG
ADD constraint fk_DONHANG_IDGIAY foreign key(IDGIAY) references GIAY(IDGIAY)
 on delete cascade
 on update cascade
 alter table DONHANG
 ADD constraint fk_DONHANG_IDKH foreign key(IDKH) references KHACHHANG(IDKH)
 on delete cascade
 on update cascade
 alter table DONHANG
 ADD constraint fk_DONHANG_IDNV foreign key(IDNV) references NHANVIEN(IDNV)
 on delete cascade
 on update cascade
-- alter table NHANVIEN
 --ADD constraint fk_NHANVIEN_IDCV foreign key(IDCV) references CHUCVU(IDCV)
 --on delete cascade
 --on update cascade
 alter table THEKH
 ADD constraint fk_THEKH_IDKH foreign key(IDKH) references KHACHHANG(IDKH)
 alter table THEKH
 ADD constraint fk_THEKH_MaLoai foreign key(MaLoai) references LOAITHE(MaLoai)
 on delete cascade
 on update cascade
-- alter table GIABAN
 --ADD constraint fk_GIABAN_IDGIAY foreign key(IDGIAY) references GIAY(IDGIAY)
 --on delete cascade
 --on update cascade
 -----------------------------------
 insert into NHANVIEN values('NV001',	N'Trần Minh Hiếu' ,'12/01/1986','012345678',	N'Nguyên Hồng',	'0983165835',	N'Quản lí',1,	'hieutran001')
 insert into NHANVIEN values('NV002',	N'Phạm Thu Hương' ,'01/21/1990','104290124',	N'Nguyên Hồng',	'0969002774',	N'Nhân viên bán hàng',0,	'huongpham1')
 insert into NHANVIEN values('NV003',	N'Nguyễn Thu Hằng','10/10/1988','023840238',    N'Thanh Xuân' ,	'01663082674',	N'Nhân viên bán hàng',0,	'hang1201')
 insert into NHANVIEN values('NV004',	N'Đỗ Ngọc Mai'    ,'12/22/1987','923842739',    N'Từ Liêm'    ,	'01699805181',	N'Nhân viên bán hàng',0,	'maimit12')
 insert into NHANVIEN values('NV005',	N'Nguyễn Lê Huy'  ,'09/19/1993','230842384',	N'Mỹ Đình'   ,	'0979970168',	N'Nhân viên kho'     ,1,	'hieutran001')
 ------------------------------------
 insert into KHACHHANG values('KH001',	N'Trần Ngọc Hải'  ,	1	,N'Thụy Khuê',	'0912536783',	'haitran1082@gmail.com')
	 insert into KHACHHANG values('KH002',	N'Nguyễn Hòa Bình',	1	,N'Ô CHợ Dừa',	'0904507090',	'nhbsub@yahoo.com')
	 insert into KHACHHANG values('KH003',	N'Nguyễn Anh Tuấn',	1	,N'Cầu Diễn',	'01682234186',	'tuanchef1603@gmail.com')
	 insert into KHACHHANG values('KH004',	N'Phạm Minh Châu' ,	1	,N'Mỹ Đình',		'0979790580',	'chauphamminh68@gmail.com')
	 insert into KHACHHANG values('KH005',	N'Nguyễn Văn Công', 1	,N'Mỹ Đình',		'0969000555',	'congnguyenvan2710@yahoo.com')
	 insert into KHACHHANG values('KH006',	N'Đỗ Anh Quang'   , 1	,N'Hoàng Cầu',	'0969342342',	'anhquangpro090@yahoo.com')
	 insert into KHACHHANG values('KH007',	N'Dương Quốc Huy' , 1	,N'Trần Duy Hưng','0123992876',	'dqh02101986@yahoo.com')
	 insert into KHACHHANG values('KH008',	N'Lê Tú Dũng'     , 1	,N'Phố Huế',		'01669273295',	'tuledung129@yahoo.com')
	 insert into KHACHHANG values('KH009',	N'Nguyễn Huy Dũng', 1	,N'Yên Bái',		'0124918293',	'sszinzin960@yahoo.com')
	 insert into KHACHHANG values('KH010',	N'Ngô Đình Ngọc',   1	,N'Mỹ Đình',		'09048712835',	'DNgoc36630@yahoo.com')
	 insert into KHACHHANG values('KH011',	N'Phan Đình Tùng'  ,1	,N'Thụy Khuê',	'09125234443',	'afadcf@gmail.com')
	 insert into KHACHHANG values('KH012',	N'BM Junie'  ,	1	,    N'Sài Gòn',	'09125362383',	'Junie@gmail.com')
	 insert into KHACHHANG values('KH013',	N'Nguyễn QUốc Cường'  ,	1	,N'Đắc Lắc',	'09134236783','cuongse7en@gmail.com')
	 insert into KHACHHANG values('KH014',	N'Đỗ Trung Văn'  ,	1	,N'Đà Lạt',	'0912554783',	'Vanoccho@gmail.com')
	 insert into KHACHHANG values('KH015',	N'Nguyễn Quang Minh'  ,	1	,N'Tây Mỗ',	'0912534783',	'MinhCanvan@gmail.com')
	 insert into KHACHHANG values('KH016',	N'Lê Quang Đạo'  ,	1	,N'Sóc Sơn',	'0912536383',	'Daobeff@gmail.com')
	 insert into KHACHHANG values('KH017',	N'Nguyễn Công Phượng'  ,	1	,N'Gia Lai',	'0912556783',	'Phuongcong78@gmail.com')
	 insert into KHACHHANG values('KH018',	N'Phan Văn Tài Em'  ,	1	,N'Hải Phòng',	'0912536343',	'anhtai12@gmail.com')
	 insert into KHACHHANG values('K0019',	N'Trần Quý Kiên'  ,	1	,N'Ba Đình',	'0912536745',	'Kiencc@gmail.com')
	 insert into KHACHHANG values('KH020',	N'Nguyễn Vân Nga'  ,	1	,N'Thụy Khuê',	'0912535583',	'Nga1082@gmail.com')
	 insert into KHACHHANG values('KH021',	N'Nguyễn Trọng Long'  ,	1	,N'Mai Dịch',	'0912556783',	'LongMU@gmail.com')
	 insert into KHACHHANG values('KH022',	N'Nguyễn Hoàn Lực'  ,	1	,N'Bắc Từ Liêm',	'0912556783',	'152468523@gmail.com')
--------------------------------------------
insert into NCC values('NCC01',	N'Timberlen',	'Mỹ Đình',		'0437640716')
	 insert into NCC values('NCC02',	N'Thượng Đình',	'Thượng Đình',	'0466634630')
	 insert into NCC values('NCC03',	N'Nike',	'Hoàng Mai',		'0437649441')
	 insert into NCC values('NCC04',	N'Addidas',	'Trung Hòa',		'0437645441')
	 insert into NCC values('NCC05',	N'ECCO',	'Ứng Hòa',			'0437649812')
	 insert into NCC values('NCC06',	N'CAT',	'Phú Xuyên',			'0437640676')
---------------------------------------------------------------
insert into LOAITHE values('LT1',	N'Member1',	'1')
	 insert into LOAITHE values('LT2',	N'Silver',	'2')
	 insert into LOAITHE values('LT3',	N'Gold',	'3')
	 insert into LOAITHE values('LT4',	N'Member0',	'4')
---------------------------------------------------------------
insert into THEKH values('MT001',	N'KH001',	'LT4',			'2016-01-02 03:16:00.000')
	 insert into THEKH values('MT002',	N'KH002',	'LT4',			'2016-01-02 03:16:00.000')
	 insert into THEKH values('MT003',	N'KH003',	'LT1',			'2016-01-02 03:16:00.000')
	 insert into THEKH values('MT004',	N'KH004',	'LT1',			'2016-01-02 03:16:00.000')
	 insert into THEKH values('MT005',	N'KH005',	'LT1',			'2016-01-02 03:16:00.000')
	 insert into THEKH values('MT006',	N'KH006',	'LT1',			'2016-01-02 03:16:00.000')
	 insert into THEKH values('MT007',	N'KH007',	'LT1',			'2016-01-02 03:16:00.000')
	 insert into THEKH values('MT008',	N'KH008',	'LT1',			'2016-01-02 03:16:00.000')
	 insert into THEKH values('MT009',	N'KH009',	'LT1',			'2016-01-02 03:16:00.000')
	 insert into THEKH values('MT010',	N'KH010',	'LT2',			'2016-01-02 03:16:00.000')
	 insert into THEKH values('MT011',	N'KH011',	'LT2',			'2016-01-02 03:16:00.000')
	 insert into THEKH values('MT012',	N'KH012',	'LT2',			'2016-01-02 03:16:00.000')
	 insert into THEKH values('MT013',	N'KH013',	'LT3',			'2016-01-02 03:16:00.000')
	 insert into THEKH values('MT014',	N'KH014',	'LT2',			'2016-01-02 03:16:00.000')
	 insert into THEKH values('MT015',	N'KH015',	'LT2',			'2016-01-02 03:16:00.000')
	 insert into THEKH values('MT016',	N'KH016',	'LT1',			'2016-01-02 03:16:00.000')
	 insert into THEKH values('MT017',	N'KH017',	'LT1',			'2016-01-02 03:16:00.000')
	 insert into THEKH values('MT018',	N'KH018',	'LT3',			'2016-01-02 03:16:00.000')
	 insert into THEKH values('MT020',	N'KH020',	'LT2',			'2016-01-02 03:16:00.000')
	 insert into THEKH values('MT021',	N'KH021',	'LT4',			'2016-01-02 03:16:00.000')
	 insert into THEKH values('MT022',	N'KH022',	'LT1',			'2016-01-02 03:16:00.000')
-----------------------------------------------------------------
 insert into GIAY values('G001',	N'Giày da','Nam',	'35','39-42',N'Nâu Vàng','NCC01','350000','450000','nam1.jpg')
	 insert into GIAY values('G002',	N'Giày da','Nam',	'20','39-42',N'Nâu Vàng','NCC02','250000','1000000','nam2.jpg')
	 insert into GIAY values('G003',	N'Giày da','Nam',	'18','39-42',N'Đen','NCC01','450000','850000','nam3.jpg')
	 insert into GIAY values('G004',	N'Giày da','Nam',	'5','39-42',N'Đen','NCC01','365000','1100000','nam4.jpg')
	 insert into GIAY values('G005',	N'Giày da','Nam',	'8','39-42',N'Nâu Đen','NCC01','450000','900000','nam5.jpg')
	 insert into GIAY values('G006',	N'Giày da','Nam',	'9','39-42',N'Trắng','NCC02','600000','1200000','nam6.jpg')
	 insert into GIAY values('G007',	N'Giày da','Nam',	'3','39-42',N'Vàng','NCC03','450000','1500000','nam7.jpg')
	 insert into GIAY values('G008',	N'Giày da','Nam',	'5','39-42',N'Xanh dương','NCC01','400000','450000','nam8.jpg')
	 insert into GIAY values('G009',	N'Giày da','Nam',	'7','39-42',N'Đen ','NCC02','400000','800000','nam9.jpg')
	 insert into GIAY values('G010',	N'Giày da','Nam',	'4','39-42',N'Đen','NCC02','400000','740000','nam10.jpg')
	 insert into GIAY values('G011',	N'Giày da','Nữ',	'6','39-42',N'Xanh dương','NCC03','450000','500000','nu1.jpg')
	 insert into GIAY values('G012',	N'Giày da','Nữ',	'2','39-42',N'Nâu','NCC02','300000','450000','nu1.jpg')
	 insert into GIAY values('G013',	N'Giày da','Nữ',	'5','39-42',N'Đen','NCC03','350000','450000','nu1.jpg')
	 insert into GIAY values('G014',	N'Giày da','Nữ',	'2','39-42',N'Đỏ','NCC03','600000','700000','nu1.jpg')
	 insert into GIAY values('G015',	N'Giày da','Nữ',	'7','39-42',N'Xanh dương','NCC04','350000','450000','nu1.jpg')
	 insert into GIAY values('G016',	N'Giày da','Nữ',	'8','39-42',N'Đen','NCC05','500000','700000','nu2.jpg')
	 insert into GIAY values('G017',	N'Giày da','Nữ',	'2','39-42',N'Vàng','NCC06','350000','450000','nu3.jpg')
	 insert into GIAY values('G018',	N'Giày da','Nữ',	'5','39-42',N'Vàng Tím','NCC06','450000','700000','nu4.jpg')
	 insert into GIAY values('G019',	N'Giày da','Khác',	'8','39-42',N'Xanh đen','NCC06','350000','450000','khac1.jpg')
	 insert into GIAY values('G020',	N'Giày da','Khác',	'7','39-42',N'Đen','NCC04','350000','450000','khac1.jpg')
	 insert into GIAY values('G021',	N'Giày da','Khác',	'4','39-42',N'Nâu','NCC04','350000','450000','khac2.jpg')
	 insert into GIAY values('G022',	N'Giày da','Khác',	'5','39-42',N'Đen','NCC016','350000','350000','khac3.jpg')
	 -----------------------------------------------------
	 insert into HDB values('HDB001',	'2016-07-01 00:00:00.000',	'MT001',			'NV002','0','450000')
	 insert into HDB values('HDB002',	'2016-07-01 00:00:00.000',	'MT002',			'NV002','0','350000')
	 insert into HDB values('HDB003',	'2016-07-01 00:00:00.000',	'MT003',			'NV002','80000','1900000')
	 insert into HDB values('HDB004',	'2016-07-01 00:00:00.000',	'MT004',			'NV002','37000','807500')
	 insert into HDB values('HDB005',	'2016-07-02 00:00:00.000',	'MT005',			'NV002','50000','990000')
	 insert into HDB values('HDB006',	'2016-07-02 00:00:00.000',	'MT006',			'NV003','20000','880000')
	 insert into HDB values('HDB007',	'2016-07-02 00:00:00.000',	'MT007',			'NV003','20000','1180000')
	 insert into HDB values('HDB008',	'2016-07-04 00:00:00.000',	'MT008',			'NV003','75000','1425000')
	 insert into HDB values('HDB009',	'2016-07-05 00:00:00.000',	'MT009',			'NV002','0','450000')
	 insert into HDB values('HDB010',	'2016-07-06 00:00:00.000',	'MT010',			'NV002','80000','720000')
	 insert into HDB values('HDB011',	'2016-07-06 00:00:00.000',	'MT011',			'NV004','20000','703000')
	 insert into HDB values('HDB012',	'2016-07-02 00:00:00.000',	'MT012',			'NV004','50000','950000')
	 insert into HDB values('HDB013',	'2016-07-07 00:00:00.000',	'MT013',			'NV004','0','450000')
	 insert into HDB values('HDB014',	'2016-07-07 00:00:00.000',	'MT014',			'NV001','20000','630000')
	 insert into HDB values('HDB015',	'2016-07-08 00:00:00.000',	'MT015',			'NV001','20000','730000')
	 insert into HDB values('HDB016',	'2016-07-09 00:00:00.000',	'MT016',			'NV001','20000','850000')
	 insert into HDB values('HDB017',	'2016-07-10 00:00:00.000',	'MT017',			'NV001','20000','900000')
	 insert into HDB values('HDB018',	'2016-07-11 00:00:00.000',	'MT018',			'NV002','20000','1380000')
	 insert into HDB values('HDB019',	'2016-07-12 00:00:00.000',	'MT022',			'NV003','20000','740000')
	 insert into HDB values('HDB020',	'2016-07-12 00:00:00.000',	'MT020',			'NV003','67000','1330000')
	 insert into HDB values('HDB021',	'2016-07-13 00:00:00.000',	'MT021',			'NV002','0','450000')
---------------------------------------------------------------------------------
insert into HDN values('HDN001',	'2016-05-02 00:00:00.000',	'NV001',			'NCC01','10500000')
	 insert into HDN values('HDN002',	'2016-05-02 00:00:00.000',	'NV001',			'NCC02','4000000')
	 insert into HDN values('HDN003',	'2016-05-02 00:00:00.000',	'NV001',			'NCC06','3600000')
	 insert into HDN values('HDN004',	'2016-05-02 00:00:00.000',	'NV001',			'NCC04','4200000')
	 insert into HDN values('HDN005',	'2016-06-02 00:00:00.000',	'NV001',			'NCC02','6000000')
	 insert into HDN values('HDN006',	'2016-06-02 00:00:00.000',	'NV001',			'NCC05','6000000')
	 insert into HDN values('HDN007',	'2016-06-02 00:00:00.000',	'NV001',			'NCC03','4500000')
	 insert into HDN values('HDN008',	'2016-06-02 00:00:00.000',	'NV001',			'NCC01','3600000')
	 insert into HDN values('HDN009',	'2016-07-02 00:00:00.000',	'NV001',			'NCC06','6000000')
	 insert into HDN values('HDN010',	'2016-07-02 00:00:00.000',	'NV001',			'NCC03','8000000')
	-------------------------------------------------------------------
	insert into DONHANG values('DH1',	'KH010',	'G007',			'NV001','5','2016-07-20 00:00:00.000','2016-07-25 00:00:00.000')
	 insert into DONHANG values('DH2',	'KH017',	'G001',			'NV001','10','2016-07-25 00:00:00.000','2016-08-03 00:00:00.000')
	 insert into DONHANG values('DH3',	'KH018',	'G020',			'NV001','6','2016-07-29 00:00:00.000','2016-08-05 00:00:00.000')
	 insert into DONHANG values('DH4',	'KH005',	'G022',			'NV001','9','2016-07-30 00:00:00.000','2016-08-04 00:00:00.000')

	 ----------------------------------------------------------------------------
	 insert into CTHDB values('ID021',	'HDB021',	'G008',			N'Đôi','450000','1','450000')
	 insert into CTHDB values('ID01',	'HDB001',	'G001',			N'Đôi','450000','1','450000')
	 insert into CTHDB values('ID010',	'HDB010',	'G011',			N'Đôi','800000','1','720000')
	 insert into CTHDB values('ID011',	'HDB011',	'G016',			N'Đôi','740000','1','703000')
	 insert into CTHDB values('ID012',	'HDB012',	'G017',			N'Đôi','500000','2','950000')
	 insert into CTHDB values('ID013',	'HDB013',	'G022',			N'Đôi','300000','1','450000')
	 insert into CTHDB values('ID014',	'HDB014',	'G021',			N'Đôi','650000','1','630000')
	 insert into CTHDB values('ID015',	'HDB015',	'G002',			N'Đôi','750000','1','730000')
	 insert into CTHDB values('ID016',	'HDB016',	'G004',			N'Đôi','870000','1','850000')
	 insert into CTHDB values('ID017',	'HDB017',	'G005',			N'Đôi','920000','1','900000')
	 insert into CTHDB values('ID018',	'HDB018',	'G007',			N'Đôi','700000','2','1380000')
	 insert into CTHDB values('ID019',	'HDB019',	'G018',			N'Đôi','760000','1','740000')
	 insert into CTHDB values('ID02',	'HDB002',	'G020',			N'Đôi','350000','1','350000')
	 insert into CTHDB values('ID020',	'HDB020',	'G009',			N'Đôi','700000','2','1330000')
	 insert into CTHDB values('ID03',	'HDB003',	'G007',			N'Đôi','1000000','2','1900000')
	 insert into CTHDB values('ID04',	'HDB004',	'G003',			N'Đôi','850000','1','807500')
	 insert into CTHDB values('ID05',	'HDB005',	'G005',			N'Đôi','1100000','1','990000')
	 insert into CTHDB values('ID06',	'HDB006',	'G012',			N'Đôi','900000','1','880000')
	 insert into CTHDB values('ID07',	'HDB007',	'G016',			N'Đôi','1200000','1','1180000')
	 insert into CTHDB values('ID08',	'HDB008',	'G017',			N'Đôi','1500000','1','1425000')
	 insert into CTHDB values('ID09',	'HDB009',	'G010',			N'Đôi','450000','1','450000')
	 ---------------------------------------------------------------------------
	  insert into CTHDN values('IP01',	'HDN001',	'G001',			N'Đôi','350000','30','10500000')
	 insert into CTHDN values('IP02',	'HDN002',	'G002',			N'Đôi','250000','10','2500000')
	 insert into CTHDN values('IP03',	'HDN003',	'G017',			N'Đôi','450000','8','3600000')
	 insert into CTHDN values('IP04',	'HDN004',	'G014',			N'Đôi','600000','7','4200000')
	 insert into CTHDN values('IP05',	'HDN005',	'G006',			N'Đôi','60000','10','6000000')
	 insert into CTHDN values('IP06',	'HDN006',	'G015',			N'Đôi','500000','12','6000000')
	 insert into CTHDN values('IP07',	'HDN007',	'G007',			N'Đôi','450000','10','4500000')
	 insert into CTHDN values('IP08',	'HDN008',	'G004',			N'Đôi','365000','10','3650000')
	 insert into CTHDN values('IP09',	'HDN009',	'G018',			N'Đôi','400000','15','6000000')
	 insert into CTHDN values('IP10',	'HDN010',	'G013',			N'Đôi','400000','20','8000000')
	-------------------------------------------------------------------------
	insert into DOITRA values('MDT01',	'KH001',	'G010',			N'HDB001','1','2016-07-02 00:00:00.000',N'Đã Duyệt')
	insert into DOITRA values('MDT02',	'KH016',	'G001',			N'HDB001','1','2016-07-02 00:00:00.000',N'Đã Duyệt')
	
	-------------------------TRUY VẤN-----------------------------
--1. thông tin quản lý
select *from NHANVIEN
where bophan like 'Qu?n lí'
--2.Tìm số điện thoại các nhà cung cấp
select TenNCC,dienthoai
from NCC
--3.Tính tuổi của nhân viên
select IDNV,TenNV,bophan,diachi,DATEDIFF(year,ngaysinh,GETDATE()) as 'Tuổi'
from NHANVIEN
--4.Thống kê khách có thẻ GOLDMEMBER
select KHACHHANG.IDKH,KHACHHANG.tenkhachang,KHACHHANG.diachi,KHACHHANG.sodienthoai,THEKH.MaLoai
from KHACHHANG,THEKH
where KHACHHANG.IDKH=THEKH.IDKH and THEKH.MaLoai like 'LT3'
--5.Tính tiền các đơn hàng
select KHACHHANG.IDKH,KHACHHANG.tenkhachang,KHACHHANG.diachi,KHACHHANG.sodienthoai,DONHANG.IDGIAY,DOnhang.Soluong,'Thành tiền' = iif(THEKH.MaLoai like 'LT4',DONHANG.Soluong * GIAY.DongiaB - 20000 ,IIF(THEKH.MaLoai like 'LT2',DONHANG.Soluong * GIAY.DongiaB * 95/100 ,IIF(THEKH.MaLoai like 'LT3',DONHANG.Soluong * GIAY.DongiaB *90/100 ,DONHANG.Soluong * GIAY.DongiaB)))
from KHACHHANG,DONHANG,GIAY,THEKH
where DONHANG.IDKH = KHACHHANG.IDKH and GIAY.IDGIAY = DONHANG.IDGIAY and THEKH.IDKH=KHACHHANG.IDKH
--6.Liệt kê số hàng bán đc trong ngày 1/7/2016
select CTHDB.IDGIAY,CTHDB.Soluong,HDB.Ngaylap,'Thành tiền' = iif(THEKH.MaLoai like 'LT4',CTHDB.Soluong * GIAY.DongiaB - 20000 ,IIF(THEKH.MaLoai like 'LT2',CTHDB.Soluong * GIAY.DongiaB * 95/100 ,IIF(THEKH.MaLoai like 'LT3',CTHDB.Soluong * GIAY.DongiaB *90/100 ,CTHDB.Soluong * GIAY.DongiaB)))
from CTHDB,HDB,GIAY,THEKH
where HDB.MaHDB = CTHDB.MaHDB and HDB.Ngaylap = '2016-07-01 00:00:00.000' and GIAY.IDGIAY = CTHDB.IDGIAY and HDB.MaThe = THEKH.MaThe
--7.Thượng Đình đã cung cấp những đôi giầy nào
select NCC.TenNCC,NCC.diachi,NCC.dienthoai,GIAY.IDNCC,GIAY.Tengiay
from NCC,GIAY
where NCC.IDNCC = GIAY.IDNCC and NCC.IDNCC = 'NCC02'
--8.Xem các đơn hàng đổi trả
select *from DOITRA
--9. Tính doanh thu ngày 1/7/2016
select sum(iif(THEKH.MaLoai like 'LT4',CTHDB.Soluong * GIAY.DongiaB - 20000 ,IIF(THEKH.MaLoai like 'LT2',CTHDB.Soluong * GIAY.DongiaB * 95/100 ,IIF(THEKH.MaLoai like 'LT3',CTHDB.Soluong * GIAY.DongiaB *90/100 ,CTHDB.Soluong * GIAY.DongiaB)))) as 'Doanh thu'
from CTHDB,HDB,GIAY,THEKH
where HDB.MaHDB = CTHDB.MaHDB and HDB.Ngaylap = '2016-07-01 00:00:00.000' and GIAY.IDGIAY = CTHDB.IDGIAY and HDB.MaThe = THEKH.MaThe
--10.Tổng doanh thu
select sum(iif(THEKH.MaLoai like 'LT4',CTHDB.Soluong * GIAY.DongiaB - 20000 ,IIF(THEKH.MaLoai like 'LT2',CTHDB.Soluong * GIAY.DongiaB * 95/100 ,IIF(THEKH.MaLoai like 'LT3',CTHDB.Soluong * GIAY.DongiaB *90/100 ,CTHDB.Soluong * GIAY.DongiaB)))) as 'Doanh thu'
from CTHDB,HDB,GIAY,THEKH
where HDB.MaHDB = CTHDB.MaHDB and GIAY.IDGIAY = CTHDB.IDGIAY and HDB.MaThe = THEKH.MaThe
--11. Xem đôi nào chưa từng được hỏi mua
select Giay.IDGIAY,GIAY.TenGiay
from GIAY
where NOT EXISTS(select IDGIAY from CTHDB where CTHDB.IDGIAY = GIAY.IDGIAY)
--12. cho biết mỗi khách đã thanh toán bao nhiêu 
select KHACHHANG.IDKH,KHACHHANG.tenkhachang,KHACHHANG.diachi,KHACHHANG.sodienthoai,CTHDB.IDGIAY,CTHDB.Soluong,'Thành tiền' = iif(THEKH.MaLoai like 'LT4',CTHDB.Soluong * GIAY.DongiaB - 20000 ,IIF(THEKH.MaLoai like 'LT2',CTHDB.Soluong * GIAY.DongiaB * 95/100 ,IIF(THEKH.MaLoai like 'LT3',CTHDB.Soluong * GIAY.DongiaB *90/100 ,CTHDB.Soluong * GIAY.DongiaB)))
from KHACHHANG,CTHDB,GIAY,THEKH,HDB
where GIAY.IDGIAY = CTHDB.IDGIAY and THEKH.IDKH=KHACHHANG.IDKH and HDB.MaThe = THEKH.MaThe and CTHDB.MaHDB = HDB.MaHDB
-------------TRIGGER------------------------
--cau1:khi insert ,update vào CTHDB số lượng trong bảng giày được cập nhập
create trigger cau1 on [dbo].[CTHDB]
for insert,update
as begin
declare @idgiay varchar(10),@soluong int,@soluong1 int
select @soluong1= [Soluong]from CTHDB 
select @idgiay=[IDGIAY]from inserted
select IDGIAY,SUM(Soluong) AS soluong into btl
from CTHDB
where IDGIAY=@idgiay
group by IDGIAY
select @soluong=soluong from btl
drop table btl
UPDATE GIAY
SET GIAY.Soluong=GIAY.Soluong-(@soluong-@soluong1)
where GIAY.IDGIAY=@idgiay
end
--cau 2:yêu cầu số lượng trong bảng DONHANG phải lớn hơn không.
create trigger cau2 on [dbo].[DONHANG]
for insert, update
as begin
declare @soluong int
select @soluong=[Soluong]from inserted
if(@soluong<=0)
begin
raiserror('Số lượng phải lớn hơn không!',16,1)
end
end
--câu 3:ngày hẹn giao hàng phải lớn hơn ngày đặt mua.
create trigger cau3 on [dbo].[DONHANG]
for insert,update
as begin
declare @ngaygh datetime,@ngaydat datetime
select @ngaygh=[NgayGH]from inserted
select @ngaydat=[NgayDat] from inserted
if(@ngaydat>@ngaygh)
begin
raiserror('Ngày lập đơn hàng phải nhỏ hơn ngày giao hang!',16,1)
end 
end
--cau 4:Ngày lập phải nhỏ hơn ngày hiện tại
create trigger cau4 on dbo.HDB
for insert,update
as
begin
declare @ngaylap datetime
select @ngaylap=[Ngaylap]from inserted
if(@ngaylap>getdate())
raiserror('Ngày lập phải nhỏ hơn ngày hiện tại',16,1)
end
--câu5:Tính thành tiền khi trong bảng CTHDN khi sửa đổi bản ghi
create trigger cau5 on dbo.CTHDN
for insert,update
as
begin
declare @dongia int,@Thanhtien int,@soluong int,@idn nvarchar(50)
select @dongia=[DongiaN]from inserted
select @idn=[IDN] from inserted
select @soluong=[Soluong] from inserted
select @Thanhtien=@soluong*@dongia
update CTHDN
set CTHDN.Thanhtien=@Thanhtien
Where CTHDN.IDN=@idn
end
--câu6:	Viết trigger tự động cập nhật tổng tiền của HDN khi thêm mới hay cập nhật 1 bản ghi của bảng CTHDN Biết  Thanh tien=Sum(CTHDN .ThanhTien)
create trigger cau6 on dbo.CTHDN
for insert, update
as begin
declare @mahdn nvarchar(50), @ngayl datetime,@idncc varchar(10),@tongtien int,@idnv varchar(10)
select @mahdn=[MaHDN] from inserted
select MaHDN,SUM(CTHDN.Thanhtien)as[Tongtien] into TBL1
from CTHDN
where CTHDN.MaHDN=@mahdn
group by MaHDN
select @tongtien=Tongtien from TBL1
drop table TBL1
update HDN
set HDN.Thanhtien=@tongtien
Where MaHDN=@mahdn
end
--câu 7:	Viết trigger tự động cập nhật tổng tiền và chiết khấu của HDB khi thêm mới hay cập nhật 1 bản ghi của bảng CTHDB. 
--Biết:Thanhtien=Sum(CTHDB.ThanhTien) 
--ChietKhau=Thanh tien*n, trong đó ,n=0 nếu khách hàng có thẻ member1 , 
--n=0,05 nếu khách hàng có thẻ sliver, n=0,1 nếu khách hàng có thẻ Gold, chietkhau=20000 cho đơn hàng sau nếu khách hàng có thẻ member0

CREATE TRIGGER  cau7
   ON   [dbo].[HDB]
   FOR UPDATE,INSERT
   	
AS 
BEGIN
	
	DECLARE @MaHDB nvarchar(50)
	DECLARE @NgayLap datetime
	DECLARE @MaTheKH nvarchar(50)
	DECLARE @MaNV varchar(10)
	DECLARE @ChietKhau int
	DECLARE @TongTien int
	DECLARE @MaLoaiThe nvarchar(10)

	SELECT @MaHDB=MaHDB from inserted
	--SELECT @NgayLap=Ngaylap from inserted
	--SELECT @MaNV=IDNV from inserted
	SELECT @MaTheKH=MaThe from inserted

	SELECT THEKH.MaLoai as MaLoai into TBL
	FROM THEKH
	WHERE THEKH.MaThe=@MaTheKH
	SELECT @MaLoaiThe=MaLoai from TBL
    drop table TBL
	
    
	SELECT MaHDB,Sum(CTHDB.Thanhtien) as [TongTien] into TBL
	FROM CTHDB
	WHERE CTHDB.MaHDB=@MaHDB 
	GROUP BY MaHDB
	SELECT @TongTien=TongTien from TBL
	drop table TBL
	
	SELECT @ChietKhau=
	CASE 
	WHEN @MaLoaiThe='LT1'
		THEN @TongTien*0
	WHEN @MaLoaiThe='LT2'
		THEN @TongTien*0.05
	WHEN @MaLoaiThe='LT3'
		THEN @TongTien*0.1
	WHEN @MaLoaiThe='LT4'
		THEN 20000
	else 0
	END
	update HDB
	set Thanhtien=@TongTien,Chietkhau=@ChietKhau
	where MaHDB=@MaHDB		  
END
--câu 8: insert, update vào bản ghi GIAY cho phép nhập mã IDGIAY là duy nhất
create trigger cau8 on [dbo].[GIAY]
for insert, update
as begin
declare @idgiay nvarchar(50)
select @idgiay=[IDGIAY] from inserted
if ((select count(IDGIAY) from GIAY where GIAY.IDGIAY=@idgiay)>=2)
begin
raiserror('IDGIAY đã tồn tại',16,1)
rollback tran
end 
end
--câu 9:không cho phép Insert,update vào bảng LOAITHE
create trigger cau9 on [dbo].[LOAITHE]
for insert,update
as begin
declare @Maloai char(5)
select @Maloai=[MaLoai] from inserted
raiserror('Hiện tại chỉ có 4 đối tượng!. Bạn không thể thêm được',16,1)
end
----------------Quan tri------------
create login huongpham1
with password = '123'
create user huongpham1 for login huongpham1
create login hieutran001
with password = '123'
create user hieutran001 for login hieutran001
--Câu 1: cấp quyền select update delete cho huongpham1 trong bảng Nhà cung cấp
GRANT update,delete
on NCC to huongpham1
--2. xóa quyền update delete với huongpham1 trong bảng NHANVIEN
REVOKE update, delete ON  NHANVIEN FROM huongpham1
--3. ngăn ko cho tài khoản huongpham1 chỉnh sửa bảng NHANVIEN
DENY update ON NHANVIEN to huongpham1
--4. cấp đầy đủ quyền cho hieutran001 trên bảng NHANVIEN
grant select, update, delete on NHANVIEN to hieutran001
--5. không cho huongpham1 xóa trên bảng nhanvien
DENY delete ON NHANVIEN to huongpham1
------6. xóa quyền delete của hieutran001 trên bảng NHANVIEN
REVOKE delete ON NHANVIEN FROM hieutran001
---7. tạo login
create login luongtuanlinh
with password = '123'
create login doductuan
with password ='123'
create login phamduythanh
with password ='123'
--8. xóa login
drop login luongtuanlinh
--9. tạo user
create user tuan for login doductuan
create user thanh for login phamduythanh
-------------Nội thủ tục-----------------
--câu1:tạo nội thủ tục với tham số đầu vào là IDGIAY đầu ra là IDNCC,Soluong,DongiaN
create proc Proc_Cau1 (@idgiay char(20))
as
begin
select IDNCC,Soluong,DongiaN
from GIAY
where IDGIAY=@idgiay
end
exec Proc_Cau1 'G004'

----câu 2:Viết nội thủ tục với tham số đầu vào IDGIAY,Donvi,Ngaylap đâù ra Đơn giá bán 
CREATE PROCEDURE getprice
(
  @idgiay nvarchar(10),@DVT nvarchar(50),@NgayBan datetime, @MucGiaBan float output
)
	
AS
BEGIN
	SELECT DongiaB
	FROM CTHDB,HDB
	WHERE IDGIAY=@idgiay and
		  Donvi=@DVT and
		  Ngaylap=@NgayBan and
		  CTHDB.MaHDB=HDB.MaHDB
		  select @MucGiaBan=[DongiaB] from CTHDB
END

		declare @GIABAN int

EXEC	 getprice 'G004','Đôi','2016-07-09 00:00:00.000' ,@GIABAN out  
select    @GIABAN 
--câu 3:Viết nội thủ tục với tham số đầu vào IDKH đâù ra là thông tin khách hàng đó
CREATE PROCEDURE GETkhach
(
 @idkh nvarchar(50)
 )
 as
 begin
 select tenkhachang,Gioitinh=IIF(gioitinh='true','Nam','Nữ'),diachi,email
 from KHACHHANG
 where IDKH=@idkh
 end
 EXEC GETkhach 'KH006'
 ---câu 4:Viết nội thủ tục với tham số đầu vào là IDKH đầu ra là số đơn hàng mà khách hàng đó đã đặt
 create proc Proc_Cau4 (@makhach nvarchar(10))
as
begin
 select count(MaDDH) AS 'Số Đơn Hàng',IDKH
 FROM DONHANG
 where IDKH=@makhach
 group by IDKH
 end
exec Proc_Cau4 N'KH010'

---------------------Tồn kho-------------
select GIAY.IDGIAY,GIAY.Soluong as 'Ban đầu',/*' Bán ra' = sum(*/ CTHDB.Soluong,(GIAY.Soluong - CTHDB.Soluong) as 'Tồn kho',CTHDB.Donvi
from giay,cthdb
where GIAY.IDGIAY=CTHDB.IDGIAY