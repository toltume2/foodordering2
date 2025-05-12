<?php 

    session_start();
    session_unset();
    session_destroy();

    echo "<script> window.location.href='https://e-commerce-food-ordering.infinityfreeapp.com/admin-panel/admins/login-admins.php'; </script>";
