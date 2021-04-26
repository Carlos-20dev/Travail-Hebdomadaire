<DOCTYPE html>
<html> 
<head>
   <title>Enregistrer les données</title>
</head>
<body>
   
   <?php
     $db = new PDO('mysql:host=localhost;dbname=piniantelli;charset=utf8', 'root', '');

     $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
     if (isset($_POST['enregistrer'])){

          $nom = $_POST['nom'];
          $prenom = $_POST['prenom'];
          $age = $_POST['age'];
          $adresse = $_POST['adresse'];
          $ville= $_POST['ville'];
          $mail = $_POST['mail'];

          
          }

          if(!empty($nom) && !empty($prenom) && !empty($age) && !empty($adresse) &&
          !empty($ville) && !empty($mail))
          {
          
              $requete = $db->prepare('INSERT INTO clients(nom, prenom, age, adresse, 
              ville, mail) VALUES(;nom, :prenom, :age, :adresse, :ville, :mail)');

              $requete->bindvalue(':nom', $nom);
              $requete->bindvalue(':prenom', $prenom);
              $requete->bindvalue(':age', $age);
              $requete->bindvalue(':adresse', $adresse);
              $requete->bindvalue(':ville', $ville);
              $requete->bindvalue(':mail', $mail);

              $result = $requete->execute();

              if(!$result){
                   
                    echo "Erreur constaté, enregistrement non abouti";
              }
              else{
                   echo "
                   <script type=\"text/javascript\"> alert('Vous êtes bien enregistré.
                   Votre identifiant est: ".$db->LastInsertId()."')</script>";
              }

           }else
           {
                echo "Tous les champs sont recquis!";
           

           }        

 
      ?>

     <form action="insertion.php" method="post">
        <fieldset>
          <legend><b> Vos coordonnées</b></legend>
          <table>
               <tr><td>Nom:</td><td><input type="text" name="nom" size="50" 
               max length="50"></td></tr>

               <tr><td>Prénom:</td><td><input type="text" name="prenom" size="50" 
               max length="50"></td></tr>

               <tr><td>Age:</td><td><input type="text" name="age" size="50" 
               max length="3"></td></tr>

               <tr><td>Adresse:</td><td><input type="text" name="adresse" size="50" 
               max length="100"></td></tr>

               <tr><td>Ville:</td><td><input type="text" name="ville" size="50" 
               max length="50"></td></tr>

               <tr><td>Adresse Email:</td><td><input type="text" name="mail" size="50" 
               max length="50"></td></tr>

               <tr><td><input type="reset" name="effacer" value="Effacer"></td>
                   <td><input type="submit" name="enregistrer" value="Enregistrer"></td>

               </tr>
          
          
          
          
          </table>
        
         </fieldset>
     
     </form>
          </body>
          </html>