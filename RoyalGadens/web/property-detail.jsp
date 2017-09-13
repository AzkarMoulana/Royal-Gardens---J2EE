<%-- 
    Document   : property-detail
    Created on : Apr 15, 2017, 11:16:21 PM
    Author     : Ishan Darshana
--%>

<%@page import="processes.CheckOwnProperties"%>
<%@page import="processes.GetAllProperties"%>
<%@page import="java.util.List"%>
<%@page import="mvc.Property"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>


<%!
    String id;
    boolean isMyOwnProperty;

%>

<%    id = request.getParameter("id");
    if (id == null) {
        response.sendRedirect("buy.jsp");

    }
%>

<div class="container">
    <div class="properties-listing spacer">
        <h4><strong>PROPERTY DETAILS</strong></h4><hr>
        <div class="row">
            <div class="col-lg-3 col-sm-4 hidden-xs">



                <div class="hot-properties hidden-xs">
                    <h4>Hot Properties</h4>
                    <%
                        List<Property> list01 = GetAllProperties.getHotProperties(5);
                        for (Property elem : list01) {
                    %>

                    <div class="row">
                        <div class="col-lg-4 col-sm-5"><img title="<%=elem.getName()%>" src="images/uploads/<%=elem.getImages()%>" class="img-responsive img-circle" alt="properties"/></div>
                        <div class="col-lg-8 col-sm-7">
                            <h5><a href="property-detail.jsp"><%=elem.getName()%></a></h5>
                            RS <%=elem.getPrice()%></div>
                    </div>

                    <%
                        }
                    %>




                </div>



                <div class="advertisement">
                    <h4>Advertisements</h4>
                    <img src="images/advertisements.jpg" class="img-responsive" alt="advertisement">

                </div>

            </div>

            <div class="col-lg-9 col-sm-8">
                <%                    List<Property> list = null;
                    if (id != null) {
                        list = GetAllProperties.getPropertyByID(Integer.parseInt(id));
                        for (Property elem : list) {

                %>
                <h2><%=elem.getName()%></h2>
                <div class="row">
                    <div class="col-lg-8">
                        <div class="property-images">
                            <!-- Slider Starts -->
                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ol class="carousel-indicators hidden-xs">
                                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                    <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                                    <li data-target="#myCarousel" data-slide-to="2" class=""></li>
                                    <li data-target="#myCarousel" data-slide-to="3" class=""></li>
                                </ol>
                                <div class="carousel-inner">
                                    <!-- Item 1 -->
                                    <div class="item active">
                                        <img src="images/uploads/<%=elem.getImages()%>" class="properties" alt="properties" />
                                    </div>
                                    <!-- #Item 1 -->

                                    <!-- Item 2 -->
                                    <div class="item">
                                        <img src="images/properties/2.jpg" class="properties" alt="properties" />

                                    </div>
                                    <!-- #Item 2 -->

                                    <!-- Item 3 -->
                                    <div class="item">
                                        <img src="images/properties/1.jpg" class="properties" alt="properties" />
                                    </div>
                                    <!-- #Item 3 -->

                                    <!-- Item 4 -->
                                    <div class="item ">
                                        <img src="images/properties/3.jpg" class="properties" alt="properties" />

                                    </div>
                                    <!-- # Item 4 -->
                                </div>
                                <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
                                <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                            </div>
                            <!-- #Slider Ends -->

                        </div>




                        <div class="spacer"><h4><span class="glyphicon glyphicon-th-list"></span> Property Detail</h4>
                                    <%=elem.getDescription()%>

                        </div>


                        <div><h4><span class="glyphicon glyphicon-map-marker"></span> Location</h4>
                            <div class="well"><iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Pulchowk,+Patan,+Central+Region,+Nepal&amp;aq=0&amp;oq=pulch&amp;sll=37.0625,-95.677068&amp;sspn=39.371738,86.572266&amp;ie=UTF8&amp;hq=&amp;hnear=Pulchowk,+Patan+Dhoka,+Patan,+Bagmati,+Central+Region,+Nepal&amp;ll=27.678236,85.316853&amp;spn=0.001347,0.002642&amp;t=m&amp;z=14&amp;output=embed"></iframe></div>
                        </div>

                    </div>
                    <div class="col-lg-4">
                        <div class="col-lg-12  col-sm-6">
                            <div class="property-info">

                                <p class="price"><strong>RS <%=elem.getPrice()%></strong></p>
                                <div class="area profile"><span class="glyphicon glyphicon-map-marker"></span> <strong>Location</strong>
                                    <%
                                        if (elem.getAddress() == null) {
                                            out.write("<p>not provided by agent,But you can contact seller to ask it</p>");
                                        } else {
                                            out.write("<p>" + elem.getAddress() + "</p>");
                                        }
                                    %>

                                </div>
                                <div class="profile">
                                    <span class="glyphicon glyphicon-user"></span> <strong>Agent Details</strong>
                                    <p><a href="profile.jsp?id=<%=elem.getSeller()%>"><%=elem.getSellerName()%></a><br><%=elem.getContact()%></p>
                                </div>



                            </div>
                            <div class="profile">
                                <span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;&nbsp;<strong>Availabilty</strong>
                                <div class="listing-detail">
                                    <p><span data-toggle="tooltip" data-placement="bottom" data-original-title="Bed Room">5</span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Living Room">2</span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Parking">2</span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Kitchen">1</span></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 col-sm-6 ">
                            <div class="enquiry">
                                <h6><span class="glyphicon glyphicon-envelope"></span> Post Enquiry</h6>
                                <form role="form">
                                    <input type="text" class="form-control" placeholder="Full Name"/>
                                    <input type="text" class="form-control" placeholder="you@yourdomain.com"/>
                                    <input type="text" class="form-control" placeholder="your number"/>
                                    <textarea rows="6" class="form-control" placeholder="Whats on your mind?"></textarea>
                                    <button type="submit" class="btn btn-primary" name="Submit">Send Message</button>

                                    <div>
                                        <!-- PayPal Logo --><table border="0" cellpadding="10" cellspacing="0" align="center"><tr><td align="center"></td></tr><tr><td align="center"><a href="https://www.paypal.com/webapps/mpp/paypal-popup" title="How PayPal Works" onclick="javascript:window.open('https://www.paypal.com/webapps/mpp/paypal-popup', 'WIPaypal', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1060, height=700'); return false;"><img src="https://www.paypalobjects.com/webstatic/mktg/logo/bdg_now_accepting_pp_2line_w.png" border="0" alt="Now Accepting PayPal"></a><div style="text-align:center"><a href="https://www.paypal.com/webapps/mpp/how-paypal-works"><font size="2" face="Arial" color="#0079CD">How PayPal Works</font></a></div></td></tr></table><!-- PayPal Logo -->

                                    </div>
                                    <%
                                       isMyOwnProperty  = CheckOwnProperties.getPropertyByID(Integer.parseInt(id), session.getAttribute("nic").toString());
                                        if (elem.getBuyer() == 0 && !isMyOwnProperty) {
                                    %><button class="btn btn-success" data-toggle="modal" data-target="#loginpop-2"><strong>RESERVE NOW</strong></button><%
                                    } else {
                                    %><button class="btn btn-success" data-toggle="modal" data-target="#loginpop-2" disabled><strong>RESERVED</strong></button><%
                                        }
                                    %>

                                </form>
                            </div>         
                        </div>
                    </div>
                </div>
                <%  }
                    }%>
            </div>
        </div>
    </div>
</div>

<%@include file="footer.jsp" %>
