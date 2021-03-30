<html>
    <head>
        <meta charset="utf_8">
        <meta name="description" content="">
        <title></title>
    </head>    
    <body>

    <form action="script.php" method="GET">
        <input type="text" name="prenom">   
        <input type="text" name="nom">      
        <input type="submit" value="Envoyer">
    </form>

    <form action="script.php" method="post">
   Votre e-mail : <input type="text" name="email">
        <input type="hidden" name="secret" value="valeur cachée">
        <input type="submit" value="Envoyer">
    </form> 

    </body>
</html>

<?php

if (empty($_POST["nom"]) 
{       
    header("Location:formulaire.php?erreur=nom");
    exit;
} 

if (empty($_POST["prenom"]) 
{
    header("Location:formulaire.php?erreur=prenom");
    exit;
} 
?>