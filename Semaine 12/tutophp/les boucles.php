<!-- Exercice 1 Affichage succéssion nbres impaire <0-150> -->

<!-- <?php
$a = 1;
while ($a < 150)
{
    echo $a.'<br>';
    $a++;
    $a++;
}
?> -->


<!-- Exercice 2 Phrase repetée 500X -->

<!-- <?php
$monexo2= 1;

while ($monexo2 <= 500)
{
    echo 'Je dois faire des sauvegardes régulières de mes fichiers.<br />';
    $monexo2++;
}
?> -->


<!-- Exercice 3 Multiplication -->

<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <h1>Table de multiplication :</h1>
        <table border="2">
        <?php
        for ($i = 0; $i <= 12; $i++)
        {
            echo("<tr>");

            for ($j = 0; $j <= 12; $j++)
            {
                $a = $i*$j;
                echo("<td>$a</td>");
            }
            echo ("</tr>");

        }

        ?>
        </table>
    </body>
</html>    