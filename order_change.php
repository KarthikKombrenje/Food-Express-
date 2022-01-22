<?php
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Headers"); 
    header("Access-Control-Allow-Origin, Accept");
    header("Access-Control-Allow-Credentials: true");
    header("Content-type:application/json;charset=utf-8"); 
    header("Access-Control-Allow-Methods: GET");
  //  header('Content-Type: application/json');
   // header("Access-Control-Allow-Credentials": "true");
   // header("Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale");
    //header("Access-Control-Allow-Methods": "POST, OPTIONS");
  //  header("Access-Control-Allow-Origin: *");
    //header("Content-type:application/json;charset=utf-8");
   // header("Access-Control-Allow-Methods: GET");
   // header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
    //open connection to mysql db
    $connection = mysqli_connect("localhost","root","*******","localconnect") or die("Error " . mysqli_error($connection));
    //fetch table rows from mysql db
    $sql = "select * from orders";
    $result = mysqli_query($connection, $sql) or die("Error in Selecting " . mysqli_error($connection));

    //create an array
    $emparray = array();
    while($row =mysqli_fetch_assoc($result))
    {
        $emparray[] = $row;
    }
    echo json_encode($emparray);

    //close the db connection
    mysqli_close($connection);
?>
