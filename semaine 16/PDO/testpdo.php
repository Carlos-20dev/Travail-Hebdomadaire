<?php
   try 
   {        
       $db = new PDO('mysql:host=localhost;charset=utf8;dbname=jarditou', 'root', '');
       $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
   } catch (Exception $e) {
      echo "Erreur : " . $e->getMessage() . "<br>";
      echo "N° : " . $e->getCode();
      die("Fin du script");
}
$requete = "SELECT * FROM produits WHERE pro_id = 7";
$result = $db->query($requete);
$produit = $result->fetch(PDO::FETCH_OBJ);
$result->closeCursor();         
?>

<html>
<head>
   <meta charset="UTF-8">
   <title>testDb.php</title>
   
</head>
<body>
<?php
while ($produit = $result->fetch(PDO::FETCH_OBJ)) 
{
   echo $produit->pro_id." – ".$produit->pro_libelle. "<br>";
}
?>
<p>Ma page</p>   
</body>
</html> 