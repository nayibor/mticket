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
        <script type="text/javascript" src="js/index.js"></script>


    </head>
    <body
        style="
        background: #eee url(images/grain.png) repeat;
        background: url(images/bg-gradient-sky.png) repeat-x 0 0,url(images/grain.png) repeat 0 0,#eee;
        ">

        <div id="wrapper">
            <div id="container">
                <div id="top" style="border-top: solid 2px #2d84b6 !important;">
                    <div id="logo" style="width: 336px !important;height: 70px !important;float: left;">
                        <h1><a href="index.php"><span class="t1">Mobi</span>Ticketz.com</a></h1>
                        <span class="desc">Ticketing Made Easy</span>
                    </div><!-- end #logo -->

                    <div id="nav" style="
                         float: right !important;
                         width: 463px;
                         height: 70px;
                         /* margin: 0px !important; */
                         padding: 0px !important;
                         vertical-align: baseline !important;
                         font-size: 100% !important;
                         margin-left: 20px !important;
                         ">		
                        <ul style="
                            margin: 0;  padding: 0;  border: 0;  outline: 0;  font-size: 100%;  font: inherit;  vertical-align: baseline;  background: transparent;
                            color: #606369;
                            ">

                            <li class="current" style="
                                float: left;
                                background: transparent;
                                display: list-item;  list-style: none;
                                text-align: -webkit-match-parent;
                                border-bottom: 4px solid #62b3d1;
                                height: 56px !important;
                                "> <a href="#" style="
                                  color: #464646;
                                  padding: 18px 15px;display: block;  
                                  border-bottom: 4px solid rgba(0, 0, 0, 0);  display:  block;  
                                  font-size: 16px !important;  font-family: 'Dosis', sans-serif;
                                  /* border-bottom: 4px solid #62b3d1; */
                                  height: 56px;
                                  ">Home</a></li>
                            <li style="
                                float: left;
                                background: transparent;
                                display: list-item;  list-style: none;
                                text-align: -webkit-match-parent;
                                ">
                                <a href="events.php" style="
                                   color: #464646;  padding: 18px 15px;display: block;  
                                   font-size: 16px !important;  font-family: 'Dosis', sans-serif;
                                   ">Tickets</a>		
                            </li>
                            <li style="
                                float: left;
                                background: transparent;
                                display: list-item;  list-style: none;
                                text-align: -webkit-match-parent;
                                ">
                                <a href="contactus.html" style="
                                   color: #464646;  padding: 18px 15px;   display: block;  
                                   font-size: 16px !important;  font-family: 'Dosis', sans-serif;
                                   ">Contact</a>		
                            </li>
                        </ul></div>



                </div><!-- end #top -->


                <div id="header">
                    <div id="slideshow">
                        <div id="s3slider">
                            <ul id="s3sliderContent">
                                <li class="s3sliderImage">
                                    <img src="images/slide1.jpg" alt="" />
                                    <div>
                                        <h1> <?php //echo "My Event One";   ?></h1>
                                        <p></p>
                                        <!--  <a href="#" class="but">View Event</a> -->
                                    </div>
                                </li>
                                <li class="s3sliderImage">
                                    <img src="images/slide2.jpg" alt=""/>
                                    <div>
                                        <h1><?php //echo "My Event Two";   ?></h1>
                                        <p></p>
                                        <!--  <a href="#" class="but">View Event</a> -->
                                    </div>
                                </li>
                                <li class="s3sliderImage">
                                    <img src="images/slide3.jpg" alt=""/>
                                    <div>
                                        <h1><?php //echo "My Event Three";   ?></h1>
                                        <p></p>
                                        <!--<a href="#" class="but">View Event</a>-->
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
                            <p><b>Your One Stop Shop For Electronic Ticketing.</b>
                                We provide electronic ticketing services .
                                Mobile tickets reduce the production and distribution costs connected with traditional paper-based ticketing channels 
                                and increase customer convenience by providing new and simple ways to purchase tickets  
                                Customers can order, pay for, obtain and validate tickets from any location and at any time using mobile phones or other mobile handsets.</p>
                            <br />
                            <hr class="dotted" />
                            <br />
                            <ul class="inline">
                                <li> <a href="#"><img src="images/pic1.jpg" alt="" /></a>
                                    <h2><a href="#">Organizers</a></h2>
                                    <p>We help with the organization ,sale and verification of electronic tickets.</p>
                                </li>
                                <li> <a href="#"><img src="images/pic2.jpg" alt="" /></a>
                                    <h2><a href="#">Events</a></h2>
                                    <p>We help with the organization events</p>
                                </li>
                                <!--li class="nomargin"><a href="#"><img src="images/pic3.jpg" alt="" /></a>
                                    <h2><a href="#">Download Our Apps</a></h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
                                </li>
                                -->
                            </ul>
                            <p>&nbsp;</p>


                            <!--
                                                        <p style="font-family:Bookman Old Stylee; font-size:18px;"><strong>Subscribe </strong></p>
                                                        <p>Please subscribe to get the latest events updates</p>
                            -->

                            <div  style="width:470px">
                                <div style="float:left; width:300"><input style="width:300px; height:30px;" type="text" name="textfield" id="textfield" /></div>

                                <a href="#"><div  style="float:left; width:70px; height:26px; cursor:pointer; background-color:#999; padding-left:30px; padding-top:8px; color:#FFF"> <strong>Submit</strong></div></a>
                            </div>
                            </p>
                        </div><!-- end #maintext -->
                    </div><!-- end #content-left -->
                    <div id="content-right" style="height: 440px;">
                        <div id="sideright">
                            <div class="news-container">
                                <div class="box">
                                    <h2>Latest Events</h2>
                                    <ul class="newslist">
                                        <li style="background: none"><br><br>
                                                    <span>Loading Latest Events ...</span>
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
                                                            Copyright &copy; <php echo date('Y');  ?> MobiTicketsz.com All rights reserved.
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