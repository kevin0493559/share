<?php // Example 26-4: index.php
  require_once 'header.php';

  echo "<br><span class='main'>Welcome to $appname,";
	
  if ($loggedin) echo " $user, you are logged in.";
  else           echo ' please sign up and/or log in to join in.';
  include ("index1.php");
?>

    </span><br><br>
  </body>
</html>