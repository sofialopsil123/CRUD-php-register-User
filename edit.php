<?php
session_start();
require_once __DIR__ . '/includes/header.php';
require_once __DIR__ . '/model/conexion.php';

// Opcional para ver errores claros
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

if (empty($_SESSION['csrf'])) {
  $_SESSION['csrf'] = bin2hex(random_bytes(32));
}
$csrf = $_SESSION['csrf'];

$id = (int)($_GET['id'] ?? 0);
if ($id <= 0) {
  $_SESSION['flash'][] = ['type'=>'danger','msg'=>'ID inválido.'];
  header('Location: register.php'); exit;
}

/* ✅ CORRECTO: especifica columnas (o usa *).
   Ojo: `date` es palabra reservada, protégela con backticks. */
$stmt = $conexion->prepare(
  "SELECT id, `name`, `lastname`, `dni`, `date`, `email` FROM person WHERE id = ?"
);
$stmt->bind_param('i', $id);
$stmt->execute();

$res = $stmt->get_result();              // requiere mysqlnd (normal en XAMPP)
$person = $res->fetch_assoc();
$stmt->close();

if (!$person) {
  $_SESSION['flash'][] = ['type'=>'danger','msg'=>'Registro no encontrado.'];
  header('Location: register.php'); exit;
}
?>
<div class="container py-4">
  <form action="controller/update_person.php" method="post" class="card shadow p-4 col-12 col-md-6 mx-auto">
    <h3 class="mb-3 text-secondary">Editar persona</h3>
    <input type="hidden" name="id" value="<?= htmlspecialchars($person['id']) ?>">
    <input type="hidden" name="csrf" value="<?= htmlspecialchars($csrf) ?>">

    <div class="mb-3">
      <label class="form-label">Name</label>
      <input name="name" class="form-control" value="<?= htmlspecialchars($person['name']) ?>" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Last Name</label>
      <input name="lastName" class="form-control" value="<?= htmlspecialchars($person['lastname']) ?>" required>
    </div>

    <div class="mb-3">
      <label class="form-label">DNI</label>
      <input name="dni" class="form-control" value="<?= htmlspecialchars($person['dni']) ?>" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Date of Birth</label>
      <input type="date" name="date" class="form-control" value="<?= htmlspecialchars($person['date']) ?>" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Email</label>
      <input type="email" name="email" class="form-control" value="<?= htmlspecialchars($person['email']) ?>" required>
    </div>

    <div class="d-flex gap-2">
      <button class="btn btn-primary" type="submit">Actualizar</button>
      <a href="register.php" class="btn btn-secondary">Cancelar</a>
    </div>
  </form>
</div>
