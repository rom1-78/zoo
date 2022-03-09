<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
</head>
<body>
<h1>informations des animaux pour plus d'infos</h1>

<?php 
mysql_connect("localhost","root","");
mysql_select_db("zoo");


$requete=("SELECT * FROM animaux");
$resultat=mysql_query($requete);
	
?>

<table border="1">
	<tr>
		<td>Identifiant</td>
		<td>Reference de la race</td>
		<td>Date de naissance</td>
		<td>Pseudo</td>
		<td>Sexe</td>
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

<button><a href="modification_animaux_admin.html">Modifier</a></button>
<button><a href="supprime_animal_admin.html">Supprimer</a></button>
<button><a href="index_admin.html">Retour au menu principal</a></button>
</body>
</html>