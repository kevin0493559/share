<?php
require_once 'header.php';
if (!$loggedin) die();

echo "<div class='main'><h3>Your Picture</h3>";

if($stmt = $connection->prepare("SELECT picture.pic FROM picture WHERE user='$user'")){
	$stmt->execute();
	$stmt->bind_result($link);
	while($stmt->fetch()){
		echo "<img src=".$link." />";
		}
	$stmt->close();   
}
function findexts ($filename)
{
	$filename = strtolower($filename) ;
	$exts = preg_split("[/\\.]", $filename) ;
	$n = count($exts)-1;
	$exts = $exts[$n];
	return $exts;
}
if(isset($_FILES["file"]["name"])){

    $allowedExts = array("gif", "jpeg", "jpg", "png");
    $temp = explode(".", $_FILES["file"]["name"]);
    $extension = end($temp);
    if ((($_FILES["file"]["type"] == "image/gif")
    || ($_FILES["file"]["type"] == "image/jpeg")
    || ($_FILES["file"]["type"] == "image/JPEG")
    || ($_FILES["file"]["type"] == "image/jpg")
    || ($_FILES["file"]["type"] == "image/JPG")
    || ($_FILES["file"]["type"] == "image/pjpeg")
    || ($_FILES["file"]["type"] == "image/x-png")
    || ($_FILES["file"]["type"] == "image/png"))
    && ($_FILES["file"]["size"] < 2000000)
    && in_array($extension, $allowedExts))
      {
      if ($_FILES["file"]["error"] > 0)
        {
        echo "Return Code: " . $_FILES["file"]["error"] . "<br>";
        }
      else
        {
        $ext = findexts($_FILES['file']['name']) ; 
        $target = 'images/';
        $ran = time();
        $target = $target.$ran.'.'.$ext;
        $picture=$_FILES['file']['tmp_name'];
        if(move_uploaded_file($picture, $target)) 
         {
         	switch($_FILES['file']['type'])
    		{
		      case "image/gif":   $src = imagecreatefromgif($target); break;
		      case "image/jpeg":  // Both regular and progressive jpegs
		      case "image/pjpeg": $src = imagecreatefromjpeg($target); break;
		      case "image/png":   $src = imagecreatefrompng($target); break;
		      default:            $typeok = FALSE; break;
		    }
		
		    
		      list($w, $h) = getimagesize($target);
		
		      $tw=200;
		      $th=200;
		
		      $tmp = imagecreatetruecolor($tw, $th);
		      imagecopyresampled($tmp, $src, 0, 0, 0, 0, $tw, $th, $w, $h);
		      imageconvolution($tmp, array(array(-1, -1, -1),
		        array(-1, 16, -1), array(-1, -1, -1)), 8, 0);
		      imagejpeg($tmp, $target);
		    
            //$link = $_POST["web_URL"];
            $local = 'http://localhost:80/share/images/'.$ran.'.'.$ext;
            
            if ($stmt = $connection->prepare("insert into picture (pic,user) values (?,?)")) {
                $stmt->bind_param("ss", $local, $user);
                $stmt->execute();
                $stmt->close();    
            }
         } 
         else
         {
           echo "Sorry, there was a problem uploading your file.";
         }
         
         $target2 = 'images/'.$ran.'big.'.$ext;

         if(copy($target, $target2))
         {
         	switch($_FILES['file']['type'])
         	{
         		case "image/gif":   $src = imagecreatefromgif($target2); break;
         		case "image/jpeg":  // Both regular and progressive jpegs
         		case "image/pjpeg": $src = imagecreatefromjpeg($target2); break;
         		case "image/png":   $src = imagecreatefrompng($target2); break;
         		default:            $typeok = FALSE; break;
         	}
         	list($w, $h) = getimagesize($target2);
         	$tw=500;
         	$th=500;
         	
         	$tmp = imagecreatetruecolor($tw, $th);
         	imagecopyresampled($tmp, $src, 0, 0, 0, 0, $tw, $th, $w, $h);
         	imageconvolution($tmp, array(array(-1, -1, -1),
         	array(-1, 16, -1), array(-1, -1, -1)), 8, 0);
         	imagejpeg($tmp, $target2);
         	imagedestroy($tmp);
         	imagedestroy($src);
         	
         	$local2='http://localhost:80/share/images/'.$ran.'big.'.$ext;
         	if ($stmt = $connection->prepare("insert into picturebig (pic,user) values (?,?)")) {
         		$stmt->bind_param("ss", $local2, $user);
         		$stmt->execute();
         		$stmt->close();
         	}
         }
         else {
         	echo "Sorry, there was a problem uploading your file.";
         }
        }
      }
    else
      {
      echo "Invalid file";
      }
	
}
echo <<<_END
    <form method='post' action='addpic.php' enctype='multipart/form-data'>
    <h3>upload an image</h3>
_END;
?>

    Image: <input type='file' name='file' size='14'>
    <input type='submit' value='Save Image'>
    </form></div><br>
  </body>
</html>
