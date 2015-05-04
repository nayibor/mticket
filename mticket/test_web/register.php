<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<title>mobiTicketz</title>
<meta charset="iso-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="styles/layout.css" type="text/css">
<script src="scripts/jquery-1.8.2.min.js"></script>
<script src="scripts/jquery-browsercheck.js"></script>
<script src="scripts/jquery-defaultvalue.js"></script>
<script type="text/javascript" src="scripts/parsley.js"></script>
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
      <h1><a href="#">mobi<span>Ticketz</span><span>.com</span></a></h1>
      <h2>ticketing made simple</h2>
    </hgroup>
    <nav>
      <ul class="clear">
        <li><a href="index.html">Home</a><span></span></li>
        <li><a href="organiser.php">Organisers</a><span></span></li>
        <li><a href="events.php">Events</a><span></span>
		 <ul>
            <li><a href="justin.php">Just In Events</a></li>
            <li><a href="upcoming.php">Upcoming Events</a></li>
          </ul>
		</li>
        <li class="active"><a href="register.php">Register</a><span></span></li>
		<li><a href="categories.php">Categories</a><span></span></li>
        <li><a href="contactus.html">Contact Us</a><span></span></li>
      </ul>
    </nav>
  </header>
</div>
<!-- content -->
<div class="wrapper row3">
  <div id="container" class="clear">
  <div id="content" >
  <section id="comments">
    <h2>Register</h2>
        <form action="process/register.php" method="post" enctype="multipart/form-data" data-validate="parsley">
          <p>
		  <label for="name"><small>Name (required)</small></label><br/>
            <input type="text" name="name" id="name" value="" size="45" data-required="true">
            
          </p>
		  <p>
		  <label for="email"><small>Email Address (required)</small></label><br/>
            <input type="text" name="email" id="email" value="" size="80" data-type="email" data-required="true" >
            
          </p>
		  <p>
		    <label for="email"><small>Contact No. (required)</small></label><br/>
            <input type="text" name="phone" id="phone" value="" size="45" data-type="phone" data-required="true">
            
          </p>
            <p>
		    <label for="email"><small>Fax:</small></label><br/>
            <input type="text" name="fax" id="fax" value="" size="45" data-type="phone">

          </p>
		  <p>
		    <label for="email"><small>Logo (required)</small></label><br/>
            <input type="file" name="logo" id="logo" value="" size="45">
            
          </p>
		  <p>
		    <label for="email"><small>Location (required)</small></label><br/>
            <input type="text" name="city" id="city" value="" size="45">
            
          </p>
		  <p>
		    <label for="email"><small>Address (required)</small></label><br/>
            <input type="text" name="addr" id="addr" value="" size="45"  data-required="true">
            
          </p>
          <p>
		    <label for="comment" class="hidden"><small>Description (required)</small></label><br/>
            <textarea name="descr" id="descr" cols="10" rows="10" data-required="true"></textarea>
            
          </p>
          <p>
            <input name="submit" type="submit" id="submit" value="Save">
            &nbsp;
            <input name="reset" type="reset" id="reset" value="Clear">
          </p>
        </form>
		</section>
		</div>
  </div>
</div>
<!-- Footer -->
<div class="wrapper row4">
  <div id="footer" class="clear">
    <!-- Section One -->
    <section class="one_third first">
      <div class="newsletter">
        <h2 class="title">Subscribe</h2>
        <p>Subscribe to get the latest event updates</p>
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