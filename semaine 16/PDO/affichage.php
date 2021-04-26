<!DOCTYPE html>
<html>
<head>
    
    <title>Récupération des données</title>
</head>
<body>
<?php
     $db = new PDO('mysql:host=localhost;dbname=piniantelli;charset=utf8', 'root', '');
     $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
     
     $requete = "SELECT * FROM clients ORDER BY id_client ASC";
     $result = $db->query($requete);

     if (!result){
         echo "La récupération des données indique  un problème!";

     }else{
         $nbre_clients = $result->rowCount();

         ?>
         <h3>Tous nos clients</h3>
         <h4>Il y a <?=$nbre_clients?> clients</h4>
         <table border="1">

         <tr>
              <th>Numéro de client</th>
              <th>Nom</th>
              <th>Prénom</th>
              <th>Age</th>
              <th>Adresse</th>
              <th>Ville</th>
              <th>Adresse Email</th>
         </tr>
        
         <?php

          while($single= $result->fetch(PDO::FETCH_NUM)){
              echo "<tr>";
              foreach ($ligne as $valeur)  {
                  echo"<td>$valeur</td>";
              }

              echo "</tr>";
          }
          
          ?>


     </table>
     <?php
     $result->closeCursor();
     
     
     }
     ?>   
</body>
</html>