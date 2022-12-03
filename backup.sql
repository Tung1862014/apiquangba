/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: admin
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `admin` (
  `AD_id` int(11) NOT NULL AUTO_INCREMENT,
  `ND_id` int(11) NOT NULL,
  PRIMARY KEY (`AD_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: chugianhang
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `chugianhang` (
  `NB_id` int(11) NOT NULL AUTO_INCREMENT,
  `ND_id` int(11) NOT NULL,
  PRIMARY KEY (`NB_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: danhgia
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `danhgia` (
  `DG_id` int(11) NOT NULL AUTO_INCREMENT,
  `DH_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SP_id` int(11) NOT NULL,
  `NB_id` int(11) NOT NULL,
  `ND_id` int(11) NOT NULL,
  `DG_sosao` int(11) NOT NULL,
  `DG_mota` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `DG_traloi` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DG_ngayDG` date NOT NULL,
  `DG_ngayCN` date NOT NULL,
  PRIMARY KEY (`DG_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 46 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: danhmuc
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `danhmuc` (
  `DM_id` int(11) NOT NULL AUTO_INCREMENT,
  `NB_id` int(11) NOT NULL,
  `DM_danhmuc` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`DM_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 18 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: diachigiaohang
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `diachigiaohang` (
  `DC_id` int(11) NOT NULL AUTO_INCREMENT,
  `ND_id` int(11) NOT NULL,
  `DC_diachiGH` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `DC_chitiet` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`DC_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: donhang
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `donhang` (
  `DH_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ND_id` int(11) NOT NULL,
  `NB_id` int(11) NOT NULL,
  `DH_tongtien` float NOT NULL,
  `DH_trangthai` int(11) NOT NULL,
  `DH_loaithanhtoan` int(11) NOT NULL,
  `DH_diachi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `DH_phivanchuyen` float NOT NULL,
  `DH_ngay` date NOT NULL,
  `DH_trangthaiTT` int(11) NOT NULL,
  `DH_ghichu` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `DH_ghichuhuy` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`DH_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: giohang
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `giohang` (
  `SP_id` int(11) NOT NULL,
  `ND_id` int(11) NOT NULL,
  `TTGH_soluong` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: hinhanh
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `hinhanh` (
  `HA_id` int(11) NOT NULL AUTO_INCREMENT,
  `SP_id` int(11) NOT NULL,
  `HA_image` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`HA_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 238 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: khachhang
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `khachhang` (
  `ND_id` int(11) NOT NULL AUTO_INCREMENT,
  `ND_NG_id` int(11) NOT NULL,
  PRIMARY KEY (`ND_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 16 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: khuyenmai
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `khuyenmai` (
  `KM_id` int(11) NOT NULL AUTO_INCREMENT,
  `SP_id` int(11) NOT NULL,
  `KM_tungay` date NOT NULL,
  `KM_denngay` date NOT NULL,
  `KM_phantram` int(11) NOT NULL,
  PRIMARY KEY (`KM_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 37 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: link
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `link` (
  `LI_id` int(11) NOT NULL AUTO_INCREMENT,
  `QB_id` int(11) NOT NULL,
  `LI_tieude` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `LI_link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`LI_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 38 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: motashop
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `motashop` (
  `MTS_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NB_id` int(11) NOT NULL,
  `MTS_logo` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MTS_ten` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MTS_image` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MTS_diachi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `MTS_chitiet` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `MTS_clientId` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`MTS_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: nguoidung
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `nguoidung` (
  `ND_id` int(11) NOT NULL AUTO_INCREMENT,
  `ND_hoten` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ND_username` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ND_password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ND_image` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ND_email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ND_diachi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ND_ngayDK` date NOT NULL,
  `ND_sdt` int(10) NOT NULL,
  `ND_quyen` int(11) NOT NULL,
  `ND_trangthai` int(11) NOT NULL,
  `ND_ghichu` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ND_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 16 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: quangba
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `quangba` (
  `QB_id` int(11) NOT NULL AUTO_INCREMENT,
  `QB_tieude` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `QB_mota` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `QB_image` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`QB_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: sanpham
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `sanpham` (
  `SP_id` int(11) NOT NULL AUTO_INCREMENT,
  `NB_id` int(11) NOT NULL,
  `SP_ten` varchar(228) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SP_soluong` int(11) NOT NULL,
  `SP_soluongban` int(11) NOT NULL,
  `SP_gia` int(11) NOT NULL,
  `SP_image` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SP_trongluong` int(11) NOT NULL,
  `SP_mota` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `SP_trangthai` int(11) NOT NULL,
  `DM_id` int(11) NOT NULL,
  PRIMARY KEY (`SP_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 81 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: thongtindonhang
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `thongtindonhang` (
  `TTDH_id` int(11) NOT NULL AUTO_INCREMENT,
  `ND_id` int(11) NOT NULL,
  `NB_id` int(11) NOT NULL,
  `SP_id` int(11) NOT NULL,
  `DH_id` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TTDH_soluong` int(11) NOT NULL,
  `TTDH_gia` int(11) NOT NULL,
  `TTDH_phantram` int(11) NOT NULL,
  PRIMARY KEY (`TTDH_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 462 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: admin
# ------------------------------------------------------------

INSERT INTO
  `admin` (`AD_id`, `ND_id`)
VALUES
  (1, 1);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: chugianhang
# ------------------------------------------------------------

INSERT INTO
  `chugianhang` (`NB_id`, `ND_id`)
VALUES
  (1, 2);
INSERT INTO
  `chugianhang` (`NB_id`, `ND_id`)
VALUES
  (2, 3);
INSERT INTO
  `chugianhang` (`NB_id`, `ND_id`)
VALUES
  (3, 4);
INSERT INTO
  `chugianhang` (`NB_id`, `ND_id`)
VALUES
  (4, 5);
INSERT INTO
  `chugianhang` (`NB_id`, `ND_id`)
VALUES
  (5, 6);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: danhgia
# ------------------------------------------------------------

INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    1,
    'LLG79C',
    1,
    2,
    9,
    5,
    'Sản phẩm rất tốt hợp vị.',
    'Cảm ơn bạn đã đánh giá, chúng tôi sẽ cố gắng hoàn thiện hơn. Chúc bạn ngon miệng.',
    '2022-03-24',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    2,
    'LLG79C',
    4,
    2,
    9,
    4,
    'Sản phẩm chất lượng tốt, rất hợp vị.',
    '',
    '2022-03-24',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    3,
    'LLG799',
    7,
    3,
    7,
    5,
    'san phâm khong nhu hinh',
    '',
    '2022-10-04',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    4,
    'LLGLUP',
    4,
    2,
    7,
    4,
    'Sản phẩm chưa giống hình lắm, vị sản phẩm khá sản nhưng hơi mặn. Mong shop có thể khắc phục.',
    '',
    '2022-03-15',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    5,
    'LLGQ4K',
    1,
    2,
    8,
    4,
    'Chất lượng mấy miếng còn lại không được ổn lắm mong shop sớm khắc phục.',
    '',
    '2022-03-12',
    '2022-10-04'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    6,
    'LLGCG6',
    10,
    3,
    9,
    5,
    'Sản phẩm chất lượng, ngon. shop đóng gói kỹ .',
    '',
    '2022-10-07',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    7,
    'LLGCGV',
    12,
    3,
    8,
    5,
    'Sản phẩm chất lượng.',
    '',
    '2022-10-07',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    8,
    'LLGCG9',
    9,
    3,
    8,
    3,
    'sản phẩm không giống hình',
    '',
    '2022-10-07',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    9,
    'LLGCGU',
    3,
    2,
    8,
    4,
    'sản tương đối ổn, cầm bớt mặn lại một chút.',
    '',
    '2022-10-07',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    10,
    'LLG799',
    9,
    3,
    7,
    4,
    'san phâm khong nhu hinh',
    '',
    '2022-10-04',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    11,
    'LLG799',
    12,
    3,
    7,
    4,
    'san phâm khong nhu hinh',
    '',
    '2022-10-04',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    12,
    'LLGWKB',
    56,
    6,
    11,
    5,
    'Đóng gói cẩn thận, sạch sẽ nên nhìn ngon. Không nên gói thực phẩm bằng giấy báo',
    'Cảm ơn bạn đã ủng hộ gian hàng, chúc bạn ngon miệng. Shop sẽ rút kinh nghiệm ạ',
    '2022-11-06',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    13,
    'LLGAB6',
    30,
    6,
    10,
    5,
    'Sản phẩm ngon chất lượng. Vị vừa ăn.',
    'Gian hàng Nguyen123 cảm ơn quý khách đã ủng hộ. \nRất hân hạnh phục vụ quý khách.',
    '2022-11-06',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    14,
    'LLGABV',
    34,
    2,
    10,
    4,
    'Sản phẩm ổn. Vị nên bớt mặn 1 chút là tuyệt vời ạ.',
    'Cảm ơn quý khách hàng đã ủng hộ mua sắm tại gian hàng của chúng tôi.',
    '2022-11-06',
    '2022-11-06'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    15,
    'LLGABV',
    7,
    2,
    10,
    5,
    'Khô giao khá nhanh. Vị mặn phải rửa ăn mới được nha. Không thì vừa ăn vừa uống nc.  Hihihi',
    'Cảm ơn quý khách hàng đã ủng hộ mua sắm tại gian hàng của chúng tôi.',
    '2022-11-06',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    17,
    'LLGA3L',
    35,
    2,
    11,
    5,
    'Đóng gói cẩn thận, sạch sẽ nên nhìn ngon. Không nên gói thực phẩm bằng giấy báo.',
    'Cảm ơn khách hàng đã ủng hộ',
    '2022-11-06',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    18,
    'LLGA3F',
    42,
    3,
    11,
    5,
    'Đóng gói cẩn thận, sạch sẽ nên nhìn ngon. Không nên gói thực phẩm bằng giấy báo.',
    '',
    '2022-11-06',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    19,
    'LLGA3F',
    12,
    3,
    11,
    5,
    'Đóng gói cẩn thận, sạch sẽ nên nhìn ngon. Không nên gói thực phẩm bằng giấy báo.',
    '',
    '2022-11-06',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    20,
    'LLGAR3',
    61,
    2,
    12,
    5,
    'Khô nhìn rất sạch sẽ, đóng gói cẩn thận chỉ có điều vị rất mặn nên trước khi chiên phải ướp lại',
    'Cảm ơn khách hàng đã ủng hộ',
    '2022-11-07',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    21,
    'LLGAR3',
    6,
    2,
    12,
    5,
    'Khô nhìn rất sạch sẽ, đóng gói cẩn thận chỉ có điều vị rất mặn nên trước khi chiên phải ướp lại',
    'Cảm ơn khách hàng đã ủng hộ',
    '2022-11-07',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    22,
    'LLG8AW',
    65,
    2,
    7,
    5,
    'Hơi mặn Ngoài ra thì ok Mong shop giảm độ mặn lại chút. Vì mặn quá mất ngon mặc dù em ướp khá nhiều bột ngọt. Nhưng độ mặn nó thấm sâu vào trong rồi nên khó chữa.',
    '',
    '2022-11-11',
    '2022-11-11'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    23,
    'LLG8AW',
    5,
    2,
    7,
    5,
    'Vẫn cứ là ưng hết nước chấm. Ngon quá!',
    '',
    '2022-11-11',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    24,
    'LLG8AY',
    37,
    2,
    9,
    5,
    'Cách làm và đóng gói sạch sẽ vệ sinh, hút chân không hai lớp nên để ngăn đông cũng không sợ tủ lạnh có mùi . Sản phẩm làm từ miền Tây thì chắc chắn là ngon . Mọi người nên mua',
    '',
    '2022-11-11',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    25,
    'LLG8AY',
    63,
    2,
    9,
    5,
    'Khô giao đúng hàng...đóng gói cẩn thận...khô cá tra phồng ướp quá mặn..',
    '',
    '2022-11-11',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    26,
    'LLG8AY',
    64,
    2,
    9,
    5,
    'Khô cá quá mặn nếu đem đi luộc sơ rồi chiên và khè xíu đường thì ăn mới nổi',
    '',
    '2022-11-11',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    27,
    'LLGRUY',
    64,
    2,
    10,
    5,
    'Ăn rất là ngon luôn, cho dù là mỡ nhưng ăn ko ngán, ko mặn. Lần sau mình sẽ đặc tiếp ☺️\n',
    '',
    '2022-11-13',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    28,
    'LLGRUY',
    61,
    2,
    10,
    5,
    'Khô nhìn rất sạch sẽ, đóng gói cẩn thận chỉ có điều vị rất mặn nên trước khi chiên phải ướp lại.',
    '',
    '2022-11-13',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    29,
    'LLGRUE',
    49,
    5,
    11,
    5,
    'Khô nhìn rất sạch sẽ, đóng gói cẩn thận chỉ có điều vị rất mặn nên trước khi chiên phải ướp lại',
    '',
    '2022-11-13',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    30,
    'LLGRCQ',
    46,
    4,
    11,
    5,
    'Khô nhìn rất sạch sẽ, đóng gói cẩn thận chỉ có điều vị rất mặn nên trước khi chiên phải ướp lại',
    '',
    '2022-11-13',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    31,
    'LLGRCL',
    36,
    2,
    11,
    5,
    'Khô nhìn rất sạch sẽ, đóng gói cẩn thận chỉ có điều vị rất mặn nên trước khi chiên phải ướp lại',
    '',
    '2022-11-13',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    32,
    'LLGRCL',
    64,
    2,
    11,
    5,
    'Khô nhìn rất sạch sẽ, đóng gói cẩn thận chỉ có điều vị rất mặn nên trước khi chiên phải ướp lại',
    '',
    '2022-11-13',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    33,
    'DHSPMP3',
    33,
    2,
    8,
    5,
    'Khô nhìn rất sạch sẽ, đóng gói cẩn thận chỉ có điều vị rất mặn nên trước khi chiên phải ướp lại',
    'Cám ơn khách đã đánh giá. Chúc mhon miệng ạ. ',
    '2022-11-13',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    34,
    'DHSPMP3',
    35,
    2,
    8,
    5,
    'Khô nhìn rất sạch sẽ, đóng gói cẩn thận chỉ có điều vị rất mặn nên trước khi chiên phải ướp lại',
    '',
    '2022-11-13',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    35,
    'DHSPMP3',
    62,
    2,
    8,
    5,
    'Khô nhìn rất sạch sẽ, đóng gói cẩn thận chỉ có điều vị rất mặn nên trước khi chiên phải ướp lại',
    '',
    '2022-11-13',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    36,
    'LLGRYF',
    6,
    2,
    9,
    5,
    'Đã nhận được hàng hôm qua rồi nhưng nay rảnh mới đánh giá, đã dùng thử cũng ngon',
    '',
    '2022-11-14',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    37,
    'LLGRYF',
    34,
    2,
    9,
    5,
    'Gói hàng rất cẩn thận, giao hàng nhanh, nhưng chao mùi hơi khét',
    '',
    '2022-11-14',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    38,
    'LLGE8V',
    5,
    2,
    10,
    2,
    'Sản phẩm khá mặn. Hàng giao tới thì bị méo mó.',
    'Cám ơn bạn đã góp ý. Chúng tôi sẽ khắc phục.',
    '2022-11-20',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    39,
    'LLGE89',
    68,
    3,
    10,
    4,
    'Khô ngon giá hơi đắt hơn ở ngoài nhưng nhìn chung tạm được đóng gói chắc chắn giao hàng nhanh',
    '',
    '2022-11-20',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    40,
    'LLGE89',
    67,
    3,
    10,
    3,
    'Khô ngon giá hơi đắt hơn ở ngoài nhưng nhìn chung tạm được đóng gói chắc chắn giao hàng nhanh',
    '',
    '2022-11-20',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    41,
    'LLGE8P',
    6,
    2,
    12,
    5,
    'Khô cá ngon tuy hơi mặn chút. Ăn với cơm hay xôi nếp đều hợp.',
    '',
    '2022-11-20',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    42,
    'LLGE6A',
    70,
    3,
    7,
    5,
    'Sản phẩm chất lượng, ngon.',
    '',
    '2022-11-20',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    43,
    'LLGE6A',
    13,
    3,
    7,
    5,
    'Sản phẩm đúng với hình, rất ngon.',
    '',
    '2022-11-20',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    44,
    'LLUULE',
    7,
    2,
    14,
    5,
    'Sản phẩm chất lượng. Ngon',
    '',
    '2022-11-30',
    '0000-00-00'
  );
INSERT INTO
  `danhgia` (
    `DG_id`,
    `DH_id`,
    `SP_id`,
    `NB_id`,
    `ND_id`,
    `DG_sosao`,
    `DG_mota`,
    `DG_traloi`,
    `DG_ngayDG`,
    `DG_ngayCN`
  )
VALUES
  (
    45,
    'LLUULE',
    4,
    2,
    14,
    5,
    'Sản phẩm với hương vị vừa ăn. Rất ngon.',
    'Cảm ơn bạn đã ủng hộ gian hàng của chúng tôi.',
    '2022-11-30',
    '0000-00-00'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: danhmuc
# ------------------------------------------------------------

INSERT INTO
  `danhmuc` (`DM_id`, `NB_id`, `DM_danhmuc`)
VALUES
  (1, 2, 'Khô cá lóc');
INSERT INTO
  `danhmuc` (`DM_id`, `NB_id`, `DM_danhmuc`)
VALUES
  (2, 2, 'Khô cá sặc');
INSERT INTO
  `danhmuc` (`DM_id`, `NB_id`, `DM_danhmuc`)
VALUES
  (3, 2, 'Khô cá tra');
INSERT INTO
  `danhmuc` (`DM_id`, `NB_id`, `DM_danhmuc`)
VALUES
  (4, 3, 'Khô cá lóc');
INSERT INTO
  `danhmuc` (`DM_id`, `NB_id`, `DM_danhmuc`)
VALUES
  (5, 3, 'Khô cá sặc');
INSERT INTO
  `danhmuc` (`DM_id`, `NB_id`, `DM_danhmuc`)
VALUES
  (6, 3, 'Khô cá lưỡi trâu');
INSERT INTO
  `danhmuc` (`DM_id`, `NB_id`, `DM_danhmuc`)
VALUES
  (7, 4, 'Khô cá lóc');
INSERT INTO
  `danhmuc` (`DM_id`, `NB_id`, `DM_danhmuc`)
VALUES
  (8, 4, 'Khô cá sặc');
INSERT INTO
  `danhmuc` (`DM_id`, `NB_id`, `DM_danhmuc`)
VALUES
  (9, 5, 'Khô cá lóc');
INSERT INTO
  `danhmuc` (`DM_id`, `NB_id`, `DM_danhmuc`)
VALUES
  (10, 5, 'Khô cá sặc');
INSERT INTO
  `danhmuc` (`DM_id`, `NB_id`, `DM_danhmuc`)
VALUES
  (11, 6, 'Khô cá lóc');
INSERT INTO
  `danhmuc` (`DM_id`, `NB_id`, `DM_danhmuc`)
VALUES
  (12, 6, 'Khô cá sặc');
INSERT INTO
  `danhmuc` (`DM_id`, `NB_id`, `DM_danhmuc`)
VALUES
  (16, 4, 'Khô cá tra');
INSERT INTO
  `danhmuc` (`DM_id`, `NB_id`, `DM_danhmuc`)
VALUES
  (17, 5, 'Khô cá tra phồng');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: diachigiaohang
# ------------------------------------------------------------

INSERT INTO
  `diachigiaohang` (`DC_id`, `ND_id`, `DC_diachiGH`, `DC_chitiet`)
VALUES
  (
    1,
    7,
    'Hồ Chí Minh,Quận 11,Phường 14',
    '123/234 hẻm 3456'
  );
INSERT INTO
  `diachigiaohang` (`DC_id`, `ND_id`, `DC_diachiGH`, `DC_chitiet`)
VALUES
  (
    2,
    8,
    'Hồ Chí Minh,Quận 9,Phường Long Bình',
    '123/456 hẻm 122 '
  );
INSERT INTO
  `diachigiaohang` (`DC_id`, `ND_id`, `DC_diachiGH`, `DC_chitiet`)
VALUES
  (
    3,
    9,
    'Hồ Chí Minh,Quận 10,Phường 13',
    '123/65 hẻm 234'
  );
INSERT INTO
  `diachigiaohang` (`DC_id`, `ND_id`, `DC_diachiGH`, `DC_chitiet`)
VALUES
  (
    4,
    10,
    'Hồ Chí Minh,Quận 10,Phường 13',
    '123/234/ hẻm 90'
  );
INSERT INTO
  `diachigiaohang` (`DC_id`, `ND_id`, `DC_diachiGH`, `DC_chitiet`)
VALUES
  (
    5,
    11,
    'Hồ Chí Minh,Quận 10,Phường 14',
    '56/124 hẻm 98'
  );
INSERT INTO
  `diachigiaohang` (`DC_id`, `ND_id`, `DC_diachiGH`, `DC_chitiet`)
VALUES
  (
    6,
    12,
    'Hồ Chí Minh,Quận 12,Phường Hiệp Thành',
    '235/ 34 '
  );
INSERT INTO
  `diachigiaohang` (`DC_id`, `ND_id`, `DC_diachiGH`, `DC_chitiet`)
VALUES
  (
    7,
    13,
    'Hồ Chí Minh,Quận 12,Phường Tân Chánh Hiệp',
    '231/456 hẻm 45'
  );
INSERT INTO
  `diachigiaohang` (`DC_id`, `ND_id`, `DC_diachiGH`, `DC_chitiet`)
VALUES
  (
    8,
    14,
    'Hồ Chí Minh,Quận 12,Phường Hiệp Thành',
    '123 hẻm 345'
  );
INSERT INTO
  `diachigiaohang` (`DC_id`, `ND_id`, `DC_diachiGH`, `DC_chitiet`)
VALUES
  (
    9,
    15,
    'Long An,Huyện Cần Đước,Xã Long Sơn',
    '123/99'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: donhang
# ------------------------------------------------------------

INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP0',
    7,
    6,
    140000,
    2,
    1,
    'Hồ Chí Minh,Quận 10,Phường 13',
    40000,
    '2022-11-08',
    1,
    '',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP1',
    7,
    2,
    223000,
    4,
    1,
    'Hồ Chí Minh,Quận 10,Phường 13',
    40000,
    '2022-01-12',
    2,
    'Giao hàng ngoài giờ hành chính',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP10',
    9,
    2,
    260000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    50000,
    '2022-02-22',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP100',
    10,
    2,
    220000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-07-04',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP101',
    10,
    2,
    470000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-07-06',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP102',
    10,
    2,
    178000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-07-07',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP103',
    11,
    2,
    250000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    45000,
    '2022-07-09',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP104',
    11,
    2,
    486000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    45000,
    '2022-07-09',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP105',
    9,
    2,
    316000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    50000,
    '2022-07-09',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP106',
    9,
    2,
    348000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-07-13',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP107',
    13,
    2,
    130000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    50001,
    '2022-07-14',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP108',
    13,
    2,
    486000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    55000,
    '2022-07-17',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP109',
    13,
    2,
    270000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    50001,
    '2022-07-19',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP11',
    8,
    2,
    172000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    40000,
    '2022-04-02',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP110',
    14,
    2,
    235000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-07-22',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP111',
    14,
    2,
    220000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-07-22',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP112',
    10,
    2,
    176000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-07-23',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP113',
    10,
    2,
    470000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-07-24',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP114',
    7,
    2,
    270000,
    4,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    40000,
    '2022-07-26',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP115',
    7,
    2,
    220000,
    4,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    45000,
    '2022-07-27',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP116',
    7,
    2,
    348000,
    4,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    45000,
    '2022-07-29',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP117',
    9,
    2,
    316000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-08-01',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP118',
    9,
    2,
    168000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-08-01',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP119',
    9,
    2,
    310000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-08-02',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP12',
    8,
    2,
    245000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    40000,
    '2022-04-05',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP120',
    9,
    2,
    270000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-08-04',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP121',
    8,
    2,
    168000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    45000,
    '2022-08-05',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP122',
    8,
    2,
    470000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    45000,
    '2022-08-07',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP123',
    8,
    2,
    178000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    40000,
    '2022-08-10',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP124',
    8,
    2,
    220000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    40000,
    '2022-08-11',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP125',
    8,
    2,
    280000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    45000,
    '2022-08-13',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP126',
    13,
    2,
    250000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    55000,
    '2022-08-13',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP127',
    13,
    2,
    168000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    55000,
    '2022-08-13',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP128',
    13,
    2,
    270000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    50001,
    '2022-08-16',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP129',
    13,
    2,
    486000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    55000,
    '2022-08-17',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP13',
    11,
    2,
    240000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    40000,
    '2022-04-06',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP130',
    13,
    2,
    176000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    50001,
    '2022-08-19',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP131',
    11,
    2,
    250000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    45000,
    '2022-08-23',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP132',
    11,
    2,
    178000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    40000,
    '2022-08-24',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP133',
    11,
    2,
    310000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    40000,
    '2022-08-25',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP134',
    11,
    2,
    486000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    45000,
    '2022-08-28',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP135',
    11,
    2,
    168000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    45000,
    '2022-09-01',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP136',
    12,
    2,
    486000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-09-01',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP137',
    12,
    2,
    270000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-09-03',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP138',
    12,
    2,
    250000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-09-04',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP139',
    12,
    2,
    310000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-09-06',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP14',
    11,
    2,
    135000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    40000,
    '2022-04-07',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP140',
    12,
    2,
    168000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-09-07',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP141',
    14,
    2,
    220000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-09-09',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP142',
    14,
    2,
    176000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-09-13',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP143',
    14,
    2,
    470000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-09-13',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP144',
    14,
    2,
    348000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-09-13',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP145',
    14,
    2,
    280000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-09-14',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP146',
    15,
    2,
    220000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    82500,
    '2022-09-17',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP147',
    15,
    2,
    486000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    97900,
    '2022-09-19',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP148',
    15,
    2,
    270000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    82500,
    '2022-09-22',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP149',
    15,
    2,
    470000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    97900,
    '2022-09-22',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP15',
    13,
    2,
    409000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    55000,
    '2022-04-07',
    2,
    'Giao hàng ngoài giờ hàng chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP150',
    15,
    2,
    178000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    93500,
    '2022-09-23',
    2,
    'Giang hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP151',
    7,
    2,
    270000,
    4,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    40000,
    '2022-09-24',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP152',
    7,
    2,
    176000,
    4,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    40000,
    '2022-09-25',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP153',
    7,
    2,
    135000,
    4,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    40000,
    '2022-09-27',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP154',
    7,
    2,
    486000,
    4,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    45000,
    '2022-09-27',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP155',
    7,
    2,
    84000,
    4,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    40000,
    '2022-09-28',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP156',
    11,
    2,
    125000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    40000,
    '2022-09-29',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP157',
    11,
    2,
    235000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    40000,
    '2022-09-30',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP158',
    11,
    2,
    235000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    40000,
    '2022-10-01',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP159',
    11,
    2,
    178000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    40000,
    '2022-10-01',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP16',
    13,
    2,
    176000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    50001,
    '2022-04-09',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP160',
    11,
    2,
    280000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    45000,
    '2022-10-02',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP161',
    10,
    2,
    168000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-10-04',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP162',
    10,
    2,
    486000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-10-05',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP163',
    10,
    2,
    267000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    50000,
    '2022-10-07',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP164',
    10,
    2,
    310000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-10-08',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP165',
    10,
    2,
    348000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-10-10',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP166',
    8,
    2,
    470000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    45000,
    '2022-10-11',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP167',
    8,
    2,
    316000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    45000,
    '2022-10-12',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP168',
    8,
    2,
    486000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    45000,
    '2022-10-15',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP169',
    8,
    2,
    348000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    45000,
    '2022-10-16',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP17',
    15,
    2,
    318000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    97900,
    '2022-04-10',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP170',
    8,
    2,
    220000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    40000,
    '2022-10-18',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP171',
    9,
    2,
    316000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-10-20',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP172',
    9,
    2,
    486000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-10-21',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP173',
    9,
    2,
    84000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-10-21',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP174',
    9,
    2,
    220000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-10-22',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP175',
    9,
    2,
    250000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-10-23',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP176',
    14,
    2,
    220000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50000,
    '2022-10-25',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP177',
    14,
    2,
    348000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-10-26',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP178',
    14,
    2,
    270000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-10-28',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP179',
    14,
    2,
    220000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-10-29',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP18',
    15,
    2,
    265000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    82500,
    '2022-04-11',
    2,
    'Giao hàng gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP180',
    14,
    2,
    280000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-11-01',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP181',
    12,
    2,
    168000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-11-01',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP182',
    12,
    2,
    270000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-11-02',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP183',
    12,
    2,
    470000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-11-03',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP184',
    12,
    2,
    470000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-11-05',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP185',
    12,
    2,
    178000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-11-05',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP186',
    10,
    2,
    470000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-11-06',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP187',
    10,
    2,
    310000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-11-07',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP188',
    8,
    2,
    176000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    40000,
    '2022-11-07',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP189',
    8,
    2,
    220000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    45000,
    '2022-11-07',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP19',
    9,
    2,
    213000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-04-11',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP190',
    11,
    2,
    260000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    40000,
    '2022-11-09',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP191',
    11,
    2,
    280000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    45000,
    '2022-11-10',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP192',
    15,
    2,
    194000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    90200,
    '2022-11-11',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP193',
    15,
    2,
    110000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    82500,
    '2022-11-13',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP194',
    14,
    2,
    270000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-11-14',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP195',
    14,
    2,
    265000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-11-14',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP196',
    13,
    2,
    260000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    50001,
    '2022-11-16',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP197',
    13,
    2,
    173000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    50001,
    '2022-11-17',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP198',
    9,
    2,
    408000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    50001,
    '2022-11-19',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP199',
    9,
    2,
    470000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-11-20',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP2',
    7,
    5,
    140000,
    4,
    1,
    'Hồ Chí Minh,Quận 10,Phường 13',
    40000,
    '2022-11-08',
    2,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP20',
    9,
    2,
    324000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-04-11',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP200',
    12,
    2,
    331000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-11-22',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP201',
    12,
    2,
    329000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-11-22',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP202',
    11,
    2,
    316000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    45000,
    '2022-11-23',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP203',
    11,
    2,
    309000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    50000,
    '2022-11-24',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP204',
    10,
    2,
    303000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    47500,
    '2022-11-24',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP205',
    10,
    2,
    559000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    47500,
    '2022-11-25',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP206',
    9,
    2,
    265000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-11-26',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP207',
    9,
    2,
    290000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-11-27',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP208',
    8,
    2,
    375000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    45000,
    '2022-11-27',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP209',
    8,
    2,
    240000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    40000,
    '2022-11-27',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP21',
    12,
    2,
    265000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-04-14',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP210',
    13,
    2,
    220000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    50001,
    '2022-11-27',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP211',
    14,
    2,
    470000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-11-28',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP212',
    9,
    2,
    283000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-11-28',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP213',
    12,
    2,
    250000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-11-29',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP214',
    15,
    2,
    373000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    90200,
    '2022-11-30',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP215',
    11,
    2,
    295000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    40000,
    '2022-12-01',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP216',
    7,
    2,
    331000,
    4,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    40000,
    '2022-12-02',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP217',
    7,
    2,
    199000,
    4,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    40000,
    '2022-12-03',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP218',
    10,
    2,
    219000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-12-04',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP219',
    9,
    2,
    260000,
    3,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-12-04',
    1,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP22',
    12,
    2,
    284000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-04-15',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP220',
    14,
    2,
    370000,
    2,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-12-05',
    1,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP23',
    8,
    2,
    88000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    40000,
    '2022-04-16',
    2,
    'Giao hàng gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP24',
    8,
    2,
    199000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    40000,
    '2022-04-17',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP25',
    10,
    2,
    235000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-04-18',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP26',
    10,
    2,
    199000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-04-18',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP27',
    11,
    2,
    250000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    45000,
    '2022-04-20',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP28',
    11,
    2,
    293000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    40000,
    '2022-04-21',
    2,
    'Giao hàng ngoài giờ hàng chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP29',
    14,
    2,
    245000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-04-22',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP3',
    8,
    2,
    876000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    60002,
    '2022-01-19',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP30',
    14,
    2,
    309000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-04-23',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP31',
    15,
    2,
    194000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    90200,
    '2022-04-24',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP32',
    15,
    2,
    353000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    97900,
    '2022-04-25',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP33',
    12,
    2,
    353000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-04-25',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP34',
    12,
    2,
    229000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-04-27',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP35',
    10,
    2,
    84000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-04-28',
    2,
    'Giao hàng nhớ gọi truocs 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP36',
    10,
    2,
    245000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-04-28',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP37',
    10,
    2,
    280000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-04-30',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP38',
    13,
    2,
    470000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    55000,
    '2022-05-01',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP39',
    13,
    2,
    199000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    50001,
    '2022-05-02',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP4',
    13,
    3,
    864000,
    2,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    65001,
    '2022-11-22',
    1,
    'Nhớ gọi điện trước 15 phút, gioa hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP40',
    9,
    2,
    288000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-05-03',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP41',
    9,
    2,
    299000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-05-03',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP42',
    9,
    2,
    474000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    50001,
    '2022-05-06',
    2,
    'Gia hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP43',
    8,
    2,
    228000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    40000,
    '2022-05-07',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP44',
    8,
    2,
    348000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    45000,
    '2022-05-08',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP45',
    8,
    2,
    290000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    40000,
    '2022-05-09',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP46',
    7,
    2,
    172000,
    4,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    40000,
    '2022-05-09',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP47',
    7,
    2,
    219000,
    4,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    40000,
    '2022-05-09',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP48',
    7,
    2,
    260000,
    4,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    40000,
    '2022-05-12',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP49',
    10,
    2,
    270000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-05-13',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP5',
    13,
    2,
    550000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    60001,
    '2022-01-29',
    2,
    'Nhớ gọi điện trước 15 phút, gioa hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP50',
    10,
    2,
    250000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-05-14',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP51',
    10,
    2,
    89000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-05-15',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP52',
    11,
    2,
    250000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    45000,
    '2022-05-16',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP53',
    11,
    2,
    84000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    40000,
    '2022-05-17',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP54',
    11,
    2,
    176000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    40000,
    '2022-05-17',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP55',
    9,
    2,
    260000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-05-19',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP56',
    9,
    2,
    235000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-05-20',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP57',
    9,
    2,
    250000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-05-21',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP58',
    8,
    2,
    176000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    40000,
    '2022-05-21',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP59',
    8,
    2,
    270000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    40000,
    '2022-05-23',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP6',
    7,
    2,
    168000,
    4,
    2,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    50000,
    '2022-02-02',
    2,
    'Giao hàng ngoài giờ hành chính',
    'Khách hàng hủy đơn.'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP60',
    8,
    2,
    125000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    40000,
    '2022-05-24',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP61',
    14,
    2,
    220000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-05-25',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP62',
    14,
    2,
    235000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-05-26',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP63',
    14,
    2,
    178000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-05-27',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP64',
    15,
    2,
    260000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    82500,
    '2022-05-28',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP65',
    15,
    2,
    168000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    97900,
    '2022-05-28',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP66',
    7,
    2,
    220000,
    4,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    40000,
    '2022-05-30',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP67',
    7,
    2,
    270000,
    4,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    40000,
    '2022-05-31',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP68',
    10,
    2,
    270000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-06-01',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP69',
    10,
    2,
    168000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-06-02',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP7',
    11,
    2,
    258000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    45000,
    '2022-02-05',
    2,
    'Giao hàng ngoài giờ hành chính, nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP70',
    10,
    2,
    260000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-06-03',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP71',
    8,
    2,
    470000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    45000,
    '2022-06-04',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP72',
    8,
    2,
    316000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    45000,
    '2022-06-05',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP73',
    15,
    2,
    260000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    82500,
    '2022-06-05',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP74',
    15,
    2,
    158000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    82500,
    '2022-06-07',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP75',
    9,
    2,
    310000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-06-08',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP76',
    9,
    2,
    168000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-06-09',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP77',
    9,
    2,
    270000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-06-10',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP78',
    14,
    2,
    470000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-06-11',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP79',
    14,
    2,
    348000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-06-11',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP8',
    14,
    2,
    118000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-02-08',
    2,
    'Giao hàng ngoài giờ hành chính và gọi trước 5 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP80',
    13,
    2,
    260000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    50001,
    '2022-06-11',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP81',
    13,
    2,
    176000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    50001,
    '2022-06-14',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP82',
    12,
    2,
    270000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-06-15',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP83',
    12,
    2,
    280000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-06-16',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP84',
    10,
    2,
    348000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-06-17',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP85',
    10,
    2,
    270000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-06-17',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP86',
    9,
    2,
    310000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-06-19',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP87',
    8,
    2,
    470000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    45000,
    '2022-06-20',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP88',
    8,
    2,
    158000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    40000,
    '2022-06-21',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP89',
    11,
    2,
    250000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    45000,
    '2022-06-21',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP9',
    15,
    2,
    428000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    97900,
    '2022-02-10',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP90',
    11,
    2,
    486000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    45000,
    '2022-06-23',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP91',
    13,
    2,
    260000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    50001,
    '2022-06-24',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP92',
    13,
    2,
    470000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    55000,
    '2022-06-25',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP93',
    12,
    2,
    220000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-06-25',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP94',
    12,
    2,
    486000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-06-27',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP95',
    15,
    2,
    260000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    93500,
    '2022-06-28',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP96',
    15,
    2,
    470000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    97900,
    '2022-06-29',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP97',
    12,
    2,
    486000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-07-01',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP98',
    12,
    2,
    348000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-07-02',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'DHSPMP99',
    10,
    2,
    168000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-07-02',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLG67D',
    10,
    4,
    162000,
    2,
    1,
    'Hồ Chí Minh,Quận Tân Phú,Phường Tân Thành',
    22003,
    '2022-11-10',
    1,
    '',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLG67K',
    10,
    6,
    285000,
    5,
    1,
    'Hồ Chí Minh,Quận Tân Phú,Phường Tân Thành',
    22003,
    '2022-11-10',
    1,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLG6BB',
    11,
    4,
    598000,
    4,
    1,
    'Hồ Chí Minh,Quận Phú Nhuận,Phường 13',
    22003,
    '2022-10-12',
    2,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLG799',
    7,
    3,
    200000,
    4,
    1,
    'Hồ Chí Minh,Quận 10,Phường 14',
    40000,
    '2022-09-20',
    2,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLG79C',
    9,
    2,
    200000,
    4,
    1,
    'Hồ Chí Minh,Quận 10,Phường 14',
    40000,
    '2022-01-04',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLG879',
    8,
    2,
    503000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    47500,
    '2022-01-13',
    2,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLG8AW',
    7,
    2,
    398000,
    4,
    1,
    '123/234 hẻm 3456,Phường 13,Quận 10,Hồ Chí Minh',
    50001,
    '2022-01-15',
    2,
    'Giao hàng ngoài giờ hành chính',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLG8AY',
    9,
    2,
    472000,
    4,
    1,
    '123/65 hẻm 234,Xã Tân Thới Nhì,Huyện Hóc Môn,Hồ Chí Minh',
    60001,
    '2022-01-15',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLG8LW',
    7,
    2,
    110000,
    5,
    1,
    '123/234 hẻm 3456,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-01-13',
    1,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGA3F',
    11,
    3,
    410000,
    4,
    2,
    'Hồ Chí Minh,Quận Phú Nhuận,Phường 13',
    40000,
    '2022-11-06',
    2,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGA3L',
    11,
    2,
    125000,
    4,
    2,
    'Hồ Chí Minh,Quận Phú Nhuận,Phường 13',
    40000,
    '2022-01-08',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGAAL',
    7,
    5,
    145000,
    4,
    2,
    'Hồ Chí Minh,Quận 10,Phường 13',
    40000,
    '2022-11-07',
    2,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGAB6',
    10,
    6,
    140000,
    4,
    1,
    'Hà Nội,Quận Cầu Giấy,Phường Mai Dịch',
    71500,
    '2022-11-06',
    2,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGABV',
    10,
    2,
    245000,
    4,
    1,
    'Hà Nội,Quận Cầu Giấy,Phường Mai Dịch',
    71500,
    '2022-01-08',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGAR3',
    12,
    2,
    523000,
    4,
    1,
    'Hồ Chí Minh,Quận 10,Phường 13',
    50001,
    '2022-01-10',
    2,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGCG6',
    9,
    3,
    189000,
    4,
    1,
    'Hồ Chí Minh,Quận 10,Phường 14',
    40000,
    '2022-09-20',
    2,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGCG9',
    8,
    3,
    225000,
    4,
    1,
    'An Giang,Huyện Chợ Mới,Xã Nhơn Mỹ',
    18700,
    '2022-09-20',
    2,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGCGU',
    8,
    2,
    260000,
    4,
    1,
    'An Giang,Huyện Chợ Mới,Xã Nhơn Mỹ',
    18700,
    '2022-01-06',
    2,
    'Giao hàng nhớ gọi trước 5 phút',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGCGV',
    8,
    3,
    140000,
    4,
    1,
    'An Giang,Huyện Chợ Mới,Xã Nhơn Mỹ',
    18700,
    '2022-10-06',
    2,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGE6A',
    7,
    3,
    755000,
    4,
    1,
    '123/234 hẻm 3456,Phường 12,Quận 10,Hồ Chí Minh',
    55001,
    '2022-11-17',
    2,
    '',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGE89',
    10,
    3,
    598000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    55001,
    '2022-11-20',
    2,
    'Giao hàng nhớ điện trước 15 phút',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGE8D',
    12,
    6,
    440000,
    2,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-11-20',
    1,
    'Giao hàng ngoài giờ hành chính, nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGE8G',
    9,
    2,
    333000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-01-23',
    2,
    'Giao hàng ngoài giờ hành chính, nhớ gọi trước 15 phút',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGE8N',
    12,
    3,
    522000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-11-20',
    2,
    'Giao hàng ngoài giờ hành chính, nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGE8P',
    12,
    2,
    140000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-01-25',
    2,
    'Giao hàng ngoài giờ hành chính, nhớ gọi trước 15 phút',
    'Khách hàng hủy đơn (lý do): Không đủ kinh phí'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGE8U',
    9,
    3,
    508000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    52501,
    '2022-11-20',
    2,
    'Giao hàng ngoài giờ hành chính, nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGE8V',
    10,
    2,
    178000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-01-23',
    2,
    'Giao hàng nhớ điện trước 15 phút',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGEF6',
    7,
    2,
    388000,
    5,
    1,
    '123/234 hẻm 3456,Phường 13,Quận 10,Hồ Chí Minh',
    50001,
    '2022-01-22',
    1,
    'Giao hàng nhớ điện trước 15 phút',
    'Chủ gian hàng hủy đơn (lý do): Do số lượng hàng chưa về kịp ạ.'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGEFN',
    7,
    6,
    140000,
    5,
    1,
    '123/234 hẻm 3456,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-11-16',
    1,
    'Giao hàng nhớ điện trước 15 phút',
    'Khách hàng hủy (lý do): Do không đủ kinh phí mua hàng'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGEY7',
    7,
    2,
    689000,
    4,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    50001,
    '2022-01-27',
    2,
    'Giao hàng ngoài giờ hành chính, nhớ gợi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGEYF',
    7,
    3,
    260000,
    5,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    40000,
    '2022-11-20',
    1,
    'Giao hàng ngoài giờ hành chính, nhớ gợi trước 15 phút',
    'Khách hàng hủy đơn (lý do): Khô có kinh phí mua hàng'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGEYL',
    11,
    3,
    300000,
    2,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    40000,
    '2022-11-20',
    1,
    '',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGEYQ',
    11,
    2,
    268000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    45000,
    '2022-01-26',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGG6C',
    10,
    2,
    362000,
    4,
    1,
    'An Giang,Huyện Chợ Mới,Xã Nhơn Mỹ',
    64900,
    '2022-01-04',
    2,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGG6E',
    13,
    2,
    120000,
    5,
    1,
    'Hồ Chí Minh,Quận Thủ Đức,Phường Tam Bình',
    50001,
    '2022-01-06',
    1,
    '',
    'Khách hàng hủy đơn (lý do): Không đủ kinh phí'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGG6M',
    12,
    2,
    240000,
    4,
    2,
    'An Giang,Huyện Chợ Mới,Xã Nhơn Mỹ',
    0,
    '2022-01-06',
    2,
    'Giao Hàng nhớ gọi trước 15 phút',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGG6V',
    11,
    2,
    181000,
    4,
    1,
    'An Giang,Huyện Chợ Mới,Xã Nhơn Mỹ',
    18700,
    '2022-01-05',
    2,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGHFT',
    12,
    6,
    90000,
    2,
    1,
    'Hồ Chí Minh,Quận 10,Phường 13',
    22003,
    '2022-10-30',
    1,
    '',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGHFW',
    12,
    5,
    365000,
    1,
    1,
    'Hồ Chí Minh,Quận 10,Phường 13',
    22003,
    '2022-10-30',
    1,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGLUP',
    7,
    2,
    223000,
    4,
    1,
    'An Giang,Huyện Chợ Mới,Xã Nhơn Mỹ',
    40000,
    '2022-01-03',
    2,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGMDM',
    7,
    2,
    243000,
    4,
    1,
    '123/234 hẻm 3456,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-01-20',
    2,
    'Giao hàng ngoài giờ hành chính và gọi điện trước 5 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGQ4K',
    8,
    2,
    181000,
    4,
    1,
    'An Giang,Huyện Chợ Mới,Xã Nhơn Mỹ',
    35000,
    '2022-01-02',
    2,
    '',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGQ4P',
    7,
    2,
    120000,
    5,
    1,
    'An Giang,Huyện Chợ Mới,Xã Nhơn Mỹ',
    45000,
    '2022-01-01',
    1,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGQ4X',
    7,
    2,
    120000,
    4,
    1,
    'An Giang,Huyện Chợ Mới,Xã Nhơn Mỹ',
    35000,
    '2022-01-03',
    2,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGRCL',
    11,
    2,
    516000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    55001,
    '2022-01-18',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGRCQ',
    11,
    4,
    360000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    40000,
    '2022-11-13',
    2,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGRUE',
    11,
    5,
    460000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    45000,
    '2022-11-13',
    2,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGRUY',
    10,
    2,
    654000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    55001,
    '2022-01-15',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGRYF',
    9,
    2,
    410000,
    4,
    1,
    '123/65 hẻm 234,Xã Tân Thới Nhì,Huyện Hóc Môn,Hồ Chí Minh',
    55000,
    '2022-01-20',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGWKB',
    11,
    6,
    102000,
    4,
    1,
    'Hồ Chí Minh,Quận Phú Nhuận,Phường 13',
    22003,
    '2022-10-28',
    2,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLGWKW',
    11,
    6,
    376000,
    2,
    1,
    'Hồ Chí Minh,Quận Phú Nhuận,Phường 13',
    22003,
    '2022-10-28',
    1,
    '',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLULF3',
    13,
    5,
    610000,
    1,
    2,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    55000,
    '2022-11-22',
    2,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLULF4',
    13,
    5,
    494000,
    1,
    2,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    60001,
    '2022-11-22',
    2,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLULFK',
    13,
    5,
    390000,
    1,
    2,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    55000,
    '2022-11-22',
    2,
    '',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLULFT',
    13,
    5,
    336000,
    1,
    2,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    55000,
    '2022-11-22',
    2,
    'Giao hàng ngoài giờ hành chính',
    ''
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLULFU',
    13,
    5,
    480000,
    5,
    2,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    55000,
    '2022-11-22',
    2,
    '',
    'Khách hàng hủy đơn.'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLULL8',
    11,
    2,
    563000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    47500,
    '2022-02-01',
    2,
    'Giao hàng ngoài giờ hành chính, nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLULLA',
    13,
    2,
    280000,
    4,
    2,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    55000,
    '2022-01-30',
    2,
    '',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLULLK',
    12,
    3,
    600000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-11-22',
    2,
    'Giao hàng ngoài giờ hành chính, nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLULLM',
    7,
    3,
    530000,
    2,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    45000,
    '2022-11-22',
    1,
    'Giao hàng ngoài giờ hành chính và gọi điện trước 5 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLULLR',
    7,
    2,
    350000,
    4,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    47500,
    '2022-02-02',
    2,
    'Giao hàng ngoài giờ hành chính và gọi điện trước 5 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLULLW',
    12,
    2,
    586000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    60001,
    '2022-01-28',
    2,
    'Giao hàng ngoài giờ hành chính, nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUU74',
    15,
    2,
    265000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    82500,
    '2022-03-07',
    2,
    'Nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUU76',
    14,
    2,
    220000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-03-03',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUU78',
    10,
    2,
    310000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-03-14',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUU79',
    13,
    2,
    486000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    55000,
    '2022-03-02',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUU7A',
    10,
    2,
    168000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-03-12',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUU7B',
    15,
    2,
    348000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    97900,
    '2022-03-07',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUU7C',
    13,
    2,
    329000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    50001,
    '2022-03-01',
    2,
    'Giao hàng nhớ gọi điện trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUU7D',
    8,
    2,
    466000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    45000,
    '2022-03-05',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUU7H',
    13,
    2,
    381000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    55000,
    '2022-03-11',
    2,
    'Giao hàng gọi trước 5 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUU7K',
    7,
    2,
    168000,
    4,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    45000,
    '2022-03-09',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUU7L',
    12,
    2,
    270000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-02-27',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUU7N',
    14,
    2,
    250000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-03-03',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUU7P',
    8,
    2,
    395000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    45000,
    '2022-03-06',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUU7Q',
    12,
    2,
    559000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    60001,
    '2022-02-26',
    2,
    'Nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUU7R',
    8,
    2,
    260000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    40000,
    '2022-03-16',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUU7U',
    13,
    2,
    220000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    50001,
    '2022-02-27',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUU7W',
    7,
    2,
    348000,
    4,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    45000,
    '2022-03-10',
    2,
    'Giao hàng ngoài giờ hàng chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUU7X',
    13,
    2,
    299000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    55000,
    '2022-03-12',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUU7Y',
    8,
    2,
    348000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    45000,
    '2022-03-15',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUF3',
    10,
    2,
    250000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-02-17',
    2,
    'Nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUF4',
    10,
    2,
    375000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    47500,
    '2022-02-17',
    2,
    'Nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUF6',
    8,
    2,
    310000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    40000,
    '2022-02-14',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUF7',
    15,
    2,
    446000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    97900,
    '2022-02-10',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUFB',
    10,
    2,
    446000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-02-16',
    2,
    'Giao hàng ngoài giờ hanhg chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUFE',
    12,
    2,
    168000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-02-25',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUFH',
    11,
    2,
    245000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    40000,
    '2022-02-21',
    2,
    'Nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUFK',
    11,
    2,
    250000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    45000,
    '2022-02-19',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUFM',
    9,
    2,
    446000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    45000,
    '2022-02-23',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUFN',
    8,
    2,
    349000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    40000,
    '2022-02-15',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUFQ',
    14,
    2,
    448000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-02-09',
    2,
    'Nhớ gọi trước 15 phút khi giao hàng',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUFR',
    9,
    2,
    463000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    50001,
    '2022-02-23',
    2,
    'Nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUFU',
    15,
    2,
    308000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    113300,
    '2022-02-12',
    1,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUFV',
    8,
    2,
    118000,
    4,
    1,
    '123/456 hẻm 122 ,Phường Long Bình,Quận 9,Hồ Chí Minh',
    40000,
    '2022-02-13',
    1,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUFW',
    11,
    2,
    270000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    40000,
    '2022-02-20',
    2,
    'Nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUG3',
    7,
    2,
    293000,
    5,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    40000,
    '2022-03-29',
    1,
    'Giao hàng nhớ gọi trước 15 phút',
    'Khách hàng hủy đơn.'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUG4',
    7,
    2,
    378000,
    4,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    40000,
    '2022-03-30',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUG6',
    11,
    2,
    316000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    45000,
    '2022-03-24',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUG7',
    12,
    2,
    295000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-03-17',
    2,
    'Nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUG9',
    9,
    2,
    229000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-03-22',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUGB',
    15,
    2,
    470000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    97900,
    '2022-03-28',
    2,
    'Giao hàng ngoài giờ hàng chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUGC',
    9,
    2,
    130000,
    4,
    1,
    '123/65 hẻm 234,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-03-21',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUGD',
    14,
    2,
    155000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-03-26',
    2,
    'Giao hàng nhớ gọi trước 5 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUGF',
    12,
    2,
    270000,
    4,
    1,
    '235/ 34 ,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    50001,
    '2022-03-17',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUGG',
    13,
    2,
    260000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    50001,
    '2022-03-19',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUGH',
    10,
    2,
    130000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-04-02',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUGK',
    11,
    2,
    265000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    40000,
    '2022-03-31',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUGN',
    14,
    2,
    268000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-03-24',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUGP',
    15,
    2,
    218000,
    4,
    1,
    '123/99,Xã Long Sơn,Huyện Cần Đước,Long An',
    82500,
    '2022-03-27',
    2,
    'Giao hàng ngoài giờ hàng chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUGT',
    10,
    2,
    177000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    40000,
    '2022-04-02',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUGU',
    13,
    2,
    353000,
    4,
    1,
    '231/456 hẻm 45,Phường Tân Chánh Hiệp,Quận 12,Hồ Chí Minh',
    55000,
    '2022-03-20',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUGV',
    11,
    2,
    260000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    40000,
    '2022-03-23',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUUGW',
    11,
    2,
    401000,
    4,
    1,
    '56/124 hẻm 98,Phường 14,Quận 10,Hồ Chí Minh',
    45000,
    '2022-04-01',
    2,
    'Giao hàng ngoài giờ hành chính',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUULE',
    14,
    2,
    443000,
    4,
    1,
    '123 hẻm 345,Phường Hiệp Thành,Quận 12,Hồ Chí Minh',
    55000,
    '2022-02-07',
    2,
    'Nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUULF',
    7,
    2,
    168000,
    4,
    1,
    '123/234 hẻm 3456,Phường 14,Quận 11,Hồ Chí Minh',
    45000,
    '2022-02-04',
    2,
    'Giao hàng nhớ gọi trước 15 phút',
    'undefined'
  );
INSERT INTO
  `donhang` (
    `DH_id`,
    `ND_id`,
    `NB_id`,
    `DH_tongtien`,
    `DH_trangthai`,
    `DH_loaithanhtoan`,
    `DH_diachi`,
    `DH_phivanchuyen`,
    `DH_ngay`,
    `DH_trangthaiTT`,
    `DH_ghichu`,
    `DH_ghichuhuy`
  )
VALUES
  (
    'LLUULR',
    10,
    2,
    493000,
    4,
    1,
    '123/234/ hẻm 90,Phường 13,Quận 10,Hồ Chí Minh',
    50001,
    '2022-02-05',
    2,
    'Nhớ gọi trước 15 phút',
    'undefined'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: giohang
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: hinhanh
# ------------------------------------------------------------

INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    1,
    1,
    'http://localhost:5000/product/1664955059550-bc5c814e9587d312ccfa4488e81bfb93.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    2,
    1,
    'http://localhost:5000/product/1664955059555-bbc60778d98220bf2232a852c01eb662.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    3,
    1,
    'http://localhost:5000/product/1664955059562-dcd4d87358f96d662992e333933919e4.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    4,
    2,
    'http://localhost:5000/product/1664953076118-9cb6ca824920de6449cfa5b07ac5f01a.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    5,
    2,
    'http://localhost:5000/product/1664953076123-8ac0a01bac8ab95a83ecfec629512cbc.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    6,
    2,
    'http://localhost:5000/product/1664953076127-b264bdc4ba7ccf5ad0f12b9ea9d47136.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    7,
    3,
    'http://localhost:5000/product/1664950148746-48d73c3eb6146c4d144dbfd48461520d.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    8,
    3,
    'http://localhost:5000/product/1664950136844-67c656aeb9d69912823b5b433b1d42a5.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    9,
    3,
    'http://localhost:5000/product/1664950136851-90b0608c10f133bef72f9bf02eef9c86.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    10,
    4,
    'http://localhost:5000/product/1664949847394-e7bb6e64614c79a57f4f4d7a88ff7960.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    11,
    4,
    'http://localhost:5000/product/1664949847397-0ec01a9451441190fc682eaf1f09e119.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    12,
    4,
    'http://localhost:5000/product/1664949847400-09859e00592d7a3ea8d418368de656d6_tn.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    13,
    5,
    'http://localhost:5000/product/1664946586577-c7e0defc0f9058bb0a339d27a93ff2b1.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    14,
    5,
    'http://localhost:5000/product/1664946586581-9fa33cb348377de54219722cb89803c0.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    15,
    5,
    'http://localhost:5000/product/1664946586586-575323ffcc1c3f476a809833f585afc1_tn.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    16,
    6,
    'http://localhost:5000/product/1664948100568-60b12fd5bb9a0330e8f5edbe10c4fc1b.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    17,
    6,
    'http://localhost:5000/product/1665028418569-6f9ae05192462fc3f191615f8b1880e7.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    18,
    6,
    'http://localhost:5000/product/1664948100575-575323ffcc1c3f476a809833f585afc1_tn.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    19,
    7,
    'http://localhost:5000/product/1665027007292-6f1f1da2df57206b873960a700512304.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    20,
    7,
    'http://localhost:5000/product/1665027007294-365f3272dcb2199c3d836729b659e498.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    21,
    7,
    'http://localhost:5000/product/1665027007296-a3f29af683c2d3771223bd438f888315.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    22,
    8,
    'http://localhost:5000/product/1664956705581-90e2d8f50647067bc920ca607bc707e4.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    23,
    8,
    'http://localhost:5000/product/1664956705875-417f7caf9bed2c2a84a1947f0ec494fd.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    24,
    8,
    'http://localhost:5000/product/1664956706076-27520469f4b9bdcdca5c6a8685ff9477.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    25,
    9,
    'http://localhost:5000/product/1664957099558-a3f29af683c2d3771223bd438f888315.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    26,
    9,
    'http://localhost:5000/product/1664957099868-60856b90d9d141d60f7ce908b79a8959.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    27,
    9,
    'http://localhost:5000/product/1664957100054-f1bf51f572d593cba7cdf05adf80d8ac.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    28,
    10,
    'http://localhost:5000/product/1664958508494-fbe71e4fcbc5c9d788b51e3db880d7af.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    29,
    10,
    'http://localhost:5000/product/1664958508795-f4c6566f48c138b088ab10bb07f7c206.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    30,
    10,
    'http://localhost:5000/product/1664958508999-0ea0864765bf1a1884ccb8589dc308f6.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    31,
    11,
    'http://localhost:5000/product/1664958831157-ff94dc1f283e87b2653aca8975ab5e8d.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    32,
    11,
    'http://localhost:5000/product/1664958831455-1c2d204a4e0dd74359b344de9d6c1912.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    33,
    11,
    'http://localhost:5000/product/1664958831654-6f1f1da2df57206b873960a700512304.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    34,
    12,
    'http://localhost:5000/product/1664959206104-bc0161b40ee46867a8b4370d4728934f.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    35,
    12,
    'http://localhost:5000/product/1664959206413-a2c6709e5ebdfe02bd3687073573fbb6.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    36,
    12,
    'http://localhost:5000/product/1664959206599-bc9d7cdaecf245a213d5c057aabcc2cf.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    37,
    13,
    'http://localhost:5000/product/1664959568540-e8a949e4c8e3b8cc6d8f7903515534c8.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    38,
    13,
    'http://localhost:5000/product/1664959568842-c5831208fbc2cc8614bce2694077c573.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    39,
    13,
    'http://localhost:5000/product/1664959569053-cc5791c1f9b8252d48bbc94fb9efb313.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    40,
    14,
    'http://localhost:5000/product/1664959871554-6864857ec0a3e654de806eadc2aa43c7.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    41,
    14,
    'http://localhost:5000/product/1664959871853-a8e94974a77d4b59987471f6d813e923.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    42,
    14,
    'http://localhost:5000/product/1664959872056-90dfd51a10bf104ba260b0ff46d4190f.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    43,
    15,
    'http://localhost:5000/product/1664975714689-de5f708646d5f98a0c2e3c6182cd9b60.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    44,
    15,
    'http://localhost:5000/product/1664975714986-dce6a44ac023a743c699bd09ea957a74.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    45,
    15,
    'http://localhost:5000/product/1664975715184-dcd4d87358f96d662992e333933919e4.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    46,
    16,
    'http://localhost:5000/product/1664975956340-5ace0e89287355beb0f0e5deaf8dac72.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    47,
    16,
    'http://localhost:5000/product/1664975956642-a8e94974a77d4b59987471f6d813e923.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    48,
    16,
    'http://localhost:5000/product/1664975956840-6864857ec0a3e654de806eadc2aa43c7.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    49,
    17,
    'http://localhost:5000/product/1664976280551-8d1a3ecd72c5a6a0d39f2d96ef80017a.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    50,
    17,
    'http://localhost:5000/product/1664976280852-70963cd23744a53eae5fe67858c29984.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    51,
    17,
    'http://localhost:5000/product/1664976281055-a68f46f935fa1b08a92198b1264c171d.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    52,
    18,
    'http://localhost:5000/product/1664976538939-13bf5442196cd08b0e06cae1ab1898bc.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    53,
    18,
    'http://localhost:5000/product/1664976539249-c1bdc019c8ed46883f548360a7da5f0c (1).jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    54,
    18,
    'http://localhost:5000/product/1664976539452-f4c6566f48c138b088ab10bb07f7c206.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    55,
    19,
    'http://localhost:5000/product/1664976887357-07f6c42a7e5b936719905578b4979f25.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    56,
    19,
    'http://localhost:5000/product/1664976887669-479306392bc9356fa79fadbe981658c0.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    57,
    19,
    'http://localhost:5000/product/1664976887854-f5178dc64a057f29053c51b12989d123.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    58,
    20,
    'http://localhost:5000/product/1664977384452-014d2302b3e34145576497688bdb4071.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    59,
    20,
    'http://localhost:5000/product/1664977384752-9d1f5dc515bd8e5fb2e14a1ecdadb716.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    60,
    20,
    'http://localhost:5000/product/1664977384965-6f9ae05192462fc3f191615f8b1880e7.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    61,
    21,
    'http://localhost:5000/product/1664977928700-83d3646fd5ff91d1786f94bf01c75ba3.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    62,
    21,
    'http://localhost:5000/product/1664977928999-sg-11134201-22090-f2dmiuju4vhvd0.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    63,
    21,
    'http://localhost:5000/product/1664977929203-67c656aeb9d69912823b5b433b1d42a5.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    64,
    22,
    'http://localhost:5000/product/1664978249404-4b9ede8bda4149d17cef2b04f31df08a.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    65,
    22,
    'http://localhost:5000/product/1664978249701-bbe6b244ed1c8eadfdd634a92be16a6e.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    66,
    22,
    'http://localhost:5000/product/1664978249896-6864857ec0a3e654de806eadc2aa43c7.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    67,
    23,
    'http://localhost:5000/product/1664979242555-6f1f1da2df57206b873960a700512304.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    68,
    23,
    'http://localhost:5000/product/1664979242866-014d2302b3e34145576497688bdb4071.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    69,
    23,
    'http://localhost:5000/product/1664979243051-4b9ede8bda4149d17cef2b04f31df08a.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    70,
    26,
    'http://localhost:5000/product/1664980472771-46bec9a73bff772cd1b831c8a67bcaf2.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    71,
    26,
    'http://localhost:5000/product/1664980473082-c257d780f979c25b5d6840d53d37892b.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    72,
    26,
    'http://localhost:5000/product/1664980473280-6864857ec0a3e654de806eadc2aa43c7.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    73,
    27,
    'http://localhost:5000/product/1664980897747-356a09ab98171d8fabbbc1a8ac1851c6.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    74,
    27,
    'http://localhost:5000/product/1664980898050-8bdd6cc04b47f81a10ca0a172f76d387.jpg_720x720q80.jpg_.webp'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    75,
    27,
    'http://localhost:5000/product/1664980898255-b1f67b4ec1dbaa08eefd8055b6907da7.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    76,
    28,
    'http://localhost:5000/product/1664981225964-1d3977ccdafae3f88eff2377307c9304.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    77,
    28,
    'http://localhost:5000/product/1664981226265-dce6a44ac023a743c699bd09ea957a74.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    78,
    28,
    'http://localhost:5000/product/1664981226463-46bec9a73bff772cd1b831c8a67bcaf2.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    79,
    29,
    'http://localhost:5000/product/1664981478907-a87d1115ed29da4a9e4285b0b0ee310e.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    80,
    29,
    'http://localhost:5000/product/1664981479217-365f3272dcb2199c3d836729b659e498.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    81,
    29,
    'http://localhost:5000/product/1664981479402-9340f58c89775a5449a47e2a1cb0038a.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    82,
    30,
    'http://localhost:5000/product/1665026128152-bc0161b40ee46867a8b4370d4728934f.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    83,
    30,
    'http://localhost:5000/product/1665026128450-adb62a14fb1d36295f9aa7817b986620.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    84,
    30,
    'http://localhost:5000/product/1665026128654-b1a809cdf38c1567b949acbae88910e4.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    85,
    31,
    'http://localhost:5000/product/1665026363291-7d43ef86c25692efc36295c2b1a116ac.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    86,
    31,
    'http://localhost:5000/product/1665026363589-0aef132a1ca3f44ededaf89c677bf05e.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    87,
    31,
    'http://localhost:5000/product/1665026363791-bc0161b40ee46867a8b4370d4728934f.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    88,
    32,
    'http://localhost:5000/product/1665026669302-e976633b9af59786287369e6f9e0f2f2.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    89,
    32,
    'http://localhost:5000/product/1665026669600-5cd2d756b5586e3c66719612c2a43399.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    90,
    32,
    'http://localhost:5000/product/1665026669801-9eedc0aa5a4bc66c841c5f67a33ca81f.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    91,
    33,
    'http://localhost:5000/product/1665027362349-27520469f4b9bdcdca5c6a8685ff9477.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    92,
    33,
    'http://localhost:5000/product/1665027362639-36b301e7cc0172c8202a99ef4ac35856.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    93,
    33,
    'http://localhost:5000/product/1665027362842-302f390d89f9fd0945988dc00c113983.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    94,
    34,
    'http://localhost:5000/product/1665027513534-0b9e033c2f591ca05d75ad574f0abbc8.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    95,
    34,
    'http://localhost:5000/product/1665027513831-46ea8875e14acda63662a039c9a00b2d.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    96,
    34,
    'http://localhost:5000/product/1665027514030-302f390d89f9fd0945988dc00c113983.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    97,
    35,
    'http://localhost:5000/product/1665027748664-c40ff1050480319f5181cd823792a6cf.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    98,
    35,
    'http://localhost:5000/product/1665027748979-96ec8933112b63f5e3dbbd71c5e290cd.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    99,
    35,
    'http://localhost:5000/product/1665027749164-69f1f788ed13d5d021ee91c4ee94962e.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    100,
    36,
    'http://localhost:5000/product/1665028001655-bf6a69d71c1d433d3d1fb6a14760d16c.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    101,
    36,
    'http://localhost:5000/product/1665028001965-d9236d4fb36206cba16b8813d83796ea.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    102,
    36,
    'http://localhost:5000/product/1665028002151-9fe706821860c615b44418a0916029f9.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    103,
    37,
    'http://localhost:5000/product/1665028217144-sg-11134201-22090-fhu0vi1p5xhv35.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    104,
    37,
    'http://localhost:5000/product/1665028217454-2a94122802ab25eab011043e8e68fa03.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    105,
    37,
    'http://localhost:5000/product/1665028217646-bf6a69d71c1d433d3d1fb6a14760d16c.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    106,
    38,
    'http://localhost:5000/product/1665028983024-56adebce96159bc634820af4c5c79bf8.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    107,
    38,
    'http://localhost:5000/product/1665028983339-b850a89f4130d708649e8d699b2ebc50.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    108,
    38,
    'http://localhost:5000/product/1665028983526-761e4e8a2ebc57f037aee70dad5da26a.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    109,
    39,
    'http://localhost:5000/product/1665029154815-48a55e8a575481195c43ddcaec474ee1.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    110,
    39,
    'http://localhost:5000/product/1665029155118-ecbb8d90f832fd568fe8387c13b54927.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    111,
    39,
    'http://localhost:5000/product/1665029155326-f06ffbef21cef2ba3de751ac76def3b8.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    112,
    40,
    'http://localhost:5000/product/1665029317464-1bca9a08905b2b1c8680a37baa1d6350.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    113,
    40,
    'http://localhost:5000/product/1665029317760-c88084b4d826d5bd6ee192e335a8bdb7.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    114,
    40,
    'http://localhost:5000/product/1665029317966-2a94122802ab25eab011043e8e68fa03.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    115,
    41,
    'http://localhost:5000/product/1665029504858-fed061824246a06d37b50c68c0a73ecb.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    116,
    41,
    'http://localhost:5000/product/1665029505158-761e4e8a2ebc57f037aee70dad5da26a.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    117,
    41,
    'http://localhost:5000/product/1665029505360-ecbb8d90f832fd568fe8387c13b54927.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    118,
    42,
    'http://localhost:5000/product/1665029845609-52afec28ac0d27a085c5ab17404c06a0.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    119,
    42,
    'http://localhost:5000/product/1665029845901-6256dc4ec9f9d2d949cb1a1afed7e346.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    120,
    42,
    'http://localhost:5000/product/1665029846103-1bca9a08905b2b1c8680a37baa1d6350.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    121,
    43,
    'http://localhost:5000/product/1665030072636-4eaec1478e6a852958d0f8796849da8c.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    122,
    43,
    'http://localhost:5000/product/1665030072940-761e4e8a2ebc57f037aee70dad5da26a.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    123,
    43,
    'http://localhost:5000/product/1665030073148-ba5b0699a84013d563935f00881d798b.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    124,
    44,
    'http://localhost:5000/product/1665030251900-37cb8c4ce7f0f2de4df92f8eb7bc7c42.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    125,
    44,
    'http://localhost:5000/product/1665030252200-fa7e12298e91b4440fde4e94eb19fd94.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    126,
    44,
    'http://localhost:5000/product/1665030252403-cb76149cf5dbf6fde2a74bc4317a58ca.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    127,
    45,
    'http://localhost:5000/product/1665030470419-46ea8875e14acda63662a039c9a00b2d.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    128,
    45,
    'http://localhost:5000/product/1665030470717-4413c84cb93ac620e7821df63cfb4f74.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    129,
    45,
    'http://localhost:5000/product/1665030470924-d842051b1c1980adade999550b0b0c43.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    130,
    46,
    'http://localhost:5000/product/1665030646692-c88084b4d826d5bd6ee192e335a8bdb7.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    131,
    46,
    'http://localhost:5000/product/1665030646991-9fe706821860c615b44418a0916029f9.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    132,
    46,
    'http://localhost:5000/product/1665030647192-sg-11134201-22100-wl94l1sqr9hv75.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    133,
    47,
    'http://localhost:5000/product/1665030850891-b6d1f0f6afbf5d1034eba522bb744afb.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    134,
    47,
    'http://localhost:5000/product/1665030851184-a20df83ff23dcb2c1fad6fe686f8b084.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    135,
    47,
    'http://localhost:5000/product/1665030851387-f1d2d447ed4508b5cd5bcb4a10458de8.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    136,
    48,
    'http://localhost:5000/product/1665031109011-2ce6d53bbd869daa64d171337f867a4e.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    137,
    48,
    'http://localhost:5000/product/1665031109322-390e7c31e4a7856d3ead166d181e6af4.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    138,
    48,
    'http://localhost:5000/product/1665031109523-d8ee5a0a56c09d7afb5acde38c63ac0d.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    139,
    49,
    'http://localhost:5000/product/1665031348615-65b8e8ac4eba13596b53dc3bf404c2e6.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    140,
    49,
    'http://localhost:5000/product/1665031348914-c9c9895e1dc9d19e4de6da727e818f01.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    141,
    49,
    'http://localhost:5000/product/1665031349117-b6d1f0f6afbf5d1034eba522bb744afb.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    142,
    50,
    'http://localhost:5000/product/1665031552245-f14b1d6cb603a4a2d8d1e4c76e932e23.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    143,
    50,
    'http://localhost:5000/product/1665031552542-5f4f2fdb2f315567ea42e401637e4fc3.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    144,
    50,
    'http://localhost:5000/product/1665031552745-72015b10cbc4b691310991622aba3a8e.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    145,
    51,
    'http://localhost:5000/product/1665031739699-006a5dbb9fd2e4ec4fb69898782d2fff.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    146,
    51,
    'http://localhost:5000/product/1665031739994-debab76c671e4d083ac680ba06a308e1.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    147,
    51,
    'http://localhost:5000/product/1665031740197-4bb1793cb63a19b65d36ee17e48c877e.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    148,
    52,
    'http://localhost:5000/product/1665031895826-69af616b5a515f15b8465718532626da.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    149,
    52,
    'http://localhost:5000/product/1665031896119-2b33b9ece70882e05bf9b9a5c7d19526.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    150,
    52,
    'http://localhost:5000/product/1665031896318-b94584547a520df95ac99a260db7a425.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    151,
    53,
    'http://localhost:5000/product/1665032049448-006a5dbb9fd2e4ec4fb69898782d2fff.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    152,
    53,
    'http://localhost:5000/product/1665032049741-48a55e8a575481195c43ddcaec474ee1.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    153,
    53,
    'http://localhost:5000/product/1665032049935-620bcd61fa812e53d213b7af224028e5.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    154,
    54,
    'http://localhost:5000/product/1665032244660-d9e62ff150c85233e8cbc86df10bcaa0.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    155,
    54,
    'http://localhost:5000/product/1665032244959-sg-11134201-22090-ruwhiuiz4yhvdf.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    156,
    54,
    'http://localhost:5000/product/1665032245168-5d7fe1751fe0a82a6726f1f27a5b968f.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    157,
    55,
    'http://localhost:5000/product/1665032996188-6010449eacc7914815956dded03dac8f.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    158,
    55,
    'http://localhost:5000/product/1665032996489-69f1f788ed13d5d021ee91c4ee94962e.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    159,
    55,
    'http://localhost:5000/product/1665032996691-2541eebbd3dfc9b97a24568597963b23.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    160,
    56,
    'http://localhost:5000/product/1665033258805-9f7590db0dac2618bd5f56dc600704b7.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    161,
    56,
    'http://localhost:5000/product/1665033259111-4bb1793cb63a19b65d36ee17e48c877e.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    162,
    56,
    'http://localhost:5000/product/1665033259308-36b301e7cc0172c8202a99ef4ac35856.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    163,
    57,
    'http://localhost:5000/product/1665033453716-d52e5938dd41788682cdcee1dfda8a10.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    164,
    57,
    'http://localhost:5000/product/1665033454003-006a5dbb9fd2e4ec4fb69898782d2fff.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    165,
    57,
    'http://localhost:5000/product/1665033454208-36b301e7cc0172c8202a99ef4ac35856.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    166,
    58,
    'http://localhost:5000/product/1665033688704-769e033c32b684d2245e5c05d38d68ed.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    167,
    58,
    'http://localhost:5000/product/1665033689016-88130ac86bfbfed4e584c002127048bb.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    168,
    58,
    'http://localhost:5000/product/1665033689202-853dca79c30d6f162ccaed741571008e.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    169,
    59,
    'http://localhost:5000/product/1665033947340-6525c58e395f8314fdbf5400e3fc00e7.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    170,
    59,
    'http://localhost:5000/product/1665033947636-a0b1b8224cbeb5bdc56c07ec72b0b0dd.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    171,
    59,
    'http://localhost:5000/product/1665033947837-4eaec1478e6a852958d0f8796849da8c.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    172,
    60,
    'http://localhost:5000/product/1665034092850-fe1b381e18296dd9f6520d9f5f868dbd.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    173,
    60,
    'http://localhost:5000/product/1665034093149-8e22b4c4237459be829b8f315a3efa44.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    174,
    60,
    'http://localhost:5000/product/1665034093351-2b33b9ece70882e05bf9b9a5c7d19526.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    175,
    61,
    'http://localhost:5000/product/1666513070307-57f402f3051e2da0b822171de125b93a.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    176,
    61,
    'http://localhost:5000/product/1666513070606-5671947a4103fbb147bcf6d92764c42a.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    177,
    61,
    'http://localhost:5000/product/1666513070806-6d608d9fd8764a8f9bfdd80c153eab36.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    178,
    62,
    'http://localhost:5000/product/1666513435227-7fbc22f58b452c8804fa48827053bc03.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    179,
    62,
    'http://localhost:5000/product/1666513435523-43e73eb03f97af3934cb3027ef5e0b85.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    180,
    62,
    'http://localhost:5000/product/1666513435724-57f402f3051e2da0b822171de125b93a.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    181,
    63,
    'http://localhost:5000/product/1666513675897-c49719a06abd5bd6e9a245721791fc9b.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    182,
    63,
    'http://localhost:5000/product/1666513676210-32f4597fd07c71737cfd0be844cf1601.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    183,
    63,
    'http://localhost:5000/product/1666513676410-8a59fc8ce539226201c3d545584b1fe5.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    184,
    64,
    'http://localhost:5000/product/1666513848738-63a571cc8c955b1448dc0c54e0d18e7a.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    185,
    64,
    'http://localhost:5000/product/1666513849041-ba36956a4f770387a779c75d1d11291b.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    186,
    64,
    'http://localhost:5000/product/1666513849239-60b79f212a011ff8c95b78b66582eeff.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    187,
    65,
    'http://localhost:5000/product/1666514162635-61f0701bdc6934d26f2508c661b17fa1.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    188,
    65,
    'http://localhost:5000/product/1666514162936-73d43191415ffef8ed6e530607f77282.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    189,
    65,
    'http://localhost:5000/product/1666514163141-ba36956a4f770387a779c75d1d11291b.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    190,
    66,
    'http://localhost:5000/product/1666515402630-42e3cf5a9d34e469e0c8a57a2bc2d3bd.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    191,
    66,
    'http://localhost:5000/product/1666515403380-b818d5ef91e8def876b4a855da8b41ce.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    192,
    66,
    'http://localhost:5000/product/1666515403382-df10476bd8bed6ba1ab329a31305f3f0.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    193,
    67,
    'http://localhost:5000/product/1666515579489-e86b022aeeff69f68fc47ef802f11484.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    194,
    67,
    'http://localhost:5000/product/1666515579781-5ac311499ab2eb4b2568e38fa5b14f8e.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    195,
    67,
    'http://localhost:5000/product/1666515579986-7b3c11d12c47b44cb3cc00b9c9e1a606.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    196,
    68,
    'http://localhost:5000/product/1666515802445-bd9077778c4a10cbb30f03a3621082db.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    197,
    68,
    'http://localhost:5000/product/1666515802741-b818d5ef91e8def876b4a855da8b41ce.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    198,
    68,
    'http://localhost:5000/product/1666515802943-19fe8cc54b8ccbe147c6de017c4a30c4.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    199,
    69,
    'http://localhost:5000/product/1666515997111-64533fdada94a5cf064b76a39ba7af93.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    200,
    69,
    'http://localhost:5000/product/1666515997409-ad0e47e99608fac7df8e8d37ebf03f27.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    201,
    69,
    'http://localhost:5000/product/1666515997614-28e82d65abaff0b81f0f91e3f906f2d5.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    202,
    70,
    'http://localhost:5000/product/1666618586911-502a84d4127a274217c54d2095c7644c.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    203,
    70,
    'http://localhost:5000/product/1666618587216-38120308fcdce3428015e8a6f4a172d1.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    204,
    70,
    'http://localhost:5000/product/1666618587416-362a79961418bd4e472c54853b220c0e.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    205,
    71,
    'http://localhost:5000/product/1666619085086-760f9bcf46f18736115ed00d7696a4a3.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    206,
    71,
    'http://localhost:5000/product/1666619085386-070b15605c6496f37ab8294e212b73ed.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    207,
    71,
    'http://localhost:5000/product/1666619085594-c49719a06abd5bd6e9a245721791fc9b.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    208,
    72,
    'http://localhost:5000/product/1666619495130-a5bd602309a53da26c9c6ab26429f187.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    209,
    72,
    'http://localhost:5000/product/1666619495430-3c6d12e8be3376ad0e589b681d6651bd.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    210,
    72,
    'http://localhost:5000/product/1666619495631-6d608d9fd8764a8f9bfdd80c153eab36.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    211,
    73,
    'http://localhost:5000/product/1666619855911-48f5b7c8573fe9b09b607779a9bf8a3d.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    212,
    73,
    'http://localhost:5000/product/1666619856222-b4dad5c5db51a3a1c209aec55d48c6d5.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    213,
    73,
    'http://localhost:5000/product/1666619856425-c523909930a075fbe52185d1daef0b84.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    214,
    74,
    'http://localhost:5000/product/1666620197039-fad417d7663795a082b392c5feba6d61.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    215,
    74,
    'http://localhost:5000/product/1666620197333-e42b5edc9ab6bf6ba3bdecf5639756fd.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    216,
    74,
    'http://localhost:5000/product/1666620197531-c523909930a075fbe52185d1daef0b84.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    217,
    75,
    'http://localhost:5000/product/1666857826480-db309b5c65740658e0b583d370d80955.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    218,
    75,
    'http://localhost:5000/product/1666857826770-77b80be908ace2af973cd41a2b9ff695.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    219,
    75,
    'http://localhost:5000/product/1666857826975-e1a4e2cbd810dee85c44cad751fa81d8.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    220,
    76,
    'http://localhost:5000/product/1666858071978-c49719a06abd5bd6e9a245721791fc9b.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    221,
    76,
    'http://localhost:5000/product/1666858072273-db309b5c65740658e0b583d370d80955.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    222,
    76,
    'http://localhost:5000/product/1666858072477-43e19f693cb66f35d3a7f9d24c6dd60e.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    223,
    77,
    'http://localhost:5000/product/1666858195950-23c4082b01bd71d0bd6528981d96d1f8.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    224,
    77,
    'http://localhost:5000/product/1666858196253-8ded86a4ee2d99af147f1ee264e7055f.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    225,
    77,
    'http://localhost:5000/product/1666858196448-28ea0da2aff62a7d790696cbae2172ef.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    226,
    78,
    'http://localhost:5000/product/1666858402411-f88b444fed97ce83c34c0d8d3ab996d4.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    227,
    78,
    'http://localhost:5000/product/1666858402710-af71b531d6876b1ec7b814f9c8ee341b.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    228,
    78,
    'http://localhost:5000/product/1666858402911-ad60b3cb08a40eebab42c7c55c4a4476.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    229,
    79,
    'http://localhost:5000/product/1666858641414-sg-11134201-22100-11mcn0mmikiv21.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    230,
    79,
    'http://localhost:5000/product/1666858641712-e27af174c2b0e1ade6a1226b0c340538.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    231,
    79,
    'http://localhost:5000/product/1666858641912-fad417d7663795a082b392c5feba6d61.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    232,
    80,
    'http://localhost:5000/product/1666964233701-6f9ae05192462fc3f191615f8b1880e7.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    233,
    80,
    'http://localhost:5000/product/1666964234002-5ae7210d56a92df9658b16d8783bf630.jfif'
  );
INSERT INTO
  `hinhanh` (`HA_id`, `SP_id`, `HA_image`)
VALUES
  (
    234,
    80,
    'http://localhost:5000/product/1666964234203-4b9fa88d13276acdee1651907e46e26c.jfif'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: khachhang
# ------------------------------------------------------------

INSERT INTO
  `khachhang` (`ND_id`, `ND_NG_id`)
VALUES
  (1, 7);
INSERT INTO
  `khachhang` (`ND_id`, `ND_NG_id`)
VALUES
  (2, 8);
INSERT INTO
  `khachhang` (`ND_id`, `ND_NG_id`)
VALUES
  (3, 9);
INSERT INTO
  `khachhang` (`ND_id`, `ND_NG_id`)
VALUES
  (4, 10);
INSERT INTO
  `khachhang` (`ND_id`, `ND_NG_id`)
VALUES
  (5, 11);
INSERT INTO
  `khachhang` (`ND_id`, `ND_NG_id`)
VALUES
  (6, 12);
INSERT INTO
  `khachhang` (`ND_id`, `ND_NG_id`)
VALUES
  (7, 13);
INSERT INTO
  `khachhang` (`ND_id`, `ND_NG_id`)
VALUES
  (14, 14);
INSERT INTO
  `khachhang` (`ND_id`, `ND_NG_id`)
VALUES
  (15, 15);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: khuyenmai
# ------------------------------------------------------------

INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (1, 1, '2022-10-28', '2022-11-06', 10);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (2, 2, '2022-10-28', '2022-11-30', 5);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (3, 4, '2022-10-28', '2022-11-30', 5);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (4, 7, '2022-11-05', '2022-12-30', 4);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (5, 13, '2022-11-05', '2022-12-30', 5);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (6, 17, '2022-11-01', '2022-12-30', 5);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (7, 20, '2022-10-29', '2022-12-29', 4);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (8, 21, '2022-10-25', '2022-12-25', 5);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (9, 27, '2022-10-15', '2022-12-15', 5);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (10, 28, '2022-10-20', '2022-12-20', 3);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (11, 29, '2022-10-21', '2022-12-21', 6);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (12, 31, '2022-10-28', '2022-12-28', 4);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (13, 32, '2022-10-23', '2022-12-23', 10);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (14, 35, '2022-10-17', '2022-12-17', 17);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (15, 36, '2022-10-26', '2022-12-26', 38);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (16, 40, '2022-10-22', '2022-12-22', 10);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (17, 45, '2022-10-27', '2022-12-27', 10);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (18, 46, '2022-10-25', '2022-12-21', 10);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (19, 47, '2022-10-24', '2022-12-25', 37);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (20, 48, '2022-10-19', '2022-12-19', 12);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (21, 53, '2022-10-17', '2022-12-10', 10);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (22, 55, '2022-10-18', '2022-12-26', 10);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (23, 56, '2022-10-13', '2022-12-22', 7);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (24, 58, '2022-10-29', '2022-12-29', 10);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (25, 59, '2022-10-12', '2022-12-12', 10);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (26, 60, '2022-10-24', '2022-12-28', 10);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (27, 61, '2022-10-24', '2022-12-25', 10);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (28, 62, '2022-10-24', '2022-12-19', 10);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (29, 63, '2022-10-17', '2022-11-30', 33);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (30, 64, '2022-10-18', '2022-12-26', 7);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (31, 71, '2022-10-13', '2022-12-10', 20);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (32, 72, '2022-10-24', '2022-12-29', 10);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (33, 73, '2022-10-14', '2022-12-04', 20);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (34, 75, '2022-10-24', '2022-12-19', 10);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (35, 78, '2022-10-17', '2022-11-30', 18);
INSERT INTO
  `khuyenmai` (
    `KM_id`,
    `SP_id`,
    `KM_tungay`,
    `KM_denngay`,
    `KM_phantram`
  )
VALUES
  (36, 79, '2022-10-18', '2022-12-26', 5);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: link
# ------------------------------------------------------------

INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    1,
    1,
    'Khám phá làng nghề mộc Chợ Thủ An Giang',
    'https://thuviengo.vn/kham-pha-lang-nghe-moc-cho-thu-an-giang.html'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    2,
    1,
    'Làng mộc Chợ Thủ, An Giang – Đệ nhất tinh hoa vùng Tây Nam Bộ',
    'https://topnoithat.com/lang-moc-cho-thu-an-giang-de-nhat-tinh-hoa-vung-tay-nam-bo/'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    4,
    1,
    'TINH HOA NGHỀ MỘC CHỢ THỦ',
    'https://scov.gov.vn/ban-sac-van-hoa/tinh-hoa-nghe-moc-cho-thu.html'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    5,
    1,
    'Làng nghề mộc Chợ Thủ và những thăng trầm',
    'https://nghethucongvn.blogspot.com/2013/05/lang-nghe-moc-cho-thu-va-nhung-thang.html'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    6,
    1,
    'Tìm hiểu về các làng nghề thủ công truyền thống tại An Giang',
    'https://angiangtourist.vn/tim-hieu-ve-cac-lang-nghe-thu-cong-truyen-thong-tai-an-giang/#:~:text=L%C3%A0ng%20ngh%E1%BB%81%20m%E1%BB%99c%20Ch%E1%BB%A3%20Th%E1%BB%A7%20X%C3%A3%20Long%20%C4%90i%E1%BB%81n,r%E1%BB%ABng%2C%20g%E1%BB%97%20c%C3%B4ng%20nghi%E1%BB%87p%2C%20nh%C3%B4m%2C%20mica%20v%C3%A0%20cimen%E2%80%A6'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    7,
    1,
    '\nNGHỀ MỘC CHỢ THỦ XƯA VÀ NAY',
    'https://sanphamchomoi.vn/tintuc/nghe-moc-cho-thu-xua-va-nay/'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    8,
    1,
    'Tinh hoa của chợ nghề mộc',
    'https://nghemoc.vn/blogs/news/kham-pha-cho-nghe-moc-cho-thu-an-giang'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    9,
    2,
    'Sức sống của tranh kiếng',
    'https://baovinhlong.com.vn/nhip-song-dong-bang/201801/suc-song-cua-tranh-kieng-2875687/#:~:text=Huy%E1%BB%87n%20Ch%E1%BB%A3%20M%E1%BB%9Bi%20%28An%20Giang%29%20c%C3%B3%20l%C3%A0ng%20tranh,ng%E1%BB%ABng%2C%20nh%E1%BA%A5t%20l%C3%A0%20trong%20nh%E1%BB%AFng%20ng%C3%A0y%20gi%C3%A1p%20T%E1%BA%BFt.'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    10,
    2,
    'Nghề truyền thống ở Long Điền B, vẽ tranh trên kiếng',
    'http://covattinhhoa.vn/news/detail/723/nghe-truyen-thong-o-long-dien-b-ve-tranh-tren-kieng.cvth'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    11,
    2,
    'làng tranh kiếng nổi tiếng với bề dày trăm năm',
    'https://sanphamchomoi.vn/tintuc/suc-song-cua-tranh-kieng/'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    12,
    2,
    'Níu giữ nghề xưa: Tranh kiếng Chợ Mới trở lại',
    'https://thanhnien.vn/niu-giu-nghe-xua-tranh-kieng-cho-moi-tro-lai-post739326.html'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    13,
    2,
    'Xứ Cù Lao với làng nghề làm tranh kiếng',
    'https://blog.mytour.vn/bai-viet/xu-cu-lao-voi-lang-nghe-lam-tranh-kieng.html'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    14,
    2,
    'nghề làm Tranh Kiếng ở Nam Bộ',
    'https://www.noron.vn/post/lang-nghe-lam-tranh-kieng-o-nam-bo-nguoi-khmer-620r99hy1w'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    15,
    2,
    'TRANH KIẾNG TRUYỀN THỐNG Ở CHỢ MỚI, AN GIANG',
    'https://baotangphunu.com/en/tranh-kieng-truyen-thong-o-cho-moi-an-giang_en/'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    16,
    3,
    'Giới thiệu làng nghề đóng xuồng ghe Mỹ Hiệp',
    'https://sanphamchomoi.vn/tintuc/gioi-thieu-lang-nghe-dong-xuong-ghe-my-hiep/'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    17,
    3,
    'Làng nghề đóng xuồng Mỹ Hiệp vào mùa',
    'https://baoangiang.com.vn/lang-nghe-dong-xuong-my-hiep-vao-mua-a230983.html'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    18,
    3,
    'Sôi động làng nghề đóng xuồng Mỹ Hiệp vào mùa nước nổi',
    'https://dangcongsan.vn/xa-hoi/soi-dong-lang-nghe-dong-xuong-my-hiep-vao-mua-nuoc-noi-202183.html'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    19,
    3,
    'Nhộn nhịp làng nghề đóng xuồng, ghe mùa nước nổi',
    'https://baovinhlong.vn/nhip-song-dong-bang/201710/nhon-nhip-lang-nghe-dong-xuong-ghe-mua-nuoc-noi-2855933/'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    20,
    4,
    'Thêm việc làm, thêm thu nhập',
    'https://baoangiang.com.vn/them-viec-lam-them-thu-nhap-a256382.html'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    21,
    4,
    'Tìm hiểu thêm Nghề đan giỏ ni-lon xã Tấn Mỹ, huyện Chợ Mới, tỉnh An Giang',
    'http://vannghe.angiang.gov.vn/nghe-dan-gio-ni-lon-xa-tan-my-huyen-cho-moi-tinh-an-giang/'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    22,
    4,
    'TIN TỨC Nghề đan giỏ nilon xã Tấn Mỹ',
    'https://www.angiang.dcs.vn/Lists/Tintuc/DispForm.aspx?ID=58'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    23,
    4,
    'Làm giàu từ nghề đan giỏ trạc',
    'https://thanhnien.vn/lam-giau-tu-nghe-dan-gio-trac-post620005.html'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    24,
    5,
    'Tìm hiểu Làng nghề đan đát xã Long Giang',
    'https://sanphamchomoi.vn/tintuc/lang-nghe-dan-dat-xa-long-giang/'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    25,
    5,
    'Giữ gìn nghề đan đát Long Giang – Chợ Mới',
    'https://angiang.gov.vn/wps/wcm/connect/an+giang+portal-vi/sa-dulich/e21fcd1a-b8f9-4da7-8af0-a58da126f465'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    26,
    5,
    'Sức sống làng nghề đan đát Long Giang ',
    'https://baocantho.com.vn/suc-song-lang-nghe-dan-dat-long-giang-a130816.html'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    27,
    5,
    'Khuyến công An Giang hỗ trợ làng nghề đan đát Long Giang phát triển',
    'https://langngheviet.com.vn/khuyen-cong/khuyen-cong-an-giang-ho-tro-lang-nghe-dan-dat-long-giang-phat-trien.html28452'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    28,
    5,
    'Nhịp sống bình yên ở làng nghề đan đát',
    'https://baoangiang.com.vn/nhip-song-binh-yen-o-lang-nghe-dan-dat-a347133.html'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    29,
    5,
    'Làng nghề đan lát Long Giang - An Giang: Khơi dậy tiềm năng phát triển sản phẩm OCOP',
    'https://ocopvietnam.com.vn/hanh-trinh-ocop/lang-nghe-dan-lat-long-giang-an-giang-khoi-day-tiem-nang-phat-trien-san-pham-ocop.html30029'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    30,
    6,
    'Giới thiệu làng nghề chằm nón lá Hòa Bình',
    'https://sanphamchomoi.vn/tintuc/gioi-thieu-lang-nghe-cham-non-la-hoa-binh/#:~:text=L%C3%A0ng%20ngh%E1%BB%81%20ch%E1%BA%B1m%20n%C3%B3n%20l%C3%A1%20H%C3%B2a%20B%C3%ACnh%20%C4%91%C6%B0%E1%BB%A3c,%C4%91%C6%B0%E1%BB%A3c%20334%20lao%20%C4%91%E1%BB%99ng%20tham%20gia%20l%C3%A0m%20ngh%E1%BB%81.'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    31,
    6,
    'Tìm hiểu thêm về Nghề chằm nón lá Hòa Bình',
    'https://dantocmiennui.vn/nghe-cham-non-la-hoa-binh/118537.html'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    32,
    6,
    'An Giang: Làng nghề truyền thống chằm nón lá Hòa An',
    'https://langngheviet.com.vn/lang-nghe-nghe-nhan/an-giang-lang-nghe-truyen-thong-cham-non-la-hoa-an.html11154'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    33,
    6,
    'Tiềm năng địa phương - Nghề chằm nón lá Hòa Bình',
    'https://vietnam.vnanet.vn/vietnamese/tin-tuc/nghe-cham-non-la-hoa-binh-138161.html'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    34,
    6,
    'Giữ hồn quê hương trong chiếc nón lá',
    'https://baoangiang.com.vn/giu-hon-que-huong-trong-chiec-non-la-a345104.html'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    35,
    6,
    'Các làng nghề sản xuất nón lá nổi tiếng ở Việt Nam',
    'https://www.dasaque.com/tu-hao-non-la-viet-nam-san-xuat-cung-ung-mua-ban-dai-ly-phan-phoi-sao-cho-xung-tam/'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    36,
    7,
    'Tìm hiểu thêm về Nghề làm khô cá lóc ở An Giang',
    'https://chodokho.com/tap-chi-am-thuc-cho-do-kho/nghe-lam-kho-ca-loc-o-an-giang.html'
  );
INSERT INTO
  `link` (`LI_id`, `QB_id`, `LI_tieude`, `LI_link`)
VALUES
  (
    37,
    7,
    'Khô cá lóc ẩm thực an giang',
    'https://sites.google.com/site/amthuc13gt1/cho-moi/kho-ca-loc'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: motashop
# ------------------------------------------------------------

INSERT INTO
  `motashop` (
    `MTS_id`,
    `NB_id`,
    `MTS_logo`,
    `MTS_ten`,
    `MTS_image`,
    `MTS_diachi`,
    `MTS_chitiet`,
    `MTS_clientId`
  )
VALUES
  (
    '119227',
    2,
    'http://localhost:5000/shop/1668134741787-KhoChuBay.png',
    'KhoChuBay',
    'http://localhost:5000/shop/1668934066032-8e22b4c4237459be829b8f315a3efa44.jfif',
    'Xã Long Kiến,Huyện Chợ Mới,An Giang',
    '234. Ấp Long Thạnh 2',
    'Ae9pDuj562DAY1aNt0PoQo2QKPqOaImPizoS8zwmvkEcjhUmtMUulchzjwnKVv5kxvnKGM-9VK2Xwom4'
  );
INSERT INTO
  `motashop` (
    `MTS_id`,
    `NB_id`,
    `MTS_logo`,
    `MTS_ten`,
    `MTS_image`,
    `MTS_diachi`,
    `MTS_chitiet`,
    `MTS_clientId`
  )
VALUES
  (
    '119269',
    3,
    'http://localhost:5000/shop/1664955761692-Thank Kho.png',
    'Thanh Khô',
    'http://localhost:5000/shop/1664955761675-0ec01a9451441190fc682eaf1f09e119.jfif',
    'An Giang,Huyện Chợ Mới,Xã Long Kiến',
    'số 275, ấp Long Bình',
    'Add7MzVqf2vOKiZJGZMm8MoOeC4PN9qeE_HyNVXSICknw5Aoam5zhpWzR5Hkdxu_rSxld4gyfXih4n4Z'
  );
INSERT INTO
  `motashop` (
    `MTS_id`,
    `NB_id`,
    `MTS_logo`,
    `MTS_ten`,
    `MTS_image`,
    `MTS_diachi`,
    `MTS_chitiet`,
    `MTS_clientId`
  )
VALUES
  (
    '119407',
    4,
    'http://localhost:5000/shop/1664960177274-ThanhSang.png',
    'ThanhSang',
    'http://localhost:5000/shop/1664960177259-d4a6f5105502c14ec1dc02981263f5e3_tn.jfif',
    'An Giang,Huyện Chợ Mới,Xã Long Kiến',
    '233, ấp Long Bình',
    'AQzORcbkOhYjiyrBNWdvAYgXgfLJ8IEQkOfBuJWUpG1BMo6R6ceecx55hc5ry0zugLfyozEVS16IWEe8'
  );
INSERT INTO
  `motashop` (
    `MTS_id`,
    `NB_id`,
    `MTS_logo`,
    `MTS_ten`,
    `MTS_image`,
    `MTS_diachi`,
    `MTS_chitiet`,
    `MTS_clientId`
  )
VALUES
  (
    '119470',
    5,
    'http://localhost:5000/shop/1664977469448-LinhPinKHouse.png',
    'LinhPinkHouse',
    'http://localhost:5000/shop/1664977469438-479306392bc9356fa79fadbe981658c0.jfif',
    'An Giang,Huyện Chợ Mới,Xã Long Kiến',
    '235. ấp Long Thạnh',
    'AYZwkeYrKc18rGFbp63tt1gWjA6UH7LF5wnfRy0Ghm7R3rc0UbLF4Q8AIwYEns9hS-S7bEPuUcNVwH0F'
  );
INSERT INTO
  `motashop` (
    `MTS_id`,
    `NB_id`,
    `MTS_logo`,
    `MTS_ten`,
    `MTS_image`,
    `MTS_diachi`,
    `MTS_chitiet`,
    `MTS_clientId`
  )
VALUES
  (
    '119563',
    6,
    'http://localhost:5000/shop/1664980642605-Nguyen123.png',
    'Nguyen123',
    'http://localhost:5000/shop/1664980642584-4b9fa88d13276acdee1651907e46e26c.jfif',
    'An Giang,Huyện Chợ Mới,Xã Long Kiến',
    '245. ẤP LONG THẠNH',
    'AZ0k-1oquNl5Xxo-AynQ_5p_adtVIpidHcT81sHu_4CVvcpUKgienDpD5lVbGBMNOPCR7OqG5k1tgq-i'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: nguoidung
# ------------------------------------------------------------

INSERT INTO
  `nguoidung` (
    `ND_id`,
    `ND_hoten`,
    `ND_username`,
    `ND_password`,
    `ND_image`,
    `ND_email`,
    `ND_diachi`,
    `ND_ngayDK`,
    `ND_sdt`,
    `ND_quyen`,
    `ND_trangthai`,
    `ND_ghichu`
  )
VALUES
  (
    1,
    'Thanh tung',
    'thanh123',
    '1234567',
    'http://localhost:5000/customers/1665906167736-Admin.png',
    'tunha1234@gmail.com',
    'Can tho',
    '2022-09-17',
    918814027,
    0,
    1,
    ''
  );
INSERT INTO
  `nguoidung` (
    `ND_id`,
    `ND_hoten`,
    `ND_username`,
    `ND_password`,
    `ND_image`,
    `ND_email`,
    `ND_diachi`,
    `ND_ngayDK`,
    `ND_sdt`,
    `ND_quyen`,
    `ND_trangthai`,
    `ND_ghichu`
  )
VALUES
  (
    2,
    'KhoChuBay',
    'quangba',
    '1234567',
    'http://localhost:5000/customers/1668132625519-KhoChuBay.png',
    'tunha1234@gmail.com',
    'An Giang',
    '2022-09-17',
    918814026,
    1,
    1,
    ''
  );
INSERT INTO
  `nguoidung` (
    `ND_id`,
    `ND_hoten`,
    `ND_username`,
    `ND_password`,
    `ND_image`,
    `ND_email`,
    `ND_diachi`,
    `ND_ngayDK`,
    `ND_sdt`,
    `ND_quyen`,
    `ND_trangthai`,
    `ND_ghichu`
  )
VALUES
  (
    3,
    'Thanh Khô',
    'thanhkho',
    '1234567',
    'http://localhost:5000/customers/1664955833762-Thank Kho.png',
    'tunha1234@gmail.com',
    'Can tho',
    '2022-09-17',
    917714026,
    1,
    1,
    ''
  );
INSERT INTO
  `nguoidung` (
    `ND_id`,
    `ND_hoten`,
    `ND_username`,
    `ND_password`,
    `ND_image`,
    `ND_email`,
    `ND_diachi`,
    `ND_ngayDK`,
    `ND_sdt`,
    `ND_quyen`,
    `ND_trangthai`,
    `ND_ghichu`
  )
VALUES
  (
    4,
    'Thanh Sang',
    'thanhsang',
    '1234567',
    'http://localhost:5000/customers/1664960140569-ThanhSang.png',
    'tunha1234@gmail.com',
    'Can tho',
    '2022-09-17',
    946653215,
    1,
    1,
    ''
  );
INSERT INTO
  `nguoidung` (
    `ND_id`,
    `ND_hoten`,
    `ND_username`,
    `ND_password`,
    `ND_image`,
    `ND_email`,
    `ND_diachi`,
    `ND_ngayDK`,
    `ND_sdt`,
    `ND_quyen`,
    `ND_trangthai`,
    `ND_ghichu`
  )
VALUES
  (
    5,
    'Linh Pink House',
    'linhpinkhouse',
    '1234567',
    'http://localhost:5000/customers/1664977429789-LinhPinKHouse.png',
    'tunha1234@gmail.com',
    'Can tho',
    '2022-09-17',
    918814024,
    1,
    1,
    ''
  );
INSERT INTO
  `nguoidung` (
    `ND_id`,
    `ND_hoten`,
    `ND_username`,
    `ND_password`,
    `ND_image`,
    `ND_email`,
    `ND_diachi`,
    `ND_ngayDK`,
    `ND_sdt`,
    `ND_quyen`,
    `ND_trangthai`,
    `ND_ghichu`
  )
VALUES
  (
    6,
    'Nguyen123',
    'nguyen',
    '1234567',
    'http://localhost:5000/customers/1664980605378-Nguyen123.png',
    'tunha1234@gmail.com',
    'Can tho',
    '2022-09-17',
    918834945,
    1,
    1,
    ''
  );
INSERT INTO
  `nguoidung` (
    `ND_id`,
    `ND_hoten`,
    `ND_username`,
    `ND_password`,
    `ND_image`,
    `ND_email`,
    `ND_diachi`,
    `ND_ngayDK`,
    `ND_sdt`,
    `ND_quyen`,
    `ND_trangthai`,
    `ND_ghichu`
  )
VALUES
  (
    7,
    'Lê Thị Mỹ Linh',
    'linh',
    '1234567',
    'http://localhost:5000/customers/1665065258331-LINH.png',
    'linh1862014@gmail.com',
    'An Giang',
    '2022-09-25',
    918814029,
    2,
    1,
    ''
  );
INSERT INTO
  `nguoidung` (
    `ND_id`,
    `ND_hoten`,
    `ND_username`,
    `ND_password`,
    `ND_image`,
    `ND_email`,
    `ND_diachi`,
    `ND_ngayDK`,
    `ND_sdt`,
    `ND_quyen`,
    `ND_trangthai`,
    `ND_ghichu`
  )
VALUES
  (
    8,
    'Nguyễn Thanh Sơn',
    'son123',
    '1234567',
    'http://localhost:5000/customers/1665063389348-Son.png',
    'son1234@gmail.com',
    'Can tho',
    '2022-10-03',
    986614025,
    2,
    1,
    ''
  );
INSERT INTO
  `nguoidung` (
    `ND_id`,
    `ND_hoten`,
    `ND_username`,
    `ND_password`,
    `ND_image`,
    `ND_email`,
    `ND_diachi`,
    `ND_ngayDK`,
    `ND_sdt`,
    `ND_quyen`,
    `ND_trangthai`,
    `ND_ghichu`
  )
VALUES
  (
    9,
    'Trần Thị Thi Liễu',
    'lieu123',
    '1234567',
    'http://localhost:5000/customers/1665063475342-Lieu.png',
    'lieu1234@gmail.com',
    'Cần Thơ',
    '2022-10-03',
    947732056,
    2,
    1,
    ''
  );
INSERT INTO
  `nguoidung` (
    `ND_id`,
    `ND_hoten`,
    `ND_username`,
    `ND_password`,
    `ND_image`,
    `ND_email`,
    `ND_diachi`,
    `ND_ngayDK`,
    `ND_sdt`,
    `ND_quyen`,
    `ND_trangthai`,
    `ND_ghichu`
  )
VALUES
  (
    10,
    'Lưu Thanh Sang',
    'sang123',
    '1234567',
    'http://localhost:5000/customers/1665063528149-Sang.png',
    'sang1234@gmail.com',
    'Cần Thơ',
    '2022-10-03',
    923842857,
    2,
    1,
    ''
  );
INSERT INTO
  `nguoidung` (
    `ND_id`,
    `ND_hoten`,
    `ND_username`,
    `ND_password`,
    `ND_image`,
    `ND_email`,
    `ND_diachi`,
    `ND_ngayDK`,
    `ND_sdt`,
    `ND_quyen`,
    `ND_trangthai`,
    `ND_ghichu`
  )
VALUES
  (
    11,
    'Lê Thị Mỹ Hạnh',
    'hanh123',
    '1234567',
    'http://localhost:5000/customers/1665063574338-Hanh.png',
    'hanh1234@gmail.com',
    'Cần Thơ',
    '2022-10-03',
    936623678,
    2,
    1,
    ''
  );
INSERT INTO
  `nguoidung` (
    `ND_id`,
    `ND_hoten`,
    `ND_username`,
    `ND_password`,
    `ND_image`,
    `ND_email`,
    `ND_diachi`,
    `ND_ngayDK`,
    `ND_sdt`,
    `ND_quyen`,
    `ND_trangthai`,
    `ND_ghichu`
  )
VALUES
  (
    12,
    'Ngô Kiến Huy',
    'huy123',
    '1234567',
    'http://localhost:5000/customers/1665063615608-HUY.png',
    'huy1234@gmail.com',
    'Cần Thơ',
    '2022-10-03',
    915672080,
    2,
    1,
    ''
  );
INSERT INTO
  `nguoidung` (
    `ND_id`,
    `ND_hoten`,
    `ND_username`,
    `ND_password`,
    `ND_image`,
    `ND_email`,
    `ND_diachi`,
    `ND_ngayDK`,
    `ND_sdt`,
    `ND_quyen`,
    `ND_trangthai`,
    `ND_ghichu`
  )
VALUES
  (
    13,
    'Mạc Văn Khoa',
    'khoa123',
    '1234567',
    'http://localhost:5000/customers/1665062634433-KHOA.png',
    'khoa1234@gmail.com',
    'Cần Thơ',
    '2022-10-03',
    918814789,
    2,
    1,
    'Hành vi không lành mạnh từ ngày 8/11/2022 đến ngày 30/12/2022 gg'
  );
INSERT INTO
  `nguoidung` (
    `ND_id`,
    `ND_hoten`,
    `ND_username`,
    `ND_password`,
    `ND_image`,
    `ND_email`,
    `ND_diachi`,
    `ND_ngayDK`,
    `ND_sdt`,
    `ND_quyen`,
    `ND_trangthai`,
    `ND_ghichu`
  )
VALUES
  (
    14,
    'Trần Thị Yến Vy',
    'vy123',
    '1234567',
    'http://localhost:5000/customers/1669816227949-hinh-nen-4k-tuyet-dep-cho-may-tinh-03.jpg',
    'vy1234@gmail.com',
    'Cần Thơ',
    '2022-11-30',
    913314027,
    2,
    1,
    ''
  );
INSERT INTO
  `nguoidung` (
    `ND_id`,
    `ND_hoten`,
    `ND_username`,
    `ND_password`,
    `ND_image`,
    `ND_email`,
    `ND_diachi`,
    `ND_ngayDK`,
    `ND_sdt`,
    `ND_quyen`,
    `ND_trangthai`,
    `ND_ghichu`
  )
VALUES
  (
    15,
    'Lưu Gia Hưng',
    'hung123',
    '1234567',
    'http://localhost:5000/customers/1669820539633-3837171.png',
    'hung123@gmail.com',
    'Cần Thơ',
    '2022-11-30',
    918824578,
    2,
    1,
    ''
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: quangba
# ------------------------------------------------------------

INSERT INTO
  `quangba` (`QB_id`, `QB_tieude`, `QB_mota`, `QB_image`)
VALUES
  (
    1,
    'Làng nghề Mộc Chợ Thủ',
    '<h4>Lịch sử làng nghề Mộc Chợ Thủ</h4><p>Đệ nhất nghề mộc và điêu khắc gỗ vùng Tây Nam Bộ là cái tên người ta mệnh danh cho làng nghề mộc Chợ Thủ. Làng nghề này vốn đã tồn tại được hơn 200 năm với những sản phẩm gỗ chạm khắc nổi tiếng với chất lượng và mẫu mã tinh tế cả trong và ngoài nước.</p><p>Theo lịch sử được ghi chép thì làng nghề mộc Chợ Thủ được xây dựng từ năm 1786; do những người Việt từ Bắc vào Nam khai hoang lập nên. Họ đem them những kinh nghiệm của mình; và sử dụng những nguyên liệu gỗ sẵn có tại địa phương để tạo ra các sản phẩm bàn; ghế gỗ để sử dụng. Đến khi thực dân Pháp đánh chiếm Cao Lãnh, Đồng Tháp; họ di tản về khu vực An Giang. Dần dần cha truyền con nối từ đời này qua đời khác; tạo thành một làng nghề có truyền thống lâu đời bậc nhất Tây Nam Bộ.</p><p>Hiện tại, ở đình làng Chợ Thủ vẫn lưu giữ những đồ vật chạm khắc gỗ tinh xảo như bức hoành phi; các cột kèo; bao lam…có niên đại hơn 200 năm. Cũng như nhiều làng nghề khác; làng nghề mộc Chợ Thủ hằng năm tổ chức lễ cúng Lịch Đại tổ sư; Lỗ Ban tiên sư và Cửu Thiên Huyền Nữ vào 2 lần trong năm là ngày; và 13 tháng 6 và ngày 20 tháng chạp Âm lịch. Người dân nơi đây đều coi những dịp cúng này là ngày lễ lớn và tham gia rất đông đảo; nhiệt tình.</p><h4>Vị trí địa lý và quy mô sản xuất làng nghề mộc Chợ Thủ</h4><p>Làng nghề mộc chợ Thủ nằm ở xã Long Điền A; huyện Chợ Mới, tỉnh An Giang; dọc theo con đường đến chợ Thủ. Làng nghề tập trung tại 4 ấp là Long Thuận 1; Long Thuận 2; Long Định và Long Bình với tổng cộng hơn 1000 hộ gia đình; và 100 cơ sở lớn nhỏ. Khi đến đây, người ta có thể dễ dàng bắt gặp rất nhiều những cửa hàng đồ gỗ bên tỉnh lộ 942; kéo dài tới hơn 4km. Những sản phẩm tủ bàn ghế gỗ được trưng bày có kiểu dáng cực kỳ bắt mắt và họa tiết tinh tế sang trọng.</p><p>Mỗi năm; trung bình làng nghề mộc Chợ Thủ cung cấp ra thị trường hơn 50 ngàn đầu sản phẩm. Doanh thu đến đến 150 tỷ chủ yếu đến từ đồng bằng Sông Cửu Long; các thì trường khác như thành phố Hồ Chí Minh; Đồng Nai; Cần Thơ… Vào những dịp lễ đặc biệt lượng tiêu thụ tăng đột biết; đến mức làng nghề không thể cung cấp đủ cho khách dù đã có chuẩn bị trước. Nhất là những dịp Tết Nguyên Đán.</p><p>Mỗi năm càng nhiều gia đình muốn tân trang nhà cửa cũng như tu sửa các công trình thờ cúng để cho ngôi nhà trở nên đẹp hơn. Việc tu sửa nhà thờ tổ, đình đền cũng là để thể hiện lòng hireus thảo và biết ơn của con cháu đối với ông bà tổ tiên. Chính vì vậy mà nhu cầu mua sắm đồ gỗ nội thất tại làng nghề mộc chợ thủ ngày càng tăng cao. Do đó, nhiều cơ sở phải chuẩn bị nguyên vật liệu từ những tháng đầu năm. Thêm vào đó các chủ cơ sở cũng phải cho lao động phải hoạt động hết công suất để kịp đáp ứng nhu cầu của khách hàng.</p><h4>Sản phẩm chủ đạo của làng nghề mộc Chợ Thủ</h4><p>Một trong những lý do giúp cho sản phẩm của làng nghề mộc Chợ Thủ được nhiều người yêu thích chính là bởi chất lượng gỗ làm nên sản phẩm. Những nguyên liệu gỗ đầu vào đều phải được lựa chọn kỹ càng bởi những người thợ lành nghề. Trước tiên là có nguồn gốc xuất xứ rõ ràng, sau đó sẽ kiểm tra chi tiết từng khối gỗ. Nhờ vậy những sản phẩm của làng nghề mộc chợ Thủ nổi tiếng với độ bền rất cao. Bên cạnh đó, làng nghề vẫn giữ mức giá hợp lý cho mỗi sản phẩm. Đảm bảo chất lượng tương xứng với giá tiền nên khi khách hàng tới mua tại làng nghề đều rất yên tâm.</p><figure class=\"image\"><img src=\"http://localhost:5000/LTH_6934.jpg\"></figure><figure class=\"image\"><img src=\"http://localhost:5000/_DSC3110.jpg\"></figure><figure class=\"image\"><img src=\"http://localhost:5000/114.jpg\"></figure><p>Điểm thú vị của làng nghề mộc Chợ thủ là những nghệ nhân thường kết hợp kinh nghiệm và thị hiếu của từng vùng mà thiết kế ra sản phẩm. Chứ không chỉ dựa trên yếu tố chủ quan cá nhân hay cá tính của mỗi nghệ nhân. Vì vậy khi tham quan những sản phẩm trưng bày ở đây, bạn có thể bắt gặp những hoa văn họa tiết đặc trưng của khắp các vùng viền trải dài từ Bắc vào Nam. Mỗi cơ sở sản xuất trong làng nghề cũng có một hoặc vài sản phẩm chủ đạo. Vừa để cạnh tranh, vừa đảm bảo tính chuyên biệt và phát triển mở rộng làng nghề.</p><h4>Lý do mộc chợ Thủ được yêu thích</h4><p>Mỗi sản phẩm của làng nghề mộc Chợ Thủ đều có giá trị nghệ thuật cao như: tủ thờ; tủ quần áo; bàn ghế; kệ; giường cho đến các loại ban công, cầu thang, bao lam, phù điêu… nhờ bàn tay của các nghệ nhân. Để cho ra đời một sản phẩm, người làm mộc Chợ Thủ phải trải qua nhiều công đoạn phức tạp. Họ thổi hồn vào những tấm gỗ nét văn hóa truyền thống Việt Nam, những hình ảnh ý nghĩa từ cuộc sống miền tây sông nước, hoặc điển tích điển cố sâu sắc một cách công phu và cẩn thận. Nhờ đó, mộc Chợ Thủ ngày càng nổi tiếng và khẳng định được vị thế của mình.</p><figure class=\"image\"><img src=\"http://localhost:5000/LTH_6919.jpg\"></figure><figure class=\"image\"><img src=\"http://localhost:5000/LTH_6882.jpg\"></figure><p>Từ khi thành lập đến nay, trải qua không biết bao nhiêu sự kiện lịch sử, những biến động trên thị trường, mùi hương của gỗ cùng những tiếng đồ nghề máy móc phát ra từ các căn nhà trong ngôi làng vẫn giữ được những đặc trưng như thuở ban đầu. Dù càng ngày càng có nhiều người lựa chọn các sản phẩm gỗ công nghiệp gỗ ép để thay thế, gây khó khăn cho việc tiêu thụ, nhưng chất lượng và giá thành của các sản phẩm mộc chợ Thủ vẫn giữ nguyên tới tay người dùng.</p><h4>Lời kết</h4><p>Mộc Chợ Thủ nổi tiếng với sự đa dạng về mẫu mã, kiểu dáng và đề tài trang trí. Hơn nữa, sản phẩm mộc Chợ Thủ có chất lượng gỗ tốt, sử dụng bền, đẹp theo thời gian nên tạo được uy tín rất cao với khách hàng. Nhiều sản phẩm của làng nghề đã tham gia các cuộc hội chợ đi khắp mọi miền đất nước.</p><figure class=\"media\"><oembed url=\"https://youtu.be/971HsuCpF3E\"></oembed></figure><p>Vừa rồi, Thư Viện Gỗ đã chia sẻ với các bạn một số thông tin về làng nghề mộc chợ Thủ An Giang. Hy vọng bạn đọc đã có thêm những thông tin hữu ích cho mình. Và nếu có cơ hội, hãy ghé thăm làng nghề mộc chợ Thủ An Giang để khám phá nhé. Cám ơn bạn đọc đã theo dõi bài viết này.</p><p>Nguồn: <a href=\"https://thuviengo.vn/kham-pha-lang-nghe-moc-cho-thu-an-giang.html\"><i>https://thuviengo.vn/kham-pha-lang-nghe-moc-cho-thu-an-giang.html</i></a></p>',
    'http://localhost:5000/adverties/1667486130553-lang_nghe_moc_cho_thu.jpg'
  );
INSERT INTO
  `quangba` (`QB_id`, `QB_tieude`, `QB_mota`, `QB_image`)
VALUES
  (
    2,
    'Nghề tranh kiếng Long Diền B, Long Giang, Long Kiến',
    '<p><strong>Huyện Chợ Mới (An Giang) có làng tranh kiếng nổi tiếng với bề dày trăm năm, tập trung ở 3 xã Long Điền B, Long Giang, Long Kiến.</strong> <strong>Gọi là làng nghề nhưng hiện nay chỉ còn hơn chục hộ còn gắn bó với nghiệp vẽ tranh. Tuy số người làm giảm đi nhưng số lượng tranh kiếng phục vụ thị trường tăng lên không ngừng, nhất là trong những ngày giáp Tết. Để tranh kiếng có thể sống cùng thời đại là nỗ lực rất lớn của các nghệ nhân tâm huyết.</strong></p><figure class=\"media\"><oembed url=\"https://youtu.be/oRgMRUsNKSg\"></oembed></figure><p>Tranh kiếng là loại tranh được vẽ từ mặt sau của tấm kiếng, sau đó được lật lại mặt trước để treo. Do đó, để hoàn thành bức tranh, người thợ vẽ phải thực hiện ngược mọi chi tiết và nét nào đáng lẽ phải vẽ sau cùng thì đối với tranh kiếng là phải vẽ trước tiên. Đây chính là nét độc đáo của nghề làm tranh kiếng.</p><p>Ở vùng nông thôn, hầu như gia đình nào cũng treo tranh kiếng, phổ biến nhất là tranh thờ tín ngưỡng đặt trang trọng trên bàn thờ tổ tiên, kế đến là tranh trang trí phòng khách và tranh treo cửa buồng. Những câu chuyện dân gian Thoại Khanh - Châu Tuấn, Lưu Bình - Dương Lễ, &nbsp;Lục Vân Tiên - Kiều Nguyệt Nga, Nàng út ống tre… vẫn được khách hàng ưa chuộng, bởi ý nghĩa giáo dục sâu sắc, tôn vinh đức tính quý trọng tình bằng hữu, sống hiếu thảo, bênh vực chính nghĩa của người Việt.</p><figure class=\"image\"><img src=\"http://localhost:5000/th.jfif\"></figure><p>Thể loại tranh trang trí phòng khách ngày càng phong phú, không chỉ duy trì những khuôn mẫu truyền thống, nay còn bổ sung thêm tranh vẽ phong cảnh đất nước, thắng cảnh An Giang, tranh bộ chữ “Phước - Lộc - Thọ” theo phong cách mới. Đặc biệt, tranh thờ là loại tranh to nhất, trang trí đa dạng, màu sắc hài hòa, là loại tranh không thể thiếu trong mỗi gia đình, nhắc nhở cháu con về cội nguồn.</p><p>Treo tranh trong nhà đã trở thành nét văn hóa của người Nam Bộ hơn trăm năm qua, đáp ứng nhu cầu tín ngưỡng và mỹ thuật. Bản thân bức tranh cũng hội đủ giá trị chân - thiện - mỹ khi chứa trong nó là cái đẹp, ý nghĩa, cái tâm và tài hoa của các nghệ nhân.</p><figure class=\"image\"><img src=\"http://localhost:5000/tranh kiếng 2.jpg\"></figure><p>Mấy chục năm trước, vẽ tranh kiếng là nghề giúp hàng chục hộ có của ăn, của để, duy trì đến nay, có nhiều cơ sở do đời thứ 3 nối nghiệp. Nhà nhà làm tranh kiếng vẫn không đủ bán, vì làm ra 1 sản phẩm không hề đơn giản, người lành nghề vẽ 1 ngày giỏi lắm chỉ 10 bức tranh, còn làm từ đầu đến khi hoàn thiện phải mất 1 tuần.</p><figure class=\"image\"><img src=\"http://localhost:5000/tranhkieng_bave-1024x576.jpg\"></figure><p>Tranh làm ra lâu, giá thành cao, trong khi đời sống phát triển, thị trường ngày càng có nhiều loại tranh đáp ứng tiêu chí rẻ và đẹp, khiến những người giữ nghề không khỏi trăn trở. Không chấp nhận quy luật bị mai một, bằng phương pháp kéo lụa mới, tranh kiếng đã khắc phục được những khó khăn để tiếp tục vươn ra thị trường.</p><h2>Nghề vẽ tranh kiếng ở Bà Vệ</h2><p><a href=\"https://ngaymoionline.com.vn/nghe-ve-tranh-kieng-o-ba-ve-1816.html\"><i>https://ngaymoionline.com.vn/nghe-ve-tranh-kieng-o-ba-ve-1816.html</i></a></p>',
    'http://localhost:5000/adverties/1667532047495-1057-bai16-1.jpg'
  );
INSERT INTO
  `quangba` (`QB_id`, `QB_tieude`, `QB_mota`, `QB_image`)
VALUES
  (
    3,
    'Nghề đóng xuồng ghe Mỹ Hiệp',
    '<p><strong>Năm nay, lũ về sớm, lên nhanh, diễn biến phức tạp. Tuy nhiên, đây là điều kiện tốt để người dân kiếm thêm thu nhập, trong đó có nghề đóng xuồng ở xã Mỹ Hiệp (Chợ Mới).</strong></p><p>Vào tháng 8/2007, được tỉnh An Giang công nhận “Làng nghề đóng xuồng Mỹ Hiệp”. Đón con nước lũ thượng nguồn, không khí làng nghề đang rất sôi động, làm ra những sản phẩm đẹp, chắc, bền phục vụ mùa nước nổi 2013.</p><figure class=\"media\"><oembed url=\"https://www.youtube.com/watch?v=KTnfFmwEP9I\"></oembed></figure><p>Với bề dày hình thành, phát triển, qua bao thăng trầm nhưng làng nghề đóng xuồng Mỹ Hiệp vẫn trụ vững với thời gian là nhờ có sản phẩm đẹp, phong phú, sử dụng duy nhất nguyên liệu gỗ cây sao có sẵn tại địa phương nên giảm được chi phí, giá thành, lại chắc, bền, có hạn sử dụng lâu năm. Nhờ vậy sản phẩm của làng nghề đóng xuồng Mỹ Hiệp có thị trường tiêu thụ ra nhiều tỉnh Vĩnh Long, Cần Thơ, mạnh nhất là các huyện Tân Hồng, Hồng Ngự (tỉnh Đồng Tháp), huyện đầu nguồn lũ thị xã Tân Châu, huyện An Phú (tỉnh An Giang) và nước bạn Campuchia.</p><p>Mùa nước nổi ở An Giang bắt đầu vào tháng 8 đến tháng 11 hằng năm, năm nay do mưa bão nhiều, mực nước lên nhanh, cao hơn so với cùng kỳ gần 1 mét. Dự báo trong vài ngày tới mực nước trên các sông Tiền, sông Hậu và sông Vàm Nao còn tiếp tục lên nhanh. Chủ động nắm bắt tình hình, đồng thời do mở rộng được thị trường tiêu thụ, nên làng nghề đóng xuồng Mỹ Hiệp đã sớm khởi động công việc làm ăn từ khoảng tháng 6, tháng 7, để dự trữ, cung cấp kịp thời sản phẩm cho thị trường.</p><figure class=\"image\"><img src=\"http://localhost:5000/a5.jpg\"></figure><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Các công nhân miệt mài đóng xuồng</p><figure class=\"image\"><img src=\"http://localhost:5000/a2.jpg\"></figure><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Bào be xuồng cho láng để ghép các tấm ván được khích, nước không vào thân xuồng.</p><figure class=\"image\"><img src=\"http://localhost:5000/a3.jpg\"></figure><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Người thợ miệt mài hoàn thành các công đoạn của một chiếc xuồng.</p><figure class=\"image\"><img src=\"http://localhost:5000/a4.jpg\"></figure><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Trét chai chống thấm cho xuồng</p><figure class=\"image\"><img src=\"http://localhost:5000/a6.jpg\"></figure><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Xuồng thành phẩm, kiểm tra trước khi chuẩn bị xuất xưởng.</p><p>Theo anh Lê Quốc Bình, chủ cơ sở đóng xuồng ở xã Mỹ Hiệp, sản phẩm của làng nghề hiện có 7 loại như ghe tam bản, ghe chày, vỏ tắc ráng, xuồng Cần Thơ, xuồng ba lá, xuồng cui, xuồng lường có giá từ 1 triệu đồng đến trên 50 triệu đồng/chiếc, không chỉ sử dụng cho việc di chuyển của các hộ dân vùng sông nước, mà còn phục vụ cho việc đánh bắt thủy sản trên sông, vận chuyển hàng hóa trong, ngoài tỉnh. Vì vậy, người thợ làm nghề phải thật khéo léo theo từng công đoạn, như chọn gỗ già, chắc; ngâm; móc cây; cưa; phơi; uốn be; đóng; trét chai; vạt; đóng sạp; cho ra thành phẩm. Còn anh Huỳnh Văn Tân, chủ cơ sở đóng xuồng đã có trên 20 năm trong nghề cho biết, các hộ đóng xuồng Mỹ Hiệp hầu hết làm nghề “Cha truyền con nối”, đến nay cũng được 3 - 4 đời, hoạt động quanh năm nhưng sôi động nhất là 4 tháng mùa nước nổi, năng suất tăng lên gấp 2 - 3 lần những tháng bình thường. Từ kinh nghiệm của người dân vùng sông nước, khi thấy nguồn nước năm nay đổ mạnh xuống từ thượng nguồn, mỗi hộ cũng tranh thủ đóng dự phòng từ 30 đến hơn 100 chiếc xuồng để kịp giao hàng khi có yêu cầu, nhờ đó thu nhập của người dân cũng ổn định. Cái hay của làng nghề là người lớn tuổi hay trẻ em không biết nghề cũng làm được, hiện có thu nhập từ 200.000 - 300.000 đồng/ngày/lao động chính và 100.000 - 120.000 đồng/ngày đối với thợ phụ làm khâu trét chai, vạt, cao hơn 100.000 - 200.000 đồng/người/ngày so với những tháng không có nước.</p><p>Ông Đặng Văn Bưng - Trưởng ấp Tân Thượng - xã Mỹ Hiệp cho biết, trước đây làng nghề đóng xuồng Mỹ Hiệp chỉ đóng loại ghe lớn, nhưng từ năm lũ lớn (năm 2.000) đến nay phần nhiều các hộ đã chuyển sang đóng loại nhỏ như xuồng lường, xuồng cui, xuồng ba lá, có hạn sử dụng từ 3 - 7 năm, nên duy trì được làng nghề hoạt động xuyên suốt trong tình hình kinh tế khó khăn. Bình quân mỗi năm làng nghề đưa ra thị trường trên 1.000 chiếc xuồng các loại. Các cơ sở chủ động trong dự đoán tình hình, làm ra sản phẩm đạt chất lượng cao, đáp ứng yêu cầu thị trường nên tiêu thụ rất mạnh. Nhờ vậy, các hộ nghèo cũng vươn lên khá, giàu, người không có tay nghề cũng sống được bằng công việc phụ của mình. Để tiếp sức cho hộ làm nghề, từ đầu năm đến nay nguồn ngân sách nhà nước đã hỗ trợ cho 24 hộ được vay vốn và chuẩn bị triển khai tiếp cho 20 hộ, mỗi hộ 20 triệu đồng, tạo điều kiện cho các cơ sở làng nghề tiểu thủ công nghiệp truyền thống địa phương được hưởng các chính sách vay vốn, giới thiệu, quảng bá hình ảnh thương hiệu tại các kỳ hội chợ, triển lãm trong và ngoài tỉnh..../.</p>',
    'http://localhost:5000/adverties/1669345865339-a1.jpg'
  );
INSERT INTO
  `quangba` (`QB_id`, `QB_tieude`, `QB_mota`, `QB_image`)
VALUES
  (
    4,
    'Nghề đan giỏ ny-lon ở xã Tấn Mỹ (Chợ Mới, An Giang)',
    '<p><i><strong>Nghề đan giỏ ny-lon ở xã Tấn Mỹ (Chợ Mới, An Giang) đã xuất hiện trên địa bàn xã cách đây trên 30 năm, và được công nhận là làng nghề truyền thống từ năm 2014. Hiện làng nghề có khoảng 10 cơ sở sản xuất, 350 hộ tham gia, với gần 1.000 lao động. Bình quân hàng tháng, mỗi cơ sở cung cấp cho thị trường khoảng 2.000 sản phẩm các loại. Nghề đan giỏ rất dễ học, dễ làm, lại tiện lợi, nên các chị em vừa có thể làm công việc nhà, vừa tranh thủ thời gian để đan giỏ, cải thiện thu nhập cho gia đình.</strong></i></p><figure class=\"image\"><img src=\"http://localhost:5000/6-nghedangio-nilon.jpg\"></figure><p>Từ khi được công nhận là làng nghề truyền thống năm 2014, làng nghề đan giỏ ny-lon xã Tấn Mỹ ngày càng phát triển. Nhờ chất lượng sản phẩm được nâng lên, thị trường ngày càng rộng mở, số lượng tiêu thụ từ đó tăng hơn rất nhiều. Qua đó, góp phần giải quyết việc làm đáng kể cho lực lượng lao động tại xã cũng như các địa phương lân cận. Hiện nay, theo thống kê có gần 400 hộ dân chuyên làm nghề đan giỏ, tập trung ở các ấp: Tấn Lợi, Tấn Phước, Tấn Bình, Tấn Thành... thuộc xã Tấn Mỹ và rải rác ở các xã: Mỹ Hiệp, Bình Phước Xuân, An Thạnh Trung.</p><figure class=\"image\"><img src=\"http://localhost:5000/2-nghedangio-nilon.jpg\"></figure><p>Theo bà Phạm Thị Tuyết Oanh (đại diện làng nghề đan giỏ ny-lon xã Tấn Mỹ), nghề đan giỏ ny-lon rất dễ học và dễ làm; chị em có thể vừa làm công việc nhà, vừa đan giỏ hay đan giỏ những lúc đã lo xong việc vườn tược. Bên cạnh đó, đan giỏ không cần đòi hỏi phải có năng khiếu, bất kể là đàn ông, phụ nữ, người lớn, trẻ nhỏ đều có thể tham gia đan giỏ... “Học nghề này chỉ cần 2 tuần là có thể đan thành thạo, nếu người nào “nhạy việc” mất chừng 10 ngày là làm được, càng làm tay nghề càng nhanh nhạy” - bà Oanh thông tin. Mỗi người thợ lành nghề đan được trung bình 8-10 giỏ/ngày, tiền công mỗi giỏ lớn là 14.000 đồng. Tính ra, nhiều chị em vừa coi nhà, giữ con, lo cơm nước rồi thong thả ngồi đan giỏ có thể bỏ túi trên 100.000 đồng/người/ngày.</p><figure class=\"image\"><img src=\"http://localhost:5000/1-nghedangio-nilon.jpg\"></figure><p>Được học nghề, nhận gia công sản phẩm, bà Oanh cùng chồng tích góp và phát triển thành cơ sở sản xuất có lực lượng thợ gia công, đến hơn trăm hộ. Hàng ngày, tại cơ sở của bà Oanh, các lao động sẽ cắt dây đúng quy cách giỏ lớn, nhỏ, sau đó chở nguyên liệu này giao tận nhà cho các hộ dân nhận gia công. Vài ngày sau, lại đến thu gom sản phẩm về cơ sở và chờ thương lái đến thu mua. “Vui nhất là tạo được công ăn việc làm cho bà con, chứ nghề này lời ít, “sống” được là nhờ số lượng nhiều. Đầu ra của sản phẩm ổn định nên mấy chục năm nay có việc làm cho bà con mình làm suốt. Tuy nghề này không làm giàu, nhưng được cái có tiền mỗi ngày, lo được cho gia đình” - bà Oanh thiệt tình chia sẻ. Làng nghề đan giỏ ny-lon làm quanh năm nên đã tạo thêm thu nhập ổn định cho nhiều người ở xứ cù lao Giêng. Ban đầu, các chị được UBND xã Tấn Mỹ phối hợp Trung tâm Dạy nghề huyện Chợ Mới mở lớp đào tạo nghề đan giỏ, thu hút hàng trăm học viên tham gia. Sau khi học nghề thành thạo, các chị nhận gia công sản phẩm cho các cơ sở trong xã. Ngoài ra, bà Oanh còn đến các xã lân cận của huyện Chợ Mới hay sang các địa phương khác như: Thoại Sơn, Tịnh Biên, Tri Tôn mở các lớp dạy nghề đan giỏ, khi địa phương có nhu cầu.</p><figure class=\"image\"><img src=\"http://localhost:5000/3-nghedangio-nilon.jpg\"></figure><p>Bên cạnh những hộ làm lúc nhàn rỗi, thêm thu nhập thì nghề đan giỏ ny-lon trở thành nguồn kinh tế chính, ổn định của nhiều hộ không đất sản xuất. Một hộ bình quân có 2-3 lao động, chủ yếu là phụ nữ vừa làm việc nhà, vừa đan giỏ, các em nhỏ tranh thủ ngoài giờ học đan giỏ tiếp gia đình tăng thu nhập. Không giống như nhiều ngành nghề khác, nghề đan giỏ tiện lợi có thể tranh thủ làm vào bất cứ lúc nào trong ngày. Có nhà cả ngày đi chăm sóc vườn xoài, hoặc làm thêm công việc khác, tối về tranh thủ ngồi đan cũng kiếm được vài chục ngàn đồng. Sáng sớm lo đi phun thuốc cho vườn xoài với con trai, đầu giờ chiều bà Trần Thị Hường (ấp Tấn Quới, Tấn Mỹ) mới bắt tay vào công việc đan giỏ. Vừa làm, bà Hường vừa chia sẻ, nhờ làm với con trai, con dâu nên đến trời tối cũng được chục cái giỏ, kiếm thêm 140.000 đồng.</p><figure class=\"media\"><oembed url=\"https://youtu.be/E_IbcMbWUbs\"></oembed></figure><p><i>Nguồn: </i><a href=\"https://www.angiang.dcs.vn/Lists/Tintuc/DispForm.aspx?ID=58\"><i>https://www.angiang.dcs.vn/Lists/Tintuc/DispForm.aspx?ID=58</i></a></p>',
    'http://localhost:5000/adverties/1667636248389-t7.jpg'
  );
INSERT INTO
  `quangba` (`QB_id`, `QB_tieude`, `QB_mota`, `QB_image`)
VALUES
  (
    5,
    ' Làng nghề đan đát Long Giang, huyện Chợ Mới, An Giang',
    '<p><strong>Nghề đan đát xã Long Giang (huyện Chợ Mới, tỉnh An Giang) dù trải qua biết bao thăng trầm của thời gian nhưng vẫn tồn tại và phát triển đến ngày nay. Nghề này không phụ người có lòng, mang lại cuộc sống ấm no cho người dân nơi đây. Hình thành hơn trăm năm, làng đan đát ở xã Long Giang (huyện Chợ Mới, tỉnh An Giang) được chính thức công nhận làng nghề truyền thống năm 2006. Từ tre, trúc, những người thợ lành nghề đã biến hóa thành hàng chục sản phẩm sử dụng thân thuộc trong đời sống sinh hoạt và sản xuất nông nghiệp.</strong></p><figure class=\"image\"><img src=\"http://localhost:5000/63685b4172719a161033f59a_lang-nghe-dan-lat-an-giang_(13)_high.jpg\"></figure><figure class=\"image\"><img src=\"http://localhost:5000/63685b4272719a161033f65d_lang-nghe-dan-lat-an-giang_(14)_high.jpg\"></figure><p>Ấn tượng đầu tiên của tôi khi đặt chân đến làng nghề là những lớp nhà khang trang, ngõ lối đều tinh tươm, sạch sẽ. Trước sân nhà, nguyên liệu và các thành phẩm vừa hoàn thành luân phiên được bày ra đón nắng.</p><figure class=\"image\"><img src=\"http://localhost:5000/63685b3e72719a161033f0c5_lang-nghe-dan-lat-an-giang_(2)_high.jpg\"></figure><p>Không có những âm thanh ồn ào, bên trong, không khí làm việc rất nhịp nhàng, mỗi người một công đoạn, lặng lẽ và bình yên.</p><figure class=\"image\"><img src=\"http://localhost:5000/63685b3e72719a161033f151_lang-nghe-dan-lat-an-giang_(3)_high.jpg\"></figure><figure class=\"image\"><img src=\"http://localhost:5000/63685b3f72719a161033f267_lang-nghe-dan-lat-an-giang_(5)_high.jpg\"></figure><figure class=\"image\"><img src=\"http://localhost:5000/63685b3f72719a161033f220_lang-nghe-dan-lat-an-giang_(4)_high.jpg\"></figure><figure class=\"image\"><img src=\"http://localhost:5000/63685b3f72719a161033f364_lang-nghe-dan-lat-an-giang_(6)_high.jpg\"></figure><p>Nghề đan đát xã Long Giang được hình thành và phát triển cách đây khoảng 100 năm, tập trung ở 2 ấp Long Mỹ 2 và Long Phú. Tổ trưởng Làng nghề đan đát Long Giang Đinh Hùng Cường cho biết, làng nghề sản xuất các mặt hàng, như: rổ, thúng, xề…</p><p>Trong đó, mặt hàng thúng được chia thành nhiều loại, như: thúng 5 lít, 10 lít, 20 lít và 40 lít; giá bán dao động từ 33.000-100.000 đồng/cái. Đối với xề được chia làm 2 loại: loại lớn có giá 42.000 đồng/cái và loại nhỏ có giá 25.000 đồng/cái (giá bán cho thương lái). Mỗi sản phẩm có thể sử dụng từ 5-10 năm.</p><p>Mục sở thị quy trình làm ra các sản phẩm mới thấy được sự khéo léo, tỉ mỉ của người thợ. Nguyên liệu chính để làm ra những sản phẩm gần gũi trên chủ yếu bằng tre và trúc. Việc chọn lọc nguyên liệu tre, trúc kỹ lưỡng nên các sản phẩm chắc và bền.</p><p>Theo ông Cường, cây tre, trúc quá già sẽ giòn, dễ gãy, khó uốn. Còn những cây tre còn non sẽ không được dẻo dai, dễ bị mối mọt cắn phá, mau hư hỏng. Theo ông Cường, để làm ra 1 sản phẩm phải trải qua ít nhất 10 công đoạn, như: tách, chẻ, vót, gài, đan đát, lận, nứt...</p><p><strong>Giải quyết việc làm lao động nông thôn</strong></p><p>Làng nghề đan đát xã Long Giang hiện có khoảng 130 hộ tham gia sản xuất, giải quyết việc làm cho khoảng 450 lao động ở địa phương. Ngoài ra, có 6 cơ sở chuyên thu mua, phân phối sản phẩm ra thị trường. Tùy từng công đoạn, mỗi lao động có thu nhập từ 40.000-150.000 đồng/ngày.</p><p>Cái hay của nghề là hầu như ai cũng có thể tham gia. Những công việc nặng nhọc, như: chặt tre, chẻ thanh do cánh đàn ông đảm nhận. Các công việc đòi hỏi sự cẩn thận và tỉ mẩn thì phụ nữ sẽ tham gia. Đối với các em nhỏ, sau thời gian đi học có thể phụ giúp cha mẹ thông qua các công việc đan đát, cạo vỏ… Tuy thu nhập không nhiều, nhưng giúp các em có thêm thu nhập, trang trải chi phí học hành.</p><p>Bên cạnh các mặt hàng truyền thống, thời gian gần đây, Làng nghề đan đát xã Long Giang có nhiều đổi mới, cải tiến mẫu mã để nâng cao sức cạnh tranh trên thị trường. Nhiều cơ sở trong làng nghề đã phát triển thêm các sản phẩm, như: thúng, rổ có kích thước nhỏ hơn, phục vụ nhu cầu của khách du lịch hay để trang trí ở các hàng quán, khu du lịch…</p><figure class=\"media\"><oembed url=\"https://youtu.be/XQcJrFijqP4\"></oembed></figure><p>Nhờ chất lượng sản phẩm ổn định, thị trường tiêu thụ rộng lớn nên Làng nghề đan đát xã Long Giang vẫn duy trì phát triển. Hiện nay, do dịch bệnh COVID-19 bùng phát nên hoạt động kinh doanh bị chựng lại. Tuy nhiên, người dân vẫn lạc quan, hy vọng đến khi hết dịch, làng nghề đan đát xã Long Giang tiếp tục sôi động như thời gian trước.</p><p>Tạp chí nông thôn việt: <a href=\"https://nongthonviet.com.vn/nhip-song-binh-yen-o-lang-nghe-dan-dat.ngn\"><i>https://nongthonviet.com.vn/nhip-song-binh-yen-o-lang-nghe-dan-dat.ngn</i></a></p>',
    'http://localhost:5000/adverties/1667635913947-22.jpg'
  );
INSERT INTO
  `quangba` (`QB_id`, `QB_tieude`, `QB_mota`, `QB_image`)
VALUES
  (
    6,
    'Làng nghề chằm nón lá Hòa Bình',
    '<p><strong>Bao đời nay, nghề chằm nón lá ở xã Hòa Bình (huyện Chợ Mới, tỉnh An Giang) đã nổi danh khắp miền Tây Nam Bộ. Tuy là nghề phụ tranh thủ&nbsp;làm lúc nông nhàn nhưng lại giúp nhiều gia đình nơi đây có thêm thu nhập, giúp thoát nghèo, cải thiện cuộc sống.</strong></p><p>Là vật dụng thân thuộc, gần gũi với cuộc sống thường nhật, chiếc nón lá từ lâu gắn bó&nbsp;với người dân vùng sông nước, thôn quê khắp&nbsp;các vùng miền nước Việt.</p><p>Theo chị Thùy Dương, cán bộ văn hóa xã Hòa Bình và&nbsp;cũng là người đại diện của làng nón thì nghề này có từ khoảng năm 1930. Ban đầu, nón lá&nbsp;được sản xuất phục vụ nhu cầu sử dụng của các gia đình.&nbsp;Về sau, theo&nbsp;nhu cầu lớn của người dân quanh vùng&nbsp;mà nghề làm nón được mở rộng, ngày càng có nhiều người học nghề. Đến nay, nghề làm nón ngày càng hưng thịnh và tiếng thơm vang xa. Năm 2006, làng nón Hòa Bình được UBND tỉnh An Giang công nhận là làng nghề truyền thống của tỉnh.</p><p>Các bước thực hiện:</p><figure class=\"image\"><img src=\"http://localhost:5000/1701201709543865-Thong-Hai_1-_resize.jpg\"></figure><p><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Lá buông phơi khô, nguyên liệu chính để làm nón.</i></p><figure class=\"image\"><img src=\"http://localhost:5000/17012017095438377-Thong-Hai_4-_resize.jpg\"></figure><p><i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Vuốt tre làm nguyên liệu đang vành nón.</i></p><figure class=\"image\"><img src=\"http://localhost:5000/17012017095438658-Thong-Hai_5-_resize.jpg\"></figure><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Uốn cong những thanh tre đã vuốt và kết vào khung.</p><figure class=\"image\"><img src=\"http://localhost:5000/17012017095438908-Thong-Hai_7-_resize.jpg\"></figure><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Trang trí màu sắc và bắt mắt.</p><figure class=\"image\"><img src=\"http://localhost:5000/1701201709544039-Thong-Hai_19-_resize.jpg\"></figure><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Chuẩn bị lá buông sau khi được hơ nóng và kết vào khung.</p><figure class=\"image\"><img src=\"http://localhost:5000/17012017095437753-COVER-Thong-Hai_14_resize.jpg\"></figure><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Khâu các lá buông lại với nhau.</p><figure class=\"image\"><img src=\"http://localhost:5000/17012017095440319-Thong-Hai_27-_resize.jpg\"></figure><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Sau đó thoa dầu nóng cho nón và hoàn thành.</p><p>Chiếc nón&nbsp;lá&nbsp;được&nbsp;làm ra với&nbsp;nhiều công đoạn, trong đó làm khung, lựa chọn lá và chằm nón là những khâu chính. Khung nón được làm&nbsp;từ loại&nbsp;gỗ nhẹ, mái cong đều hình chóp. Vành nón làm bằng tre, gồm 16 vòng tròn lớn nhỏ được chuốt tròn trịa, cân xứng. Lá nón trước khi lợp được luộc chín, vuốt thẳng và&nbsp;đem phơi rồi ủ khô sao cho luôn giữ màu xanh-trắng tự nhiên.</p><p>Hiện nghề chằm nón lá tại Hòa Bình phát triển khi sản phẩm đáp ứng được thị hiếu của người sử dụng. Trung bình, ở làng nghề có thể chằm được 4 đến 7 cái nón. Tùy loại nón và độ dày mỏng khác nhau mà có giá từ 20 ngàn đến 50 ngàn/cái. Tính đến hết năm 2016, nghề làm nón đã thu hút được 460 hộ với hơn 1200 lao động tham gia,&nbsp;cung cấp cho thị trường&nbsp;khoảng 2500 chiếc nón.</p><p>Hàng năm, sản lượng sản xuất hơn 900.000 chiếc, thị trường tiêu thụ rộng khắp ở An Giang và các tỉnh như: Đồng Tháp, Kiên Giang, Sóc Trăng, Cần Thơ, Cà Mau…. và còn xuất qua Campuchia. Để phát triển làng nón hơn nữa, chị Thuỳ Dương chia sẻ thêm: “Nhu cầu phát triển nghề làm nón rất lớn nên rất cần hỗ trợ về vốn ưu đãi. Chúng tôi mong muốn ngân hàng sẽ tiếp tục hỗ trợ vốn để bà con mở rộng sản xuất, tiếp tục giữ gìn và mở rộng nghề làm nón ở Hòa Bình hơn nữa”../.</p><figure class=\"media\"><oembed url=\"https://www.youtube.com/watch?v=FTBIVVqw7Bg\"></oembed></figure><p>&nbsp;</p><p>Báo ảnh việt nam : <a href=\"https://vietnam.vnanet.vn/vietnamese/tin-tuc/nghe-cham-non-la-hoa-binh-138161.html\"><i>https://vietnam.vnanet.vn/vietnamese/tin-tuc/nghe-cham-non-la-hoa-binh-138161.html</i></a></p>',
    'http://localhost:5000/adverties/1667635486187-Non-la-Hoa-Binh-1536x1044.jpg'
  );
INSERT INTO
  `quangba` (`QB_id`, `QB_tieude`, `QB_mota`, `QB_image`)
VALUES
  (
    7,
    'Nghề làm khô cá lóc ở An Giang',
    '<p><strong>Giữa tháng 10 âm lịch, là thời điểm nhộn nhịp nhất của nghề làm khô ở Chợ Mới, Thoại Sơn -An Giang. Trước đây, chỉ có một vài hộ làm khô cá lóc bán lẻ ngay tại chợ, thì nay món đặc sản này có mặt ở khắp nơi, kể cả trong siêu thị. Nghề làm khô cá lóc bây giờ có gần chục cơ sở lớn, nhỏ giải quyết việc làm cho hàng trăm lao động ở địa phương. Những cơ sở này được tập hợp lại thành tổ hợp tác để cùng xây dựng thương hiệu khô cá lóc An Giang. Gần tết là thời điểm nhộn nhịp nhất của làng nghề để cung cấp hàng phục vụ cho thị trường.</strong></p><figure class=\"media\"><oembed url=\"https://youtu.be/1a3q_ahVces\"></oembed></figure><p>&nbsp;</p><p>“Vùng đất An Giang từ xưa đến nay con cá lóc rất nhiều, đặc biệt là trong mùa nước nổi. Những lúc dội chợ, cá tươi ăn không hết nên nông dân xẻ khô trữ lại. Từ đó, nghề làm khô cá lóc cũng ra đời. Tuy nhiên, thời gian gần đây, mới phát triển lên cơ sở và sản phẩm làm ra nhiều hơn trước”. Sản phẩm khô cá lóc ở đây có hương vị đặc trưng rất riêng nhờ vào bàn tay khéo léo của người phụ nữ. Bà Phạm Thị Mây cho biết thêm: “Để có miếng khô ngon, phải qua rất nhiều công đoạn như: làm sạch, loại bỏ xương, ướp gia vị và đem phơi nắng. Trong đó, ướp gia vị rất quan trọng để tạo ra hương vị riêng của từng cơ sở và đây cũng là bí quyết gia truyền…”. Hầu hết những sản phẩm khô cá lóc ở An Giang đều được làm thủ công và phơi dưới ánh nắng mặt trời.</p><figure class=\"image\"><img src=\"http://localhost:5000/dip1401468877 (Copy).jpg\"></figure><p>Ngày nay, ngoài khô lóc, nhiều khách hàng ở Sài Gòn, Đồng Nai, Bình Dương… đều thích ăn khô cá lóc phơi một nắng. Bởi, cá khô phơi một nắng giữ được nhiều vị của cá tươi, thơm ngon mà lại dễ dàng vận chuyển. Tuy nhiên, cách làm khô một nắng khó hơn, vì phải bảo quản tốt nếu không rất dễ bị hư.</p><figure class=\"image\"><img src=\"http://localhost:5000/kho-ca-loc-thoai-son3.jpg\"></figure><p>Bên cạnh thế mạnh là khô cá lóc, những năm gần đây tại xã Phú Thọ còn chế biến khô cá sặc rằn, khô cá chạch, khô cá chốt, khô cá trèn…</p><h2><strong>5 gia vị làm nên khô cá lóc An Giang</strong></h2><p><a href=\"https://vnexpress.net/thoi-su/5-gia-vi-lam-nen-kho-ca-loc-an-giang-3671928.html\"><i><strong>https://vnexpress.net/thoi-su/5-gia-vi-lam-nen-kho-ca-loc-an-giang-3671928.html</strong></i></a></p><figure class=\"image\"><img></figure>',
    'http://localhost:5000/adverties/1667637548060-6toan-(2).jpg'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: sanpham
# ------------------------------------------------------------

INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    1,
    2,
    '1kg Khô cá lóc loại lớn 2 nắng [Đặc sản An Giang]',
    16,
    16,
    190000,
    'http://localhost:5000/product/1664955059541-c1bdc019c8ed46883f548360a7da5f0c.jfif',
    1000,
    '<p>Khô cá lóc là một trong những loại đặc sản nổi tiếng thơm ngon, mạng đậm hương vị quê hương của miền Tây nói chung và An Giang nói riêng. Khô được chế biến từ cá lóc sống, phơi thủ công, ướp vị mặn vừa ăn.&nbsp;</p><p>Sản phẩm thích hợp làm quà biếu, tiếp đãi khách hoặc dùng trong bữa cơm hằng ngày.</p><p>* Các món được chế biến từ khô cá lóc:&nbsp;</p><p>- Khô cá lóc trộn gỏi xoài</p><p>- Khô cá lóc chiên bơ tỏi&nbsp;</p><p>- Khô cá lóc chiên giấm đường&nbsp;</p><p>- Khô cá lóc nướng&nbsp;</p><p>- Khô cá lóc chiên truyền thống Kết hợp chấm khô với nước mắm me, nước mắm tỏi ớt,…thêm chén cơm trắng hít hà vị quê.</p>',
    0,
    1
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    2,
    2,
    'khô cá lóc dẻo 2 nắng 1kg',
    40,
    30,
    235000,
    'http://localhost:5000/product/1664953076115-cf874b0c0a33adb4c125b79e4d80e891.jfif',
    1000,
    '<p>Nhầm đáp ứng nhu cầu biếu tặng người thân Khô Miền Tây xin phép giới thiệu tới quý khách Khô Cá Lóc 2 nắng để gửi tặng người thân mà không lo bị hư hỏng .</p><p>+Khô cá lóc rút xương được chế biến từ nguồn cá tươi, xẻ và phơi đẹp, gia vị tẩm ướp vừa ăn.&nbsp;</p><p>+Không tẩm màu mà phơi đủ nắng nên màu cá khô vàng sậm tự nhiên&nbsp;</p><p>+Bảo đảm vệ sinh an toàn thực phẩm.</p><p>+Đóng gói HÚT CHÂN KHÔNG an toàn, bảo quản tốt, thích hợp làm quà biếu, tặng.&nbsp;</p><p>+ Không chất bảo quản, nên sản phẩm có hạn dùng ngắn, các bạn yên tâm về chất lượng và sức khỏe khi dùng nhé.</p><p>&nbsp;+ Bảo quản lâu ở nhiệt độ tủ lạnh ( 6 tháng)</p>',
    1,
    1
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    3,
    2,
    'Khô cá lóc Chợ Mới đủ 3 nắng tự nhiên, ít mặn, dai thơm ,đảm bảo vệ sinh Không dử dụng chất bảo quản',
    200,
    36,
    130000,
    'http://localhost:5000/product/1664952643350-90b0608c10f133bef72f9bf02eef9c86.jfif',
    500,
    '<p>Nguyên liệu : Nguyên liệu chế biến từ cá lóc tươi ngon được nuôi tại các vùng cửa ngõ sông Miền tây. Vì thế khách hàng nên yên tâm về chất lượng nguồn cá khô của chúng tôi</p><p>Chế biến : Sản phẩm được chế biến hoàn toàn thủ công bởi nông dân vớii công thức gia truyền sẽ được phơi nắng tự nhiên 3-5 nắng trong môi trường nhà khép kín tránh côn trùng&nbsp;<br>Giá thành : Do lấy trực tiếp từ nông dân làm cá khô nên giá thành mỗi sản phẩm của chúng tôi là tốt nhất, ngoài ra chúng tôi còn hỗ trợ đóng gói hút chân không cho khách phương xa làm quà cho người thân, bạn bè, đối tác.</p><p>Cách dùng : Chế biến cho các món canh , rim , kho , gỏi ,xào , sốt...</p><p>1. Khô cá lóc nướng&nbsp;</p><p>2. Khô cá lóc kho thơm&nbsp;</p><p>3. Khô cá lóc chiên nước mắm&nbsp;</p><p>4. Khô cá lóc sốt me&nbsp;</p><p>5. Khô cá lóc chiên giấm đường&nbsp;</p><p>6. Khô cá lóc kho tiêu&nbsp;</p><p>7. Khô cá lóc nấu canh chua&nbsp;</p><p>8. Khô cá lóc sốt bơ tỏi</p>',
    1,
    1
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    4,
    2,
    'Khô cá lóc 3 nắng,đủ nắng,vị vừa ăn,không chất bảo quản,vệ sinh-Đặc sản Miền Tây 1KG',
    200,
    40,
    235000,
    'http://localhost:5000/product/1664949847389-bbc60778d98220bf2232a852c01eb662.jfif',
    1000,
    '<p>Khô Cá Lóc đồng tự nhiên (Loại 1) được phơi 3 nắng để giữ độ dẻo tránh khô khi dùng mà vẫn không mất đi độ tươi ngon ngọt của cá. Khô cá lóc có rất nhiều ở các tỉnh miền tây sông nước, có thể nói con khô lóc đã gắn liền với tuổi thơ không biết bao nhiêu thế hệ người Nam bộ.Rất nhiều cách chế biến để để ta cảm nhận được vị thơm ngon khó quên của món ăn này. Tuy nhiên độc đáo và truyền thống nhất vãn là đem khô cá lóc nướng với than hoa, cách này làm dậy lên hương thơm đặc trưng của cá lóc kết hợp vị mặn mòi của cá, sau đó bạn đem khô đập cho tơi ra rồi xé nhỏ ăn cùng mắm me là ngon hết sẩy. Các món gỏi ngon như gỏi xoài, gỏi dưa leo, gỏi lá sầu đâu, gỏi đu đủ mà kết hợp cùng khô cá lóc đều tạo nên hương vị đặc biệt xứ sông nước, lắng động trong đó là tấm chân tình của người miền tây gửi thực khách.</p>',
    1,
    1
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    5,
    2,
    '1kg Khô Cá Lóc Rút Xương Vị Vừa Ăn Không Chất Bảo Quản-500gr',
    200,
    35,
    89000,
    'http://localhost:5000/product/1664949515046-aae97c5e7df67fe2f4277c3b73d7e711.jfif',
    500,
    '<p>Cá Dứa U Minh Cà Mau chính gốc, một loại đặc sản đang được ưa chuộng hiện nay, đang trở thành một món ăn, một món quà biếu đầy ý nghĩa. Quy cách: – Khô Cá Dứa U Minh Cà Mau được đóng gói hút chân không, bảo quản không dùng phụ gia – Đóng gói theo từng con hoặc cắt nhỏ cho vào bịch hút chân không từ 0.5kg – 2kg. Cam kết: – Đổi trả tại nhà miễn phí nếu hàng kém chất lượng – Sản phẩm an toàn, nguồn gốc rõ ràng Tiêu chuẩn chất lượng : Đạt tiêu chuẩn sạch, KHÔNG hóa chất, KHÔNG phẩm màu, đảm bảo VSATTP. Hình thức kinh doanh : Bán lẻ giao hàng đi toàn quốc - Kinh doanh sỉ giá rẻ tốt nhất cho đại lý toàn quốc Hỗ trợ cho các địa lý muốn kinh doanh online mở shop online hoặc mở cửa hàng kinh doanh thực phẩm khô toàn quốc. Quý anh chị nhớ Follow đăng ký theo dõi shop để nhận thông tin giá rẻ và Voucher mua sắm tốt nhất nhé Vận chuyển + Giao hàng COD TOÀN QUỐC + Có nhận Giao hàng đi quốc tế , chi phí rẻ nhất cho kiều bào ở nước ngoài Khi đặt hàng anh chị chú ý lấy mã Freeship Extra để được hỗ trợ cước tốt nhất cho mình nhé , đặc biệt khi mua kèm với các sản phẩm khác sẽ được giảm thêm và tiết kiệm một khoản tiền cho mình nhé anh chị ! KHÔ CÁ DỨA ĐẶC SẢN U Minh Cà Mau BẢO QUẢN KHÔ CÁ DỨA - U Minh Cà Mau – Cá Dứa sau khi mua về hoặc người thân biếu tặng thì bạn nên bảo quản kỹ trong tủ , cá Dứa phải được bao bọc ni lông kỹ lưỡng – Không nên lấy cá Dứa ra khỏi tủ lạnh nhiều lần vì nhiệt độ thường xuyên thay đổi sẽ khiến chất lượng cá giảm sút đáng kể. – Khô cá Dứa một nắng khi mua nên chia nhỏ từng con theo từng bịch và hút chân không kỹ lưỡng (cá Dứa được hút chân không sẽ bảo quản lâu hơn, chất lượng cá đảm bảo tốt nhất). CÁCH LÀM CÁ KHÔ MẶN BỚT VỊ MẶN TRƯỚC KHI SỬ DỤNG Ngâm khô cá trong nước vo gạo. ... Ngâm cá khô trong nước cốt canh. ... Ướp cá khô với đường và chanh. ... Ngâm cá khô với nước muối loãng. CÁCH CHẾ BIẾN CÁ DỨA THÀNH NHIỀU MÓN ĐẶC SẢN Cá dứa kho tộ Cá dứa nấu canh, Cá dứa một nắng chiên vàng sốt mắm ớt hay om cà chua... CÁCH BẢO QUẢN - Để ở nơi khô ráo, thoáng mát - Nếu không có tủ lạnh chúng ta sau khi mua cá khô về phải phơi thật khô và dùng bao ni lông bọc kín lại, thỉnh thoảng khoảng 1 tuần đem cá khô phơi qua nắng để tránh ẩm mốc. - Nếu có tủ lạnh thì dùng bao ni lông bọc kín cá lại và cho vào ngăn mát của tủ lạnh . Có thể bảo quản cá khô được lâu khoảng 6 tháng và không làm giảm chất lượng. - KHÔ CÁ DỨA ĐƯỢC HÚT CHÂN KHÔNG BÁN TẠI SHOP sẽ bảo quản tốt hơn so với điều kiện thường.</p>',
    1,
    1
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    6,
    2,
    '1 Ký CÁ LÓC 1 NẮNG',
    200,
    33,
    140000,
    'http://localhost:5000/product/1664946386393-dcd4d87358f96d662992e333933919e4.jfif',
    1000,
    '<p>Cá Dứa U Minh Cà Mau chính gốc, một loại đặc sản đang được ưa chuộng hiện nay, đang trở thành một món ăn, một món quà biếu đầy ý nghĩa. Quy cách: – Khô Cá Dứa U Minh Cà Mau được đóng gói hút chân không, bảo quản không dùng phụ gia – Đóng gói theo từng con hoặc cắt nhỏ cho vào bịch hút chân không từ 0.5kg – 2kg. Cam kết: – Đổi trả tại nhà miễn phí nếu hàng kém chất lượng – Sản phẩm an toàn, nguồn gốc rõ ràng Tiêu chuẩn chất lượng : Đạt tiêu chuẩn sạch, KHÔNG hóa chất, KHÔNG phẩm màu, đảm bảo VSATTP. Hình thức kinh doanh : Bán lẻ giao hàng đi toàn quốc - Kinh doanh sỉ giá rẻ tốt nhất cho đại lý toàn quốc Hỗ trợ cho các địa lý muốn kinh doanh online mở shop online hoặc mở cửa hàng kinh doanh thực phẩm khô toàn quốc. Quý anh chị nhớ Follow đăng ký theo dõi shop để nhận thông tin giá rẻ và Voucher mua sắm tốt nhất nhé Vận chuyển + Giao hàng COD TOÀN QUỐC + Có nhận Giao hàng đi quốc tế , chi phí rẻ nhất cho kiều bào ở nước ngoài Khi đặt hàng anh chị chú ý lấy mã Freeship Extra để được hỗ trợ cước tốt nhất cho mình nhé , đặc biệt khi mua kèm với các sản phẩm khác sẽ được giảm thêm và tiết kiệm một khoản tiền cho mình nhé anh chị ! KHÔ CÁ DỨA ĐẶC SẢN U Minh Cà Mau BẢO QUẢN KHÔ CÁ DỨA - U Minh Cà Mau – Cá Dứa sau khi mua về hoặc người thân biếu tặng thì bạn nên bảo quản kỹ trong tủ , cá Dứa phải được bao bọc ni lông kỹ lưỡng – Không nên lấy cá Dứa ra khỏi tủ lạnh nhiều lần vì nhiệt độ thường xuyên thay đổi sẽ khiến chất lượng cá giảm sút đáng kể. – Khô cá Dứa một nắng khi mua nên chia nhỏ từng con theo từng bịch và hút chân không kỹ lưỡng (cá Dứa được hút chân không sẽ bảo quản lâu hơn, chất lượng cá đảm bảo tốt nhất). CÁCH LÀM CÁ KHÔ MẶN BỚT VỊ MẶN TRƯỚC KHI SỬ DỤNG Ngâm khô cá trong nước vo gạo. ... Ngâm cá khô trong nước cốt canh. ... Ướp cá khô với đường và chanh. ... Ngâm cá khô với nước muối loãng. CÁCH CHẾ BIẾN CÁ DỨA THÀNH NHIỀU MÓN ĐẶC SẢN Cá dứa kho tộ Cá dứa nấu canh, Cá dứa một nắng chiên vàng sốt mắm ớt hay om cà chua... CÁCH BẢO QUẢN - Để ở nơi khô ráo, thoáng mát - Nếu không có tủ lạnh chúng ta sau khi mua cá khô về phải phơi thật khô và dùng bao ni lông bọc kín lại, thỉnh thoảng khoảng 1 tuần đem cá khô phơi qua nắng để tránh ẩm mốc. - Nếu có tủ lạnh thì dùng bao ni lông bọc kín cá lại và cho vào ngăn mát của tủ lạnh . Có thể bảo quản cá khô được lâu khoảng 6 tháng và không làm giảm chất lượng. - KHÔ CÁ DỨA ĐƯỢC HÚT CHÂN KHÔNG BÁN TẠI SHOP sẽ bảo quản tốt hơn so với điều kiện thường.</p>',
    1,
    1
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    7,
    2,
    'Khô cá lóc đồng phơi nắng tự nhiên thơm ngon 500g',
    100,
    36,
    115000,
    'http://localhost:5000/product/1665027007288-cc8a72e3af28ed38bb7d1aa2b8b52024.jfif',
    500,
    '<p>Khô cá lóc loại ngon nhà làm được tẩm ướp vừa ăn, hợp vệ sinh.&nbsp;</p><p>Khô cá lóc không quá cứng hay quá mềm mà có độ dai vừa đủ, có mùi thơm và độ ngọt đặc trưng, đồng thời cho vị vừa miệng.</p><p>Hạn sử dụng: 3 tháng trong tủ đông vì sản phẩm không sử dụng chất bảo quản.&nbsp;</p><p>Xuất xứ: Việt Nam.&nbsp;</p><p>Đặc sản vùng: An Giang.</p>',
    1,
    1
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    8,
    3,
    'Khô cá Sặc bổi Cà Mau-Ướp vị vừa ăn Kho ca sac Đặc sản Khô Miền Tây',
    30,
    0,
    160000,
    'http://localhost:5000/product/1664956704666-65877e8c63c9f9bf13fad4ba3d49a59c.jfif',
    500,
    '<p>+Không tẩm màu, phơi đủ nắng nên màu cá khô vàng sậm tự nhiên.&nbsp;</p><p>+Bảo đảm vệ sinh an toàn thực phẩm.&nbsp;</p><p>+Đóng gói sạch đẹp an toàn, bảo quản tốt, thích hợp làm quà biếu, tặng.&nbsp;</p><p>+Không chất bảo quản, nên sản phẩm có hạn dùng ngắn, các bạn yên tâm về chất lượng và sức khỏe khi dùng nhé.</p><p>&nbsp;+Bảo quản lâu ở nhiệt độ tủ lạnh ( tốt nhất là ngăn đá)&nbsp;</p><p>+Sau khi nhận được hàng, nếu có gì không hài lòng, xin khách hãy nhắn tin cho shop, shop sẽ hỗ trợ hết mình.</p>',
    1,
    5
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    9,
    3,
    '1kg khô cá lóc vị vừa ăn chất lượng rất ngon hàng mới về liên tục chuẩn loại 1 như hình',
    100,
    4,
    225000,
    'http://localhost:5000/product/1664957098651-6f1f1da2df57206b873960a700512304.jfif',
    1000,
    '<p>Khô cá lóc dùng để chiên, nướng phục vụ trong món ăn của người Việt&nbsp;</p><p>Khô mới nên ăn rất ngon, khách hàng cứ yên tâm chất lượng nha!!</p><p>Cá lóc sau khi làm thịt, đánh vảy, moi ruột rồi xẻ làm đôi ở phía lưng, lấy hết xương sống cá bỏ đi và ướp với muối trắng hoặc ớt cay.&nbsp;</p><p>Thịt cá cho độ ngon ngọt, thơm béo được sử dụng cho rất nhiều món chiên, xào, nướng làm gỏi hoặc nấu canh, nấu súp… Những món chế biến từ khô cá lóc cả nhà có thể tham khảo ạ : Khô cá lóc kho thơm, canh chua khô cá lóc, canh mẻ, khô cá lóc sốt chua ngọt, nướng hoặc xé trộn làm gỏi...&nbsp;</p><p>Đặc biệt, khô cá lóc chiên hoặc nước chấm với mắm me là món nhâm nhi ngon lắm luôn nha cả nhà.</p>',
    1,
    4
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    10,
    3,
    'SALE TẬN GỐC 1KG KHÔ CÁ LÓC 2 NẮNG NẮNG THƠM NGON CHẤT LƯỢNG',
    100,
    2,
    189000,
    'http://localhost:5000/product/1664958507613-a8e94974a77d4b59987471f6d813e923.jfif',
    1000,
    '<p>Khô Cá Lóc đặc sản Miền Tây Nam Bộ- Khô cá lóc &nbsp;được chọn từ những con cá lóc tươi ngon.&nbsp;</p><p>- Khô cá lóc không quá mặn, không quá ngọt, phơi không quá khô cũng không quá ướt. Ngoài ra khô cá lóc loại ngon thường được xẻ rất tỉ mỉ, bỏ xương, bỏ đầu rất đẹp.</p><p>&nbsp;- Khô ngon đc hút chân không, bảo quản đc lâu, vân chuyển đi xa lại an toàn.</p><p>Là 1 trong món mà khách không thể bỏ qua trong bữa cơm gia đình cũng như mồi lai rai những ngày Lễ Tết sum hợp gia đình nha.&nbsp;</p><p>Cá lóc đã được lóc xương vị vừa ăn có tẩm ướp thêm tiêu sọ nên ăn cực kỳ thơm ngon.</p>',
    1,
    4
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    11,
    3,
    'Khô cá lóc 1 nắng, rất lạt, dai thơm không cứng [ ĐẬM VỊ ƯỚP]',
    100,
    0,
    100000,
    'http://localhost:5000/product/1664958830252-3ac26594938bd922c03a151d893df3f6.jfif',
    500,
    '<p>Khô có vị ngon rất vừa ăn, dai thơm, chỉ sử dụng hương liệu nhà bếp mà chúng ta thường ăn không thêm bất cứ chất phụ gia hay hoá chất độc hại nào hết. Khô được hút chân không nên có thể vận chuyển được xa, quý khách lưu ý là trong bịch khô 1kg được hút chân không có thể tiết ra mỡ chứ không phải chảy nước hay phơi không khô ạ.</p><p>Khô cá lóc có rất nhiều cách chế biến, tùy hợp vào khẩu vị và cách ăn của mỗi người: chiên, hấp, nướng, làm gỏi xoài, gỏi sầu đâu,.....làm quà tặng.&nbsp;</p><p>Còn đặc biệt thích hợp cho người bận rộn như mua về để tủ lạnh, khi cần ăn cơm thì chỉ lấy ra chiên hoặc nướng là xong.</p>',
    1,
    4
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    12,
    3,
    '500GAM KHÔ CÁ LÓC SỢI ( PHI LÊ LÓC XƯƠNG RỒI )',
    100,
    5,
    140000,
    'http://localhost:5000/product/1664959205198-122761c4847518fd490d1dde9512b1f3.jfif',
    500,
    '<p>Khô cá lóc sợi phi lê&nbsp;</p><p>Bỏ hết xương chỉ còn thịt nha mọi người&nbsp;</p><p>Tẩm gia vị vừa ăn lắm ạ ????????????????</p><p>&nbsp;Cá bao ngon, ăn với cơm ghiền luôn ạ</p>',
    1,
    4
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    13,
    3,
    'THỊT KHÔ CÁ LÓC TẨM GIA VỊ XẾP VỈ',
    100,
    2,
    200000,
    'http://localhost:5000/product/1664959567638-c5831208fbc2cc8614bce2694077c573.jfif',
    500,
    '<p>THỊT KHÔ CÁ LÓC TẨM GIA VỊ XẾP VỈ&nbsp;</p><p>Thịt nạt 100% không xương&nbsp;</p><p>Bao ngon không mặn&nbsp;</p>',
    1,
    4
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    14,
    3,
    'Khô cá lóc tiêu sọ 5 nắng cho tín đồ yêu lóc chuẩn khô (500g)',
    100,
    3,
    160000,
    'http://localhost:5000/product/1664959870649-cc5791c1f9b8252d48bbc94fb9efb313.jfif',
    500,
    '<p>Em lóc tiêu sọ 5 nắng cho khách yêu thích đồ khô chuẩn khô nhé ạ!&nbsp;</p><p>Đợt này lóc lớn ngon lắm ạ, tầm 6-8 con/kg, chất lượng thơm ngon không đổi ạ, càng nhai càng ngọt miệng, càng ghiền!!!&nbsp;</p><p>Khô phơi khô thiệt khô, chiên nướng lên ngồi thưởng thức cái thớ thịt dai dai càng nhai càng ngọt, càng nhai càng thấm vị, thú vị lắm nghe!&nbsp;</p><p>Cái thú khác hẳn khi nhai các loại khô còn hơi mềm tay!&nbsp;</p><p>Loại này dành cho ai không có tủ lạnh nè, để ngoài dã chiến cả tháng vẫn ngon nhé!&nbsp;</p><p>Nếu đem nướng thì nên ngâm rửa sơ để khô chín tới là dai ngon vừa đủ độ phê nhé</p><p>Khô đặt vựa làm, tẩm ướp vừa ăn, không hóa chất.</p>',
    1,
    4
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    15,
    4,
    '1 KG KHÔ CÁ LÓC 1 NẮNG CHẤT LƯỢNG [ĐẶC SẢN]',
    100,
    0,
    120000,
    'http://localhost:5000/product/1664975713786-ae40ec81fc3821a21a4a1d3e34edea84.jfif',
    1000,
    '<p>Món này chiên giòn cực bắt cơm ???? Giá yêu thương</p>',
    1,
    7
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    16,
    4,
    'Khô cá Lóc đồng sấy Tiêu Sọ 500Gram',
    100,
    0,
    135000,
    'http://localhost:5000/product/1664975955439-bf98d9748b5b04e091fef48487d3e08a.jfif',
    500,
    '<p>Mô tả sản phẩm: Khô cá Lốc tẩm tiêu sọ, vị mặn mặn, ngọt ngọt, thơm tiêu sọ Phú Quốc, thích hợp chiên hoặc nướng. Khách có thời gian nên thử nướng ăn rất thơm và ngon ạ!&nbsp;</p><p>Hàng này sấy bằng máy nên rất khô và sạch thích hợp vận chuyển đi nước ngoài. Khách mua hàng tại shop cứ yên tâm về chất lượng, hàng nhập mỗi ngày, an toàn hợp vệ sinh, có sỉ số lượng lớn. 100% ảnh thật shop chụp.</p>',
    1,
    7
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    17,
    4,
    'Khô cá lóc sợi - món mới gây nghiện 500g',
    100,
    1,
    170000,
    'http://localhost:5000/product/1664976279639-9c0a233e2f9b40443981038a2280f55f.jfif',
    500,
    '<p>Khô cá lóc sợi được làm từ khô cá lóc lớn phi lê rút xương thái sợi. Cách tẩm ướp hơi khác so với khô cá lóc nguyên con nên cho vị ngon lạ miệng hơn.</p><p>Khô tẩm vị mặn cay nhẹ, ngọt vị cá, không tẩm đường, chiên hoặc nướng lên chấm mắm me, ăn với cơm hoặc xé trộn gỏi xoài rất tuyệt</p><p>Đặc biệt là rất tiện cho các mẹ cho bé măm măm, ngày bận rộn mẹ lấy vài sợi chiên lên thêm ít dưa leo/cải chua/rau sống hoặc rau luộc là con có bữa ngon, chồng nhậu xả láng. Vào bếp chưa bao giờ nhàn hơn thế.</p><p>Khô tẩm vừa ăn thôi chứ không mặn nhiều nên ba mẹ cứ an tâm cho bé ăn cũng như bản thân thưởng thức nhé!</p>',
    1,
    7
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    18,
    4,
    '1Kg Khô Cá Lóc Bao Ngon Tuyệt Vời Hàng Loại 1',
    100,
    0,
    250000,
    'http://localhost:5000/product/1664976538034-6f9ae05192462fc3f191615f8b1880e7.jfif',
    1000,
    '<p>THÔNG TIN SẢN PHẨM :</p><p>- Khô được làm từ cá tươi, ngon, vệ sinh, không phẩm màu độc hại, không chất bảo quản, rất dinh dưỡng.&nbsp;</p><p>- Chọn nơi có nắng tốt để phơi khô.&nbsp;</p><p>- Trãi đều khô ra để ánh nắng có thể tiếp xúc đều lên bề mặt khô. Đảo thường xuyên để ánh nắng làm khô đều cả hai mặt. trực tiếp phơi như vậy ít nhật 3 ngày cho đến khi cá đạt độ khô vừa ý.&nbsp;</p><p>- Với thớ thịt đậm đà, dai thơm, vị ngọt tự nhiên khô cá lóc có thể biến tấu thành nhiều món ăn ngon hơn và hấp dẫn hơn - Đậm chất miền quê phù hợp quà biếu.</p><p>- Cách làm giảm độ mặn của cá khô trước khi nấu :&nbsp;</p><p>+ Cách 1 : ngâm cá khô với nước vo gạo khoảng 30p sau đó rửa lại bằng nước sạch&nbsp;</p><p>+ Cách 2 : Ngâm cá khô trong nước cốt chanh :Ngâm cá khô trong nước cốt chanh pha với tỉ lệ 1 chén nước&nbsp;</p><p>+ 1/3 chén cốt chanh khoảng 30 phút. Các bạn lưu ý nếu nước chanh nhiều quá có thể ảnh hưởng tới hương vị món ăn nên nếu thấy khô cá vị chua bạn có thể cho ít nước cốt chanh hơn nhé.&nbsp;</p><p>+ Cách 3 : Ướp cá khô với đường và chanh Trước tiên rửa cá qua nước cho cá mềm và dễ thấm, sau đó ướp cá khô với chanh với đường theo tỷ lệ tuỳ ý (theo khẩu vị) khoảng 15 phút.Nếu không thích đường có thể thay thế bằng mật ong&nbsp;</p><p>+ Cách 4 : Ngâm cá khô với nước muối loãng : ngâm nước muối pha loãng trong 20 phút có thể làm giảm độ mặn có cá khô, xin lưu ý nhớ rửa lại với nước thường để loại bỏ nước muối trước khi chế biến bạn nhé</p>',
    1,
    7
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    19,
    4,
    'Khô Cá Lóc 3 Nắng - Đặc Sản Miền Tây',
    100,
    0,
    115000,
    'http://localhost:5000/product/1664976886452-dbc559108333bb3dda35444c9fa0ee31.jfif',
    500,
    '<p>Khô Cá Lóc 3 Nắng là một trong những đặc sản miền tây được nhiều người ưa chuộng với độ thơm ngon tự nhiên công thức ướp cá đặc trưng miền tây. Trên thực tế không phải ai ở miền Tây cũng biết cách làm khô cá lóc ngon. Để có được những con khô ngon thì khâu chọn cá là quan trọng nhất, trọng lượng từ 400gr-600gr 1 con, cá quá nhỏ hoặc quá to sẽ không ngon.</p><p>Khô cá lóc là món ăn ngon tiện lợi không thể thiếu trong mỗi gia đình của người miền Tây khi vào dịp Tết cổ truyền của người Việt. Đặc biệt, khô cá lóc dẻo 2 nắng được chế biến thành nhiều món ngon như: Khô cá lóc nấu canh chua bắp chuối (hoa chuối) hoặc củ chuối; Khô cá lóc rim mắm đường; Khô cá lóc nướng hoặc chiên vàng chấm mắm me; Khô cá lóc trộn gỏi lá sầu đâu, gỏi xoài, gỏi ngó sen, gỏi nộm…</p>',
    1,
    7
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    20,
    4,
    'Khô cá lóc đồng An Giang 4 nắng ướp vừa ăn 500g',
    100,
    0,
    160000,
    'http://localhost:5000/product/1664977383549-4b9fa88d13276acdee1651907e46e26c.jfif',
    500,
    '<p>+ Khô cá lóc đồng An Giang chuẩn lóc đồng 100%. Nhà làm sạch sẽ, chất lượng. Không hóa chất. Tẩm ướp vừa ăn.&nbsp;</p><p>+ Cá phơi 4 nắng, chiên nướng ngon bá cháy.&nbsp;</p><p>+ Cá lóc đồng nhỏ con nhưng sống và ăn thức ăn tự nhiên nên thịt dai thơm, ngọt ngon hơn cá lóc nuôi.</p>',
    1,
    7
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    21,
    5,
    'Khô cá lóc  500gr ,chất lượng thơm ngon,thịt dai ngọt,cá sạch không dùng chất bảo quản',
    100,
    0,
    135000,
    'http://localhost:5000/product/1664977927791-6b79524dfe26bc47548a15c20b8409bd.jfif',
    500,
    '<p>Nguyên liệu : Nguyên liệu chế biến từ cá lóc tươi ngon được nuôi tại các vùng cửa ngõ sông MIền tây. Vì thế khách hàng nên yên tâm về chất lượng nguồn cá khô của chúng tôi&nbsp;</p><p>Chế biến : Sản phẩm được chế biến hoàn toàn thủ công bởi nông dân vớii công thức gia truyền sẽ được phơi nắng tự nhiên 3-5 nắng trong môi trường nhà khép kín tránh côn trùng&nbsp;</p><p>Giá thành : Do lấy trực tiếp từ nông dân làm cá khô nên giá thành mỗi sản phẩm của chúng tôi là tốt nhất, ngoài ra chúng tôi còn hỗ trợ đóng gói hút chân không cho khách phương xa làm quà cho người thân, bạn bè, đối tác.</p>',
    1,
    9
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    22,
    5,
    '500 gram khô cá lóc ngon ướp tiêu đặc sản(tên khác: Cá Quả, Cá chuối, Tràu,...) thơm ngon ngất ngây',
    100,
    1,
    140000,
    'http://localhost:5000/product/1664978248494-99e121590d465578679fd2f68d3aeec3.jfif',
    500,
    '<p>Khô Cá Lóc (tên khác: Cá Quả, Cá chuối, Cá lóc, Cá sộp, Cá xộp, Cá tràu, cá trõn, Cá đô,...) &nbsp;</p><p>Khô cá lóc là một trong những đặc sản Việt với công thức ướp cá đặc trưng. Cá lóc sau khi làm thịt, đánh vảy, moi ruột rồi xẻ làm đôi ở phía lưng, lấy hết xương sống cá bỏ đi và ướp với muối trắng hoặc ớt cay, thêm một chút gia vị, sả đập nhỏ và chút nghệ cho cá bớt mùi tanh rồi đem phơi. Thịt cá cho độ ngon ngọt, thơm béo được sử dụng cho rất nhiều món chiên, xào, nướng làm gỏi&nbsp;hoặc nấu canh, nấu súp…</p>',
    1,
    9
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    23,
    5,
    'Khô cá lóc non (lóc bống, lóc cửng, lóc xẻ) dai ngọt tự nhiên (500g)',
    100,
    1,
    145000,
    'http://localhost:5000/product/1664979241652-24f4f4a11ba2025a48b78c7866b92178.jfif',
    500,
    '<p>Cá lóc non bên mình con vừa phải, không quá lớn (cá quá lớn xương sẽ bị cứng khó ăn), cũng không quá nhỏ.</p>',
    1,
    9
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    24,
    5,
    'Hải sản khô, cá lóc phơi nắng, Khô cá lóc miền Tây thơm ngon ướp vừa ăn 1kg',
    100,
    0,
    199000,
    'http://localhost:5000/product/1664979799097-f8ef2f1d149acc744732cf2aa5dfb9e2.jfif',
    1000,
    '<p>CHI TIẾT SẢN PHẨM&nbsp;</p><p>Cá lóc sau khi làm thịt, đánh vảy, moi ruột rồi xẻ làm đôi ở phía lưng, lấy hết xương sống cá bỏ đi và ướp với muối trắng, ớt cay, thêm một chút gia vị, sả đập nhỏ cho cá bớt mùi tanh rồi đem phơi. Với thớ thịt đậm đà, dai thơm, khô cá lóc vừa có thể làm đồ ăn mặn với khô cá lóc kho thơm, canh chua khô cá lóc, canh mẻ, khô cá lóc sốt chua ngọt vừa làm mồi nhậu khi đem chiên, nướng hoặc xé trộn làm gỏi... Đặc biệt, khô cá lóc chiên hoặc nước chấm với mắm me là món nhâm nhi siêu hao cả cánh mày râu và chị em phụ nữ đều mê mẩn.</p><p>HƯỚNG DẪN THỰC HIỆN MÓN GỎI XOÀI KHÔ CÁ LÓC 1 NẮNG :&nbsp;</p><p>Nguyên liệu: 1 con cá lóc khô, 3 quả xoài xanh. Gia vị: ớt tỏi, rau răm, hành phi, đậu phộng, nước mắm, tiêu bột.&nbsp;</p><p>Cách chế biến như sau: Nướng cá khô trên bếp than cho chín vàng, để nguội xé sợi cho ra dĩa. Xoài xanh gọt vỏ, băm sợi mỏng cho vào một cái tô, cho vào ngăn mát tủ lạnh 30 phút sẽ làm xoài giòn hơn. Ớt tỏi băm nhuyễn làm nước mắm chua ngọt vừa ăn để trộn gỏi. Rau răm rửa sạch cắt nhỏ. Đậu phộng rang chín dã dập. Cho cá khô đã xé sợi, xoài xanh vào một cái thố, rưới nước mắm chua ngọt lên và trộn đều cho thấm, sau đó cho thêm rau răm và ít tiêu vào trộn đều nêm lại vừa ăn. Bày gỏi xoài cá khô ra dĩa, rắc thêm hành phi, đậu phộng rang và ít rau thơm lên trên.</p>',
    1,
    9
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    25,
    5,
    '500 g Khô Cá Lóc Hàng Ngon Y Hình',
    100,
    0,
    110000,
    'http://localhost:5000/product/1664980233552-1baa2a45739ad4746eccecb53f35c3ed.jfif',
    500,
    '<p>Cá Lóc rất đỗi quen thuộc với mỗi nhà&nbsp;</p><p>Cá lóc rất giàu can xi và thích hợp cho mọi người&nbsp;</p><p>Cá lóc nhà em được làm từ cá sống &nbsp;</p><p>Cá được tẩm ướp một chút muối cho vừa ăn . cá rất thích hợp dùng để ăn với cơm.. làm gỏi ,làm cơm chiên sốt chua ngọt ....đều rất ngon</p>',
    1,
    9
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    26,
    5,
    '500 g Khô Cá Lóc Loại Ngon Y Hình Chất Lượng',
    100,
    0,
    145000,
    'http://localhost:5000/product/1664980471873-9340f58c89775a5449a47e2a1cb0038a.jfif',
    500,
    '<p>Cá lóc nhà em làm nhé cả nhà . Hàng chuẩn luôn . cá nhạt không cay nhé.cá là Hàng một nắng nhưng nhà em.phoi khô như cá khô luôn , cá ăn nhạt và rất thơm . có thể dùng để laidai , dùng ăn với cơm thì quá tuyệt</p>',
    1,
    9
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    27,
    6,
    '500g Khô cá lóc đồng ( Hút chân không)',
    100,
    0,
    150000,
    'http://localhost:5000/product/1664980896841-4ed50b7becdba6ad3f1083e4506d9068.jfif',
    500,
    '<p>Được đảm bảo 100% về chất lượng, uy tín đã được khẳng định với hàng vạn đơn hàng trên cả nước.&nbsp;</p><p>Cam kết bán hàng chất lượng cao nhất có đầy đủ tem mác nhãn hiệu nguồn gốc xuất xứ.&nbsp;</p><p>Hàng được đóng hộp, hút chân không bảo quản nguyên vẹn 100% đến tay khách hàng, đổi hoàn trả sản phẩm nếu phát hiện hàng bị hỏng và không đạt chất lượng như cam kết của shop.</p>',
    1,
    11
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    28,
    6,
    'Cá Lóc khô Loại Dẻo 3 nắng, KHÔ CÁ LÓC MIỀN TÂY (LÀM TỪ CÁ TƯƠI 1KG) Thơm ngon đảm bảo chất lượng',
    100,
    0,
    200000,
    'http://localhost:5000/product/1664981225060-cd82bab08494a20c196a03abb876fcd0.jfif',
    1000,
    '<p>Sản phẩm được làm từ nguyên liệu cá lóc đồng chuẩn, không sử dụng cá nuôi. Người nông dân bắt cá còn sống để làm khô, phơi kỹ lưỡng không bị ẩm ướt. Cách ướp khô đặc trưng độc nhất không giống các sản phẩm khác trên thị trường, không sử dụng phẩm màu độc hại.</p><p>Khô ướp tẩm gia vị vừa ăn, không quá mặn, không quá cay, phù hợp với gia đình có người không ăn cay được.</p><p>Khô ngon nhất khi được nướng hoặc chiên, ngoài ra cũng có thể luộc, nấu canh chua, hấp cơm. Nước chấm là nước mắm me, tương ớt.</p>',
    1,
    11
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    29,
    6,
    'Cá lóc khô An Giang, Cá lóc khô đặc sản miền Tây 1kg, Cá ít mặn, Thịt dai, thơm ngon nhiều chất dinh dưỡng',
    100,
    0,
    210000,
    'http://localhost:5000/product/1664981477999-99642b4c59037c24ecd62d713856c7bd.jfif',
    1000,
    '<p>Dinh dưỡng và công dụng&nbsp;trong Khô Cá Lóc &nbsp;</p><p>- Trong&nbsp;khô cá lóc&nbsp;có albumin rất nhiều, tích trữ dinh dưỡng và hormone giúp dự trữ và tiêu hóa các vitamin tan trong chất béo, &nbsp;Albumin giữ các tế bào máu&nbsp;các chất dinh dưỡng khác ở dạng hòa tan.&nbsp;</p><p>&nbsp;- Nếu thiếu albumin sẽ gây ra rối loạn trong hệ thống tuần hoàn của con người.&nbsp;</p><p>- Trong khô cá lóc&nbsp;có chứa protein, hormone và khoáng chất để được lưu thông khắp cơ thể.&nbsp;&nbsp;</p><p>&nbsp;- Giảm thiệt hại do mô &nbsp;Albumin có vai trò quan trọng trong việc cải thiện quá trình tái tạo tế bào.&nbsp;</p><p>&nbsp;- Ngăn chặn sưng trên cơ thể&nbsp;</p><p>&nbsp;- Điều tiết cần bằng chất lỏng &nbsp;- Nếu các tế bào cơ thể bị thiếu chất lỏng, albumin sẽ tạo nước trong máu đưa vào các tế bào cho đến khi sự cân bằng xảy ra.</p><p>Khô cá lóc được sản&nbsp;xuất như thế nào &nbsp;</p><p>- Chọn lựa những con cá nóc sạch sẽ kĩ lượng làm sạch đầu bụng. Khó nhất là đánh thật sạch vảy nhưng phải giữ lại cho da đẹp mắt để đến với tay khách hàng. Rửa cá sạch sẽ bằng nước muối để thịt cá săn chắc lại. &nbsp;</p><p>- Cá có thịt dày nên chúng tôi xẻ ra và tẩm nước mắm, tiêu hạt giã, ớt tươi, mật ong, bột ngọt rồi để khoảng 50 phút trước khi đem phơi.&nbsp;</p><p>-&nbsp;Cá đem phơi ở thờ tiết khô nắng để tránh bị ẩm nước. Một mẻ cá được phơi từ 3-4 ngày trong điều kiện nắng tốt, được lật trở nhiều lần để cá khô đều và có màu đẹp mắt.</p>',
    1,
    11
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    30,
    6,
    '500GR KHÔ CÁ LÓC SỢI PHI LÊ( KHÔNG XƯƠNG ƯỚP VỊ NGON)',
    100,
    2,
    140000,
    'http://localhost:5000/product/1665026127248-9a6c74f8f524a6be9e7621721feed09a.jfif',
    500,
    '<p>500GR KHÔ CÁ LÓC SỢI&nbsp;</p><p>Cá được lóc bỏ xương, thái sợi, tẩm vị vừa ăn rồi phơi khô. Khô cá được phơi dẻo, không bị cứng. Nướng or chiên ăn rất ngon.</p>',
    1,
    11
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    31,
    6,
    'Khô Cá Lóc Sợi Loại Ngon 1kg, Đặc Sản Miền Tây',
    100,
    0,
    196000,
    'http://localhost:5000/product/1665026362387-5c9b785ace60ffa93b76ea385c29930f.jfif',
    1000,
    '<p>KHÔ CÁ LÓC SỢI PHI LÊ TẨM GIA VỊ CỰC NGON&nbsp;</p><p>Món này ko cần quảng cáo, nhưng mỗi nơi ướp gia vị khác nhau. cá bên em được ướp tiêu đường muối ớt hợp khẩu vị 3 miền.&nbsp;</p><p>- Có thể chiên, nướng.</p>',
    1,
    11
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    32,
    6,
    'KHÔ CÁ LÓC SỢI  ĐẶC SẢN MIỀN TÂY 500gr BAO NGON',
    100,
    0,
    170000,
    'http://localhost:5000/product/1665026668395-a21007edffc4d5459e4b1e13665ca8ad.jfif',
    500,
    '<p>KHÔ CÁ LÓC SỢI PHI LÊ bên em được làm ra như thế nào ?!&nbsp;</p><p>Cá tươi sống, quy trình vệ sinh sạch sẽ, vị tươi ngon là tiêu chí bên em&nbsp;</p><p>Cá phơi khô 3 nắng tự nhiên bên em ship toàn quốc, khách có thể mua gửi cho người thân ở nước ngoài vẫn được ạ</p><p>Khô bên em lên giàng mỗi ngày nên hàng gửi cho khách hằng ngày đều là hàng mới</p>',
    1,
    11
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    33,
    2,
    'Khô cá sặc bổi  - mặn vừa, dai thịt, thơm ngon (500g)',
    100,
    35,
    155000,
    'http://localhost:5000/product/1665027361437-9ed6e3ecc6672d8f3ae47bcc299fb005.jfif',
    500,
    '<p>- Khô cá sặc nhà làm được chế biến thủ công từ nguồn cá tươi ngon, đảm bảo ATVSTP tuyệt đối. Khô được làm từ những con cá tươi sống, phơi 4 nắng, cá phơi săn chắc chứ không phơi dẻo và ướt như những nơi khác. Đặc biệt, sặc bên mình chuẩn sặc rằn Cà Mau - loại sặc ngon nhất so với sặc của các vùng khác. Giá sặc phụ thuộc rất nhiều yếu tố: sặc vùng nào? Độ khô? Độ mặn? Do đó, khách lưu ý so sánh chất lượng giúp shop trước khi so sánh giá nhé ạ!</p>',
    1,
    2
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    34,
    2,
    '500 gram khô cá sặc hàng mới về vị vừa ăn cá khô loại 1 bao ngon',
    100,
    38,
    135000,
    'http://localhost:5000/product/1665027512627-14b1baa13fb2944f7c4f1b65dacfe22b.jfif',
    500,
    '<p>Khô cá sặc loại ngon lựa từng ngon, ăn không gắt dầu, không mặn.&nbsp;</p><p>Nửa kg từ 5-7 con.&nbsp;</p><p>Khách hàng khi sử dụng để chiên, nướng, trộn gỏi…&nbsp;</p><p>Cá sặc khô chế biến đảm bảo an toàn vệ sinh chất lượng thơm ngon và tiện lợi cho khách hàng sử dụng. Khách bảo quản trong ngăn mát tủ lạnh hoặc để nơi khô ráo thoáng mát. Đóng gói: hút chân không 500g và 1000g. Rất phù hợp để làm quà tặng và sử dụng cho bữa cơm gia đình.&nbsp;</p><p>Cách sử dụng: cá được tẩm ướp vừa ăn, nên khách hàng muốn lạt hơn thì ngâm nước 10-15 phút trước khi chiên hoặc nướng. Khô cá sặc có thể chế biến thành nhiều món từ chiên, nướng ăn với nước mắm me hoặc các món gỏi đều ngon tuyệt.&nbsp;</p><p>Xuất xứ: Việt Nam</p>',
    1,
    2
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    35,
    2,
    '1KG KHÔ CÁ SẶC TRỨNG BAO NGON',
    100,
    39,
    150000,
    'http://localhost:5000/product/1665027747764-a2553efc151eeeed582b8ff5fc524d06.jfif',
    1000,
    '<p>KHÔ CÁ SẶC TRỨNG</p><p>Khô 1 nắng&nbsp;</p><p>Món này chiên giòn cực bắt cơm&nbsp;</p><p>Giá yêu thương&nbsp;</p>',
    1,
    2
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    36,
    2,
    'Khô cá sặc đồng chính gốc ,chế biến món chiên , gỏi rất ngon',
    100,
    37,
    280000,
    'http://localhost:5000/product/1665028000747-c88084b4d826d5bd6ee192e335a8bdb7.jfif',
    1000,
    '<p>Nguyên liệu : Từ cá sặc đồng sặc bướm tự nhiên trên những cánh đồng lúa miền Tây nam bộ&nbsp;</p><p>Chế biến : Thủ công - Truyền thống. Hoàn toàn tự nhiên&nbsp;</p><p>Cách dùng : Chiên hoặc nướng ăn cùng cơm canh. hoặc nướng lên dùng làm gỏi và các món ăn khác. Xương nhỏ có thể ăn luôn được xương</p>',
    1,
    2
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    37,
    2,
    'Khô cá sặc đồng, cá sặc bướm, hàng siêu lạt CÁ MỚI chất lượng 500gr',
    100,
    39,
    135000,
    'http://localhost:5000/product/1665028216239-c88084b4d826d5bd6ee192e335a8bdb7.jfif',
    500,
    '<p>Tên sản phẩm: Khô cá Sặc Bướm siêu lạc (Hàng chất lượng)&nbsp;</p><p>Xuất sứ: An Giang, Việt Nam&nbsp;</p><p>Quy cách đóng gói: Hút chân không hai lớp kèm nhãn hiệu MÓN QUÀ QUÊ</p>',
    1,
    2
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    38,
    3,
    '500GAM KHÔ CÁ SẶC 2 NẮNG SIZE LỚN NHẤT',
    100,
    0,
    170000,
    'http://localhost:5000/product/1665028982121-d8ee5a0a56c09d7afb5acde38c63ac0d.jfif',
    500,
    '<p>Khô phải là con cá tươi sống, to bằng bàn tay xòe. Sau đó cá được làm sạch vảy và ruột, ngâm trong nước muối chừng 1 giờ thì đem phơi. Khô cá sặc làm món gì ngon ?&nbsp;</p><p>Khô Cá Sặc Bổi rất dễ chế biến thành các món ngon. Đơn giản nhất là nướng hay chiên vàng, xé nhỏ chấm mắm me hoặc ăn với cơm trắng, canh rau cũng rất hao cơm. Ngoài ra, bạn cũng có thể bỏ phần xương, đem trộn với xoài sống băm sợi hay lá sầu đâu sẽ có món gỏi thơm ngon.</p>',
    1,
    5
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    39,
    3,
    'khô cá sặc mặn có đầu loại nhỏ, rẽ thơm ngon',
    100,
    3,
    140000,
    'http://localhost:5000/product/1665029153912-448ef7d2759dc41d3b7bcdac3c1bbfce.jfif',
    500,
    '<p>1kg tầm mười mấy con&nbsp;</p><p>- Sản phẩm: Đóng gói cẩn thận và đã hút chân không. Vị ngon, thơm, hấp dẫn.</p>',
    1,
    5
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    40,
    3,
    'Khô cá sặc đồng 1KG, sặc buớm, 3 nắng vị mặn vừa ăn, thơn ngon',
    100,
    2,
    290000,
    'http://localhost:5000/product/1665029316560-6256dc4ec9f9d2d949cb1a1afed7e346.jfif',
    1000,
    '<p>KHÔ CÁ SẶC ĐỒNG, SẶC BƯỚ.M nhà e ngon xuất sắc, được làm theo công thức truyền thống , từ cá tươi, không chất bảo quản , không hóa chất , dùng ăn với cơm , ăn chơi . nhậu lai rai đều rất ok ạ.</p><p>Khô đc phơi đủ nắng, khô ráo 1 ký nhiều lắm , đóng goí túi hút chân ko nên vận chuyển xa thoải mái&nbsp;</p>',
    1,
    5
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    41,
    3,
    'Khô Cá sặc đồng gói 500gr 100% cá tự nhiên',
    100,
    2,
    135000,
    'http://localhost:5000/product/1665029503955-sg-11134201-22090-w685h51h72hv93.jfif',
    500,
    '<p>Khô cá sặc đồng miền Tây&nbsp;</p><p>Nguyên liệu: Cá sặc đồng tự nhiên&nbsp;</p><p>Phơi khô thủ công, gia vị chuẩn miền Tây Nam Bộ. Không hoá chất, không phẩm màu, đảm bảo vệ sinh&nbsp;</p><p>Đóng gói: Gói 200gr, 500gr hút chân không&nbsp;</p><p>Bảo quản được 6 tháng trong ngăn mát tủ lạnh&nbsp;</p><p>Cách chế biến: Chiên, nướng, hấp&nbsp;</p><p>Ăn kèm với cơm trắng, làm gỏi, các món nhậu</p>',
    1,
    5
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    42,
    3,
    'KHÔ CÁ SẶC 500Gram LOẠI NHỎ',
    100,
    3,
    130000,
    'http://localhost:5000/product/1665029844698-08dd5e96c16e4e7090a17aaef39df496.jfif',
    500,
    '<p>Khô Sặc Nhỏ&nbsp;</p><p>Vị mặn vừa ăn&nbsp;</p><p>Ăn với cơm trắng siêu ngon&nbsp;</p><p>Khô Sặc Nhỏ khô nhà làm, cứng mặn vừa, ăn cùng cơm trắng chan nước dừa hoặc nước lạnh bao ngon, đặm đà cách ăn miền tây</p>',
    1,
    5
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    43,
    4,
    '500gram KHÔ CÁ SẶC ĐẶC SẢN  LOẠI NGON SIZE ( 12-14 CON )',
    100,
    0,
    150000,
    'http://localhost:5000/product/1665030071736-620bcd61fa812e53d213b7af224028e5.jfif',
    500,
    '<p>- Dùng trong ăn cơm, nhậu&nbsp;</p><p>- Cách dùng: Nướng, chiên, hấp,gỏi lá sầu đâu chú ý lửa nhỏ và trở đều tay.&nbsp;</p><p>- Không hóa chất, không phẩm màu&nbsp;</p><p>- Khô cá sặc to đẹp thích hợp làm quà biếu, tặng.</p>',
    1,
    8
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    44,
    4,
    'KHÔ CÁ SẶC ĐỒNG ( SẶC BƯỚM )- Khay500gr',
    100,
    0,
    125000,
    'http://localhost:5000/product/1665030250996-c461dc71cd4c2f261531262c29fffdfe.jfif',
    500,
    '<p>Cách đây khoảng chục năm về trước, cá sặc bướm ở Cà Mau nhiều vô số kể, người dân nơi đây thường dùng nó làm mắm, hoặc phơi khô để dành ăn dần. Khô cá sặc bướm chỉ cần rửa sạch qua nước, đem chiên giòn là đã có ngay món ăn tuyệt hảo, ăn thì rất ư hao cơm.</p>',
    1,
    8
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    45,
    4,
    'Khô cá Sặc Bổi (size 14 con 1kg)',
    100,
    0,
    290000,
    'http://localhost:5000/product/1665030469516-8bb8ed3543c4ce5789c6c759d4596588.jfif',
    1000,
    '<p>Thịt khô cá Sặc Bổi ăn mặn vừa phải, dai và mềm một phần là do chất lượng thịt của cá, phần khác do bí kịp chế biến. Theo chia sẻ của các cơ sở sản xuất lí do cá dai mềm là do cá tươi làm sạch sẽ sẽ được ướp đá trước khi ướp muối. Sau đó đem phơi nắng đẹp, muốn hương vị cá đậm dà, thịt mềm thì chỉ nên phơi một nắng.</p><p>Không cần cầu kỳ, tẩm ướp trong chế biến nhưng khô cá Sặc Bổi vẫn chiếm được tình cảm của thực khách. Âu đó cũng là đặc điểm thiên phú của chúng.</p><p>Có rất nhiều cách để chế biến và thưởng thức với khô cá Sặc Bổi: chiên, nướng, trộn gỏi...</p>',
    1,
    8
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    46,
    4,
    'Khô Cá Sặc Đồng 500gram Thơm ngon chất lượng  ',
    100,
    2,
    200000,
    'http://localhost:5000/product/1665030645790-a0d72f43b0604dc059ccae9eef47781f.jfif',
    500,
    '<p>Khô được làm từ cá sặc thiên nhiên nên thịt thơm ngon mùi vị đặc trưng.&nbsp;</p><p>Vị vừa ăn không qua mặn, làm theo bí quyết làm nghề gia đình.&nbsp;</p><p>Khô được phơi đủ nắng, chất lượng đảm bảo.&nbsp;</p><p>Khô cá sặc rất dễ ăn, có thể nướng, chiên, làm gỏi, ăn với cơm hoặc làm đồ ăn đều rất ngon.</p>',
    1,
    8
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    47,
    4,
    'Khô cá sặc bướm 1KG , hải sản khô sặc đồng đánh bắt tự nhiên đặc sản Miền Tây chất lượng thơm ngon , nhiều thịt',
    100,
    2,
    474000,
    'http://localhost:5000/product/1665030849979-cd5c8d844386ff8e74bec29d047763c8.jfif',
    1000,
    '<p>Nguyên liệu Từ cá sặc đồng sặc bướm tự nhiên trên những cánh đồng lúa miền Tây&nbsp;</p><p>Chế biến Thủ công - Truyền thống. Hoàn toàn tự nhiên&nbsp;</p><p>Cách dùng Chiên hoặc nướng ăn cùng cơm canh. hoặc nướng lên dùng làm gỏi và các món ăn khác. Xương nhỏ có thể ăn luôn được xương</p>',
    1,
    8
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    48,
    4,
    'Khô cá sặc (rằn, bổi) bỏ đầu 4 nắng 1kg, thương hiệu đặc sản (An Giang) ăn là ghiền!',
    100,
    0,
    399000,
    'http://localhost:5000/product/1665031108107-1f2e75a4f6f56c9a19c4f00c0144b7e0.jfif',
    1000,
    '<p>Khô cá sặc hay còn gọi là khô sặc rằn, khô sặc bổi là món ăn rất quen thuộc với người dân miền Tây. Hầu như nhà nào cũng đều trữ sẵn trên gian bếp để những bữa không kịp đi chợ hay phải ra đồng sớm thì chỉ cần 5 phút là có ngay bữa cơm cho gia đình. Quá trình làm khô cá sặc (rằn, bổi).</p><p>Thịt khô cá sặc rằn ăn mặn vừa phải, dai và mềm một phần là do chất lượng thịt của cá, phần khác do tay nghề của người làm khô. Cá sặc rằn sau khi đánh bắt được làm sạch, bỏ ruột, cạo vảy, ướp gia vị từ 2 đến 3 tiếng cho thấm đều rồi tiến hành đem phơi. Tùy vào khẩu vị của từng người mà có khô cá sặc rằn 1 nắng hay nhiều nắng,đa phần khách hàng thích loại nhiều nắng hơn vì dễ bảo quản, để ăn lâu được.</p><p>Các món ngon được chế biến từ khô cá sặc!&nbsp;</p><p>Khô cá sặc chiên ăn với cơm nguội.&nbsp;</p><p>Khô cá sặc trộn gỏi xoài.&nbsp;</p><p>Gỏi sầu đâu khô cá sặc.&nbsp;</p><p>Gỏi dưa leo khô cá sặc.&nbsp;</p><p>Khô cá sặc nướng.</p>',
    1,
    8
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    49,
    5,
    'Khô cá sặc lá, sặc rằn con, sặc nhỏ chính gốc, tự nhiên 1KG',
    100,
    2,
    230000,
    'http://localhost:5000/product/1665031347712-584e0cc8d7e454d1005383b47b86c6f1.jfif',
    1000,
    '<p>Chế biếnThủ công - Truyền thống. Hoàn toàn tự nhiên</p><p>Cách dùng Chiên hoặc nướng ăn cùng cơm canh. hoặc nướng lên dùng làm gỏi và các món ăn khác. Xương nhỏ có thể ăn luôn được xương</p><p>Bảo quản: Nơi thoáng mát, tránh ánh nắng trực tiếp. Bảo quản tốt nhất là để trong tủ lạnh.&nbsp;</p><p>HSD : 6 tháng</p><p>Gói 500gr; Gói 1kg: đóng gói hút chân không.&nbsp;</p><p>Khô được làm thủ công, phơi dưới nắng tốt.&nbsp;</p><p>Khẩu vị lạt vừa ăn KHÔNG mặn hoặc quá khô.&nbsp;</p><p>Không hóa chất, không phẩm màu, đảm bảo an toàn.</p>',
    1,
    10
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    50,
    5,
    'Khô Cá Sặc Bổi Siêu Ngon Khô Ráo 1Kg',
    100,
    0,
    220000,
    'http://localhost:5000/product/1665031551338-089f61c1067ad226c902f0d8c7a8e2a9.jfif',
    1000,
    '<p>KHÔ CÁ SẶC BỔI&nbsp;</p><p>Thịt khô ngọt, vị vừa ăn ngay cả khi dùng cùng với bia&nbsp;</p><p>Thích hợp chế biến nhanh gọn: nướng, chiên, làm gỏi ngon xuất sắc&nbsp;</p><p>Khách đến nhà đột xuất vẫn có mồi bén đãi khách mà không mất nhiều thời gian.&nbsp;</p><p>Làm quà biếu sạch đẹp - vệ sinh.</p>',
    1,
    10
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    51,
    5,
    'Khô cá sặc bỗi 2 Nắng 500gram Thơm Ngon Chất Lượng',
    100,
    0,
    130000,
    'http://localhost:5000/product/1665031738791-8d343bd653535b1135eec58534b12720.jfif',
    500,
    '<p>????????????́???????? ????????̂???? ????????̂???? ????????̂̀ ????????????????̂̀???? ????????̂́???? ????????????̂́???? ????????̛́ ????????̀ ????????????̂́???? ????????̛????̛̣???????? ????????̉???? ????????́ ????????????̂ ????????̂???? ???????? ????????????́.&nbsp;</p><p>????????́ ????????????̂ đ????̛????̛̣???? đ????́???????? ????????́????,????????́???? ????????????̂???? ????????????̂???????? ????????̣???????? ????????̃, ????????????̂???????? ????????̀????, ????????????̂???????? ????????????̉???? ????????̛????̛́????, ????????????̂???????? ????????̂̉ ????????̛̃.&nbsp;</p><p>????????̣???? ????????????̛????̛̀???? ????????́ ????????????̂̉ ???????? ????????̂???? ???????????? ????????̣̂???? ????????????????????̂̉???? đ???? ???????? ????????̀ ????????̂̃ ????????̀???????? ????????̉???? ????????????̉????.</p>',
    1,
    10
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    52,
    5,
    'Khô cá sặc loại 1 đặc sản miền Tây (1kg)',
    100,
    0,
    250000,
    'http://localhost:5000/product/1665031894914-225510e628123996bb00613127b479e1.jfif',
    1000,
    '<p>Hướng dẫn sử dụng:&nbsp;</p><p>• Cá sau khi phơi khô bạn có thể dùng giấy chống ẩm bọc lại rồi cho vào bọc nhựa cột chặt hoặc bọc nhiều lớp giấy báo, dùng bao ni lông bọc kín lại, khoảng 1 tuần bạn lại đem cá khô phơi qua nắng để tránh ẩm mốc. Để nơi khô ráo thoáng mát, cứ như vậy cá sặc khô có thể bảo quản 1 đến 2 tháng.&nbsp;</p><p>• Nếu muốn bảo quản cá lâu hơn thì bạn dùng bao ni lông bọc kín cá lại và cho vào ngăn mát hoặc ngăn đông của tủ lạnh.&nbsp;</p><p>• Cá được để trong tủ lạnh có thể bảo quản được lâu hơn, khoảng 6 tháng và không làm giảm chất lượng.&nbsp;</p><p>• Cá khô nếu được hút chân không sẽ bảo quản tốt vì tránh được vi khuẩn xâm nhập. Đồng thời không để cá khô chung với các sản phẩm tươi sống khác để tránh việc cá bị nhiễm khuẩn, nhanh hỏng hơn.</p>',
    1,
    10
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    53,
    5,
    'Khô Cá Sặc - Loại Ngon Tầm 500G',
    100,
    0,
    200000,
    'http://localhost:5000/product/1665032048534-ab1df0ade7e0cb49b750e9f284b9b80c.jfif',
    500,
    '<p>Hàng có sẵn&nbsp;</p><p>100% được làm từ cá tươi nên thịt khô rất ngon,không bị bủng như 1 số loại khô làm từ cá ươn&nbsp;</p><p>Ướp vị vừa ăn, vị mặn rất nhẹ vừa đủ để làm khô nên thích hợp cho người kiêng ăn mặn</p>',
    1,
    10
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    54,
    5,
    '500gr khô cá sặc đặc sản Cà Mau (loại 10-11c/kg)',
    100,
    0,
    160000,
    'http://localhost:5000/product/1665032243755-sg-11134201-22090-8q5hetiz4yhva7.jfif',
    500,
    '<p>Cá sặc lạt 3 nắng, lạt vừa ăn ko lạt nhách&nbsp;</p><p>khô sặc làm từ cá tươi, ướp ít muối, bột ngọt, phơi 3 nắng khô ráo, thịt đỏ ao, dai ngon ko bở.&nbsp;</p>',
    1,
    10
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    55,
    6,
    '1KG KHÔ CÁ SẶC TRỨNG 1 NẮNG HÀNG MỚI VỀ',
    100,
    0,
    380000,
    'http://localhost:5000/product/1665032995282-b86838e9012064aa083d42c4ac856f83.jfif',
    1000,
    '<p>Cam Kết:&nbsp;</p><p>+Không tẩm màu, phơi đủ nắng nên màu cá khô vàng sậm tự nhiên.&nbsp;</p><p>+Bảo đảm vệ sinh an toàn thực phẩm.&nbsp;</p><p>+Đóng gói sạch đẹp an toàn, bảo quản tốt, thích hợp làm quà biếu, tặng.&nbsp;</p><p>+Không chất bảo quản, nên sản phẩm có hạn dùng ngắn, các bạn yên tâm về chất lượng và sức khỏe khi dùng nhé.&nbsp;</p><p>+Bảo quản lâu ở nhiệt độ tủ lạnh ( tốt nhất là ngăn đá)&nbsp;</p><p>+Sau khi nhận được hàng, nếu có gì không hài lòng, xin khách hãy nhắn tin cho shop, shop sẽ hỗ trợ hết mình.</p>',
    1,
    12
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    56,
    6,
    '(500gr) KHÔ CÁ SẶC BỔI- Dẻo 2 nắng, mặn vừa ăn',
    100,
    1,
    110000,
    'http://localhost:5000/product/1665033257900-d5e73de0cdae3d2ad9412d1a16fb084a.jfif',
    500,
    '<p>Cá Sặc tươi nguyên con bỏ ruột ướp muối vừa ăn.&nbsp;</p><p>Cá được phơi 2 nắng, dẻo mềm giữ được độ dai của thịt cá, không bở cũng không cứng.&nbsp;</p><p>Chiên cá giòn lên ăn kèm cơm trắng cùng canh rau là hao cơm lắm khách nhé. ✨ Xuất xứ: An Giang ✨ Đóng gói: Túi nữa ký (tầm 5-6con) hút chân không sạch sẽ.&nbsp;</p><p>Bảo quản: Ngăn đá tủ lạnh.&nbsp;</p><p>Chế biến: Rã đông tự nhiên</p><p>- Khô Cá sặc có thể làm được nhiều món ngon như:&nbsp;</p><p>- Khô Cá sặc chiên giòn ăn với cơm.&nbsp;</p><p>- Khô sặc trộn gỏi xoài rau răm, gỏi dưa leo&nbsp;</p><p>- Khô sặc nướng trộn gỏi đọt sầu đâu...</p>',
    1,
    12
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    57,
    6,
    'Khô cá sặc bổi Cà Mau túi 500g size 8 con 1 kg',
    100,
    1,
    170000,
    'http://localhost:5000/product/1665033452798-5388ad24d06ea94823340b6bb8df1431.jfif',
    500,
    '<p>Khô cá sặc bổi Cà Mau size 8 con 1kg. túi 500g hút chân không. vị vừa ăn không mặn như khô truyền thống</p>',
    1,
    12
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    58,
    6,
    'Khô cá sặc bướm 500gram 100% cá đồng thơm ngon',
    100,
    2,
    159000,
    'http://localhost:5000/product/1665033687799-01e82c6ce2505ee71be12634863d8c10.jfif',
    500,
    '<p>Chế biến từ cá đồng còn tươi sống, làm sạch, cắt đầu, cắt vây đuôi, ướp sơ ít muối và đem phơi khoảng 2 nắng gắt cho khô ráo hẳn. Luôn bảo quản khô cá sặc bướm bằng cách gói kín.</p><p>Cách dùng: Nướng, chiên...</p><p>Hạn sử dụng: 6 tháng trong ngăn đá tủ lạnh</p>',
    1,
    12
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    59,
    6,
    '500gr Khô cá sặc bổi 3 nắng',
    100,
    5,
    150000,
    'http://localhost:5000/product/1665033946429-efe4f1a9a544d27f11430d718b257671.jfif',
    500,
    '<p>Khô Cá Sặc Bổi rất dễ chế biến lắm luôn&nbsp;</p><p>- Nướng hay chiên vàng xé nhỏ chấm mắm me hoặc ăn với cơm trắng, canh rau cũng rất hao cơm&nbsp;</p><p>- Ngoài ra, bạn cũng có thể bỏ phần xương, đem trộn với xoài sống băm sợi hay lá sầu đâu sẽ có món gỏi tuyệt hảo</p><p>Khô Size 10 - 12 con/kg</p>',
    1,
    12
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    60,
    6,
    'KHÔ CÁ SẶC BỔI CON TO 7-9 CON/KG TÚI 500gr',
    100,
    0,
    150000,
    'http://localhost:5000/product/1665034091946-0f57a990585847b315d487191c337b60.jfif',
    500,
    '<p>Khô cá Sặc rất dễ ăn, nướng, xé ra nhỏ chấm muối ớt hay chiên vàng, chặt ra chấm mắm me nhắm cùng rượu đế cũng như bia đều rất đã. Ngoài ra, bạn cũng có thể bỏ phần xương, đem trộn với xoài sống băm sợi hay lá sầu đâu sẽ có món gỏi tuyệt hảo. Hoặc đơn giản nướng lên xé nhỏ là đã có bữa ăn no mà vô cùng đậm đà.</p>',
    1,
    12
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    61,
    2,
    'Khô cá tra 1kg Mekong Foods , chất lượng hảo hạng , thời gian sử dụng lâu nguồn nguyên liệu cá sạch',
    100,
    41,
    270000,
    'http://localhost:5000/product/1666513069408-e42b5edc9ab6bf6ba3bdecf5639756fd.jfif',
    1000,
    '<p>Đóng gói : Sản phẩm được đóng gói hút chân không trước khi đóng vào hộp cárton để giao đi cho quý khách nên đảm bảo thời gian vận chuyển lâu không bị hư hỏng .</p><p>Khối lượng : Khách hàng chọn trọng lượng mình muốn mua Ví dụ : 1kg sau đó đặt hàng.</p><p>HSD : 6 Tháng kể từ ngày đóng gói giao hàng</p><p>Nguyên liệu : Nguyên liệu được chế biến bằng cá tra phồng tươi ngon từ nông dân nuôi trồng tại các vùng ven biển như Cần Giờ ,Cà Mau Chế biến : Sản phẩm được chế biến hoàn toàn thủ công bởi nông dân với công thức gia truyền sẽ được phơi nắng tự nhiên 3-5 nắng trong môi trường nhà khép kín tránh côn trùng</p><p>Chất lượng : Sản phẩm bán ra đều đạt mức chất lượng tốt ngon nhất , đảm bảo hàng sạch , hàng mới tuyệt đối không bán hàng cũ hàng tồn kho ,shop đền 200% nếu phát hiện hàng cũ.</p><p>Giá thành : Do lấy trực tiếp từ nông dân làm cá khô nên giá thành mỗi sản phẩm của chúng tôi là tốt nhất, ngoài ra chúng tôi còn hỗ trợ đóng gói hút chân không cho khách phương xa làm quà cho người thân, bạn bè, đối tác.</p>',
    1,
    3
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    62,
    2,
    '1KG khô cá tra giàu dinh dưỡng , hải sản khô ngon hảo hạng nhiều Vitamin ,thực phẩm được khách hàng rất thich',
    100,
    37,
    175000,
    'http://localhost:5000/product/1666513434320-fad417d7663795a082b392c5feba6d61.jfif',
    1000,
    '<p>Hiện nay có hàng ngàn đơn vị kinh doanh hải sản khô trên toàn quốc, nhưng gian hàng QuangBa vẫn chiếm trọn sự tin yêu của khách hàng và có cho mình một lượng khách hàng ổn định. Đơn giản bởi chúng tôi mang tới cho khách hàng chất lượng sản phẩm tốt nhất, cung cách phục vụ chuyên nghiệp nhất.</p><p>Hải sản được lựa chọn kỹ càng từ những vựa hải sản lớn trên khắp cả nước, đảm bảo chất lượng hải sản tốt nhất, thơm ngon nhất như Quảng Ninh, Hải Phòng, Nghệ An, Nha Trang, Phú Quốc… Tất cả hải sản được chọn lọc để sấy khô, phơi một nắng đều là hải sản tươi ngon, không phải hải sản đã chết ươn, chất lượng kém. Do đó, khi ăn, bạn sẽ thấy hương vị thơm ngon, dai dai của cá, của tôm như khi còn tươi, thay vì vị bở bở và mùi khó chịu của cá tôm đã bị chết, ươn trước khi làm khô mà nhiều đơn vị đang bày bán.</p><p>Hải sản được lấy tận gốc, không thông qua trung gian nên mức giá hợp lý, cạnh tranh trên thị trường.&nbsp;</p>',
    1,
    3
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    63,
    2,
    'Khô cá tra phồng đặc sản An Giang chất lượng ngon , nhiều dinh dưỡng , hản sản khô đảm bảo sức khỏe (500gram)',
    100,
    39,
    88000,
    'http://localhost:5000/product/1666513674996-36ed0525bf7ea6fceee96e0a74f9650a.jfif',
    500,
    '<p>Khô cá tra có hàm lượng đạm cao, đồng thời dễ tiêu hóa hơn các loại thịt khác. Hơn nữa mỡ trong cá da trơn ít hơn thịt nhưng chất lượng tốt hơn nhiều vì chứa các axit béo không no chiếm tỉ lệ đến khoảng 80% trong tổng số lipid, gồm oleic, linolenic, arachidonic, clupanodonic… Các axit béo này rất cần thiết cho hệ thần kinh, hệ tuần hoàn và hệ tiêu hóa.</p><p>Riêng với phụ nữ, khi ăn các loại cá da trơn như cá tra và cá basa thì nguyên tố “sắt” trong các loài này rất dễ được đồng hóa, cơ thể chuyển hóa các chất đó một cách dễ dàng. Chị em phụ nữ cứ yên tâm khi ăn mỡ cá tra, cá basa vẫn không lo bị béo mà còn có lợi cho việc làm đẹp nữa đấy!</p><p>Vì công dụng tuyệt vời đó chị em phụ nữ hãy mạnh dạn đưa cá tra và cá basa vào bữa ăn thường xuyên hơn để cung cấp nguồn collagen tự nhiên cho làn da mà không phải mất nhiều chi phí làm đẹp.</p>',
    1,
    3
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    64,
    2,
    '1 Kg Mỡ bụng cá tra nhà làm Thơm Ngon Béo, giá sỉ hàng mới',
    100,
    50,
    90000,
    'http://localhost:5000/product/1666513847837-73d43191415ffef8ed6e530607f77282.jfif',
    1000,
    '<p>Sản phẩm ức mỡ cá tra (basa) đc sản xuất chế biến tự nhiên,đảm bảo chất lượng thơm ngon &amp; vệ sinh ATTP Sản phẩm rất tốt cho sức khoẻ đặc biệt là phụ nữ trong tình trạng khó mang thai. Khi ăn ức mỡ cá tra sẽ hỗ trợ tốt cho sức khoẻ của chị em.</p>',
    1,
    3
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    65,
    2,
    '1KG Khô lườn cá tra phồng 3 nắng [Đặc sản An Giang]',
    100,
    39,
    110000,
    'http://localhost:5000/product/1666514161734-8cd9b4ec9b0e6c0fd361ce3ca4004da5.jfif',
    1000,
    '<p>Khô lường được cắt ra từ phần bụng cá tra phồng 3 nắng, phơi thủ công, ướp sẵn gia vị. Đối với khách có khẩu vị nhạt, có thể ngâm qua nước, để ráo và chế biến như bình thường.&nbsp;</p><p>LƯU Ý: sản phẩm thích hợp với bạn nào thích khẩu vị BÉO vì phần lường bụng cá tương đối nhiều mỡ. Sau khi sơ chế qua nước sạch, quý khách cắt khúc vừa ăn tuỳ theo món và sở thích.</p><p>Bảo quản: 6 tháng ngăn đông</p>',
    1,
    3
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    66,
    3,
    '1 kg Khô Cá Lưỡi Trâu Chiên giòn xuất sắc- đặc sản miền tây',
    100,
    2,
    109000,
    'http://localhost:5000/product/1666515401728-9535a2cffa5663d3701c13afcdead1c2.jfif',
    1000,
    '<p>CÁC MÓN NGON TỪ KHÔ LƯỠI TRÂUBẢO QUẢN- Khô cá lưỡi trâu là loại cá có rất ít xương, thịt ngọt.</p><p>- khô cá lưỡi trâu, một món ăn tuy đạm bạc nhưng rất độc đáo nhờ thịt ngọt, mềm và mùi vị thơm ngon không chỗ chê vào đâu được.</p><p>- Khô cá lưỡi trâu có thể chế biến thành nhiều món ngon &amp; tiện nhất đó là bạn có thể chiên giòn, hoặc là có thể chiên vừa chín, ăn kèm với rau thơm, ngon nhất là dưa leo, cà chua, rau răm, rau cải..Khô cá lưỡi trâu trộn gỏi xoài chua đậm vị miền Trung</p><p>.Khô cá lưỡi trâu chiên giòn</p><p>HSD : 6 tháng</p>',
    1,
    6
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    67,
    3,
    '1KG CÁ LƯỠI TRÂU KHÔ LOẠI 1 BAO NGON',
    100,
    2,
    99000,
    'http://localhost:5000/product/1666515578580-42e3cf5a9d34e469e0c8a57a2bc2d3bd.jfif',
    1000,
    '<p>Khô cá lưỡi trâu Chiên giòn xuất sắcThông tin chi tiết về Khô cá Lưỡi Trâu CÁC MÓN NGON TỪ KHÔ LƯỠI TRÂUBẢO QUẢN- Khô cá lưỡi trâu là loại cá có rất ít xương, thịt ngọt.</p><p>cá có rất ít xương, thịt ngọt. - khô cá lưỡi trâu, một món ăn tuy đạm bạc nhưng rất độc đáo nhờ thịt ngọt, mềm và mùi vị thơm ngon không chỗ chê vào đâu được.&nbsp;</p><p>- Khô cá lưỡi trâu có thể chế biến thành nhiều món ngon &amp; tiện nhất đó là bạn có thể chiên giòn, hoặc là có thể chiên vừa chín, ăn kèm với rau thơm, ngon nhất là dưa leo, cà chua, rau răm, rau cải.</p>',
    1,
    6
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    68,
    3,
    '500g Khô Cá Lưỡi Trâu Cá (Cá Bơn)',
    100,
    2,
    70000,
    'http://localhost:5000/product/1666515801535-62898469725b0b702055df8071d95a15.jfif',
    500,
    '<p>Giá trị dinh dưỡng :&nbsp;</p><p>- Cá lưỡi trâu được chia làm 2 loại do đặc điểm thịt của chúng, gồm cá có thịt trắng và cá có thịt sẫm màu. Trong đó, nếu như cá có thịt sẫm màu chứa nhiều chất dinh dưỡng, thì thịt cá trắng lại ít chất dinh dưỡng hơn. Tuy vậy, có đi phải có lại, cá thịt sẫm tanh hơn, còn cá thịt trắng ít tanh hơn.&nbsp;</p><p>- Nghiên cứu chỉ ra trong thịt cá chứa hàm lượng vitamin A, D và B rất cao. Ngoài ra còn gồm nhiều Enzym, chất khoáng như canxi, photpho, kali, kẽm, axit béo không bão hòa và giàu protein. Đặc biệt, thịt cá lưỡi trâu còn chứa selen, chất giúp cơ thể người chống lại các loại ung thư.</p><p>- Loại cá này sau khi chế biến cho ra hương vị đặc trưng khác biệt so với những loại cá nước mặn khác. Thịt của chúng có vị ngọt thanh, dễ biến tấu thành hàng trăm loại món ngon bổ dưỡng khác nhau đem lại cảm giác mới lạ tuyệt vời.</p>',
    1,
    6
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    69,
    3,
    '[500gr/5-6 con] Khô cá lưỡi trâu lớn 1 nắng',
    100,
    2,
    75000,
    'http://localhost:5000/product/1666515996197-7ec9d3375a1101726e564312ea8f81e8.jfif',
    500,
    '<p>Quý khách xin lưu ý ( Với khô cá 1 nắng: là gần giống cá tươi, cá mềm, thịt ngọt, vị lạt vừa ăn )</p><p>Giá trị dinh dưỡng :&nbsp;</p><p>- Cá lưỡi trâu được chia làm 2 loại do đặc điểm thịt của chúng, gồm cá có thịt trắng và cá có thịt sẫm màu. Trong đó, nếu như cá có thịt sẫm màu chứa nhiều chất dinh dưỡng, thì thịt cá trắng lại ít chất dinh dưỡng hơn. Tuy vậy, có đi phải có lại, cá thịt sẫm tanh hơn, còn cá thịt trắng ít tanh hơn.&nbsp;</p><p>- Loại cá này sau khi chế biến cho ra hương vị đặc trưng khác biệt so với những loại cá nước mặn khác. Thịt của chúng có vị ngọt thanh, dễ biến tấu thành hàng trăm loại món ngon bổ dưỡng khác nhau đem lại cảm giác mới lạ tuyệt vời. Những món điển hình và gắn liền với cá lưỡi trâu có thể kể đến như: cá lưỡi trâu kho tiêu nghệ, cá lưỡi trâu chiên giòn hay cá phơi một nắng, vv…</p><p>- Đối với các tín đồ của cá lưỡi trâu thì việc thưởng thức món ngon từ nguyên liệu này không hề khó khăn chút nào bởi cá được nuôi trồng, đánh bắt trong môi trường đạt chuẩn. Cùng với đó, lượng cá cũng đảm bảo nguồn cung quanh năm với chất lượng hảo hạng nhất phục vụ tới quý khách.</p><p>&nbsp;</p>',
    1,
    6
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    70,
    3,
    '1KG KHÔ CÁ LƯỠI TRÂU 1 NẮNG LOẠI NGON,HÀNG MỚI VỀ',
    100,
    3,
    125000,
    'http://localhost:5000/product/1666618586010-6010449eacc7914815956dded03dac8f.jfif',
    1000,
    '<p>SẢN PHẨM KHÔ CÁ 1 NẮNG CÓ 3 SỰ LỰA CHỌN CHO KHÁCH HÀNG</p><p>HÀNG LOẠI 1 ĐẢM BẢO CHẤT LƯỢNG VỆ SINH AN TOÀN THỰC PHẨM</p><p>HSD : 1 THÁNG KỂ TỪ NGÀY LÊN ĐƠN ĐÓNG GÓI GIAO KHÁCH</p>',
    1,
    6
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    71,
    4,
    'Khô cá dứa lạt 1kg - Cá dứa 3 nắng chất lượng thơm ngon nhiều thịt vị vừa ăn thơm ngon',
    100,
    0,
    200000,
    'http://localhost:5000/product/1666619084185-971db284b3030fdd38fbc9db28b0e527.jfif',
    1000,
    '<p>Đóng gói : Sản phẩm được đóng gói hút chân không trước khi đóng vào hộp carton để giao đi cho quý khách nên đảm bảo thời gian vận chuyển lâu không bị hư hỏng .Đặc biệt shop có hút chân không tất cả các mặt hàng hải sản khô bán ra giao đi cho khách nên anh chị an tâm nhé</p><p>HSD : 6 Tháng kể từ ngày đóng gói giao hàng</p><p>Chất lượng : Sản phẩm bán ra đều đạt mức chất lượng tốt ngon nhất , đảm bảo hàng sạch , hàng mới tuyệt đối không bán hàng cũ hàng tồn kho ,shop đền 200% nếu phát hiện hàng cũ.</p><p>Giá thành : Do lấy trực tiếp từ nông dân làm cá khô nên giá thành mỗi sản phẩm của chúng tôi là tốt nhất, ngoài ra chúng tôi còn hỗ trợ đóng gói hút chân không cho khách phương xa làm quà cho người thân, bạn bè, đối tác.&nbsp;</p><p>Cách dùng : Khô cá dứa là loại cá đặc sản rất ngon hấp dẫn người ăn và có nhiều cách chế biến.</p>',
    1,
    16
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    72,
    4,
    'KHÔ CÁ TRA PHỒNG 1KG NGON BỔ SUNG VITAMIN VÀ DHA ĐẶC SẢN NỔI TIẾNG AN GIANG',
    100,
    0,
    180000,
    'http://localhost:5000/product/1666619494228-23c4082b01bd71d0bd6528981d96d1f8.jfif',
    1000,
    '<p>Tiêu chuẩn chất lượng : Đạt tiêu chuẩn sạch, KHÔNG hóa chất, KHÔNG phẩm màu, đảm bảo VSATTP.&nbsp;</p><p>Hình thức kinh doanh : Bán lẻ giao hàng đi toàn quốc - Kinh doanh sỉ giá rẻ tốt nhất cho đại lý toàn quốc.&nbsp;</p><p>Hỗ trợ cho các địa lý muốn kinh doanh online mở shop online hoặc mở cửa hàng kinh doanh thực phẩm khô toàn quốc.</p>',
    1,
    16
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    73,
    4,
    'Khô cá tra cần giờ ngon đặc biệt thịt dai thơm ngon - hút chân không bảo quản lâu 1kg',
    100,
    0,
    210000,
    'http://localhost:5000/product/1666619855008-f44aced4195def52380bff639a72ad31.jfif',
    1000,
    '<p>Khô cá tra hàng chất lượng bằng 100% nguyên liệu cá tươi, đảm bảo hương vị thơm ngon, đủ điều kiện về vệ sinh an toàn thực phầm. Cách phân biệt cá tra hàng chất lượng, thịt cá màu vàng tươi, không bầm, không đen. không có mùi hôi, chắc thịt không bị bỡ.</p>',
    1,
    16
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    74,
    4,
    'Khô cá Tra 1KG, cá Tra Phồng Khô sấy tự nhiên Cam kết Không chứa chất bảo quản',
    100,
    0,
    240000,
    'http://localhost:5000/product/1666620196129-6fa244a524e5289e91603a5af26273bd.jfif',
    1000,
    '<p>Cách sử dụng:&nbsp;</p><p>+Ngâm trong nước ấm khoảng 30 phút sau đó rửa sạch để ráo trước khi chiên rán (sản phẩm này có thể chiên không cần dầu mỡ bằng cách cho một ít nước vào trong chảo, sau đó thả cá vào, mỡ trong cá tự chảy ra)&nbsp;</p><p>+Sau khi sơ chế xong, cắt khúc chia nhỏ để tủ lạnh ăn dần.&nbsp;</p><p>- Bảo quản: Trong tủ lạnh hoặc nơi khô ráo.</p>',
    1,
    16
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    75,
    5,
    'Túi 500Gr - Khô Cá Tra Phồng, Khô Cá Lăng Phồng Thịt Cá Khô Thơm Béo, Chiên Phồng Giòn Ăn Cơm Cực Ngon Đặc Sản Miền Tây',
    100,
    0,
    75000,
    'http://localhost:5000/product/1666857825571-8893cf873cb7b45e371267bea90e3c7e.jfif',
    500,
    '<p>Nguyên liệu: Cá tra được chăn nuôi đạt chuẩn VietGap, tỏi, ớt, hạt nêm, đường, muối...</p><p>Tên gọi khác: Cá lăng phồng, cá lăn phòng.&nbsp;</p><p>Giao hàng và thu tiền: tận nơi toàn quốc.</p><p>Quy cách đóng gói: 500Gram/gói hút chân không</p><p>Chế biến: Thủ công - Truyền thống. Hoàn toàn tự nhiên</p><p>Cách dùng: Chiên phồng lên ăn cùng cơm trắng</p>',
    1,
    17
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    76,
    5,
    'khô cá tra ngon 1 nắng 140k/kg',
    100,
    0,
    140000,
    'http://localhost:5000/product/1666858071063-b1c9d1f67880394cb0d93e9f7aed73df.jfif',
    1000,
    '<p>khô cá tra phồng nhà làm phơi 1 nắng, hàng bao ngon. Không ngon trả lại tiền hàng y hình giá yêu thương</p>',
    1,
    17
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    77,
    5,
    'Khô Cá Tra Phồng  500gram',
    100,
    0,
    85000,
    'http://localhost:5000/product/1666858195049-43e19f693cb66f35d3a7f9d24c6dd60e.jfif',
    500,
    '<p>Đóng gói: Hút chân không 500gram&nbsp;</p><p>Cách Dùng: Chiên hoặc nướng rất giòn và thơm&nbsp;</p><p>Hạn dùng: 3 tháng&nbsp;</p><p>Bảo quản: Ngăn đông tủ lạnh</p>',
    1,
    17
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    78,
    5,
    '[TÚI 500gr] KHÔ CÁ TRA PHÒNG THƠM NGON',
    100,
    0,
    120000,
    'http://localhost:5000/product/1666858401507-40707ff6d307b12bb56fe1d060d908a0.jfif',
    500,
    '<p>Đóng gói: Hút chân không 500gram&nbsp;</p><p>Cách Dùng: Chiên hoặc nướng rất giòn và thơm&nbsp;</p><p>Hạn dùng: 3 tháng&nbsp;</p><p>Bảo quản: Ngăn đông tủ lạnh</p>',
    1,
    17
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    79,
    5,
    '1KG Khô cá tra phồng (Đặc sản An Giang) Thơm ngon',
    100,
    0,
    170000,
    'http://localhost:5000/product/1666858640501-a0d5de4f24fc620873c5f474ac297d18.jfif',
    1000,
    '<p>Nói đến đặc sản khô cá tra phồng là phải nhắc thêm hai chữ An Giang. Bởi chẳng ở đâu có được loài cá tra Biển Hồ to béo chắc nịch như An Giang – nguyên liệu chính để chế biến khô cá tra phồng.&nbsp;</p><p>Có lẽ, đặc điểm địa hình giáp với biên giới Campuchia nên An Giang mới có được ưu ái này. Cá tra từ Biển Hồ theo con nước sang đây kiếm ăn và đẻ trứng không những cung cấp nguồn nguyên liệu ổn định mà còn tạo ra thế hệ con cho người dân làm giống nuôi dưỡng. Từ đó, tạo tiền đề cho nghề làm khô cá tra phồng phát triển.&nbsp;</p><p>Đặc điểm của khô cá tra phồng là lớp da nên món ngon được thực khách yêu thích nhất là chiên. Cá chiên vàng ươm, thơm phức lại thêm lớp da phồng giòn rất hợp với bữa cơm gia đình đầm ấm.</p>',
    1,
    10
  );
INSERT INTO
  `sanpham` (
    `SP_id`,
    `NB_id`,
    `SP_ten`,
    `SP_soluong`,
    `SP_soluongban`,
    `SP_gia`,
    `SP_image`,
    `SP_trongluong`,
    `SP_mota`,
    `SP_trangthai`,
    `DM_id`
  )
VALUES
  (
    80,
    5,
    '1KG khô cá tra béo vị mặn vùng đặc sản An Giang thơm ngon ngất ngây',
    100,
    0,
    249000,
    'http://localhost:5000/product/1667442254382-f383219f668cd9b44a6c550a169b7434.jfif',
    1000,
    '<p>Khô cá tra phòng dùng để chiên chứ ko phải dùng để nướng như các loại khô khác . Khô cá tra phòng chiên nở phòng ra . Giòn và béo khi ăn&nbsp;</p><p>Hạng sử dụng : 2 tháng bảo quản ngăn mát tủ lạnh</p>',
    1,
    9
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: thongtindonhang
# ------------------------------------------------------------

INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (1, 7, 3, 7, 'LLG799', 2, 100000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (2, 7, 2, 1, 'LLGQ4P', 1, 200000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (3, 8, 2, 1, 'LLGQ4K', 1, 200000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (4, 7, 2, 3, 'LLGQ4X', 1, 200000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (5, 7, 2, 4, 'LLGLUP', 1, 200000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (6, 9, 2, 1, 'LLG79C', 2, 100000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (7, 9, 2, 4, 'LLG79C', 1, 100000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (8, 10, 2, 1, 'LLGG6C', 3, 120000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (9, 11, 2, 1, 'LLGG6V', 1, 120000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (10, 12, 2, 1, 'LLGG6M', 1, 120000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (11, 13, 2, 1, 'LLGG6E', 1, 120000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (12, 8, 2, 3, 'LLGCGU', 2, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (13, 8, 3, 9, 'LLGCG9', 1, 225000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (14, 8, 3, 12, 'LLGCGV', 2, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (15, 9, 3, 10, 'LLGCG6', 1, 189000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (16, 10, 4, 17, 'LLG67D', 1, 170000, 5);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (17, 10, 6, 27, 'LLG67K', 2, 149000, 5);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (18, 11, 4, 47, 'LLG6BB', 2, 474000, 37);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (19, 11, 6, 56, 'LLGWKB', 1, 110000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (20, 11, 6, 58, 'LLGWKW', 2, 159000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (21, 11, 6, 59, 'LLGWKW', 1, 150000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (22, 12, 5, 50, 'LLGHFW', 1, 220000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (23, 12, 5, 26, 'LLGHFW', 1, 145000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (24, 12, 6, 59, 'LLGHFT', 2, 90000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (25, 10, 2, 7, 'LLGABV', 1, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (26, 10, 2, 34, 'LLGABV', 0, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (27, 10, 6, 30, 'LLGAB6', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (28, 11, 3, 12, 'LLGA3F', 2, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (29, 11, 2, 35, 'LLGA3L', 2, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (30, 11, 3, 42, 'LLGA3F', 1, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (31, 7, 5, 23, 'LLGAAL', 1, 145000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (32, 12, 2, 6, 'LLGAR3', 2, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (33, 12, 2, 61, 'LLGAR3', 1, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (34, 11, 2, 64, 'LLGRCL', 2, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (35, 7, 2, 4, 'DHSPMP1', 1, 235000, 5);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (36, 7, 6, 30, 'DHSPMP0', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (37, 7, 5, 22, 'DHSPMP2', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (38, 7, 2, 7, 'LLG8LW', 2, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (39, 8, 2, 36, 'LLG879', 2, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (40, 8, 2, 33, 'LLG879', 2, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (41, 7, 2, 5, 'LLG8AW', 2, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (42, 7, 2, 65, 'LLG8AW', 2, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (43, 9, 2, 64, 'LLG8AY', 1, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (44, 9, 2, 63, 'LLG8AY', 2, 88000, 33);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (45, 9, 2, 37, 'LLG8AY', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (46, 10, 2, 61, 'LLGRUY', 2, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (47, 10, 2, 64, 'LLGRUY', 2, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (48, 11, 2, 36, 'LLGRCL', 2, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (49, 11, 4, 46, 'LLGRCQ', 2, 200000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (50, 11, 5, 49, 'LLGRUE', 2, 230000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (51, 8, 2, 62, 'DHSPMP3', 2, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (52, 8, 2, 35, 'DHSPMP3', 2, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (53, 8, 2, 33, 'DHSPMP3', 2, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (54, 9, 2, 34, 'LLGRYF', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (55, 9, 2, 6, 'LLGRYF', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (56, 9, 3, 12, 'LLGE8U', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (57, 7, 2, 61, 'LLGMDM', 1, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (58, 7, 2, 64, 'LLGEF6', 2, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (59, 7, 2, 7, 'LLGEF6', 2, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (60, 7, 6, 30, 'LLGEFN', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (61, 7, 3, 13, 'LLGE6A', 2, 200000, 5);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (62, 7, 3, 70, 'LLGE6A', 3, 125000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (63, 9, 2, 65, 'LLGE8G', 2, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (64, 9, 2, 4, 'LLGE8G', 1, 235000, 5);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (65, 9, 3, 66, 'LLGE8U', 2, 109000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (66, 9, 3, 69, 'LLGE8U', 2, 75000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (68, 10, 3, 67, 'LLGE89', 2, 99000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (69, 10, 3, 68, 'LLGE89', 2, 70000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (70, 10, 2, 5, 'LLGE8V', 2, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (71, 12, 6, 57, 'LLGE8D', 1, 170000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (72, 12, 6, 59, 'LLGE8D', 2, 150000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (73, 12, 2, 6, 'LLGE8P', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (74, 12, 3, 40, 'LLGE8N', 2, 290000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (75, 11, 3, 14, 'LLGEYL', 1, 160000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (76, 11, 3, 39, 'LLGEYL', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (77, 11, 2, 62, 'LLGEYQ', 1, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (78, 11, 2, 65, 'LLGEYQ', 1, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (79, 7, 2, 4, 'LLGEY7', 2, 235000, 5);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (80, 7, 2, 61, 'LLGEY7', 1, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (81, 7, 3, 42, 'LLGEYF', 2, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (82, 12, 2, 37, 'LLULLW', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (83, 12, 2, 62, 'LLULLW', 2, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (84, 12, 3, 39, 'LLULLK', 2, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (85, 12, 3, 14, 'LLULLK', 2, 160000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (86, 13, 2, 34, 'DHSPMP5', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (87, 13, 2, 6, 'DHSPMP5', 2, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (88, 13, 3, 10, 'DHSPMP4', 1, 189000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (89, 13, 3, 9, 'DHSPMP4', 3, 225000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (90, 13, 2, 6, 'LLULLA', 2, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (91, 11, 2, 33, 'LLULL8', 2, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (92, 11, 2, 63, 'LLULL8', 2, 88000, 33);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (93, 11, 2, 37, 'LLULL8', 1, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (94, 7, 2, 3, 'LLULLR', 1, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (95, 7, 2, 65, 'LLULLR', 2, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (96, 7, 3, 42, 'LLULLM', 2, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (97, 7, 3, 41, 'LLULLM', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (98, 13, 5, 50, 'LLULFU', 1, 220000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (99, 13, 5, 51, 'LLULFU', 2, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (100, 13, 5, 53, 'LLULF3', 2, 200000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (101, 13, 5, 52, 'LLULF3', 1, 250000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (102, 13, 5, 77, 'LLULF4', 2, 85000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (103, 13, 5, 79, 'LLULF4', 2, 170000, 5);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (104, 13, 5, 52, 'LLULFK', 1, 250000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (105, 13, 5, 76, 'LLULFK', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (106, 13, 5, 76, 'LLULFT', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (107, 13, 5, 78, 'LLULFT', 2, 120000, 18);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (108, 7, 2, 64, 'DHSPMP6', 2, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (109, 7, 2, 64, 'LLUULF', 2, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (110, 11, 2, 6, 'DHSPMP7', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (111, 11, 2, 63, 'DHSPMP7', 2, 88000, 33);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (112, 10, 2, 35, 'LLUULR', 2, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (113, 10, 2, 61, 'LLUULR', 1, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (114, 14, 2, 4, 'LLUULE', 1, 235000, 5);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (115, 14, 2, 7, 'LLUULE', 2, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (116, 14, 2, 63, 'DHSPMP8', 2, 88000, 33);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (117, 14, 2, 34, 'LLUUFQ', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (118, 14, 2, 5, 'LLUUFQ', 2, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (119, 15, 2, 4, 'LLUUF7', 2, 235000, 5);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (120, 15, 2, 62, 'DHSPMP9', 1, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (121, 15, 2, 37, 'DHSPMP9', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (122, 15, 2, 64, 'LLUUFU', 2, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (123, 15, 2, 6, 'LLUUFU', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (124, 8, 2, 63, 'LLUUFV', 2, 88000, 33);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (125, 8, 2, 33, 'LLUUF6', 2, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (126, 8, 2, 5, 'LLUUFN', 1, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (127, 8, 2, 3, 'LLUUFN', 2, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (128, 10, 2, 4, 'LLUUFB', 2, 235000, 5);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (129, 10, 2, 35, 'LLUUF3', 2, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (130, 10, 2, 63, 'LLUUF4', 1, 88000, 33);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (131, 10, 2, 62, 'LLUUF4', 2, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (132, 11, 2, 35, 'LLUUFK', 2, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (133, 11, 2, 37, 'LLUUFW', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (134, 11, 2, 7, 'LLUUFH', 1, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (135, 11, 2, 34, 'LLUUFH', 1, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (136, 9, 2, 3, 'DHSPMP10', 2, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (137, 9, 2, 61, 'LLUUFR', 1, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (138, 9, 2, 65, 'LLUUFR', 2, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (139, 9, 2, 2, 'LLUUFM', 2, 235000, 5);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (140, 12, 2, 64, 'LLUUFE', 2, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (141, 12, 2, 62, 'LLUU7Q', 2, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (142, 12, 2, 61, 'LLUU7Q', 1, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (143, 12, 2, 37, 'LLUU7L', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (144, 13, 2, 7, 'LLUU7U', 2, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (145, 13, 2, 63, 'LLUU7C', 1, 88000, 33);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (146, 13, 2, 34, 'LLUU7C', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (147, 13, 2, 61, 'LLUU79', 2, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (148, 14, 2, 65, 'LLUU76', 2, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (149, 14, 2, 6, 'LLUU7N', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (150, 14, 2, 7, 'LLUU7N', 1, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (151, 8, 2, 4, 'LLUU7D', 1, 235000, 5);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (152, 8, 2, 61, 'LLUU7D', 1, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (153, 8, 2, 37, 'LLUU7P', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (154, 8, 2, 35, 'LLUU7P', 1, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (155, 15, 2, 36, 'LLUU7B', 2, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (156, 15, 2, 7, 'LLUU74', 1, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (157, 15, 2, 33, 'LLUU74', 1, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (158, 7, 2, 64, 'LLUU7K', 2, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (159, 7, 2, 36, 'LLUU7W', 2, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (160, 13, 2, 4, 'LLUU7H', 1, 235000, 5);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (161, 13, 2, 62, 'LLUU7H', 1, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (162, 13, 2, 36, 'LLUU7X', 1, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (163, 13, 2, 35, 'LLUU7X', 1, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (164, 10, 2, 64, 'LLUU7A', 2, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (165, 10, 2, 33, 'LLUU78', 2, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (166, 8, 2, 36, 'LLUU7Y', 2, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (167, 8, 2, 34, 'LLUU7R', 1, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (168, 8, 2, 35, 'LLUU7R', 1, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (169, 12, 2, 34, 'LLUUGF', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (170, 12, 2, 33, 'LLUUG7', 1, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (171, 12, 2, 6, 'LLUUG7', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (172, 13, 2, 3, 'LLUUGG', 2, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (173, 13, 2, 65, 'LLUUGU', 1, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (174, 13, 2, 61, 'LLUUGU', 1, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (175, 9, 2, 3, 'LLUUGC', 1, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (176, 9, 2, 5, 'LLUUG9', 1, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (177, 9, 2, 6, 'LLUUG9', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (178, 11, 2, 35, 'LLUUGV', 1, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (179, 11, 2, 37, 'LLUUGV', 1, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (180, 11, 2, 62, 'LLUUG6', 2, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (181, 14, 2, 62, 'LLUUGN', 1, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (182, 14, 2, 65, 'LLUUGN', 2, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (183, 14, 2, 33, 'LLUUGD', 1, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (184, 15, 2, 3, 'LLUUGP', 2, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (185, 15, 2, 63, 'LLUUGP', 1, 88000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (186, 15, 2, 2, 'LLUUGB', 2, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (187, 7, 2, 62, 'LLUUG3', 1, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (188, 7, 2, 37, 'LLUUG3', 1, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (189, 7, 2, 61, 'LLUUG4', 1, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (190, 7, 2, 37, 'LLUUG4', 1, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (191, 11, 2, 33, 'LLUUGK', 1, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (192, 11, 2, 65, 'LLUUGK', 1, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (193, 11, 2, 61, 'LLUUGW', 1, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (194, 11, 2, 62, 'LLUUGW', 1, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (195, 10, 2, 63, 'LLUUGT', 1, 88000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (196, 10, 2, 5, 'LLUUGT', 1, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (197, 10, 2, 3, 'LLUUGH', 1, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (198, 8, 2, 64, 'DHSPMP11', 1, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (199, 8, 2, 63, 'DHSPMP11', 1, 88000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (200, 8, 2, 37, 'DHSPMP12', 1, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (201, 8, 2, 65, 'DHSPMP12', 1, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (202, 11, 2, 3, 'DHSPMP13', 1, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (203, 11, 2, 65, 'DHSPMP13', 1, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (204, 11, 2, 37, 'DHSPMP14', 1, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (205, 13, 2, 4, 'DHSPMP15', 1, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (206, 13, 2, 36, 'DHSPMP15', 1, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (207, 13, 2, 63, 'DHSPMP16', 2, 88000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (208, 15, 2, 5, 'DHSPMP17', 2, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (209, 15, 2, 6, 'DHSPMP17', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (210, 15, 2, 33, 'DHSPMP18', 1, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (211, 15, 2, 7, 'DHSPMP18', 1, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (212, 9, 2, 35, 'DHSPMP19', 1, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (213, 9, 2, 63, 'DHSPMP19', 1, 88000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (214, 9, 2, 5, 'DHSPMP20', 1, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (215, 9, 2, 4, 'DHSPMP20', 1, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (216, 12, 2, 7, 'DHSPMP21', 1, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (217, 12, 2, 33, 'DHSPMP21', 1, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (218, 12, 2, 36, 'DHSPMP22', 1, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (219, 12, 2, 7, 'DHSPMP22', 1, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (220, 8, 2, 63, 'DHSPMP23', 1, 88000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (221, 8, 2, 65, 'DHSPMP24', 1, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (222, 8, 2, 5, 'DHSPMP24', 1, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (223, 10, 2, 4, 'DHSPMP25', 1, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (224, 10, 2, 5, 'DHSPMP26', 1, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (225, 10, 2, 7, 'DHSPMP26', 1, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (226, 11, 2, 35, 'DHSPMP27', 2, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (227, 11, 2, 62, 'DHSPMP28', 1, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (228, 11, 2, 37, 'DHSPMP28', 1, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (229, 14, 2, 7, 'DHSPMP29', 1, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (230, 14, 2, 37, 'DHSPMP29', 1, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (231, 14, 2, 36, 'DHSPMP30', 1, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (232, 14, 2, 34, 'DHSPMP30', 1, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (233, 15, 2, 7, 'DHSPMP31', 1, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (234, 15, 2, 64, 'DHSPMP31', 1, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (235, 15, 2, 65, 'DHSPMP32', 1, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (236, 15, 2, 61, 'DHSPMP32', 1, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (237, 12, 2, 61, 'DHSPMP33', 1, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (238, 12, 2, 65, 'DHSPMP33', 1, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (239, 12, 2, 6, 'DHSPMP34', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (240, 12, 2, 5, 'DHSPMP34', 1, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (241, 10, 2, 64, 'DHSPMP35', 1, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (242, 10, 2, 65, 'DHSPMP36', 1, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (243, 10, 2, 37, 'DHSPMP36', 1, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (244, 10, 2, 6, 'DHSPMP37', 2, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (245, 13, 2, 4, 'DHSPMP38', 2, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (246, 13, 2, 5, 'DHSPMP39', 1, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (247, 13, 2, 7, 'DHSPMP39', 1, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (248, 9, 2, 3, 'DHSPMP40', 1, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (249, 9, 2, 62, 'DHSPMP40', 2, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (250, 9, 2, 36, 'DHSPMP41', 1, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (251, 9, 2, 35, 'DHSPMP41', 1, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (252, 9, 2, 62, 'DHSPMP42', 3, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (253, 8, 2, 63, 'DHSPMP43', 1, 88000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (254, 8, 2, 6, 'DHSPMP43', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (255, 8, 2, 36, 'DHSPMP44', 2, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (256, 8, 2, 33, 'DHSPMP45', 1, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (257, 8, 2, 34, 'DHSPMP45', 1, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (258, 7, 2, 64, 'DHSPMP46', 1, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (259, 7, 2, 63, 'DHSPMP46', 1, 88000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (260, 7, 2, 64, 'DHSPMP47', 1, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (261, 7, 2, 37, 'DHSPMP47', 1, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (262, 7, 2, 34, 'DHSPMP48', 1, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (263, 7, 2, 35, 'DHSPMP48', 1, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (264, 10, 2, 37, 'DHSPMP49', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (265, 10, 2, 35, 'DHSPMP50', 2, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (266, 10, 2, 5, 'DHSPMP51', 1, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (267, 11, 2, 35, 'DHSPMP52', 2, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (268, 11, 2, 64, 'DHSPMP53', 1, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (269, 11, 2, 63, 'DHSPMP54', 2, 88000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (270, 9, 2, 3, 'DHSPMP55', 2, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (271, 9, 2, 4, 'DHSPMP56', 1, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (272, 9, 2, 7, 'DHSPMP57', 1, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (273, 9, 2, 6, 'DHSPMP57', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (274, 8, 2, 63, 'DHSPMP58', 2, 88000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (275, 8, 2, 34, 'DHSPMP59', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (276, 8, 2, 35, 'DHSPMP60', 1, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (277, 14, 2, 65, 'DHSPMP61', 2, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (278, 14, 2, 4, 'DHSPMP62', 1, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (279, 14, 2, 5, 'DHSPMP63', 2, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (280, 15, 2, 3, 'DHSPMP64', 2, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (281, 15, 2, 64, 'DHSPMP65', 2, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (282, 7, 2, 7, 'DHSPMP66', 2, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (283, 7, 2, 34, 'DHSPMP67', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (284, 10, 2, 37, 'DHSPMP68', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (285, 10, 2, 64, 'DHSPMP69', 2, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (286, 10, 2, 3, 'DHSPMP70', 2, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (287, 8, 2, 4, 'DHSPMP71', 2, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (288, 8, 2, 62, 'DHSPMP72', 2, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (289, 15, 2, 3, 'DHSPMP73', 2, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (290, 15, 2, 62, 'DHSPMP74', 1, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (291, 9, 2, 33, 'DHSPMP75', 2, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (292, 9, 2, 64, 'DHSPMP76', 2, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (293, 9, 2, 37, 'DHSPMP77', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (294, 14, 2, 4, 'DHSPMP78', 2, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (295, 14, 2, 36, 'DHSPMP79', 2, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (296, 13, 2, 3, 'DHSPMP80', 2, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (297, 13, 2, 63, 'DHSPMP81', 2, 88000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (298, 12, 2, 34, 'DHSPMP82', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (299, 12, 2, 6, 'DHSPMP83', 2, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (300, 10, 2, 36, 'DHSPMP84', 2, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (301, 10, 2, 34, 'DHSPMP85', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (302, 9, 2, 33, 'DHSPMP86', 2, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (303, 8, 2, 4, 'DHSPMP87', 2, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (304, 8, 2, 62, 'DHSPMP88', 1, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (305, 11, 2, 35, 'DHSPMP89', 2, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (306, 11, 2, 61, 'DHSPMP90', 2, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (307, 13, 2, 3, 'DHSPMP91', 2, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (308, 13, 2, 2, 'DHSPMP92', 2, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (309, 12, 2, 7, 'DHSPMP93', 2, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (310, 12, 2, 61, 'DHSPMP94', 2, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (311, 15, 2, 3, 'DHSPMP95', 2, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (312, 15, 2, 2, 'DHSPMP96', 2, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (313, 12, 2, 61, 'DHSPMP97', 2, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (314, 12, 2, 36, 'DHSPMP98', 2, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (315, 10, 2, 64, 'DHSPMP99', 2, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (316, 10, 2, 65, 'DHSPMP100', 2, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (317, 10, 2, 4, 'DHSPMP101', 2, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (318, 10, 2, 5, 'DHSPMP102', 2, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (319, 11, 2, 35, 'DHSPMP103', 2, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (320, 11, 2, 61, 'DHSPMP104', 2, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (321, 9, 2, 62, 'DHSPMP105', 2, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (322, 9, 2, 36, 'DHSPMP106', 2, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (323, 13, 2, 3, 'DHSPMP107', 1, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (324, 13, 2, 61, 'DHSPMP108', 2, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (325, 13, 2, 34, 'DHSPMP109', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (326, 14, 2, 4, 'DHSPMP110', 1, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (327, 14, 2, 65, 'DHSPMP111', 2, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (328, 10, 2, 63, 'DHSPMP112', 2, 88000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (329, 10, 2, 2, 'DHSPMP113', 2, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (330, 7, 2, 34, 'DHSPMP114', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (331, 7, 2, 65, 'DHSPMP115', 2, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (332, 7, 2, 36, 'DHSPMP116', 2, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (333, 9, 2, 62, 'DHSPMP117', 2, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (334, 9, 2, 64, 'DHSPMP118', 2, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (335, 9, 2, 33, 'DHSPMP119', 2, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (336, 9, 2, 37, 'DHSPMP120', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (337, 8, 2, 64, 'DHSPMP121', 2, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (338, 8, 2, 2, 'DHSPMP122', 2, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (339, 8, 2, 5, 'DHSPMP123', 2, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (340, 8, 2, 7, 'DHSPMP124', 2, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (341, 8, 2, 6, 'DHSPMP125', 2, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (342, 13, 2, 35, 'DHSPMP126', 2, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (343, 13, 2, 64, 'DHSPMP127', 2, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (344, 13, 2, 37, 'DHSPMP128', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (345, 13, 2, 61, 'DHSPMP129', 2, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (346, 13, 2, 63, 'DHSPMP130', 2, 88000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (347, 11, 2, 35, 'DHSPMP131', 2, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (348, 11, 2, 5, 'DHSPMP132', 2, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (349, 11, 2, 33, 'DHSPMP133', 2, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (350, 11, 2, 61, 'DHSPMP134', 2, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (351, 11, 2, 64, 'DHSPMP135', 2, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (352, 12, 2, 61, 'DHSPMP136', 2, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (353, 12, 2, 37, 'DHSPMP137', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (354, 12, 2, 35, 'DHSPMP138', 2, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (355, 12, 2, 33, 'DHSPMP139', 2, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (356, 12, 2, 64, 'DHSPMP140', 2, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (357, 14, 2, 65, 'DHSPMP141', 2, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (358, 14, 2, 63, 'DHSPMP142', 2, 88000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (359, 14, 2, 4, 'DHSPMP143', 2, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (360, 14, 2, 36, 'DHSPMP144', 2, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (361, 14, 2, 6, 'DHSPMP145', 2, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (362, 15, 2, 7, 'DHSPMP146', 2, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (363, 15, 2, 61, 'DHSPMP147', 2, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (364, 15, 2, 37, 'DHSPMP148', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (365, 15, 2, 2, 'DHSPMP149', 2, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (366, 15, 2, 5, 'DHSPMP150', 2, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (367, 7, 2, 34, 'DHSPMP151', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (368, 7, 2, 63, 'DHSPMP152', 2, 88000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (369, 7, 2, 37, 'DHSPMP153', 1, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (370, 7, 2, 61, 'DHSPMP154', 2, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (371, 7, 2, 64, 'DHSPMP155', 1, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (372, 11, 2, 35, 'DHSPMP156', 1, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (373, 11, 2, 2, 'DHSPMP157', 1, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (374, 11, 2, 4, 'DHSPMP158', 1, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (375, 11, 2, 5, 'DHSPMP159', 2, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (376, 11, 2, 6, 'DHSPMP160', 2, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (377, 10, 2, 64, 'DHSPMP161', 2, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (378, 10, 2, 61, 'DHSPMP162', 2, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (379, 10, 2, 5, 'DHSPMP163', 3, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (380, 10, 2, 33, 'DHSPMP164', 2, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (381, 10, 2, 36, 'DHSPMP165', 2, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (382, 8, 2, 4, 'DHSPMP166', 2, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (383, 8, 2, 62, 'DHSPMP167', 2, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (384, 8, 2, 61, 'DHSPMP168', 2, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (385, 8, 2, 36, 'DHSPMP169', 2, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (386, 8, 2, 7, 'DHSPMP170', 2, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (387, 9, 2, 62, 'DHSPMP171', 2, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (388, 9, 2, 61, 'DHSPMP172', 2, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (389, 9, 2, 64, 'DHSPMP173', 1, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (390, 9, 2, 65, 'DHSPMP174', 2, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (391, 9, 2, 35, 'DHSPMP175', 2, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (392, 14, 2, 65, 'DHSPMP176', 2, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (393, 14, 2, 36, 'DHSPMP177', 2, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (394, 14, 2, 34, 'DHSPMP178', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (395, 14, 2, 7, 'DHSPMP179', 2, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (396, 14, 2, 6, 'DHSPMP180', 2, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (397, 12, 2, 64, 'DHSPMP181', 2, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (398, 12, 2, 34, 'DHSPMP182', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (399, 12, 2, 2, 'DHSPMP183', 2, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (400, 12, 2, 4, 'DHSPMP184', 2, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (401, 12, 2, 5, 'DHSPMP185', 2, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (402, 10, 2, 4, 'DHSPMP186', 2, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (403, 10, 2, 33, 'DHSPMP187', 2, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (404, 8, 2, 63, 'DHSPMP188', 2, 88000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (405, 8, 2, 65, 'DHSPMP189', 2, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (406, 11, 2, 3, 'DHSPMP190', 2, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (407, 11, 2, 6, 'DHSPMP191', 2, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (408, 15, 2, 7, 'DHSPMP192', 1, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (409, 15, 2, 64, 'DHSPMP192', 1, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (410, 15, 2, 65, 'DHSPMP193', 1, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (411, 14, 2, 34, 'DHSPMP194', 2, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (412, 14, 2, 33, 'DHSPMP195', 1, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (413, 14, 2, 7, 'DHSPMP195', 1, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (414, 13, 2, 3, 'DHSPMP196', 2, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (415, 13, 2, 64, 'DHSPMP197', 1, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (416, 13, 2, 5, 'DHSPMP197', 1, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (417, 9, 2, 35, 'DHSPMP198', 2, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (418, 9, 2, 62, 'DHSPMP198', 1, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (419, 9, 2, 2, 'DHSPMP199', 2, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (420, 12, 2, 61, 'DHSPMP200', 1, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (421, 12, 2, 63, 'DHSPMP200', 1, 88000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (422, 12, 2, 36, 'DHSPMP201', 1, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (423, 12, 2, 33, 'DHSPMP201', 1, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (424, 11, 2, 62, 'DHSPMP202', 2, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (425, 11, 2, 36, 'DHSPMP203', 1, 280000, 38);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (426, 11, 2, 34, 'DHSPMP203', 1, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (427, 10, 2, 64, 'DHSPMP204', 2, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (428, 10, 2, 37, 'DHSPMP204', 1, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (429, 10, 2, 5, 'DHSPMP205', 1, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (430, 10, 2, 2, 'DHSPMP205', 2, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (431, 9, 2, 33, 'DHSPMP206', 1, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (432, 9, 2, 65, 'DHSPMP206', 1, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (433, 9, 2, 34, 'DHSPMP207', 1, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (434, 9, 2, 33, 'DHSPMP207', 1, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (435, 8, 2, 4, 'DHSPMP208', 1, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (436, 8, 2, 6, 'DHSPMP208', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (437, 8, 2, 3, 'DHSPMP209', 1, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (438, 8, 2, 7, 'DHSPMP209', 1, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (439, 13, 2, 7, 'DHSPMP210', 1, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (440, 13, 2, 65, 'DHSPMP210', 1, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (441, 14, 2, 4, 'DHSPMP211', 1, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (442, 14, 2, 2, 'DHSPMP211', 1, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (443, 9, 2, 62, 'DHSPMP212', 1, 175000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (444, 9, 2, 35, 'DHSPMP212', 1, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (445, 12, 2, 7, 'DHSPMP213', 1, 115000, 4);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (446, 12, 2, 6, 'DHSPMP213', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (447, 15, 2, 3, 'DHSPMP214', 1, 130000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (448, 15, 2, 61, 'DHSPMP214', 1, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (450, 11, 2, 33, 'DHSPMP215', 1, 155000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (451, 11, 2, 6, 'DHSPMP215', 1, 140000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (452, 7, 2, 61, 'DHSPMP216', 1, 270000, 10);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (453, 7, 2, 63, 'DHSPMP216', 1, 88000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (454, 7, 2, 65, 'DHSPMP217', 1, 110000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (455, 7, 2, 5, 'DHSPMP217', 1, 89000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (456, 10, 2, 37, 'DHSPMP218', 1, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (457, 10, 2, 64, 'DHSPMP218', 1, 90000, 7);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (458, 9, 2, 35, 'DHSPMP219', 1, 150000, 17);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (459, 9, 2, 34, 'DHSPMP219', 1, 135000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (460, 14, 2, 4, 'DHSPMP220', 1, 235000, 0);
INSERT INTO
  `thongtindonhang` (
    `TTDH_id`,
    `ND_id`,
    `NB_id`,
    `SP_id`,
    `DH_id`,
    `TTDH_soluong`,
    `TTDH_gia`,
    `TTDH_phantram`
  )
VALUES
  (461, 14, 2, 37, 'DHSPMP220', 1, 135000, 0);

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
