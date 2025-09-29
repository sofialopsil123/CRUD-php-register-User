<?php
$conexion = new mysqli('localhost', 'root', '', 'php_crud'); // ajusta tus credenciales/DB
if ($conexion->connect_errno) {
    die('Error de conexión: ' . $conexion->connect_error);
}
$conexion->set_charset('utf8mb4');