<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
</head>
<body>

<?php 

mysql_connect("localhost","root","");
mysql_select_db("zoo");

$a=$_POST["supprime"];
$requete=("DELETE FROM animaux WHERE pseudo='$a'");

$resultat= mysql_query($requete);	

echo"<p>Suppresion de l'animal réussite</p>";

mysql_close();
?>
<button><a href="informations_animal.php">Information</a></button>
</body>
</html>