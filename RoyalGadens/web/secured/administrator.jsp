<%-- 
    Document   : administrator
    Created on : Apr 22, 2017, 4:37:28 PM
    Author     : Ishan Darshana
--%>

<%@page import="mvc.Issues"%>
<%@page import="mvc.ReservedFee"%>
<%@page import="mvc.PublishedFee"%>
<%@page import="processes.GetUsers"%>
<%@page import="java.util.List"%>
<%@page import="mvc.User"%>
<%@page import="processes.AdministratorData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    List<User> getAllUsers = null;
    List<PublishedFee> publishedFee = null;
    List<ReservedFee> reservedFee = null;
    List<Issues> issues = null;

%>
<html>
    <head>
        <script>
            function myFunction() {
                var input, filter, table, tr, td, i;
                input = document.getElementById("myInput");
                filter = input.value.toUpperCase();
                table = document.getElementById("myTable");
                tr = table.getElementsByTagName("tr");
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[1];
                    if (td) {
                        if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
        </script>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <meta charset="UTF-8" >
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="imagetoolbar" content="no" />

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
        <script src="assets/script.js"></script>
        <link rel="stylesheet" href="assets/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="assets/owl-carousel/owl.theme.css">
        <script src="assets/owl-carousel/owl.carousel.js"></script>
        <link rel="stylesheet" type="text/css" href="assets/slitslider/css/style.css" >
        <link rel="stylesheet" type="text/css" href="assets/slitslider/css/custom.css" >
        <script type="text/javascript" src="assets/slitslider/js/modernizr.custom.79639.js"></script>
        <script type="text/javascript" src="assets/slitslider/js/jquery.ba-cond.min.js"></script>
        <script type="text/javascript" src="assets/slitslider/js/jquery.slitslider.js"></script>
        <link rel="stylesheet" href="assets/style.css"/>

    </head>
    <body>

        <div class="container">
            <div class="row top-margin">
                <h3 class="text-uppercase"><strong>Control Panel</strong></h3><hr>
                <div class="col-md-4">

                    <div class="panel panel-primary">
                        <div class="panel-heading"><h3><strong>TOTAL USERS</strong></h3></div>
                        <div class="panel-body"><h2><strong><%=AdministratorData.getUserCount()%></strong></h2></div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-success ">
                        <div class="panel-heading"><h3><strong>SELLERS</strong></h3></div>
                        <div class="panel-body"><h2><strong><%=AdministratorData.getSellerCount()%></strong></h2></div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-success ">
                        <div class="panel-heading"><h3><strong>BUYERS</strong></h3></div>
                        <div class="panel-body"><h2><strong><%=AdministratorData.getBuyerCount()%></strong></h2></div>
                    </div>
                </div>
            </div>
            <div class="row top-margin">
                <h3 class="text-uppercase"><strong>User Information</strong></h3>
                <div class="col-md-8">
                    <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name" class="form-control">
                    <table class="table" id="myTable">
                        <tr>
                            <th></th><th>Name</th><th>IP Address</th><th>Last Visited</th><th>Status</th>
                        </tr>
                        <%
                            getAllUsers = GetUsers.getAllUsers();
                            for (User users : getAllUsers) {


                        %>

                        <tr>
                            <td width="10%"><img src="../images/uploads/users/<%=users.getImage()%>" class="img-circle" width="70"></td><td><%=users.getUsername()%></td><td><%=users.getIp()%></td><td><%=users.getLastVisited()%></td><td><a href=""><%=users.getStatus()%></a></td>
                        </tr>
                        <%}%>

                    </table>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-info ">
                        <div class="panel-heading"><h3><strong>Total Income (Rs)</strong></h3></div>
                        <div class="panel-body"><h2><strong><%=AdministratorData.getTotalPublishedFee()%></strong></h2></div>
                    </div>
                </div>
            </div>
            <div class="row top-margin">
                <div class="col-md-6">
                    <h3><strong>Transactions (Selling)</strong></h3>
                    <table class="table table-responsive table-config">
                        <tr>
                            <th>Date</th><th>Seller-id</th>
                        </tr>
                        <%
                            publishedFee = AdministratorData.getSellerTransactions();
                            for (PublishedFee elem : publishedFee) {
                        %>

                        <tr>
                            <td><%=elem.getDate()%></td><td><%=elem.getSeller()%></td>
                        </tr>

                        <% }%>
                    </table>

                </div>
                <div class="col-md-6">
                    <h3><strong>Transactions (Buying)</strong></h3>
                    <table class="table table-responsive table-config">
                        <tr>
                            <th>Amount</th><th>Date</th><th>Buyer-id</th>
                        </tr>
                        <%
                            reservedFee = AdministratorData.getBuyerTransactions();
                            for (ReservedFee elem : reservedFee) {
                        %>
                        <tr>
                            <td><%=elem.getFee()%></td><td><%=elem.getDate()%></td><td><%=elem.getBuyer()%></td>
                        </tr>
                        <% }%>
                    </table>
                </div>
            </div>
            <div class="row top-margin">
                <div class="col-md-12">
                    <h3><strong>System Issues</strong></h3><hr>

                    <%
                        issues = AdministratorData.getIssues();
                        for (Issues elem : issues) {
                    %>

                    <div class="row">
                        <div class="col-md-1">
                            <img src="../images/uploads/users/<%=elem.getImage()%>" class="img-circle" width="70">
                        </div>
                        <div class="col-md-6">
                            <h5><%= elem.getFaultName()%></h5>
                        </div>
                        <div class="col-md-2">
                            <span><%= elem.getDate()%></span>
                        </div>
                        <div class="col-md-2">
                            <span><a href=""><%=elem.getUrl()%></a></span>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
            <div class="row text-center top-margin">
                <hr>
                <div class="col-md-12">
                    <img src="../images/logo-large.png" width="300">
                </div>
            </div>
        </div>
    </body>
</html>
