<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<title>mobiTicketz.com</title>
<meta charset="iso-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="styles/layout.css" type="text/css">
<script src="scripts/jquery-1.8.2.min.js"></script>
<script src="scripts/jquery-browsercheck.js"></script>
<script src="scripts/jquery-defaultvalue.js"></script>
<script src="scripts/general.js"></script>
<script src="scripts/ajax.js"></script>
<!--[if lt IE 9]>
<link rel="stylesheet" href="../styles/ie.css" type="text/css">
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
      <h2>mobile ticketing made simple</h2>
    </hgroup>
    <nav>
      <ul class="clear">
         <li><a href="index.php">Home</a><span></span></li>
        <li><a href="organisers.php">Organisers</a><span></span></li>
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
    <div id="content">
<?php echo $_GET['msg']; ?>
 </div>
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
    <!-- / Section -->
  </div>
</div>
<!-- Copyright -->
<div class="wrapper row5">
  <footer id="copyright" class="clear">
    <p class="fl_left">Copyright &copy; 2012 - All Rights Reserved - <a href="http://mobiTicketz.com">mobiTicketz.com</a></p>
    <p class="fl_right">WebSite by <a target="_blank" href="http://www.logiclabent.com/" title="Free Website Templates">LogicLab</a></p>
  </footer>
</div>
<script>
$(document).ready(function () {
    $("#emailAddr").defaultvalue("Enter Your Email Here");
});
</script>
</body>
</html>