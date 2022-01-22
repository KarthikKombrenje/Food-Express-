<?php
    header("Access-Control-Allow-Origin: *");
    $db = mysqli_connect('localhost','root','*******','localconnect');
if(!$db){
    echo "Database connection failed";
}
$Cid = $_POST['Cid'];
$Cname = $_POST['Cname'];
$Cadd = $_POST['Cadd'];
$Ctype = $_POST['Ctype'];
//echo "User name $username $password";
$sql = "INSERT INTO customer(Cid,Cname,Cadd,Ctype) VALUES ('".$Cid."','".$Cname."','".$Cadd."','".$Ctype."')";
$query = mysqli_query($db, $sql);
if($query)
{
    echo ("success");
}
?>
