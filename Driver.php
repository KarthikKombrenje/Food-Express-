<?php
    header("Access-Control-Allow-Origin: *");
    $db = mysqli_connect('localhost','root','*******','localconnect');
if(!$db){
    echo "Database connection failed";
}
$Did = $_POST['Did'];
$Dname = $_POST['Dname'];
$Age = $_POST['Age'];
//echo "User name $username $password";
$sql = "INSERT INTO driver(Did,Dname,Age) VALUES ('".$Did."','".$Dname."','".$Age."')";
$query = mysqli_query($db, $sql);
if($query)
{
    echo ("success");
}
?>
