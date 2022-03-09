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
$a=$_POST['employe'];
$requete=("SELECT * FROM personnels WHERE id='$a'");
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
<br><br>


<button><a href="modification_employe.html">Modifier</a></button>
</body>
</html>