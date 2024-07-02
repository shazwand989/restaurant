<?php
require_once "config/db.php";
session_destroy();
redirect('admin/login.php');
