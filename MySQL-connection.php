<?php
$servername = "prakash-mysql.cq174vfsoqja.us-east-1.rds.amazonaws.com";
$username = "prakash";
$password = "prakashd";
$dbname = "mydb";

// Create connection
$conn = new mysqli($servername, $username, $password,$dbname );

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?>