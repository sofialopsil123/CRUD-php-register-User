<?php
session_start();
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
require_once __DIR__ . '/../model/conexion.php';

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        throw new RuntimeException('Método no permitido.');
    }

    // CSRF
    if (!hash_equals($_SESSION['csrf'] ?? '', $_POST['csrf'] ?? '')) {
        throw new RuntimeException('CSRF token inválido.');
    }

    // Campos
    $id       = (int)($_POST['id'] ?? 0);
    $name     = trim($_POST['name'] ?? '');
    $lastname = trim($_POST['lastName'] ?? '');
    $dni      = trim($_POST['dni'] ?? '');
    $date     = trim($_POST['date'] ?? '');   // YYYY-MM-DD
    $email    = trim($_POST['email'] ?? '');

    if ($id <= 0) throw new InvalidArgumentException('ID inválido.');
    if ($name === '' || $lastname === '' || $dni === '' || $date === '' || $email === '') {
        throw new InvalidArgumentException('Todos los campos son obligatorios.');
    }
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        throw new InvalidArgumentException('Email no válido.');
    }
    if (!preg_match('/^\d{4}-\d{2}-\d{2}$/', $date)) {
        throw new InvalidArgumentException('Fecha no válida (AAAA-MM-DD).');
    }

    // UPDATE (proteger `date` con backticks)
    $sql = "UPDATE person
               SET `name` = ?, `lastname` = ?, `dni` = ?, `date` = ?, `email` = ?
             WHERE id = ?";
    $stmt = $conexion->prepare($sql);
    $stmt->bind_param('sssssi', $name, $lastname, $dni, $date, $email, $id);
    $stmt->execute();

    $_SESSION['flash'][] = ($stmt->affected_rows > 0)
        ? ['type' => 'success', 'msg' => 'User successfullt update.']
        : ['type' => 'info', 'msg' => 'Register not found.'];

} catch (Throwable $e) {
    $_SESSION['flash'][] = ['type' => 'danger', 'msg' => 'Error while updating: ' . $e->getMessage()];
} finally {
    header('Location: ../register.php');
    exit;
}
