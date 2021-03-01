<?php include('server.php') ?>
<!DOCTYPE html>
<html>
<head>
  <title>Sistema di registrazione società turistica</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="header">
 <h1>società turistica</h1>
</div>
  <div class="header">
  	<h2>Registrazione</h2>
  </div>
	
  <form method="post" action="register.php">
  	<?php include('errors.php'); ?>
  	<div class="input-group">
  	  <label>Username</label>
  	  <input type="text" name="username" value="<?php echo $username; ?>">
  	</div>
  	<div class="input-group">
  	  <label>Email</label>
  	  <input type="email" name="email" value="<?php echo $email; ?>">
  	</div>
  	<div class="input-group">
  	  <label>Password</label>
  	  <input type="password" name="password_1">
  	</div>
  	<div class="input-group">
  	  <label>Conferma password</label>
  	  <input type="password" name="password_2">
  	</div>
  	<div class="input-group">
  	  <button type="submit" class="btn" name="reg_user">Register</button>
  	</div>
  	<p>
  		sei già registrato? <a href="login.php">fai login!</a>
  	</p>
  </form>
</body>
</html>