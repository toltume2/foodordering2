<?php 
      
    // if(!isset($_SERVER['HTTP_REFERER'])){
    //     // redirect them to your desired location
    //     header('location: http://localhost/foodordering/index.php');
    //     exit;
    // }

      
    try {
        
        //host
        if (!defined('HOST')) define("HOST", "localhost");

        //port
        if (!defined('PORT')) define("PORT", "3307");

        //dbname
        if (!defined('DBNAME')) define("DBNAME", "freshcery2");

        //user
        if (!defined('USER')) define("USER", "root");

        //pass
        if (!defined('PASS')) define("PASS", "123456");


        $conn = new PDO("mysql:host=".HOST.";port=".PORT."dbname=".DBNAME.";", USER, PASS);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // if($conn == true) {
        //     echo "connected successfully";
        // } else {
        //     echo "error";
        // }

    } catch (PDOException $e) {
        echo $e->getMessage();
    }