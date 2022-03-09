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

$b=$_POST["nom_race"];
$c=$_POST["type_nourriture"];
$d=$_POST["duree_vie"];
$e=$_POST["animal_aquatique"];


$req1="INSERT INTO especes (nom_race,type_nourriture,duree_vie,animal_aquatique) VALUES ('$b','$c','$d','$e')";
mysql_query($req1);

echo"<p>Espece ajoutée</p>";

mysql_close();
?>
</body>
</html>