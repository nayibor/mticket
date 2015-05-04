<?php
//require_once("../engine/functions.inc.php");
$id = $_GET['id'];
$url = "http://mobiticketz.com/api/eventById?id=$id";
//echo $url;
$c = curl_init();
curl_setopt($c, CURLOPT_RETURNTRANSFER, true);
curl_setopt($c, CURLOPT_URL, $url);
$content = curl_exec($c);
//echo "Content ".$content;
$response = curl_getinfo($c);
curl_close($c);
?>



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
        <style> 
            #header{   height: 0px !important;
                       clear: left;
                       margin: 10px 0px 0px 0px;
                       position: relative;
            }
        </style>

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
                                height: 56px !important;
                                "> <a href="#" style="
                                  color: #464646;
                                  padding: 18px 15px;display: block;  
                                  border-bottom: 4px solid rgba(0, 0, 0, 0);  display:  block;  
                                  font-size: 16px !important;  font-family: 'Dosis', sans-serif;
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
                                   border-bottom: 4px solid #62b3d1; 

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


                <div id="header" style ="hieght:0px !important;width:0px !important;">

                </div><!-- end #header -->
                <div id="content">
                    <div id="content-left">
                        <div id="maintext">

                            <?php
                            if ($response['http_code'] == 200) {
                                $content = json_decode($content);
                                //var_dump($content);
                                if ($content->{'success'} == 1) {
                                    ?>
                                    <h2 align="left">Event Details</h2>
                                    <ul>
                                        <?php
                                        foreach ($content->{'events'} as $cnt) {
                                            ?>


                                            <p class="name"><strong><?php echo $cnt->{'eventName'}; ?></strong></p>
                                            <p>Happening Live At <strong><?php echo $cnt->{'eventLoc'}; ?></strong></p>
                                            <p>From <strong><?php echo $cnt->{'eventStart'}; ?></strong> to <strong><?php echo $cnt->{'eventEnd'}; ?></strong></p>
                                            <p><a href="tell.php?id=<?php echo $cnt->{'id'}; ?>&name=<?php echo $cnt->{'eventName'}; ?>&start=<?php echo $cnt->{'eventStart'}; ?>&end=<?php echo $cnt->{'eventEnd'}; ?>&loc=<?php echo $cnt->{'eventLoc'}; ?>">Tell a Friend</a>&nbsp;&nbsp;&nbsp;<a href="calendar.php?id=<?php echo $cnt->{'id'}; ?>&name=<?php echo $cnt->{'eventName'}; ?>&start=<?php echo $cnt->{'eventStart'}; ?>&end=<?php echo $cnt->{'eventEnd'}; ?>&loc=<?php echo $cnt->{'eventLoc'}; ?>">Add To Calendar</a>
                                                <?php
                                                $url1 = "http://mobiticketz.com/api/tickettypesevent?id=$id";
                                                //echo $url;
                                                $c1 = curl_init();
                                                curl_setopt($c1, CURLOPT_RETURNTRANSFER, true);
                                                curl_setopt($c1, CURLOPT_URL, $url1);
                                                $content1 = curl_exec($c1);
                                                //echo "Content ".$content;
                                                $response1 = curl_getinfo($c1);
                                                curl_close($c1);
                                                //echo "Response ".$response;
                                                //$response = json_decode(json_encode($response));
                                                if ($response1['http_code'] == 200) {
                                                    $content1 = json_decode($content1);
                                                    //var_dump($content);
                                                    if ($content1->{'success'} == 1) {
                                                        ?>
                                                        <table width="100%" bgcolor="#FFFFF">
                                                            <tr>
                                                                <td colspan="4" align="center"><strong>Ticket Types</strong></td>
                                                            </tr>
                                                            <tr>
                                                                <td><strong>Ticket Type</strong></td>
                                                                <td><strong>Cost(&cent;)</strong></td>
                                                                <td><strong>Status</strong></td>
                                                                <td><strong>Action</strong></td>
                                                            </tr>
                                                            <?php
                                                            foreach ($content1->{'tickettype'} as $cnt1) {
                                                                ?>
                                                                <tr><td><?php echo $cnt1->{'name'}; ?></td>
                                                                    <td><?php echo $cnt1->{'cost'}; ?></td>
                                                                    <?php
                                                                    if ($cnt1->{'status'} == 2) {
                                                                        ?>
                                                                        <td><?php echo "Available"; ?></td>
                                                                        <td><a href="buy.php?id=<?php echo $id; ?>&idnum=<?php echo $cnt1->{'id'}; ?>">Buy</a></td>
                                                                        <?php
                                                                    } else {
                                                                        ?>
                                                                        <td><?php echo "Sold Out"; ?></td>
                                                                        <td></td>
                                                                        <?php
                                                                    }
                                                                    ?>
                                                                </tr>
                                                                <?php
                                                            }
                                                            ?>
                                                        </table>
                                                        <?php
                                                    }
                                                }
                                                ?>
                                                <p>Friends Attending</p>



                                                <div id="fb-root"></div>
                                                <script>(function(d, s, id) {
                                                    var js, fjs = d.getElementsByTagName(s)[0];
                                                    if (d.getElementById(id)) return;
                                                    js = d.createElement(s); js.id = id;
                                                    js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&appId=340068436092649";
                                                    fjs.parentNode.insertBefore(js, fjs);
                                                }(document, 'script', 'facebook-jssdk'));</script>
                                                <div class="fb-like" data-send="true" data-width="450" data-show-faces="true" data-font="verdana"></div>
                                                <a href="https://twitter.com/share" class="twitter-share-button" data-via="mobiticketz" data-hashtags="mobiticketz" url="http://localhost/mticket/web/event.php?id=<?php echo $id; ?>">Tweet</a>
                                                <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
                                                <?php
                                            }
                                            ?>
                                    </ul>

                                    <?php
                                }
                            }
                            ?>







                        </div><!-- end #maintext -->
                    </div><!-- end #content-left -->
                    <div id="content-right" style="height: 440px;">
                        <div id="sideright">
                            <div class="news-container">
                                <div class="box">
                                    <h2>Latest Events</h2>
                                    <ul class="newslist">
                                        <li style="background: none"><br><br>
                                                    Loading Latest Events ...
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