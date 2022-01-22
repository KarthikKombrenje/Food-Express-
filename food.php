<?php
    header("Access-Control-Allow-Origin: *");
    $db = mysqli_connect('localhost','root','Pitac123','localconnect');
if(!$db){
    echo "Database connection failed";
}
$Rid = $_POST['Rid'];
$Fid = $_POST['Fid'];
$FoodName= $_POST['FoodName'];
$Cost = $_POST['Cost'];
//echo "User name $username $password";
$sql = "INSERT INTO food(Rid,Fid,FoodName,Cost) VALUES ('".$Rid."','".$Fid."','".$FoodName."','".$Cost."')";
$query = mysqli_query($db, $sql);
if($query)
{
    echo ("success");
}
?>