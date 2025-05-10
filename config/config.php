<?php
$host   = "localhost";
$port   = "3307";
$dbname = "food_ordering";
$user   = "root";
$pass   = "123456";

try {
    $conn = new PDO("mysql:host=$host;port=$port;dbname=$dbname", $user, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "<script>alert(" . "Connection failed: " . $e->getMessage() . ")</script>";
}
