<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<?php

mysql_connect("localhost","root","");
mysql_select_db("zoo");

$a=$_POST['id'];

  $requete="SELECT * from personnels where id='$a'";

  $resultat= mysql_query($requete);

  $ligne=mysql_fetch_assoc($resultat);



  echo '<form action="update_employe.php" method="post">';
  echo '<h2>Modification des informations </h2>';

 echo '<p> Identifiant :';
 echo '<input type="text" name="identifiant" value="'.$ligne["id"].'" size="20" readonly></p>';

  echo '<p>Nom :';
  echo '<input type="text" name="nom" size="20" value='.$ligne["nom"].'></p>';

  echo '<p>Prénom :';
  echo '<input type="text" name="prenom" size="20" value='.$ligne["prenom"].'></p>';

  echo '<p>Date de naissance :';
  echo '<input type="text" name="date_naissance" size="20" value='.$ligne["date_naissance"].'></p>';

  echo '<p>Sexe :';
  echo '<input type="text" name="sexe" size="20" value='.$ligne["sexe"].'></p>';

  echo '<p>Fonction :';
  echo '<input type="text" name="fonction" size="20" value='.$ligne["fonction"].'></p>';

  echo '<p>Salaire :';
  echo '<input type="text" name="salaire" size="20" value='.$ligne["salaire"].'></p><br>';

   echo '<p><input type="submit" name="validation" value="Modifier"></p>';
  echo '<input type="reset" name="annuler" value="annuler">';
  echo "</form>";

  echo '<a href="index.html">retour au menu principal</a>';
mysql_close();
?>

</body>
</html>
