<?php
session_start();
require_once __DIR__ . '/includes/header.php';
require_once __DIR__ . '/model/conexion.php';

if (empty($_SESSION['csrf'])) {
  $_SESSION['csrf'] = bin2hex(random_bytes(32));
}
$csrf = $_SESSION['csrf'];
?>
<div class="col-12 p-4">
  <?php if (!empty($_SESSION['flash'])): ?>
    <?php foreach ($_SESSION['flash'] as $f): ?>
      <div class="alert alert-<?= htmlspecialchars($f['type']) ?> alert-dismissible fade show" role="alert">
        <?= htmlspecialchars($f['msg']) ?>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
    <?php endforeach; unset($_SESSION['flash']); ?>
  <?php endif; ?>

  <table class="table">
    <thead class="table-primary">
      <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>LAST NAME</th>
        <th>DNI</th>
        <th>DATE OF BIRTHDAY</th>
        <th>EMAIL</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <?php
      $sql = $conexion->query("SELECT * FROM person ORDER BY id ASC");
      while ($row = $sql->fetch_object()) { ?>
        <tr>
          <td><?= htmlspecialchars($row->id) ?></td>
          <td><?= htmlspecialchars($row->name) ?></td>
          <td><?= htmlspecialchars($row->lastname) ?></td>
          <td><?= htmlspecialchars($row->dni) ?></td>
          <td><?= htmlspecialchars($row->date) ?></td>
          <td><?= htmlspecialchars($row->email) ?></td>
          <td class="text-nowrap">
            <!-- EDIT: navega a edit.php -->
            <a href="edit.php?id=<?= urlencode($row->id)?>" class="btn btn-sm btn-warning me-1">
              <i class="fa-solid fa-pen-to-square"></i> Edit
            </a>

            <!-- DELETE: POST + CSRF -->
            <form action="controller/delete_person.php" method="post" class="d-inline"
                  onsubmit="return confirm('¿Eliminar este registro?');">
              <input type="hidden" name="id" value="<?= htmlspecialchars($row->id) ?>">
              <input type="hidden" name="csrf" value="<?= htmlspecialchars($csrf) ?>">
              <button type="submit" class="btn btn-sm btn-danger">
                <i class="fa-solid fa-trash"></i> Delete
              </button>
            </form>
          </td>
        </tr>
      <?php } ?>
    </tbody>
  </table>

  <a href="index.php" class="btn btn-secondary">Volver al formulario</a>
</div>
