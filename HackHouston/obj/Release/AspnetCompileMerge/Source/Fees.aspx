<%@ Page Language="C#" AutoEventWireup="true" Codebehind="Fees.aspx.cs" Inherits="Fees" %>
<!DOCTYPE html>
<html>
    <head runat="server">        
        <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
        <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
        <meta name="keywords" content="houston, houston tx, houston texas, city of houston tx, city of houston texas, annise parker, mayor of houston"/>
        <meta name="description" content="Official site of the City of Houston, Texas municipal government.  Annise Parker, Mayor of Houston, Texas."/>
        <title>City-Wide Fee Schedule</title>
        <link href="assets/css/bootstrap.min.css" media="screen" rel="stylesheet" type="text/css" />
        <link href="assets/css/jquery-ui-1.10.2.custom.min.css" media="screen" rel="stylesheet" type="text/css" />
        <link href="assets/css/stream.css" media="screen" rel="stylesheet" type="text/css" />
        <link href="assets/css/custom.css" media="screen" rel="stylesheet" type="text/css" />
        <link href="css/main311.css" rel="stylesheet" type="text/css" />        
        <!-- Main CSS Added by Frank -->        
		<!-- Ext Styles -->        
		<link rel="stylesheet" type="text/css" href="http://www.houstontx.gov/ext-3.1.1/resources/css/egov-global.css" />
		<link rel="stylesheet" type="text/css" href="http://www.houstontx.gov/ext-3.1.1/resources/css/egov-menu.css" />
		<link rel="stylesheet" type="text/css" href="http://www.houstontx.gov/ext-3.1.1/examples/ux/treegrid/treegrid.css" />			 
		<!-- GC -->
		<!-- LIBS -->
		<script type="text/javascript" src="http://www.houstontx.gov/ext-3.1.1/adapter/ext/ext-base.js"> </script>
		<script type="text/javascript" src="http://www.houstontx.gov/ext-3.1.1/ext-all-debug.js"></script>			 
		<!-- ENDLIBS -->
		<!-- Ext Source -->
		<script type="text/javascript" src="http://www.houstontx.gov/ext-3.1.1/examples/form/onlineserv.js"></script>
		<script type="text/javascript" src="http://www.houstontx.gov/ext-3.1.1/examples/form/dropdownSearch.js"></script>
		<script type="text/javascript" src="http://www.houstontx.gov/ext-3.1.1/examples/menu/globalNav.js"></script>			 
		<link href="http://www.houstontx.gov/css/main.css" rel="stylesheet" type="text/css" />
		<link href="http://www.houstontx.gov/css/homeContent.css" rel="stylesheet" type="text/css" />        
        <script>
            function checkIt(evt) {
                evt = (evt) ? evt : window.event
                var charCode = (evt.which) ? evt.which : evt.keyCode
                if (charCode != 46) {
                    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                        status = "This field accepts numbers only."
                        return false
                    }
                }
                status = ""
                return true
            }
        </script>
        <style>
            .totalsum { border-top-style: solid; border-top: thick double #000000 }
        </style>
		<!-- End Main CSS -->               
        <script type ="text/javascript">
            var apiUrl = "<%= apiUrl %>";
            var embedUrl = "<%= embedUrl %>";
            var all_deps = ["<%= strResponsibleDepartment %>"];
        </script>          
        <script type="text/javascript" src="Scripts/headjs/1.0.3/head.min.js"></script>
        <script type="text/javascript">
            head.js(
                "Scripts/jquery-1.11.0.min.js"
                , "Scripts/jquery-migrate-1.2.1.min.js"
                , "Scripts/jquery-ui-1.10.4.min.js"
                , "Scripts/jQueryAjaxCache.js"
                , "assets/js/libs/respond.js"
                , "assets/js/libs/jquery/jquery.typewatch.js"
                , "assets/js/libs/jquery/waypoints.min.js"
                , "vendors/mustache.js"
                , "Scripts/config.js"
                , "assets/js/libs/json2.js"
                , "assets/js/libs/jquery/jquery.jstorage.js"
                , "assets/js/Handler.js"
                , "assets/js/libs/md5.js"
                , "assets/js/storage.js"
                , "assets/js/getAll.js"
                , "assets/js/filter.js"
                , "assets/js/embed.js"
                , "assets/js/stream.js"
                , "assets/js/infinitescroll.js"                
            );
        </script>   
    </head>
    <body runat="server" onkeypress="var e = (event ? event : window.event); return (e.keyCode ? e.keyCode : e.charCode ? e.charCode : e.which) != 13;">
        <div id="main">
	        <div id="banner">
		        <div id="search" style="height:43px">
			        <script type="text/javascript" src="http://www.google.com/jsapi"></script> 
			        <script type="text/javascript">
			            google.load('search', '1');
			            google.setOnLoadCallback(function () {
			                google.search.CustomSearchControl.attachAutoCompletion(
                        '001471468827072312997:kdfxyh2wweg',
                        document.getElementById('q'),
                        'cse-search-box');
			            });
			        </script>			
		          <form method="get" action="http://www.publicworks.houstontx.gov/result.php" id="websearchSite">
			        <input type="hidden" name="cx" value="001471468827072312997:kdfxyh2wweg" />
			        <input type="hidden" name="cof" value="FORID:10" />
			        <input type="hidden" name="ie" value="UTF-8" />
			        <div class="floatL">
			          <input name="q" id="q" type="text" class="googleSearch x-form-empty-field" value="Website"  size="31" maxlength="255" />
			        </div>
			        <div class="floatL">
			          <input name="as_q" type="text" id="as_q" />
			        </div>
			        <div class="searchBtn">
			          <input name="image" type="image"  onclick="submit();" src="http://www.houstontx.gov/images/searchBtn.jpg" alt="Submit" />
			        </div>
		          </form>		  
		          <script type="text/javascript" src="http://www.google.com/cse/brand?form=websearchSite&lang=en"></script>
		          <form name="zipcode" method="get" action="http://cbtcws.cityofhouston.gov/zipcodes/zipcode.asp" id="websearchZip">
			        <div class="floatL">
			          <input name="zipcode" type="text" class="floatLeft"  id="zipcode" />
			        </div>
			        <div class="searchBtn">
			          <input name="image2" type="image" class="floatLeft" onclick="submit();" src="http://www.houstontx.gov/images/searchBtn.jpg" alt="Submit" />
			        </div>
		          </form>
		        </div>		
		        <div id="mainMenu">
                    <div id="toolbar"></div>
		        </div>
	        </div>		
		    <div id="share"> 
			    <!-- AddThis Button BEGIN --> 
			    <a class="addthis_button" href="http://www.addthis.com/bookmark.php"> <img src="https://s7.addthis.com/static/btn/sm-plus.gif" style="width:14px;height:14px;border:0px" alt="Share" /></a>
                <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=e129074"></script> 
			    <span>Share </span>
		    </div>
            <div style="position: relative; margin-left: auto; margin-right: auto; top:85px;">
                <form id="form1" runat="server">
                    <div class="container">
                        <div style="padding-bottom: 40px; padding-top: 5px; font-size: 21px;">
				            <div class="head3-1-1">
					            <p style="font-weight:bold; font-size:30px; line-height:1.4; padding-top:10px; color: #006088;">City Fee Schedule</p>
				            </div>
				            <br />
				            <span style="font-size:0.7em"> <b>Important Note:</b>  The fees listed in this schedule may be subject to an administration fee per <a href="http://choice.cityofhouston.net/citysec/ordinances/2010/2010-1063.pdf"> City Ordinance No. 2010-1016.</a> Check with the City Department under which the fee is listed. The department may be contacted using by calling or e-mailing 311.				            
				            <br /><br />
				            For additional license, fee and permit information, please visit <a href="http://www.houston311.org">Houston 3-1-1.</a><br /> 
                                For suggestions on how to improve the City Fee Schedule, please contact <a href="https://docs.google.com/spreadsheet/viewform?formkey=dHVxMmNEUVVsby1ENTUxODVPUlluZEE6MQ#gid=0">Finance Performance Improvement.</a>
				            </span>
				        </div>
				        <div style="clear: both; border-top: 1px solid #C1DBDD; height: 1px; padding-bottom: 6px;"></div>                        
                        <div class="sidebar col-span-3">
                            <div class="row">
                                <h4 class="col-span-6"> Fees (<span id="total_fees"><%= feeCount %></span>)</h4>
                            </div>
                            <div>
                                <input type="text" id="searchbox" placeholder="Search..." />
                                <span class="glyphicon glyphicon-search search-icon"></span>
                                <input type="checkbox" value='wholeword' id="searchwholeword" /> Whole word only
                            </div>
                            <div class="criteria" id="department_criteria">
                                <h4>Responsible Department</h4>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value="All" id="all_departments" /> All
                                    </label>
                                </div>
                            </div>        
                            <div id="embed">
                                <h4><input type="button" value="Embed fees on your website." class="link btn btn-primary" /></h4>
                                <div class="des">
                                    <p>Check the embed boxes on the fees, and copy the code below.</p>
                                    <textarea></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-span-9" id="fee-categories">
                        </div>
                        <div class="fees content col-span-9" id="fees">
                        </div>
                        <script id="template" type="text/html">
                            <div class="col-span-12 fee">
                                <div class="thumbnail">
                                <span class="label label-success rating">{{<%= amountColumn %>}}</span>
                                <div class="caption">
                                    <h4>{{<%= nameColumn %>}}</h4>
                                    <div class="detail">
                                    <dl>
                                        <dt>Description</dt>
                                        <dd>{{<%= descriptionColumn %>}}</dd>
                                        <dt>Responsible Department</dt>
                                        <dd>{{<%= deptColumn %>}}</dd>
                                        <dt>Statutory Authority</dt>
                                        <dd>{{<%= statAuthColumn %>}}</dd>
                                    </dl>
                                    </div>
                                </div>
                                <span style="display:none;">{{<%= tagColumn %>}}</span>
                                <span class="id" style="display:none;">{{<%= idColumn %>}}</span>
                                </div>
                            </div>
                        </script>
                        <script id="department_template" type="text/html">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" value="{{department}}" /> {{department}}
                                </label>
                            </div>
                        </script>
                    </div>
                </form>
                <div class="footer"> 
                    <a href="http://www.houstontx.gov/">Home</a> <a href="https://webintake.houstontx.gov/web_intake/Controller" target="_blank">311 City Helpline</a> <a href="http://www.houstontx.gov/espanol/index.html" target="_blank">En Espanol</a> <a href="http://www.houstontx.gov/contactus/index.html">Contact Us</a> <a href="http://www.houstontx.gov/faq/index.html">FAQs</a> <a href="http://www.houstontx.gov/privacy.html">Privacy Policy</a> <a href="http://www.houstontx.gov/citizensnet/index.html">CitizensNet</a> <br />
			        <br />© 
                    <script type="text/javascript">
			              var d = new Date();
			              document.write(d.getFullYear());
			        </script> 
                    copyright , City of Houston. All Rights Reserved <br />
			        Site best viewed at 1280 x 1024 screen size
		        </div>		
		    </div>		
	    </div>        
    </body>
</html>
