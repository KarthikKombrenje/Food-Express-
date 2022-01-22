<?php
    header("Access-Control-Allow-Origin: *");
    $db = mysqli_connect('localhost','root','*******','localconnect');
if(!$db){
    echo "Database connection failed";
}
$Cid = $_POST['Cid'];
$Rid = $_POST['Rid'];
$Rating= $_POST['Rating'];
//echo "User name $username $password";
$sql = "INSERT INTO review(Cid,Rid,Rating) VALUES ('".$Cid."','".$Rid."','".$Rating."')";
$query = mysqli_query($db, $sql);
if($query)
{
    echo ("success");
}
?>
