
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
$b=$_POST["nom"];
$c=$_POST["prenom"];
$d=$_POST["date_naissance"];
$e=$_POST["sexe"];
$f=$_POST["fonction"];
$g=$_POST["salaire"];


$req1="INSERT INTO personnels VALUES ('$a','$b','$c','$d','$e','$f','$g')";
mysql_query($req1);

echo"<p>Employé ajouté</p>";

mysql_close();
?>

</body>
</html>