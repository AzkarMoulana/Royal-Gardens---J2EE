<%-- 
    Document   : profile
    Created on : Apr 16, 2017, 10:51:13 AM
    Author     : Ishan Darshana
--%>
<%@page import="processes.GetSellerReviews"%>
<%@page import="mvc.Reviews"%>
<%@page import="processes.GetUserID"%>
<%@page import="processes.GetAllProperties"%>
<%@page import="mvc.Property"%>
<%@page import="processes.GetUsers"%>
<%@page import="java.util.List"%>
<%@page import="mvc.UserController"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConfig.DBConfig"%>
<%@page import="mvc.UserView"%>
<%@page import="mvc.User"%>
<%@include file="header.jsp" %>
<%!
    String id;//seller id 
    String nic;
    String messageBar, messageType; // messagetype = danger/info/success etc
    List<User> users = null;
    List<Property> properties = null;
    List<Property> getReservedProperties = null;
    List<Reviews> getSellerReviews = null;
    Boolean isMe;
%>

<%      nic = session.getAttribute("nic").toString();
    isMe = false;

    if (session.getAttribute("email") != null || session.getAttribute("nic") != null) {

        users = GetUsers.getUser(session.getAttribute("email").toString());
        getReservedProperties = GetAllProperties.getReservedProperties(session.getAttribute("nic").toString());
        System.out.println(getReservedProperties.isEmpty());

        for (User user : users) {
%>

<div class="container">

    <%
        if (request.getParameter("id") != null) {
            id = request.getParameter("id");
        } else {
            id = null;
        }

        String userid = GetUserID.getUserID(nic);

        if (userid != null) {
            if (userid.equals(id)) {
                isMe = true; //to check it is me or someone else
            }
        }
        if (id == null || isMe) {
    %>

    <div class="row" >

        <div class="col-sm-6">
            <h4 class="top-margin text-uppercase"><strong>public profile settings</strong></h4><hr>
            <strong><p id="profile-error" class="error-font"></p></strong>
            <form method="POST" action="UpdateUser" enctype="multipart/form-data" name="updateProfile" onsubmit="return validateProfileForm()">
                <%                     if (request.getParameter("msg") != null && request.getParameter("msg").equals("success")) {
                %>
                <div class="alert alert-success">
                    <strong>Success!</strong><%=" Public profile settings updated successfully!"%>
                </div><% }%>
                <div class="row">
                    <div class="col-sm-3">

                        <p>PROFILE PHOTO</p>
                    </div>
                    <div class="col-sm-6">
                        <input type="file" id="file" name="file" class="filestyle form-control" data-buttonBefore="true" data-icon="false" data-buttonText="Choose Image">
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <p>FULL NAME</p>
                    </div>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="fullname" value="<%=user.getName()%>">
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <p>CONTACT</p>
                    </div>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="contact" value="<%=user.getContact()%>">
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <p>LOCATION</p>
                    </div>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="location" value="<%=user.getLocation()%>">
                    </div>
                </div>





                <h4 class="text-uppercase top-margin"><strong>security settings</strong></h4><hr>
                <%                     if (request.getParameter("pw") != null && request.getParameter("pw").equals("yes")) {
                %>
                <div class="alert alert-success">
                    <strong>Success!</strong><%=" Security settings updated successfully!"%>
                </div><% }%>
                <div class="row">
                    <div class="col-sm-3">
                        <p>Current Password</p>
                    </div>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" name="password">
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-3">
                        <p>New Password</p>
                    </div>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" name="newpassword">
                    </div>
                </div>

                <button class="btn">SAVE CHANGES</button>
            </form>
            <h3 class="text-uppercase top-margin"><strong>ACCOUNT DEACTIVATION</strong></h3><hr>
            <p class="text-uppercase">What happens when you deactivate your account?</p>
            <div class="row">
                <div class="col-sm-12">
                    <ul>
                        <li>All uploaded beats will be deleted.</li>
                        <li>You won't be able to re-activate your Account.</li>
                        <li>Your profile and beats won't be shown on Obeats anymore.</li>
                    </ul>

                </div>
            </div><br>
            <div class="row">
                <div class="col-sm-5">

                    <button type="submit" class="btn btn-success btn-sm" data-toggle="modal" data-target="#loginpop-3">DEACTIVATE ACCOUNT</button>
                </div>



            </div>

        </div>
        <div class="col-sm-6">
            <h4 class="top-margin text-uppercase" ><strong>My Properties </strong><a href="my-properties.jsp" class="color-alto">View ALL</a></h4><hr>

            <%
                if (getReservedProperties.isEmpty()) {
            %>
            <div class="alert alert-info">
                <strong>No Data!</strong>You have not any own properties.<a href="buy.jsp">Buy Now!</a> 
            </div>
            <%} else {
            %>  <div class="row"><%
                int count = 0;
                for (Property property : getReservedProperties) {
                    if (count == 4) {
                        break;
                    }
                %>

                <div class="col-md-6 center">
                    <br>
                    <div class="properties">
                        <div class="image-holder"><img title="<%=property.getName()%>" src="images/uploads/<%=property.getImages()%>" class="img-responsive" alt="properties">
                        </div><br>
                        <h5 style="overflow: hidden; white-space: nowrap;  text-overflow: ellipsis;"><a href="property-detail.jsp"><%=property.getName()%></a></h5>
                        <p class="price">Price: RS<%=property.getPrice()%></p>
                        <div class="listing-detail"><span data-toggle="tooltip" data-placement="bottom" data-original-title="Bed Room">
                                <%=property.getBedRoom()%></span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Living Room">
                                <%=property.getLivingRoom()%></span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Parking">
                                <%=property.getParking()%></span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Kitchen">
                                <%=property.getKichen()%></span> </div>
                        <a class="btn btn-primary" href="property-detail.jsp?id=<%=property.getIdplot()%>">View Details</a>
                    </div>
                </div> 

                <%
                        count++;
                    }
                %></div><%}
                %>
        </div>
    </div>

    <%
        }
    %>

    <div class="row">
        <div class="col-md-12">



            <%
                if (request.getParameter("review-status") != null) {

                    if (request.getParameter("review-status").equals("published")) {
                        messageBar = "Review has been published! thank you for your time";
                        messageType = "success";
                    } else if (request.getParameter("review-status").equals("not-published")) {
                        messageBar = "Review has not been published! You already rated!";
                        messageType = "warning";
                    }
            %>
            <br>
            <div class="alert alert-<%=messageType%>">
                <%=messageBar%>
            </div>
            <%}%>

            <div class="properties-listing spacer"> <a href="buy.jsp" class="pull-right viewall">View All Listing</a>
                <h4 class="text-uppercase"><strong>Uploaded Properties</strong></h4>

                <div id="owl-example" class="owl-carousel">
                    <%                        if (id == null || isMe) { //check if new user or existing user
                            properties = GetAllProperties.getProperties(user.getNic());
                        } else {
                            properties = GetAllProperties.getProperties(id);
                        }
                        for (Property property : properties) {
                    %>
                    <div class="properties">
                        <div class="image-holder"><img title="<%=property.getName()%>" src="images/uploads/<%=property.getImages()%>" class="img-responsive" alt="properties" />
                        </div><br>
                        <h5  style="overflow: hidden; white-space: nowrap;  text-overflow: ellipsis;"><%=property.getName()%></h5>
                        <p class="price">Price: RS<%=property.getPrice()%></p>
                        <div class="listing-detail"><span data-toggle="tooltip" data-placement="bottom" data-original-title="Bed Room"><%=property.getBedRoom()%></span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Living Room"><%=property.getLivingRoom()%></span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Parking"><%=property.getParking()%></span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Kitchen"><%=property.getKichen()%></span> </div>
                        <a class="btn btn-primary" href="property-detail.jsp?id=<%=property.getIdplot()%>">View Details</a>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>


    <%
        if (id != null && !isMe) {

    %>
    <form action="PublishReview" method="get">
        <h4 class="top-margin text-uppercase"><strong>tell your story!</strong></h4>
        <p>How would you rate your overall experience with this buyer?</p><hr>
        <div class="row ">
            <div class="col-sm-6">
                <fieldset class="rating">
                    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
                    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
                    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
                    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
                    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
                </fieldset>
            </div>
        </div>            
        <div class="row ">
            <div class="col-sm-6">
                <textarea class="form-control" name="story" rows="4" cols="50" placeholder="Help the community by sharing order experience"></textarea>
                <input type="text" name="buyer" hidden value="<%=nic%>">
                <input type="text" name="seller" hidden value="<%=id%>">
            </div>
        </div>
        <div class="row ">
            <div class="col-sm-2">
                <br>
                <input type="submit" value="Publish Review" class="btn btn-success">
            </div>
        </div>
    </form>


    <%        }

    %>



    <div class="row">
        <div class="col-md-12">
            <h4 class="top-margin"><strong>REVIEWS</strong></h4>

            <%      if (id == null || isMe) {
                    id = new GetUserID().getUserID(nic);
                    getSellerReviews = GetSellerReviews.getSellerReviews(id);
                } else {
                    getSellerReviews = GetSellerReviews.getSellerReviews(id);
                }

                if (getSellerReviews.isEmpty()) {
            %>
            <div class="alert alert-info">
                There is no any reviews.! 
            </div>
            <%} else {%>
            <table class="table table-responsive table-config">
                <%for (Reviews getReview : getSellerReviews) {%>
                <tr>
                    <td class="center" width="20%"><img src="images/uploads/users/<%=getReview.getImage()%>" class="img img-circle" width="100"><br><%=getReview.getUsername()%></td><td>
                        <%
                            if (getReview.getStars() == 1) {
                                out.write("<img src='images/stars/1.png'>");
                            } else if (getReview.getStars() == 2) {
                                out.write("<img src='images/stars/2.png'>");

                            } else if (getReview.getStars() == 3) {
                                out.write("<img src='images/stars/3.png'>");

                            } else if (getReview.getStars() == 4) {
                                out.write("<img src='images/stars/4.png'>");

                            } else if (getReview.getStars() == 5) {
                                out.write("<img src='images/stars/5.png'>");
                            }

                        %>
                        <span class="color-alto"><%=getReview.getDate()%></span><br><%=getReview.getReview()%></td>
                </tr>
                <%}%>
            </table>
            <%}%>








        </div>
    </div>
</div>
<%                    }
    } else {

        response.sendRedirect("register.jsp?msg=cap");

    }

%>

<%@include file="footer.jsp" %>



