-- --------------------------------------------------------
-- Host:                         172.16.23.8
-- Versi server:                 5.5.44-MariaDB-log - MariaDB Server
-- OS Server:                    Linux
-- HeidiSQL Versi:               9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Membuang struktur basisdata untuk aplikasi
CREATE DATABASE IF NOT EXISTS `aplikasi` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `aplikasi`;

-- membuang struktur untuk table aplikasi.automaticexecute
CREATE TABLE IF NOT EXISTS `automaticexecute` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PERINTAH` text NOT NULL,
  `STATUS` tinyint(4) NOT NULL DEFAULT '0',
  `IS_PROSEDUR` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table aplikasi.group_pengguna_akses_module
CREATE TABLE IF NOT EXISTS `group_pengguna_akses_module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_PENGGUNA` smallint(11) NOT NULL,
  `MODUL` char(10) NOT NULL,
  `STATUS` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=807 DEFAULT CHARSET=latin1;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table aplikasi.info_teks
CREATE TABLE IF NOT EXISTS `info_teks` (
  `ID` tinyint(4) NOT NULL AUTO_INCREMENT,
  `TEKS` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table aplikasi.instansi
CREATE TABLE IF NOT EXISTS `instansi` (
  `PPK` int(11) NOT NULL COMMENT 'Pemberi Pelayanan Kesehatan',
  `EMAIL` varchar(50) NOT NULL COMMENT 'Email',
  `WEBSITE` varchar(50) NOT NULL COMMENT 'Website',
  PRIMARY KEY (`PPK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table aplikasi.integrasi
CREATE TABLE IF NOT EXISTS `integrasi` (
  `ID` tinyint(4) NOT NULL AUTO_INCREMENT,
  `DESKRIPSI` varchar(50) NOT NULL,
  `REF` smallint(6) DEFAULT NULL COMMENT 'Penjamin (REF10)',
  `NAMA_KLAS` varchar(250) NOT NULL COMMENT 'Class Name Service',
  `STATUS` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `REF` (`REF`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table aplikasi.modules
CREATE TABLE IF NOT EXISTS `modules` (
  `ID` char(10) NOT NULL,
  `NAMA` varchar(50) NOT NULL,
  `LEVEL` tinyint(4) NOT NULL DEFAULT '1',
  `DESKRIPSI` varchar(150) NOT NULL,
  `STATUS` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table aplikasi.pengaturan_awal_referensi
CREATE TABLE IF NOT EXISTS `pengaturan_awal_referensi` (
  `JENIS` tinyint(4) NOT NULL,
  `ID` tinyint(4) NOT NULL,
  PRIMARY KEY (`JENIS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table aplikasi.pengguna
CREATE TABLE IF NOT EXISTS `pengguna` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(15) NOT NULL,
  `PASSWORD` text NOT NULL,
  `NAMA` varchar(75) NOT NULL,
  `NIP` varchar(30) DEFAULT NULL COMMENT 'NIP/NIK',
  `NIK` char(16) DEFAULT NULL,
  `JENIS` smallint(6) DEFAULT '1' COMMENT '1=Internal; 2=Eksternal',
  `STATUS` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `NIP` (`NIP`),
  KEY `LOGIN` (`LOGIN`),
  KEY `NIK` (`NIK`),
  KEY `JENIS` (`JENIS`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table aplikasi.pengguna_akses
CREATE TABLE IF NOT EXISTS `pengguna_akses` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PENGGUNA` smallint(6) NOT NULL,
  `GROUP_PENGGUNA_AKSES_MODULE` smallint(6) NOT NULL,
  `STATUS` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `PENGGUNA` (`PENGGUNA`),
  KEY `GROUP_PENGGUNA_AKSES_MODULE` (`GROUP_PENGGUNA_AKSES_MODULE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table aplikasi.pengguna_akses_log
CREATE TABLE IF NOT EXISTS `pengguna_akses_log` (
  `TANGGAL` datetime NOT NULL,
  `OLEH` smallint(6) NOT NULL,
  `CRUD` tinyint(4) NOT NULL,
  `NAMA_TABLE` varchar(35) NOT NULL,
  `REF` varchar(35) NOT NULL COMMENT 'ID Ref',
  `KONTEN` mediumtext NOT NULL,
  PRIMARY KEY (`TANGGAL`,`OLEH`,`CRUD`,`NAMA_TABLE`,`REF`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table aplikasi.pengguna_akses_ruangan
CREATE TABLE IF NOT EXISTS `pengguna_akses_ruangan` (
  `ID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `TANGGAL` datetime NOT NULL,
  `PENGGUNA` smallint(6) NOT NULL,
  `RUANGAN` char(10) NOT NULL,
  `DIBERIKAN_OLEH` smallint(6) NOT NULL,
  `STATUS` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `TANGGAL` (`TANGGAL`),
  KEY `PENGGUNA` (`PENGGUNA`),
  KEY `RUANGAN` (`RUANGAN`),
  KEY `STATUS` (`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table aplikasi.pengguna_log
CREATE TABLE IF NOT EXISTS `pengguna_log` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `PENGGUNA` smallint(6) NOT NULL,
  `TANGGAL_AKSES` datetime NOT NULL,
  `LOKASI` char(15) NOT NULL,
  `AGENT` varchar(250) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PENGGUNA` (`PENGGUNA`),
  KEY `TANGGAL_AKSES` (`TANGGAL_AKSES`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table aplikasi.printer_list
CREATE TABLE IF NOT EXISTS `printer_list` (
  `ID` tinyint(4) NOT NULL AUTO_INCREMENT,
  `NAMA` varchar(25) NOT NULL,
  `UKURANKERTAS` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table aplikasi.properti_config
CREATE TABLE IF NOT EXISTS `properti_config` (
  `ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `NAMA` varchar(100) NOT NULL,
  `VALUE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table aplikasi.signature
CREATE TABLE IF NOT EXISTS `signature` (
  `X_ID` smallint(6) NOT NULL AUTO_INCREMENT,
  `X_PASS` char(10) NOT NULL,
  `X_REF` char(15) DEFAULT NULL,
  `STATUS` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`X_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk table aplikasi.sinkronisasi
CREATE TABLE IF NOT EXISTS `sinkronisasi` (
  `ID` tinyint(4) NOT NULL AUTO_INCREMENT,
  `DESKRIPSI` varchar(50) NOT NULL,
  `TANGGAL_TERAKHIR` datetime NOT NULL,
  `ID_TERAKHIR` bigint(20) NOT NULL,
  `STATUS` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `TANGGAL` (`TANGGAL_TERAKHIR`),
  KEY `ID_TERAKHIR` (`ID_TERAKHIR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Pengeluaran data tidak dipilih.
-- membuang struktur untuk procedure aplikasi.doAutomaticExecute
DELIMITER //
CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `doAutomaticExecute`(IN `PIS_PROSEDUR` TINYINT, IN `PLIMIT` SMALLINT)
BEGIN
	DECLARE VID INT;
	DECLARE VPERINTAH TEXT;
	DECLARE VIDS TEXT DEFAULT '';
	DECLARE VPERINTAHS TEXT DEFAULT '';
	DECLARE VFOUND TINYINT DEFAULT FALSE;
	DECLARE DATA_NOT_FOUND INT DEFAULT FALSE;
	
	DECLARE CRDATA CURSOR FOR
		SELECT ID, PERINTAH 
		  FROM aplikasi.automaticexecute
		 WHERE STATUS = 0
		   AND IS_PROSEDUR = PIS_PROSEDUR
		 ORDER BY ID LIMIT PLIMIT;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET DATA_NOT_FOUND = TRUE;
		
	OPEN CRDATA;
		DATA_END: LOOP
			FETCH CRDATA INTO VID, VPERINTAH;
		
			IF DATA_NOT_FOUND THEN
				UPDATE temp.temp SET ID = 0 WHERE ID = 0;
				LEAVE DATA_END;
			END IF;	
			
			IF NOT VFOUND THEN
				SET VFOUND = TRUE;
			END IF;
			
			UPDATE aplikasi.automaticexecute SET STATUS = 1 WHERE ID = VID;
			
			SET VIDS = CONCAT(VIDS, ',', VID);
			
			SET @PERINTAH = VPERINTAH;
			PREPARE stmt FROM @PERINTAH;
			EXECUTE stmt;
			DEALLOCATE PREPARE stmt;
		END LOOP;
	CLOSE CRDATA;
	
	IF VFOUND THEN
		SET VIDS = SUBSTRING(VIDS,2);
		SET @DOPERINTAH = CONCAT('DELETE FROM aplikasi.automaticexecute WHERE ID IN (',VIDS,')');
		PREPARE stmt FROM @DOPERINTAH;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
	/*ELSE
		SET @DOPERINTAH = CONCAT('TRUNCATE TABLE aplikasi.automaticexecute');
		PREPARE stmt FROM @DOPERINTAH;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;*/
	END IF;
END//
DELIMITER ;

-- membuang struktur untuk procedure aplikasi.killProcessSleep
DELIMITER //
CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `killProcessSleep`(
	IN `PTIME` SMALLINT

)
BEGIN
	DECLARE VID INT;
	DECLARE VFOUND TINYINT DEFAULT FALSE;
	DECLARE DATA_NOT_FOUND INT DEFAULT FALSE;
	
	DECLARE CRDATA CURSOR FOR
		SELECT ID
		  FROM information_schema.`PROCESSLIST` pl 
		 WHERE pl.TIME > PTIME
		   AND pl.COMMAND = 'Sleep';
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET DATA_NOT_FOUND = TRUE;
		
	OPEN CRDATA;
		DATA_END: LOOP
			FETCH CRDATA INTO VID;
		
			IF DATA_NOT_FOUND THEN
				UPDATE temp.temp SET ID = 0 WHERE ID = 0;
				LEAVE DATA_END;
			END IF;	
			
			KILL VID;
			
		END LOOP;
	CLOSE CRDATA;
END//
DELIMITER ;

-- membuang struktur untuk function aplikasi.getValuePropertyJSON
DELIMITER //
CREATE DEFINER=`root`@`127.0.0.1` FUNCTION `getValuePropertyJSON`(`PDATA` LONGTEXT, `PFIELD` VARCHAR(50)) RETURNS longtext CHARSET latin1
    DETERMINISTIC
BEGIN
	DECLARE VVALUE LONGTEXT;
	DECLARE VFIRST_CHAR CHAR(1);
	DECLARE VFIND_CHAR CHAR(1) DEFAULT ',';
	
	SET VVALUE = SUBSTRING(PDATA, INSTR(PDATA, PFIELD));
	SET VFIRST_CHAR = LEFT(TRIM(SUBSTRING(VVALUE, INSTR(VVALUE, ':') + 1, 2)), 1);
	/* Object */
	IF VFIRST_CHAR = '{' THEN
		SET VFIND_CHAR = '}';
	END IF;
	SET VVALUE = SUBSTRING(VVALUE, INSTR(VVALUE, ':') + 1, (INSTR(VVALUE, VFIND_CHAR) - INSTR(VVALUE, ':')) - 1);
	IF NOT VFIRST_CHAR = '{' THEN 
		SET VVALUE = REPLACE(VVALUE,'"','');
	ELSE
		SET VVALUE = CONCAT(VVALUE, '}');
	END IF;
	
	RETURN TRIM(VVALUE);
END//
DELIMITER ;

-- membuang struktur untuk function aplikasi.isSelectedGroupPenggunaAksesModule
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `isSelectedGroupPenggunaAksesModule`(`PGROUP_PENGGUNA` SMALLINT, `PMODULE` CHAR(10)) RETURNS tinyint(4)
    DETERMINISTIC
BEGIN
	DECLARE VAKSES TINYINT DEFAULT FALSE;
	
	IF EXISTS(SELECT 1 FROM aplikasi.group_pengguna_akses_module WHERE GROUP_PENGGUNA = PGROUP_PENGGUNA AND MODUL = PMODULE AND STATUS = 1) THEN
		SET VAKSES = TRUE;
	END IF;
	
	RETURN VAKSES;
END//
DELIMITER ;

-- membuang struktur untuk function aplikasi.isSelectedPenggunaAkses
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `isSelectedPenggunaAkses`(`PPENGGUNA` SMALLINT, `PMODULE` CHAR(10), `PGROUP_PENGGUNA` SMALLINT) RETURNS tinyint(4)
    DETERMINISTIC
BEGIN
	DECLARE VAKSES TINYINT DEFAULT FALSE;
	
	IF EXISTS(
		SELECT 1
		  FROM aplikasi.pengguna_akses a, aplikasi.group_pengguna_akses_module b
		 WHERE a.GROUP_PENGGUNA_AKSES_MODULE = b.ID
		   AND a.PENGGUNA = PPENGGUNA 
			AND b.MODUL = PMODULE
			AND b.GROUP_PENGGUNA = PGROUP_PENGGUNA
			AND a.STATUS = 1 AND b.`STATUS` = 1) THEN
		SET VAKSES = TRUE;
	END IF;
	
	RETURN VAKSES;
END//
DELIMITER ;

-- membuang struktur untuk function aplikasi.isSelectedPenggunaAksesRuangan
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `isSelectedPenggunaAksesRuangan`(`PPENGGUNA` SMALLINT, `PRUANGAN` CHAR(10)) RETURNS tinyint(4)
    DETERMINISTIC
BEGIN
	DECLARE VAKSES TINYINT DEFAULT FALSE;
	
	IF EXISTS(
		SELECT 1
		  FROM aplikasi.pengguna_akses_ruangan a
		 WHERE a.PENGGUNA = PPENGGUNA 
			AND a.RUANGAN = PRUANGAN
			AND a.STATUS = 1) THEN
			
		SET VAKSES = TRUE;
	END IF;
	
	RETURN VAKSES;
END//
DELIMITER ;

-- membuang struktur untuk event aplikasi.automaticExecute
DELIMITER //
CREATE DEFINER=`root`@`127.0.0.1` EVENT `automaticExecute` ON SCHEDULE EVERY 1 SECOND STARTS '2013-09-09 13:47:55' ON COMPLETION PRESERVE ENABLE DO BEGIN
	CALL aplikasi.doAutomaticExecute(0, 100);
END//
DELIMITER ;

-- membuang struktur untuk event aplikasi.automaticExecuteProcedure
DELIMITER //
CREATE DEFINER=`root`@`127.0.0.1` EVENT `automaticExecuteProcedure` ON SCHEDULE EVERY 1 SECOND STARTS '2013-09-09 13:47:55' ON COMPLETION PRESERVE ENABLE DO BEGIN
	CALL aplikasi.doAutomaticExecute(1, 1);
END//
DELIMITER ;

-- membuang struktur untuk event aplikasi.automaticKillProcessSleep
DELIMITER //
CREATE DEFINER=`root`@`127.0.0.1` EVENT `automaticKillProcessSleep` ON SCHEDULE EVERY 30 SECOND STARTS '2017-02-27 08:14:32' ON COMPLETION PRESERVE ENABLE DO BEGIN
	CALL aplikasi.killProcessSleep(1000);
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
