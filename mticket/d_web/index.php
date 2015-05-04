<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Script-Type" content="text/javascript" /> 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="robots" content="index, follow" />
<meta name="keywords" content="" />
<meta name="title" content="" />
<meta name="description" content="" />
<title>mobiTicketz</title>
<!-- ////////////////////////////////// -->
<!-- //      Start Stylesheets       // -->
<!-- ////////////////////////////////// -->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/s3slider.css" rel="stylesheet" type="text/css" />
<link href="css/jqueryslidemenu.css" rel="stylesheet" type="text/css"/>
<!-- ////////////////////////////////// -->
<!-- //      Javascript Files        // -->
<!-- ////////////////////////////////// -->
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/s3Slider.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#s3slider').s3Slider({
            timeOut: 6000 
        });
    });
</script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/Tuffy_500-Tuffy_700-Tuffy_italic_500.font.js"></script>
<script type="text/javascript">
	 Cufon.replace('h1') ('h1 a') ('h2') ('h3') ('h4') ('h5') ('h6') ('.desc')
</script>
<script type="text/javascript" src="js/jqueryslidemenu.js"></script>
<!--[if IE 6]>
<script src="js/DD_belatedPNG.js"></script>
<script>
  DD_belatedPNG.fix('img');
</script>
<![endif]--> 
</head>
<body>

<div id="wrapper">
	<div id="container">
		<div id="top">
			<div id="logo">
				<h1><a href="index.php"><span class="t1">Mobi</span>Ticketz.com</a></h1>
				<span class="desc">Ticketing Made Easy</span>
			</div><!-- end #logo -->
		</div><!-- end #top -->
		<div id="topnavigation">
			<div id="topnav">
					<div id="myslidemenu" class="jqueryslidemenu">
					<ul>
						<li class="home active"><a href="index.php">Home</a></li>
						<li><a href="#">Events</a></li>
					    <li><a href="#">Register</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
					<span style="float:right; margin-top:7px"><a href="#"><!--Sign-up</a> | <a href="#">Login</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--></span>
					</div>
			</div><!-- end #topnav -->
			<div id="topsearch">
				<form action="" method="post">
					<p><input type="text" placeholder="Search Event" class="inputbox" /><input type="submit" value="Search" class="but" /></p>
				</form>
			</div><!-- end #topsearch -->
		</div><!-- end #topnavigation -->
		<div id="header">
			<div id="slideshow">
				<div id="s3slider">
					<ul id="s3sliderContent">
						<li class="s3sliderImage">
							<img src="images/slide1.jpg" alt="" />
							<div>
							<h1> <?php echo "My Event One"; ?></h1>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p>
							<a href="#" class="but">View Event</a>
							</div>
						</li>
						<li class="s3sliderImage">
							<img src="images/slide2.jpg" alt=""/>
							<div>
							<h1><?php echo "My Event Two"; ?></h1>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p>
							<a href="#" class="but">View Event</a>
							</div>
						</li>
						<li class="s3sliderImage">
							<img src="images/slide3.jpg" alt=""/>
							<div>
							<h1><?php echo "My Event Three"; ?></h1>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p>
							<a href="#" class="but">View Event</a>
							</div>
						</li>
						<li class="clear s3sliderImage"></li>
					</ul>
				</div>
			</div><!-- end slideshow -->
		</div><!-- end #header -->
		<div id="content">
			<div id="content-left">
				<div id="maintext">
					<h1>Welcome to MobiTicketz.com</h1>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <a href="#">Duis aute irure dolor in</a> reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
					<br />
					<hr class="dotted" />
					<br />
					<ul class="inline">
						<li> <a href="#"><img src="images/pic1.jpg" alt="" /></a>
						<h2><a href="#">Organizers</a></h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
					  </li>
						<li> <a href="#"><img src="images/pic2.jpg" alt="" /></a>
						<h2><a href="#">Events</a></h2>
						<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem....</p>
					  </li>
						<li class="nomargin"><a href="#"><img src="images/pic3.jpg" alt="" /></a>
						<h2><a href="#">Download Our Apps</a></h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
					  </li>
					</ul>
				  <p>&nbsp;</p>
                    
                    
                    
                    <p style="font-family:Bookman Old Stylee; font-size:18px;"><strong>Subscribe </strong></p>
                  <p>Please subscribe to get the latest events updates</p>
                  
                      
                    <div  style="width:470px">
                      <div style="float:left; width:300"><input style="width:300px; height:30px;" type="text" name="textfield" id="textfield" /></div>
                      
                      <a href="#"><div  style="float:left; width:70px; height:26px; cursor:pointer; background-color:#999; padding-left:30px; padding-top:8px; color:#FFF"> <strong>Submit</strong></div></a>
                      </div>
                    </p>
				</div><!-- end #maintext -->
			</div><!-- end #content-left -->
			<div id="content-right">
				<div id="sideright">
				<div class="news-container">
					<div class="box">
						<h2>Latest Events</h2>
						<ul class="newslist">
							<li><span class="small">March 19, 2010</span><br /><strong>Lorem ipsum dolor sit amet</strong><br />
							Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.Ut enim ad minim veniam...<a href="#">&raquo;</a>
							</li>
							<li><span class="small">February 12, 2010</span><br /><strong>Consectetur adipisicing elit</strong><br />
							Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.Ut enim ad minim veniam...<a href="#">&raquo;</a>
							</li>
							<li class="noline"><span class="small">January 29, 2010</span><br /><strong>Sed do eiusmod tempor</strong><br />
							Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.Ut enim ad minim veniam...<a href="#">&raquo;</a>
							</li>
						</ul>
					</div><!-- end box -->
				</div><!-- end news-container -->
				</div><!-- end #sideright -->
			</div><!-- end #content-right -->
			<div class="clr"></div><!-- end clear float -->
		</div><!-- end #content -->
		<div id="footer">
			<div id="footer-text">
				Copyright &copy; 2013 MobiTicketsz.com All rights reserved.
		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="#"><img src="images/facebook.png" width="40" height="40" alt="1" /></a>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <a href="#"><img src="images/twitter.png" width="40" height="40" alt="2" /></a>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <a href="#"><img src="images/gplus.png" width="40" height="40" alt="3" /></a>
            </div><!-- end #footer-text -->
		</div><!-- end #footer -->
	</div><!-- end #container -->	
</div><!-- end #wrapper -->	
	
</body>
</html>
<!-- Localized -->