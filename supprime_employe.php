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
$requete=("DELETE FROM personnels WHERE id='$a'");

$resultat= mysql_query($requete);	

echo"<p>suppresion de l'employé réussite</p>";

mysql_close();
?>
<a href="index.html">retour au menu principal</a>

</body>
</html>