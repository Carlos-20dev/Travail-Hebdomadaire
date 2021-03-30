                                     <!-- Opérateur Ternaire -->      
<!-- Condition ternaire -->
<?php
$age = 21; 

(($age >= 18) ? $reponse="majeur" : $reponse="mineur"); 

echo "Vous êtes ".$reponse. "."; 

?>
<!-- -------*/-------------- -->
<?php
$age = 25;

echo "Vous êtes ".(($age >= 18) ? "majeur" : "mineur"). "."; 

?>

<!--Condition classique  -->
<?php
if ($age>=18)
{
   $reponse = "majeur";
}
else
{
   $reponse = "mineur";
}
?>
<!-- Code réduit et economie variable -->

<?php
$age = 25;

echo "Vous êtes ".(($age >= 18) ? "majeur" : "mineur"). "."; 
?>

