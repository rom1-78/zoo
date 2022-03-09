<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
</head>
<body>
<h1>Recherchez l'employé pour plus d'infos</h1>

<?php 
mysql_connect("localhost","root","");
mysql_select_db("zoo");


$requete=("SELECT * FROM personnels");
$resultat=mysql_query($requete);
	
?>

<table border="1">
	<tr>
		<td>Identifiant</td>
		<td>Nom de l'employé</td>
		<td>Prénom de l'employé</td>
		<td>Date de naissance</td>
		<td>Sexe de l'employé</td>
		<td>Fonction</td>
		<td>Salaire</td>
	</tr>

	<?php while($enreg=mysql_fetch_array($resultat))
	{
		?>
		<tr>
			<td><?php echo $enreg["id"];?></td>
			<td><?php echo $enreg["nom"];?></td>
			<td><?php echo $enreg["prenom"];?></td>
			<td><?php echo $enreg["date_naissance"];?></td>
			<td><?php echo $enreg["sexe"];?></td>
			<td><?php echo $enreg["fonction"];?></td>
			<td><?php echo $enreg["salaire"];?></td>
		</tr>
	<?php	
	} ?>
</table>
<?php
mysql_close();
?>

<input type="submit" value="valider">
<button><a href="modification_employe.html">Modifier</a></button>
<button><a href="informations_employe.html">Information</a></button>
<button><a href="supprime_employe.html">Supprimer</a></button>
<button><a href="index_admin.html">retour au menu principal</a></button>
</body>
</html>