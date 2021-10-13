<?php

$db = mysqli_init();

mysqli_options ($db, MYSQLI_OPT_SSL_VERIFY_SERVER_CERT, true);

$db->ssl_set('../client-key.pem', '../client-cert.pem', '../ca.pem', NULL, NULL);
$link = mysqli_real_connect ($db, 'webserver_web-app-db', 'root', 'webappdbrootpass', 'webappdbname', 3306, NULL, MYSQLI_CLIENT_SSL_DONT_VERIFY_SERVER_CERT);


if (!$link)
{
    die ('Connect error (' . mysqli_connect_errno() . '): ' . mysqli_connect_error() . "\n");
} 
else 
{
    echo 'Connected to DB!';
    $db->close();
}
?>