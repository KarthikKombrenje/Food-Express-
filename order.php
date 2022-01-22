<?php
    header("Access-Control-Allow-Origin: *");
    $db = mysqli_connect('localhost','root','Pitac123','localconnect');
if(!$db){
    echo "Database connection failed";
}
$Rid = $_POST['Rid'];
$Cid = $_POST['Cid'];
$Date= $_POST['Date'];
$Bill= $_POST['Bill'];
//echo "User name $username $password";
$sql = "INSERT INTO  orders(Rid,Cid,Date,Bill) VALUES ('".$Rid."','".$Cid."','".$Date."','".$Bill."')";
$query = mysqli_query($db, $sql);
if($query)
{
    echo ("success");
}
?>