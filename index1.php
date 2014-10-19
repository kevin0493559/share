<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Free Hello Website Template | Home :: w3layouts</title>
<link href="./style1.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='http://fonts.googleapis.com/css?family=Francois+One' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
			});
		});
		</script>
	</head>
<body>	    
<?php 
require_once 'functions.php';

$userstr = ' (Guest)';

if (isset($_SESSION['user']))
{
	$user     = $_SESSION['user'];
	$loggedin = TRUE;
	$userstr  = " ($user)";
}
else $loggedin = FALSE;
if (!$loggedin) die();
echo <<< END
	<div class="header-bottom">  
		 <div class="wrap">
		    <div class="header-left" id="home">
		      <section>
				<ul class="lb-album" >
END;
 
if($stmt = $connection->prepare("SELECT picture.pic,picture.user,picturebig.pic FROM picture,picturebig where picture.picid= picturebig.picid")){
	$stmt->execute();
	$stmt->bind_result($link,$userofp,$biglink);
	$count=1;
		while($stmt->fetch()){
// 			echo $biglink;
// 			echo $link;
// 		if($getbig = $connection->prepare("select picturebig.pic from picturebig where picturebig.picid = ? ")){
// 		$getbig->bind_param("i",$picid);
// 		$getbig->execute();
// 		$getbig->bind_result($bigpiclink);
	echo <<< END
					<li>
						<a href="#$count">
							<img src="$link" alt="image03">
							<span>$userofp</span>
						</a>
						<div class="lb-overlay" id="$count">
							<img src="$biglink" alt="image03">
							<a href="#page" class="lb-close">Close</a>
						</div>
					</li>
END;
// 		$getbig->close();
		$count++;
		}
	$stmt->close();
// 	}
}
echo <<< END
					<div class="clear"></div>
				</ul>
			</section>
			<div class="clear"></div>
        </div>
     </div>
 </div>       

END;
?>
	       
</body>
</html>