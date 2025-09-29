<?php
session_start();
require_once __DIR__ . '/../model/conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST['btnregister'])) {
    $name     = trim($_POST['name'] ?? '');
    $lastName = trim($_POST['lastName'] ?? '');
    $dni      = trim($_POST['dni'] ?? '');
    $date     = trim($_POST['date'] ?? '');
    $email    = trim($_POST['email'] ?? '');

    if ($name && $lastName && $dni && $date && $email) {
        // Ojo: si tu columna se llama `date`, protégela con backticks
        $stmt = $conexion->prepare(
            "INSERT INTO person (`name`, `lastname`, `dni`, `date`, `email`) VALUES (?, ?, ?, ?, ?)"
        );
        if (!$stmt) {
            $_SESSION['flash'][] = ['type' => 'danger', 'msg' => 'Error (prepare): ' . $conexion->error];
            header('Location: ../index.php'); exit;
        }
        $stmt->bind_param('sssss', $name, $lastName, $dni, $date, $email);

        if ($stmt->execute()) {
            $_SESSION['flash'][] = ['type' => 'success', 'msg' => 'User successfully registered.'];
            header('Location: ../register.php'); // página de la tabla
            exit;
        } else {
            $_SESSION['flash'][] = ['type' => 'danger', 'msg' => 'Error while registerin: ' . $stmt->error];
            header('Location: ../index.php'); exit;
        }
    } else {
        $_SESSION['flash'][] = ['type' => 'warning', 'msg' => 'Some Fields are empty.'];
        header('Location: ../index.php'); exit;
    }
}
