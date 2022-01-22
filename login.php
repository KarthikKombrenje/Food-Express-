<?php
    header("Access-Control-Allow-Origin: *");
    $db = mysqli_connect('localhost','root','*******','localconnect');
if(!$db){
    echo "Database connection failed";
}
$username = $_POST['username'];
$password = $_POST['password'];
//echo "User name $username $password";

$sql = "SELECT * FROM user WHERE username ='".$username."' AND password = '".$password."'";
$result = mysqli_query($db, $sql);
$count = mysqli_num_rows($result);
if($count>=1)
{
    echo ("success");
}
else{
    echo("error");
}
?>
