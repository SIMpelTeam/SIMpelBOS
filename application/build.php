<html>
	<head>
		<title>Build Apps</title>
	</head>
	<body>
<?php
	
	/*set_time_limit(300);
	$output = array();
	$return_val="";
	//exec('start /B /WAIT C:\Users\Administrator\bin\Sencha\Cmd\6.1.3.42\sencha.exe app build', $output, $return_val);
	try {
		exec('start /B /WAIT BUILD_PACKAGES_FOR_CMS.bat', $output, $return_val);
		foreach($output as $row) {
			echo $row."<br>";
		}
	} catch(\Exception $e) {}*/
	
	$apps = array(
		array("name" => "SIMpel"),
	);
	
	$packages = array(
		array("name" => "com"),
		array("name" => "data"),
		array("name" => "aplikasi"),
		array("name" => "master"),
		array("name" => "pasien"),
		array("name" => "pendaftaran"),
		array("name" => "kunjungan"),
		array("name" => "layanan"),
		array("name" => "pembayaran"),
		array("name" => "laporan"),
		array("name" => "informasi"),
		array("name" => "plugins"),
		array("name" => "rekammedis"),
		array("name" => "penjualan"),
		array("name" => "inventory"),
	);
	
	$port = $_SERVER["SERVER_PORT"] == "80" || $_SERVER["SERVER_PORT"] == "" ? "" : ":".$_SERVER["SERVER_PORT"];	
	$url_app = $_SERVER["REQUEST_SCHEME"]."://".$_SERVER["SERVER_NAME"].$port."/apps/";
	
	echo "<h1>Build Applications:</h1>";
	echo "<ul>";
	foreach($apps as $app) {
		echo "<li><a href='".$url_app.$app["name"]."/build.php"."' target='_blank'>".$app["name"]."</a></li>";
	}
	echo "</ul>";
	
	$url_package = $_SERVER["REQUEST_SCHEME"]."://".$_SERVER["SERVER_NAME"].$port."/apps/packages/local/";
	echo "<h1>Build Packages:</h1>";
	echo "<ul>";
	foreach($packages as $package) {
		echo "<li><a href='".$url_package.$package["name"]."/build.php"."' target='_blank'>".$package["name"]."</a></li>";
	}
	echo "</ul>";
?>
	</body>
</html>