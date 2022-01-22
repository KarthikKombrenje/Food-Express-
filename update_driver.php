<?php
    header("Access-Control-Allow-Origin: *");
    $db = mysqli_connect('localhost','root','Pitac123','localconnect');
if(!$db){
    echo "Database connection failed";
}
$upd = $_POST['upd'];

//echo "User name $username $password";
$sql = "$upd";
$query = mysqli_query($db, $sql);
if($query)
{
    echo ("success");
}
?>