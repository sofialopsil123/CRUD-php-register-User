<?php
session_start();
require_once __DIR__ . '/../model/conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = (int)($_POST['id'] ?? 0);

    if ($id > 0) {
        $stmt = $conexion->prepare("DELETE FROM person WHERE id = ?");
        if (!$stmt) {
            $_SESSION['flash'][] = ['type'=>'danger','msg'=>'Error (prepare): '.$conexion->error];
        } else {
            $stmt->bind_param('i', $id);
            $stmt->execute();
            $_SESSION['flash'][] = ($stmt->affected_rows > 0)
              ? ['type'=>'success','msg'=>'Persona eliminada correctamente.']
              : ['type'=>'warning','msg'=>'No se encontró el registro.'];
            $stmt->close();
        }
    } else {
        $_SESSION['flash'][] = ['type'=>'danger','msg'=>'Invalid ID.'];
    }
}
header('Location: ../register.php');
exit;
