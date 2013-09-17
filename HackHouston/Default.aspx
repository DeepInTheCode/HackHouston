<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html>

<html>
  <head runat="server">
    <title>City of Houston Fee Schedule</title>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
    <link href="assets/css/bootstrap.min.css" media="screen" rel="stylesheet" type="text/css" />
    <%--<link href="assets/css/jquery-ui-1.10.2.custom.min.css" media="screen" rel="stylesheet" type="text/css" />--%>
    <link href="assets/css/stream.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="assets/css/custom.css" media="screen" rel="stylesheet" type="text/css" />
    <script src="assets/js/libs/respond.js" type="text/javascript"></script>
  </head>
  <body runat="server">
    <form id="form1" runat="server">
        <div class="container">
          <h1 class="title">City of Houston Fee Schedule</h1>
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
          <%--<script src="assets/js/libs/jquery/jquery.min.js" type="text/javascript"></script>--%>
          <script src="Scripts/jquery-2.0.3.min.js"></script>  
          <%--<script src="assets/js/libs/jquery/jquery-ui-1.10.2.custom.min.js" type="text/javascript"></script>--%>
          <%--<script src="Scripts/jquery-ui-1.10.3.min.js"></script>--%>
          <script src="assets/js/libs/jquery/jquery.typewatch.js" type="text/javascript"></script>
          <script src="assets/js/libs/jquery/waypoints.min.js" type="text/javascript"></script>
          <script src="vendors/mustache.js" type="text/javascript"></script>
          <script type ="text/javascript">
              var apiUrl = '<%= apiUrl %>';
              var embedUrl = '<%= embedUrl %>';
          </script>
          <script src="Scripts/config.js" type="text/javascript"></script>
          <script src="assets/js/libs/json2.js" type="text/javascript"></script>
          <script src="assets/js/libs/jquery/jquery.jstorage.js" type="text/javascript"></script>
          <script src="assets/js/Handler.js" type="text/javascript"></script>
          <script src="assets/js/libs/md5.js" type="text/javascript"></script>
          <script src="assets/js/storage.js" type="text/javascript"></script>
          <script src="assets/js/filter.js" type="text/javascript"></script>
          <script src="assets/js/embed.js" type="text/javascript"></script>
          <script type="text/javascript">
              var all_deps = ['<%= strResponsibleDepartment %>'];
          </script>  
          <script src="assets/js/stream.js" type="text/javascript"></script>
          <script src="assets/js/infinitescroll.js" type="text/javascript"></script>
      </form>
    </body>
  </html>
