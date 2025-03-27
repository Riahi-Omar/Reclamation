function chiffre(ch){
    let nbc=0;
    for(let  i = 0 ; i<ch.length; i++){
        if (ch[i]>="0" && ch[i]<="9"){
            nbc=nbc+1;
        }
    }
    return nbc==ch.length;

}

function verif1(){
    let NTel = document.getElementById("tel").value;
    let cat = document.getElementById("cat").selectedIndex;
    let desc = document.getElementById("desc").value;
    if(NTel.length !=8 || chiffre(NTel)==false){alert("Tel client doit étre composé par 8 chiffres");return false;}
    if(cat < 1 ){alert("Selection d'une catégorie est obligatoire");return false;}
    if(cat==4 && desc==""){alert("description doit étre different de vide");return false;}
}
function verif2(){
    let NTel = document.getElementById("tel").value;
    let daterep = new Date(document.getElementById('daterep').value); // par défault chaine de caractéres puis convertir la chaine en type date
    //let dr=new Date(daterep);
    let ds = new Date(); //date systéme
    if(NTel.length != 8 || chiffre(NTel)==false){alert("Tel client doit étre composé par 8 chiffres");return false;}
    if(daterep >= ds){alert("Le ye 7aj");return false;}

}