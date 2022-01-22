<?php
function get_data()
{
$connect = mysqli_connect("localhost","root","Pitac123","localconnect");
$query = "SELECT * FROM driver";
$result = mysqli_query($connect,$query);
$driver_data = array();
while($row = mysqli_fetch_array($result))
{
 $driver_data[] = array(
     'Did' => $row["Did"],
     'Dname' => $row['Dname'],
     'Age' => $row['Age'],
 );
}
echo  json_encode($driver_data);

}
get_data()
?>