<%@ Page Language="C#" AutoEventWireup="true" Codebehind="Fees.aspx.cs" Inherits="Fees" %>
<!DOCTYPE html>
<html>
    <head runat="server">
        <title>City of Houston Fee Schedule</title>
        <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
        <link href="assets/css/bootstrap.min.css" media="screen" rel="stylesheet" type="text/css" />
        <link href="assets/css/jquery-ui-1.10.2.custom.min.css" media="screen" rel="stylesheet" type="text/css" />
        <link href="assets/css/stream.css" media="screen" rel="stylesheet" type="text/css" />
        <link href="assets/css/custom.css" media="screen" rel="stylesheet" type="text/css" />
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
        <form id="form1" runat="server">
            <div class="container">
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
    </body>
</html>
