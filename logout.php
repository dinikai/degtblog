<?php

error_reporting(E_ALL);
ini_set('display_errors', '1');

unset($_COOKIE['userid']);
setcookie('userid', null, -1, '/');

header("Location: .");