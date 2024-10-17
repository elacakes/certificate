<?php
    $host="localhost";
    $user="root";
    $pass="";
    $dbname="issuance";

    $conn=new mysqli($host,$user,$pass,$dbname);
    
    if(!$conn-> connect_error){
    }else{
        die("Connection Failed!" . mysqli_error($conn));
    }
