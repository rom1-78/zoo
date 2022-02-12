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

  $requete="SELECT * from animaux where id='$a'";

  $resultat= mysql_query($requete);

  $ligne=mysql_fetch_assoc($resultat);



  echo '<form action="update_animaux.php" method="post">';
  echo '<h2>Modification des informations </h2>';

 echo '<p> Identifiant :';
 echo '<input type="text" name="identifiant" value="'.$ligne["id"].'" size="20" readonly></p>';

  echo '<p>Reference animal :';
  echo '<input type="text" name="ref_race" size="20" value='.$ligne["ref_race"].'></p>';

  echo '<p>Date de naissance :';
  echo '<input type="text" name="date_naissance" size="20" value='.$ligne["date_naissance"].'></p>';

  echo '<p>Sexe :';
  echo '<input type="text" name="sexe" size="20" value='.$ligne["sexe"].'></p>';

  echo '<p>Pseudo :';
  echo '<input type="text" name="pseudo" size="20" value='.$ligne["pseudo"].'></p>';

  echo '<p>Commentaire :';
  echo '<input type="text" name="commentaire" size="20" value='.$ligne["commentaire"].'></p><br>';

   echo '<p><input type="submit" name="validation" value="Modifier"></p>';
  echo '<input type="reset" name="annuler" value="annuler">';
  echo "</form>";

  echo '<a href="index.html">retour au menu principal</a>';
mysql_close();
?>

</body>
</html>
