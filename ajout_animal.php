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


$b=$_POST["ref_race"];
$c=$_POST["date_naissance"];
$d=$_POST["sexe"];
$e=$_POST["pseudo"];
$f=$_POST["commentaire"];


$req1="INSERT INTO animaux (ref_race,date_naissance,sexe,pseudo,commentaire) VALUES ('$b','$c','$d','$e','$f')";
mysql_query($req1);

echo"<p>Animal ajouté</p>";

mysql_close();
?>
<a href="index_admin.html">retour au menu principal</a>
</body>
</html>