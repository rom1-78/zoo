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

$a=$_POST["id"];
$b=$_POST["nom_race"];
$c=$_POST["nourriture"];
$d=$_POST["duree_vie"];
$e=$_POST["animal_aquatique"];


$req1="INSERT INTO especes VALUES ('$a','$b','$c','$d','$e')";
mysql_query($req1);

echo"<p>Espece ajoutée</p>";

mysql_close();
?>

</body>
</html>