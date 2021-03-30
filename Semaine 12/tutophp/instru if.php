<?php
if ($a > $b) 
{ 
   echo "$a est plus grand que $b"; 
}

// Peut s'interpréter par : si $a est plus grand que $b, alors exécuter l'instruction ci-dessous. En fait la condition renvoi une valeur vrai ou faux.

// Si plusieurs instructions doivent être exécutées par la suite il faut ouvrir et fermer des accolades pour indiquer le début et la fin des instructions.

if ($a > $b) { 
    echo "$a est plus grand que $b"; 
    $b = $a; 
} 
else 

Exemple :

if ($a > $b) { 
    echo "$a est plus grand que $b"; 
} else { 
   echo "$a est moins grand que $b"; 
} 


// <!-- peut s'interpréter par : si $a est plus grand que$b, alors exécuter l'instruction ci-dessous, sinon ( si$an'est pas plus grand que$b` ) exécuter l'instruction ci-dessous.

// Instruction switch
// L'instruction switch est similaire à une série de conditions if sur une même variable, avec l'avantage d'être beaucoup plus claire au niveau du code : -->

 
 $a = 2; 
 
 switch ($a) { 
  case 0 : 
    echo"$a = 0"; 
  break; 

  case 1 : 
    echo "$a = 1"; 
  break; 

  case 2 : 
     echo "$a = 2"; 
  break; 
 } 
?>




