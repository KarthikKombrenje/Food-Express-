<?php
    header("Access-Control-Allow-Origin: *");
    $db = mysqli_connect('localhost','root','*******','localconnect');
if(!$db){
    echo "Database connection failed";
}
$username = $_POST['username'];
$password = $_POST['password'];
//echo "User name $username $password";

$sql = "INSERT INTO user(username, password) VALUES ('".$username."','".$password."')";
$query = mysqli_query($db, $sql);
if($query)
{
    echo ("success");
}
?>
