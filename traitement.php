<?php 
$cnx = mysqli_connect("localhost","root","","bd111000");
$tel=$_POST["tel"];
$d = $_POST["daterep"];
$req1="select * from reclamation where '$tel'=telclt and etat='N'";
$res1=mysqli_query($cnx,$req1);
if(mysqli_num_rows($res1)<1){
    echo"Aucune réclamation non traitée pour ce client";
}else{
    $req2="update reclamation set etat='O' , daterep='$d' where telclt='$tel'";
    $res2=mysqli_query($cnx,$req2);
    if(mysqli_affected_rows($cnx)>0){
        echo"Réclamation triatée avec succées";
    }
}
mysqli_close($cnx);
?>