<?php

 //Define your Server host name here.
 $HostName = " DESKTOP-GLTRQV9";

 //Define your MySQL Database Name here.
 $DatabaseName = "fooddeliveryapp";

 //Define your Database User Name here.
 $HostUser = "root";

 //Define your Database Password here.
 $HostPass = "Krishna#001";

 // Creating MySQL Connection.
 $con = mysqli_connect($HostName,$HostUser,$HostPass,$DatabaseName);

 // Getting the received JSON into $json variable.
 $json = file_get_contents('php://input');

 // Decoding the received JSON and store into $obj variable.
 $obj = json_decode($json,true);

 // Getting User email from JSON $obj array and store into $email.
 $email = $obj['username'];

 // Getting Password from JSON $obj array and store into $password.
 $password = $obj['password'];

 //Applying User Login query with email and password.
 $loginQuery = "select * from register where username = '$username' and password = '$password' ";

 // Executing SQL Query.
 $check = mysqli_fetch_array(mysqli_query($con,$loginQuery));

	if(isset($check)){

		 // Successfully Login Message.
		 $onLoginSuccess = 'Login Matched';

		 // Converting the message into JSON format.
		 $SuccessMSG = json_encode($onLoginSuccess);

		 // Echo the message.
		 echo $SuccessMSG ;

	 }

	 else{

		 // If Email and Password did not Matched.
		$InvalidMSG = 'Invalid Username or Password Please Try Again' ;

		// Converting the message into JSON format.
		$InvalidMSGJSon = json_encode($InvalidMSG);

		// Echo the message.
		 echo $InvalidMSGJSon ;

	 }

 mysqli_close($con);
?>
