<%@ Page Language="C#" AutoEventWireup="true" Codebehind="FeesById.aspx.cs" Inherits="FeesById" %>
<!DOCTYPE html>
<html>
    <head runat="server">
        <title>City of Houston Fee Schedule</title>
        <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
        <link href="assets/css/bootstrap.min.css" media="screen" rel="stylesheet" type="text/css" />
        <link href="assets/css/stream.css" media="screen" rel="stylesheet" type="text/css" />
        <link href="assets/css/custom.css" media="screen" rel="stylesheet" type="text/css" />
		<link href="http://www.houstontx.gov/css/homeContent.css" rel="stylesheet" type="text/css" />   
        <script type ="text/javascript">
            var apiUrl = "<%= apiUrl %>";
            var embedUrl = "";
            var idArray = "<%= idArray %>";
            var all_deps = [""];
        </script>      
        <script type="text/javascript" src="Scripts/headjs/1.0.3/head.min.js"></script>
        <script type="text/javascript">
            head.js(
                "Scripts/jquery-1.11.0.min.js"
                , "Scripts/jquery-migrate-1.2.1.min.js"
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
                , "assets/js/getIds.js"
                , "assets/js/filterIds.js"
                , "assets/js/embed.js"
                , "assets/js/stream.js"
                , "assets/js/infinitescroll.js"                
            );
        </script>        
    </head>
    <body runat="server">
        <form id="form1" runat="server">
            <div class="container">
                <div class="fees content col-span-6" id="fees">
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
            </div>                 
        </form>        
    </body>
</html>

