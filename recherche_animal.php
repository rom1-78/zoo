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

$a=$_POST['animal'];
$requete=("SELECT * FROM animaux WHERE pseudo='$a'");
$resultat=mysql_query($requete);
	
?>

<table border="1">
	<tr>
		<td>Identifiant</td>
		<td>Reference de la race</td>
		<td>Date de naissance</td>
		<td>Sexe</td>
		<td>Pseudo</td>
		<td>Commentaire</td>
	</tr>

	<?php while($enreg=mysql_fetch_array($resultat))
	{
		?>
		<tr>
			<td><?php echo $enreg["id"];?></td>
			<td><?php echo $enreg["ref_race"];?></td>
			<td><?php echo $enreg["date_naissance"];?></td>
			<td><?php echo $enreg["sexe"];?></td>
			<td><?php echo $enreg["pseudo"];?></td>
			<td><?php echo $enreg["commentaire"];?></td>
		</tr>
	<?php	
	} ?>
</table>
<?php
mysql_close();
?>
<button><a href="modification_animaux.html">Modifier</a></button>
<button><a href="informations_animal.php">Information</a></button>
<button><a href="supprime_animal.html">Supprimer</a></button>
</body>
</html>