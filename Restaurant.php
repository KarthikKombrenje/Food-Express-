<?php
    header("Access-Control-Allow-Origin: *");
    $db = mysqli_connect('localhost','root','Pitac123','localconnect');
if(!$db){
    echo "Database connection failed";
}
$Rid = $_POST['Rid'];
$Rname = $_POST['Rname'];
$Location = $_POST['Location'];
//echo "User name $username $password";
$sql = "INSERT INTO restaurant(Rid,Rname,Location) VALUES ('".$Rid."','".$Rname."','".$Location."')";
$query = mysqli_query($db, $sql);
if($query)
{
    echo ("success");
}
?>