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
$a=$_POST['enclos'];
$requete=("SELECT * FROM enclos WHERE id='$a'");
$resultat=mysql_query($requete);
	
?>

<table border="1">
	<tr>
		<td>Identifiant</td>
		<td>Nom de l'enclos</td>
		<td>Capacité max d'animaux</td>
		<td>Taille</td>
		<td>Presence d'eau</td>
		<td>Responsable</td>
	</tr>

	<?php while($enreg=mysql_fetch_array($resultat))
	{
		?>
		<tr>
			<td><?php echo $enreg["id"];?></td>
			<td><?php echo $enreg["nom_enclos"];?></td>
			<td><?php echo $enreg["animaux_max"];?></td>
			<td><?php echo $enreg["taille"];?></td>
			<td><?php echo $enreg["presence_eau"];?></td>
			<td><?php echo $enreg["reponsable"];?></td>
		</tr>
	<?php	
	} ?>
</table>
<?php
mysql_close();
?>
<a href="modification_animaux.php" class="lien">modification</a>
<a href="index.html">retour au menu principal</a>
</body>
</html>