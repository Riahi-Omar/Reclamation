<?php
$cnx = mysqli_connect("localhost","root","","bd111000");
$req="select libelle , count(*) from reclamation r , categorie c where (r.idcat=c.idcat) and etat='N' and year(daterec)=year(now()) group by libelle";
$res=mysqli_query($cnx,$req);
echo"<table border=2>
     <tr><th>Categorie</th><th>Nombre Réclamation non traitées</th></tr>";

    while($t=mysqli_fetch_array($res)){
        echo"<tr><td>$t[0]</td><td>$t[1]</td></tr>";
    }
echo"</table>";

mysqli_close($cnx);

?>