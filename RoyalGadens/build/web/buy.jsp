<%-- 
    Document   : buysalerent
    Created on : Apr 15, 2017, 3:37:30 PM
    Author     : Ishan Darshana
--%>

<%@page import="processes.ReserveProperty"%>
<%@page import="processes.GetAllProperties"%>
<%@page import="java.util.List"%>
<%@page import="mvc.Property"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<%!
    String propertyID = null;

%>


<%    String nic = null;
    if (session.getAttribute("nic") != null) {
        nic = session.getAttribute("nic").toString();
    }
%>

<div class="container">
    <div class="properties-listing spacer">



        <div class="row">
            <div class="col-md-12">
                <h3><strong>PROPERTIES</strong></h3><hr>
                <%
                    //showing filtering message top of the page
                    String title = "";
                    String keyword = request.getParameter("keyword");
                    String city = request.getParameter("city");
                    String landSize = request.getParameter("land-size");
                    String price = request.getParameter("price");
                    if (request.getParameter("searching") != null && (!city.equals("city")
                            || !landSize.equals("land-size") || !price.equals("price") || !keyword.equals(""))) {

                        if (!city.equals("city")) {
                            title = title + "City : " + city + " ";

                        }
                        if (!landSize.equals("land-size")) {
                            title = title + " Land-size : " + landSize + " perches ";

                        }
                        if (!price.equals("price")) {
                            title = title + " price : " + price + " ";
                        }
                        if (!keyword.equals("")) {

                            //create cookies to show the recomended properties
                            Cookie c1 = new Cookie("name", keyword);
                            c1.setMaxAge(3600 * 24 * 3); //stay 3 days
                            response.addCookie(c1);

                            title = title + " Property name : " + keyword + " ";
                        }


                %>

                <div class="alert alert-info">
                    <strong>Result filtering by </strong><%=title%> 
                </div>


                <%                    }
                %>


                <%
                    propertyID = request.getParameter("r");
                    if (propertyID != null) {

                        if (nic == null) {
                %>
                <div class="alert alert-info">
                    <strong>Need Access!</strong> You need to login first! <a href="profile.jsp">Profile</a>
                </div>
                <%
                } else {
                    ReserveProperty.reserveProperty(Integer.parseInt(propertyID), nic);


                %>
                <div class="alert alert-success">
                    <strong>Success!</strong> Property reserved successfully! To view it go to your <a href="profile.jsp">Profile</a>
                </div>
                <%                        }

                    }

                %>


            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-sm-4 ">

                <form action="buy.jsp?searching=yes" method="post">
                    <div class="search-form"><h4><span class="glyphicon glyphicon-search"></span> Search for</h4>
                        <input type="text" name="keyword" class="form-control" placeholder="Search of Properties">
                        <div class="row">
                            <div class="col-lg-5">
                                <select class="form-control" name="city">
                                    <option value="city">City</option>
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
                            <div class="col-lg-7">
                                <select class="form-control" name="land-size">
                                    <option value="land-size">Land Size</option>
                                    <option value="10">10 perches</option>
                                    <option value="15">15 perches</option>
                                    <option value="20">20 perches</option>
                                    <option value="30">30 perches</option>
                                    <option value="30">40 perches</option>
                                    <option value="45">45 perches</option>
                                    <option value="50">50 perches</option>
                                </select>
                            </div>


                            <div class="col-lg-12">
                                <select class="form-control" name="price">
                                    <option value="price">Price</option>
                                    <option value="RS150,000 - RS200,000">RS150,000 - RS200,000</option>
                                    <option value="RS200,000 - RS250,000">RS200,000 - RS250,000</option>
                                    <option value="RS250,000 - RS300,000">RS250,000 - RS300,000</option>
                                </select>
                            </div>
                        </div>


                        <button class="btn btn-primary">Find Now</button>

                    </div>
                </form>



                <div class="hot-properties hidden-xs">
                    <h4>Hot Properties</h4>
                    <%                        List<Property> list01 = GetAllProperties.getHotProperties(5);
                        for (Property elem : list01) {
                    %>

                    <div class="row">
                        <div class="col-lg-4 col-sm-5"><img title="<%=elem.getName()%>" src="images/uploads/<%=elem.getImages()%>" class="img-responsive img-circle" alt="properties"/></div>
                        <div class="col-lg-8 col-sm-7">
                            <h5 class="text-capitalize"><a href="property-detail.jsp?id=<%=elem.getIdplot()%>"><%=elem.getName()%></a></h5>
                            RS <%=elem.getPrice()%></div>
                    </div>

                    <%
                        }
                    %>




                </div>


            </div>

            <div class="col-lg-9 col-sm-8">
                <div class="sortby clearfix">
                    <%  String spageid = "";

                        if (request.getParameter("page") == null) {
                            spageid = "1";
                        } else {

                            spageid = request.getParameter("page");

                        }
                        int pageid = Integer.parseInt(spageid);
                        int total = 12;
                        if (pageid == 1) {
                        } else {
                            pageid = pageid - 1;
                            pageid = pageid * total + 1;
                        }

                        List<Property> list = null;
                        if (request.getParameter("searching") != null && request.getParameter("searching").equals("yes")) {

                            list = GetAllProperties.getAllReservedPropertiesByFiltering(pageid, total, "nic-not-need", keyword, city, landSize, price);

                        } else {
                            list = GetAllProperties.getRecords(pageid, total);
                        }


                    %>
                    <div class="pull-left result">Showing: Page <%=spageid%>  <%
                        if (list.isEmpty()) {
                            out.write("<strong>No Data</strong>");
                        }
                        %></div>
                    <div class="pull-right">
                        <select class="form-control">
                            <option>Sort by</option>
                            <option>Price: Low to High</option>
                            <option>Price: High to Low</option>
                        </select></div>

                </div>
                <div class="row">


                    <%
                        for (Property e : list) {


                    %>  
                    <!-- properties -->
                    <div class="col-lg-4 col-sm-6">
                        <div class="properties">
                            <div class="image-holder"><img src="images/uploads/<%=e.getImages()%>" class="img-responsive" alt="properties" title="<%=e.getName()%>">
                                <%
                                    if (e.getBuyer() != 0) {

                                %><div class="status sold">Sold</div><%    }

                                %>
                            </div><br>
                            <h5 style="overflow: hidden; white-space: nowrap;  text-overflow: ellipsis;"><%=e.getName()%></h5>
                            <p class="price">Price: RS<%=e.getPrice()%></p>
                            <div class="listing-detail"><span data-toggle="tooltip" data-placement="bottom" data-original-title="Bed Room"><%=e.getBedRoom()%></span>
                                <span data-toggle="tooltip" data-placement="bottom" data-original-title="Living Room"><%=e.getLivingRoom()%></span>
                                <span data-toggle="tooltip" data-placement="bottom" data-original-title="Parking"><%=e.getParking()%></span>
                                <span data-toggle="tooltip" data-placement="bottom" data-original-title="Kitchen"><%=e.getKichen()%></span>
                            </div>
                            <a class="btn btn-primary" href="property-detail.jsp?id=<%=e.getIdplot()%>">View Details</a>
                        </div>
                    </div>
                    <!-- properties -->
                    <%}%>



                </div>
                <div class="center">
                    <ul class="pagination">
                        <li><a href="#">«</a></li>
                            <%
                                int count = (list.size() / 12) + 1;
                                for (int i = 1; i <= count; i++) {
                            %><li><a href="buy.jsp?page=<%=i%>"><%=i%></a></li><%
                                }
                            %>
                        <li><a href="#">»</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="footer.jsp" %>
