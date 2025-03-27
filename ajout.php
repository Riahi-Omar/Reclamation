<?php
$cnx = mysqli_connect("localhost","root","","bd111000");
$tel=$_POST["tel"];
$cat=$_POST["cat"];
$desc=$_POST["desc"];
$req1="select * from client where '$tel'=telclt";
$res1=mysqli_query($cnx,$req1);
$req2="select * from reclamation where telclt='$tel' and Etat='N'";
$res2=mysqli_query($cnx,$req2);
$d=date('Y-m-d H:i:s'); // date et l'heure de systéme
if(mysqli_num_rows($res1)<1){
    echo"Client n'est pas enregistré";
}elseif(mysqli_num_rows($res2)>0){
    echo"Client admet une réclaction non encore traitée";
}else{
    //Mahouch mawjoud dans table réclamation
    $req3="insert into reclamation(Description,Etat,DateRec,TelClt,IdCat) values('$desc','N','$d','$tel',$cat)";
    $res3=mysqli_query($cnx,$req3);
    if(mysqli_affected_rows($cnx)>0){
        echo"Réclamation enregistré avec succés";
    }
}



//if(mysqli_num_rows($res1)<1) die("Client n'est pas enregistré");
mysqli_close($cnx);
?>