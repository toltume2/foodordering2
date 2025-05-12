<?php

if (!isset($_SERVER['HTTP_REFERER'])) {
    // redirect them to your desired location
    header('location: https://e-commerce-food-ordering.infinityfreeapp.com/index.php');
    exit;
}

?>

<?php require "../includes/header.php"; ?>
<?php require "../config/config.php"; ?>
<?php require "../config/telegram.php"; ?>
<?php

if (!isset($_SESSION['username'])) {

    echo "<script> window.location.href='" . APPURL . "'; </script>";
}

if (isset($_SESSION['user_id'])) {
    $qryProducts = $conn->query("SELECT * FROM cart WHERE user_id='$_SESSION[user_id]'");
    $qryProducts->execute();

    $products = $qryProducts->fetchAll(PDO::FETCH_OBJ);

    # Preparing message for send to telegram
    $message     = "Buyer : <b>{$_SESSION['username']}</b>\n";
    $message    .= "Orders :\n";
    $totalPrice  = 0;
    foreach ($products as $product) {
        $message    .= "  + {$product->pro_title} x {$product->pro_qty}\n";
        $totalPrice += $product->pro_subtotal;
    }
    $totalPrice  = "$".$totalPrice;
    $message    .= "Price : <b>{$totalPrice}</b>";
    
    // Telegram API URL
    $baseUrl = "https://api.telegram.org/bot{$telegramAccessToken}/sendMessage";

    // Prepare POST data
    $postData = [
        'chat_id'    => $telegramChannelID,
        'text'       => $message,
        'parse_mode' => 'HTML'
    ];

    // Use cURL to send the message
    $ch = curl_init(); 
    curl_setopt($ch, CURLOPT_URL, $baseUrl); 
    curl_setopt($ch, CURLOPT_POST, 1); 
    curl_setopt($ch, CURLOPT_POSTFIELDS, $postData); 
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); 

    $response = curl_exec($ch); 
    curl_close($ch);

    $delete = $conn->prepare("DELETE FROM cart WHERE user_id='$_SESSION[user_id]'");
    $delete->execute();
}



?>
<div class="banner">
    <div class="jumbotron jumbotron-bg text-center rounded-0" style="background-image: url('<?php echo APPURL; ?>/assets/img/bg-header.jpg');">
        <div class="container">
            <h1 class="pt-5">
                Payment has been a success
            </h1>
            <p class="lead">
                You can check your orders now.
            </p>
            <a href="<?php echo APPURL; ?>" class="btn btn-primary text-uppercase">home</a>


        </div>
    </div>
</div>

<?php require "../includes/footer.php"; ?>

<script>
  document.querySelector('.cart-count').textContent = 0;
</script>