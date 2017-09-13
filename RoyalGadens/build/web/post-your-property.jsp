<%-- 
    Document   : post-your-property
    Created on : Apr 16, 2017, 9:26:43 AM
    Author     : Ishan Darshana
--%>



<%@page import="processes.GetUsers"%>
<%@page import="java.util.List"%>
<%@page import="mvc.UserView"%>
<%@page import="mvc.UserController"%>
<%@page import="mvc.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConfig.DBConfig"%>
<%@include file="header.jsp" %>
<%    List<User> users = null;

    if (session.getAttribute("email") != null) {

        users = GetUsers.getUser(session.getAttribute("email").toString());
        for (User user : users) {

%>
<div class="container">
    <form  method="POST" action="MVCPropertyPattern" enctype="multipart/form-data" name="createProperty" onsubmit="return validatePropertyForm()">
        <div class="row">
            <div class="col-md-12">
                <h3 class="top-margin"><strong>Post Your Property</strong></h3><hr>
                <%                    if (request.getParameter("msg") != null && request.getParameter("msg").equals("success")) {

                %>
                <div class="alert alert-success">
                    <strong>Success!</strong>Property has been saved!
                </div>
                <%                    }
                %>

            </div>
        </div>



        <div class="row ">
            <div class="col-sm-3">
                <p>LOCATION</p>
            </div>
            <div class="col-sm-6">
                <select class="form-control" name="location">
                    <option value="<%=user.getLocation()%>"><%=user.getLocation()%></option>
                    <option value="Colombo">Colombo</option>
                    <option value="Kandy">Kandy</option>
                    <option value="Galle">Galle</option>
                    <option value="Ampara">Ampara</option>
                    <option value="Anuradhapura">Anuradhapura</option>
                    <option value="Badulla">Badulla</option>
                    <option value="Batticaloa">Batticaloa</option>
                    <option value="Gampaha">Gampaha</option>
                    <option value="Hambantota">Hambantota</option>
                    <option value="Jaffna">Jaffna</option>
                    <option value="Kaluthara">Kaluthara</option>
                    <option value="Kegalla">Kegalla</option>
                    <option value="Kilinochchi">Kilinochchi</option>
                    <option value="Kurunegala">Kurunegala</option>
                    <option value="Mannar">Mannar</option>
                    <option value="Mathale">Mathale</option>
                    <option value="Mathara">Mathara</option>
                    <option value="Moneragala">Moneragala</option>
                    <option value="Mullativu">Mullativu</option>
                    <option value="Nuwara Eliya">Nuwara Eliya</option>
                    <option value="Polonnaruwa">Polonnaruwa</option>
                    <option value="Puththalam">Puththalam</option>
                    <option value="Rathnapura">Rathnapura</option>
                    <option value="Trincomalee">Trincomalee</option>
                    <option value="Vavuniya">Vavuniya</option>
                </select>
            </div>
        </div>
        <div class="row ">
            <div class="col-sm-3">
                <p>ADD IMAGE</p>
            </div>
            <div class="col-sm-6">
                <input type="file" id="file" name="file" class="filestyle form-control" data-buttonBefore="true" data-icon="false" data-buttonText="Choose Image">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>BED ROOM (S)</p>
            </div>
            <div class="col-sm-6">
                <input type="number" class="form-control" step="1" value="0" name="beds">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>LIVING ROOM (S)</p>
            </div>
            <div class="col-sm-6">
                <input type="number" class="form-control" step="1" value="0" name="livingrooms">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>KITCHEN(s)</p>
            </div>
            <div class="col-sm-6">
                <input type="number" class="form-control" step="1" value="0" name="kitchen">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>PARKING (OPTIONAL)</p>
            </div>
            <div class="col-sm-6">
                <input type="number" class="form-control" step="1" value="0" name="parkings">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <p>BATHS</p>
            </div>
            <div class="col-sm-6">
                <input type="number" class="form-control" step="1" value="0" name="baths">
            </div>
        </div>
        <div class="row ">
            <div class="col-sm-3">
                <p>LAND SIZE</p>
            </div>
            <div class="col-sm-4">
                <input type="number" class="form-control" step="1" value="0" name="landsize">
            </div>
            <div class="col-sm-2">
                <input type="text" class="form-control" placeholder="perches" readonly>
            </div>
        </div>
        <div class="row ">
            <div class="col-sm-3">
                <p>HOUSE SIZE</p>
            </div>
            <div class="col-sm-4">
                <input type="number" class="form-control" step="1" value="0" name="housesize">
            </div>
            <div class="col-sm-2">
                <input type="text" class="form-control" placeholder="sqft" readonly>
            </div>
        </div>
        <div class="row ">
            <div class="col-sm-3">
                <p>ADDRESS (OPTIONAL)</p>
            </div>
            <div class="col-sm-6">
                <input type="text" name="address" class="form-control">
            </div>
        </div>
        <div class="row ">
            <div class="col-sm-3">
                <p>TITLE</p>
            </div>
            <div class="col-sm-6">
                <input type="title" name="title" class="form-control">
            </div>
        </div>
        <div class="row ">
            <div class="col-sm-3">
                <p>DESCRIPTION</p>
            </div>
            <div class="col-sm-6">
                <textarea class="form-control" name="description" rows="13"></textarea><br>
            </div>
        </div>
        <div class="row ">
            <div class="col-sm-3">
                <p>PRICE (RS)</p>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="price">
            </div>

        </div>
        <div class="row">
            <div class="col-md-12">
                <h3 class="top-margin"><strong>Contact Details</strong></h3><hr>
            </div>
        </div>
        <div class="row ">
            <div class="col-sm-3">
                <p>NAME</p>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="name" value="<%=user.getName()%>" readonly>
            </div>
        </div>
        <div class="row ">
            <div class="col-sm-3">
                <p>PHONE NUMBER</p>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="phone-number" value="<%=user.getContact()%>" readonly>
            </div>
        </div>
        <div class="row ">
            <div class="col-sm-3">
                <p>EMAIL</p>
            </div>
            <div class="col-sm-6">
                <input type="email" class="form-control" name="email" value="<%=user.getEmail()%>" readonly>
            </div>
        </div>
        <div class="row ">
            <div class="col-sm-2">
                <input type="submit" class="btn btn-success" value="Post">

            </div>

        </div>
        <strong><p id="property-error" class="error-font"></p></strong><br>
    </form>

</div>
<%}
    } else {
        response.sendRedirect("register.jsp?msg=need-login");
    }
%>

<%@include file="footer.jsp" %>
