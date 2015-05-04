<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<title>mobiTicketz.com::Event</title>
<meta charset="iso-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="styles/layout.css" type="text/css">
<script src="scripts/jquery-1.8.2.min.js"></script>
<script src="scripts/jquery-browsercheck.js"></script>
<script src="scripts/jquery-defaultvalue.js"></script>
<!--[if lt IE 9]>
<link rel="stylesheet" href="styles/ie.css" type="text/css">
<script src="scripts/ie/html5shiv.min.js"></script>
<![endif]-->
</head>
<body>
<div class="wrapper row0">
  <div id="topbar" class="clear">
     <form action="search.php" method="post">
      <fieldset>
        <legend>Search:</legend>
        <input type="text" value="Search Our Website&hellip;" name="search" onFocus="this.value=(this.value=='Search Our Website&hellip;')? '' : this.value ;">
        <input type="submit" id="sf_submit" value="Search">
      </fieldset>
    </form>
    <ul>
      <li><a href="#">Sign Up</a></li>
      <li><a href="http://mobiticketz.com/mticket/Dashboard">Login</a></li>
      <li><a href="#">RSS Feeds</a></li>
    </ul>
  </div>
</div>
<div class="wrapper row1">
  <header id="header" class="clear">
    <hgroup>
      <h1><a href="#">mobi<span>Tick</span>e<span>tz</span></a></h1>
      <h2>ticketing made simple</h2>
    </hgroup>
    <nav>
      <ul class="clear">
         <li><a href="index.php">Home</a><span></span></li>
        <li  class="active"><a href="organisers.php">Organisers</a><span></span></li>
        <li ><a href="events.php">Events</a><span></span>
		 <ul>
            <li><a href="justin.php">Just In Events</a></li>
            <li><a href="upcoming.php">Upcoming Events</a></li>
          </ul>
		</li>
        <li><a href="register.php">Register</a><span></span></li>
		<li><a href="categories.php">Categories</a><span></span></li>
        <li><a href="contactus.html">Contact Us</a><span></span></li>
      </ul>
    </nav>
  </header>
</div>
<!-- content -->
<div class="wrapper row3">
  <div id="container" class="clear">
     <?php
	  //require_once("../engine/functions.inc.php");
                  $id=$_GET['id'];
		  $url="http://mobiticketz.com/api/institutionById?id=$id";
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
		  //var_dump($content);
		  if($content->{'success'}==1)
		  {

		  ?>
		   <h2 align="left">Organiser Details</h2>
        <ul>
		<?php
		      foreach($content->{'institutions'} as $cnt)
			  {
			  ?>


            <p class="name"><strong><?php echo $cnt->{'longname'}; ?></strong></p>
		   <p><?php echo $cnt->{'description'}; ?></p>
		   
                   <p><a href="subscribe.php?id=<?php echo $cnt->{'id'}; ?>&name=<?php echo $cnt->{'longname'}; ?>">Subscribe</a>
          <?php
            $url1="http://mobiticketz.com/api/eventByOrganiser?id=$id";
		  //echo $url;
		  $c1 = curl_init();
          curl_setopt($c1, CURLOPT_RETURNTRANSFER, true);
		  curl_setopt($c1,CURLOPT_URL,$url1);
          $content1 = curl_exec($c1);
		  //echo "Content ".$content;
		  $response1=curl_getinfo($c1);
          curl_close($c1);
		  //echo "Response ".$response;
		  //$response = json_decode(json_encode($response));
		  if($response1['http_code']==200)
		  {
		  $content1=json_decode($content1);
		  //var_dump($content);
		  if($content1->{'success'}==1)
		  {
                 ?>
                   <table width="100%" bgcolor="#FFFFF">
                       <tr>
                           <td colspan="4" align="center"><strong>Events</strong></td>
                       </tr>
                       <tr>
                           <td><strong>Event Name</strong></td>
                           <td><strong>Location</strong></td>
                           <td><strong>Date</strong></td>
                           <td><strong>Action</strong></td>
                       </tr>
                  <?php
                       foreach($content1->{'events'} as $cnt1)
                       {
                   ?>
                       <tr><td><?php echo $cnt1->{'eventName'}; ?></td>
                       <td><?php echo $cnt1->{'eventLoc'}; ?></td>
                      <td><?php echo $cnt1->{'eventStart'}."-".$cnt1->{'eventEnd'}; ?></td>
                       <td><a href="event.php?id=<?php echo $id; ?>">View</a></td>
                       
                       </tr>
                       <?php
                       }
                       ?>
                   </table>
                   <?php
                  }
                  }
               ?>
             <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&appId=340068436092649";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<div class="fb-like" data-send="true" data-width="450" data-show-faces="true" data-font="verdana"></div>
 <a href="https://twitter.com/share" class="twitter-share-button" data-via="mobiticketz" data-hashtags="mobiticketz" url="http://localhost/mticket/web/organiser.php?id=<?php echo $id; ?>">Tweet</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
		  <?php

			  }
			 ?>
			 </ul>

			 <?php
		   }
		 }
		 ?>
    <!-- ########################################################################################## -->
    <!-- ########################################################################################## -->
    <!-- / content body -->

    <div id="content">
      <!-- ########################################################################################## -->

      <!-- ########################################################################################## -->
    </div>
    <!-- right column -->

      <!-- /nav -->

      <!-- /section -->
      <!-- ########################################################################################## -->

    <!-- ########################################################################################## -->
    <!-- ########################################################################################## -->
    <!-- / content body -->
  </div>
</div>
<!-- Footer -->
<div class="wrapper row4">
  <div id="footer" class="clear">
    <!-- Section One -->
    <section class="one_third first">
      <div class="newsletter">
        <h2 class="title">Subscribe</h2>
        <p>Please subscribe to get the latest events updates</p>
       <form method="post" action="process/subscribe.php">
          <fieldset>
            <legend>Subscribe:</legend>
            <label for="nl_email">Email:</label>
            <input type="text" name="emailAddr" id="emailAddr" value="">
            <input type="submit" id="nl_submit" value="submit">
          </fieldset>
        </form>
      </div>
      <div class="social">
        <h2 class="title">Stay Social</h2>
        <ul class="clear">
          <li><a href="https://www.facebook.com/mobiticketzdotcom"><img src="images/facebook.png" alt=""></a> Facebook</li>
          <li><a href="https://www.twitter.com/mobiticketz"><img src="images/twitter.png" alt=""></a> Twitter</li>
          <li><a href="#"><img src="images/plus.gif" alt=""></a> Google Plus</li>
        </ul>
      </div>
    </section>
    <!-- Section Two -->
    <section class="one_third">
     <div class="social">
      <h2 class="title">Download Our Apps</h2>
        <ul class="clear">
          <li><a href="#"><img src="images/android.png" width="50" height="50" alt=""></a> Android</li>
          <li><a href="#"><img src="images/bb.png" width="50" height="50" alt=""></a> Blackberry</li>
          <li><a href="#"><img src="images/ios.png" width="50" height="50" alt=""></a> IOS</li>

        </ul>
		</div>
    </section>
    <!-- Section Three -->
    <section class="one_third">
      <h2 class="title">Latest Tweets</h2>
      <div class="ft_tweets">
           <ul>
        <a class="twitter-timeline"  href="https://twitter.com/makkasbed" data-widget-id="298551666372902912"></a>
        
<script type="text/javascript">
    				jQuery(document).ready

(function($){
					$.getJSON

('http://api.twitter.com/1/statuses/user_timeline/makkasbed.json?

count=1&amp;callback=?', function(tweets){
					$("#twitter").html

(tz_format_twitter(tweets));
					}); });
				</script>
        </ul>
      </div>
    </section>
    <!-- / Section -->
  </div>
</div>
<!-- Copyright -->
<div class="wrapper row5">
   <footer id="copyright" class="clear">
    <p class="fl_left">Copyright &copy; 2012 - All Rights Reserved - <a href="#">mobiTicketz.com</a></p>
    <p class="fl_right">Website by <a target="_blank" href="http://www.os-templates.com/" title="Free Website Templates">Logiclab</a></p>
  </footer>
</div>
<script>
$(document).ready(function () {
    $("#emailAddr").defaultvalue("Enter Your Email Here");
});
</script>
</body>
</html>