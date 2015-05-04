<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$email=$_GET['email'];

         $url="http://mobiticketz.com/api/unsubscribe?email=$email";
		 //echo $url;
		  $c = curl_init();
          curl_setopt($c, CURLOPT_RETURNTRANSFER, true);
		  curl_setopt($c,CURLOPT_URL,$url);
          $content = curl_exec($c);
		  //echo "Content ".$content;
		  $response=curl_getinfo($c);
          curl_close($c);
		  //echo "Response ".$response;
		  //$response = json_decode(json_encode($response));
		  if($response['http_code']==200)
		  {
		  $content=json_decode($content);
                  //echo $content;
		  //var_dump($content);
		  if($content->{'success'}==1)
		  {
                    header("Location:result.php?msg= ".$content->{'message'});
                  }else
                  {
                    header("Location:result.php?msg= ".$content->{'message'});
                  }
                  }
                  
?>
