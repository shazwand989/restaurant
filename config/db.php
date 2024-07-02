<?php
// START SESSION
session_start();

// DATABASE CREDINTIALS
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'db_restaurant');

// SITE URL
define('SITE_URL', 'http://localhost:8080/');

// SITE NAME
define('SITE_NAME', 'Restaurant Politeknik Kuala Terengganu');

// CONNECT TO DATABASE
$conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_DATABASE);

// CHECK CONNECTION
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}


include_once 'functions.php';
