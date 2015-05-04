<?php
//require_once("../engine/functions.inc.php");
$url = "http://mobiticketz.com/api/events";
//echo $url;
$c = curl_init();
curl_setopt($c, CURLOPT_RETURNTRANSFER, true);
curl_setopt($c, CURLOPT_URL, $url);
$content = curl_exec($c);
//echo "Content ".$content;
$response = curl_getinfo($c);
curl_close($c);
//echo "Response ".$response;
//$response = json_decode(json_encode($response));
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
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="css/chromatron-red.css" rel="stylesheet" type="text/css" />
        <script src="datat_folder/jquery.min.js"></script>

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
                                "> <a href="http://compareninja.com/?orig=true" style="
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
                                border-bottom: 4px solid #62b3d1;
                                ">
                                <a href="http://compareninja.com/?orig=true" style="
                                   color: #464646;  padding: 18px 15px;display: block;  
                                   font-size: 16px !important;  font-family: 'Dosis', sans-serif;
                                   ">Events</a>		
                            </li>
                          
                            <li style="
                                float: left;
                                background: transparent;
                                display: list-item;  list-style: none;
                                text-align: -webkit-match-parent;
                                ">
                                <a href="http://compareninja.com/?orig=true" style="
                                   color: #464646;  padding: 18px 15px;   display: block;  
                                   font-size: 16px !important;  font-family: 'Dosis', sans-serif;
                                   ">Contact</a>		
                            </li>
                        </ul></div>



                </div><!-- end #top -->


                <div id="header">
                    <div id="slideshow">

                        <div id="DIV_1" class="dataTables_wrapper form-inline">
                            <div class="row-fluid" id="DIV_2">
                                <div class="span4" id="DIV_3">
                                    <!--  <div id="DIV_4" class="dataTables_length">
                                          <label id="LABEL_5">
                                              <select size="1" name="example-2_length" id="SELECT_6">
                                                  <option value="10" selected="selected" id="OPTION_7">
                                                      10
                                                  </option>
                                                  <option value="25" id="OPTION_8">
                                                      25
                                                  </option>
                                                  <option value="50" id="OPTION_9">
                                                      50
                                                  </option>
                                                  <option value="100" id="OPTION_10">
                                                      100
                                                  </option>
                                              </select> records per page
                                          </label>
                                      </div>
                                    -->
                                </div>
                                <div class="span8" id="DIV_11">
                                    <div class="dataTables_filter" id="DIV_12">
                                        <label id="LABEL_13">
                                            Search:
                                            <input type="text" id="INPUT_14" />
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div id="DIV_15" class="dataTables_wrapper form-inline">
                                <div class="row-fluid" id="DIV_16">
                                    <div class="span4" id="DIV_17">
                                        <div id="DIV_18" class="dataTables_length">
                                            <label id="LABEL_19">
                                                <select size="1" name="example-2_length" id="SELECT_20">
                                                    <option value="10" selected="selected" id="OPTION_21">
                                                        10
                                                    </option>
                                                    <option value="25" id="OPTION_22">
                                                        25
                                                    </option>
                                                    <option value="50" id="OPTION_23">
                                                        50
                                                    </option>
                                                    <option value="100" id="OPTION_24">
                                                        100
                                                    </option>
                                                </select> records per page
                                            </label>
                                        </div>
                                    </div>
                                    <div class="span8" id="DIV_25">
                                        <div class="dataTables_filter" id="DIV_26">
                                            <label id="LABEL_27">
                                                Search:
                                                <input type="text" id="INPUT_28" />
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <table class="datatable table table-striped table-bordered table-hover dataTable" id="TABLE_29">
                                    <thead id="THEAD_30">
                                        <tr id="TR_31">
                                            <th class="sorting_asc" rowspan="1" colspan="1" id="TH_32">
                                                Event
                                            </th>
                                            <th class="sorting" rowspan="1" colspan="1" id="TH_33">
                                                Date
                                            </th>
                                            <th class="sorting" rowspan="1" colspan="1" id="TH_34">
                                                Location
                                            </th>
                                            <!--
                                           <th class="sorting" rowspan="1" colspan="1" id="TH_34">
                                                Location
                                            </th>
                                            -->
                                            <th class="sorting" rowspan="1" colspan="1" id="TH_36">
                                                Add To Calendar
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody id="TBODY_37">
                                        <?php
                                        if ($response['http_code'] == 200) {
                                            $content = json_decode($content);
                                            //var_dump($content);
                                            if ($content->{'success'} == 1) {
                                                $i = 0;
                                                foreach ($content->{'events'} as $cnt) {
                                                    ?>

                                                    <tr class="gradeA <?php echo ($i % 2 == 0) ? "even" : "odd" ?>" id="TR_38">
                                                        <td class=" sorting_1 " id="TD_39">
                                                            <?php echo $cnt->{'eventName'} ?>
                                                        </td>
                                                        <td class=" " id="TD_40">
                                                           <b><?php echo date("F j, Y, g:i a",$cnt->{'eventStart'}); ?></b>to  <b><?php echo date("F j, Y, g:i a",$cnt->{'eventEnd'});?></b>
                                                        </td>
                                                        <td class=" " id="TD_41">
                                                            <?php echo $cnt->{'eventLoc'}; ?>
                                                        </td>
                                                      <!--  <td class=" " id="TD_42">
                                                            
                                                        </td>
                                                        -->
                                                        <td class=" " id="TD_43">
                                                            <a href="event.php?id=<?php echo $cnt->{'id'}; ?>">Buy Ticket</a>&nbsp;&nbsp;&nbsp;<a href="calendar.php?id=<?php echo $cnt->{'id'}; ?>">Add To Calendar</a>
                                                        </td>
                                                    </tr>
                                                    <?php
                                                    $i++;
                                                }
                                            }
                                        }
                                        ?>
                                    </tbody>
                                </table>

                            </div>
                            <div class="row-fluid" id="DIV_110">


                            </div>
                        </div>
                    </div><!-- end slideshow -->
                </div><!-- end #header -->

                <div id="footer" style="margin-top: 200px !important;">
                    <div id="footer-text">
                        Copyright &copy; <php echo date('Y') ;  ?> MobiTicketsz.com All rights reserved.
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

        <script src="datat_folder/bootstrap.min.js"></script>

        <!-- jQuery DataTable -->
        <script src="datat_folder/jquery.datatables.min.js"></script>
        <script>
            /* Default class modification */
            $.extend( $.fn.dataTableExt.oStdClasses, {
                "sWrapper": "dataTables_wrapper form-inline"
            } );
			
            /* API method to get paging information */
            $.fn.dataTableExt.oApi.fnPagingInfo = function ( oSettings )
            {
                return {
                    "iStart":         oSettings._iDisplayStart,
                    "iEnd":           oSettings.fnDisplayEnd(),
                    "iLength":        oSettings._iDisplayLength,
                    "iTotal":         oSettings.fnRecordsTotal(),
                    "iFilteredTotal": oSettings.fnRecordsDisplay(),
                    "iPage":          Math.ceil( oSettings._iDisplayStart / oSettings._iDisplayLength ),
                    "iTotalPages":    Math.ceil( oSettings.fnRecordsDisplay() / oSettings._iDisplayLength )
                };
            }
			
            /* Bootstrap style pagination control */
            $.extend( $.fn.dataTableExt.oPagination, {
                "bootstrap": {
                    "fnInit": function( oSettings, nPaging, fnDraw ) {
                        var oLang = oSettings.oLanguage.oPaginate;
                        var fnClickHandler = function ( e ) {
                            e.preventDefault();
                            if ( oSettings.oApi._fnPageChange(oSettings, e.data.action) ) {
                                fnDraw( oSettings );
                            }
                        };
						
                        $(nPaging).addClass('pagination').append(
                        '<ul>'+
                            '<li class="prev disabled"><a href="#">&larr; '+oLang.sPrevious+'</a></li>'+
                            '<li class="next disabled"><a href="#">'+oLang.sNext+' &rarr; </a></li>'+
                            '</ul>'
                    );
                        var els = $('a', nPaging);
                        $(els[0]).bind( 'click.DT', { action: "previous" }, fnClickHandler );
                        $(els[1]).bind( 'click.DT', { action: "next" }, fnClickHandler );
                    },
					
                    "fnUpdate": function ( oSettings, fnDraw ) {
                        var iListLength = 5;
                        var oPaging = oSettings.oInstance.fnPagingInfo();
                        var an = oSettings.aanFeatures.p;
                        var i, j, sClass, iStart, iEnd, iHalf=Math.floor(iListLength/2);
						
                        if ( oPaging.iTotalPages < iListLength) {
                            iStart = 1;
                            iEnd = oPaging.iTotalPages;
                        }
                        else if ( oPaging.iPage <= iHalf ) {
                            iStart = 1;
                            iEnd = iListLength;
                        } else if ( oPaging.iPage >= (oPaging.iTotalPages-iHalf) ) {
                            iStart = oPaging.iTotalPages - iListLength + 1;
                            iEnd = oPaging.iTotalPages;
                        } else {
                            iStart = oPaging.iPage - iHalf + 1;
                            iEnd = iStart + iListLength - 1;
                        }
						
                        for ( i=0, iLen=an.length ; i<iLen ; i++ ) {
                            // Remove the middle elements
                            $('li:gt(0)', an[i]).filter(':not(:last)').remove();
							
                            // Add the new list items and their event handlers
                            for ( j=iStart ; j<=iEnd ; j++ ) {
                                sClass = (j==oPaging.iPage+1) ? 'class="active"' : '';
                                $('<li '+sClass+'><a href="#">'+j+'</a></li>')
                                .insertBefore( $('li:last', an[i])[0] )
                                .bind('click', function (e) {
                                    e.preventDefault();
                                    oSettings._iDisplayStart = (parseInt($('a', this).text(),10)-1) * oPaging.iLength;
                                    fnDraw( oSettings );
                                } );
                            }
							
                            // Add / remove disabled classes from the static elements
                            if ( oPaging.iPage === 0 ) {
                                $('li:first', an[i]).addClass('disabled');
                            } else {
                                $('li:first', an[i]).removeClass('disabled');
                            }
							
                            if ( oPaging.iPage === oPaging.iTotalPages-1 || oPaging.iTotalPages === 0 ) {
                                $('li:last', an[i]).addClass('disabled');
                            } else {
                                $('li:last', an[i]).removeClass('disabled');
                            }
                        }
                    }
                }
            });
			
            /* Show/hide table column */
            function dtShowHideCol( iCol ) {
                var oTable = $('#TABLE_29').dataTable();
                var bVis = oTable.fnSettings().aoColumns[iCol].bVisible;
                oTable.fnSetColumnVis( iCol, bVis ? false : true );
            };
			
            /* Table #example */
            $(document).ready(function() {
                $('.datatable').dataTable( {
                    "sDom": "<'row-fluid'<'span4'l><'span8'f>r>t<'row-fluid'<'span4'i><'span8'p>>",
                    "sPaginationType": "bootstrap",
                    "oLanguage": {
                        "sLengthMenu": "_MENU_ records per page"
                    }
                });
                $('.datatable-controls').on('click','li input',function(){
                    dtShowHideCol( $(this).val() );
                })
            });
            $("#DIV_2,#DIV_3,#DIV_11,#DIV_16,#DIV_98,.dataTables_length").hide();
        </script>


    </body>
</html>
<!-- Localized -->