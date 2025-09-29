<?php
session_start(); // para mostrar los flash messages
require_once __DIR__ . '/includes/header.php'; // <-- agrega la barra
?>
<div class="min-vh-100 d-flex justify-content-center align-items-center">
  <form class="card shadow p-4 col-11 col-sm-8 col-md-6 col-lg-4"
        action="controller/registro_person.php" method="post">
    <h3 class="text-center text-secondary mb-3">Register User</h3>

    <?php if (!empty($_SESSION['flash'])): ?>
      <?php foreach ($_SESSION['flash'] as $f): ?>
        <div class="alert alert-<?= htmlspecialchars($f['type']) ?> alert-dismissible fade show" role="alert">
          <?= htmlspecialchars($f['msg']) ?>
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
      <?php endforeach; unset($_SESSION['flash']); ?>
    <?php endif; ?>

    <div class="mb-3">
      <label for="name" class="form-label">Name</label>
      <input id="name" type="text" class="form-control" name="name" required>
    </div>

    <div class="mb-3">
      <label for="lastName" class="form-label">Last Name</label>
      <input id="lastName" type="text" class="form-control" name="lastName" required>
    </div>

    <div class="mb-3">
      <label for="dni" class="form-label">DNI</label>
      <input id="dni" type="text" class="form-control" name="dni" required>
    </div>

    <div class="mb-3">
      <label for="date" class="form-label">Date Of Birth</label>
      <input id="date" type="date" class="form-control" name="date" required>
    </div>

    <div class="mb-3">
      <label for="email" class="form-label">Email</label>
      <input id="email" type="email" class="form-control" name="email" required>
    </div>

    <div class="d-grid">
      <button type="submit" class="btn btn-primary" name="btnregister" value="ok">Registrar</button>
    </div>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
