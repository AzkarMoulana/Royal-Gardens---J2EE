<%-- 
    Document   : my-properties
    Created on : Apr 20, 2017, 11:43:01 AM
    Author     : Ishan Darshana
--%>

<%@page import="processes.GetAllProperties"%>
<%@page import="java.util.List"%>
<%@page import="mvc.Property"%>
<%@include file="header.jsp" %>

<%!
    List<Property> list01 = null;
    int count;
    String isActiveEnabled = "";
    String keywordCookie;


%>

<%  String nic = null;
    count = 0;
    if (session.getAttribute("nic") != null) {
        nic = session.getAttribute("nic").toString();
    } else {
        response.sendRedirect("profile.jsp");
    }
%>

<div class="container">
    <div class="properties-listing spacer">



        <div class="row">
            <div class="col-md-12">
                <h3><strong>MY PROPERTIES</strong></h3><hr>
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


            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-sm-4 ">
                <form action="my-properties.jsp?searching=yes" method="post">
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


                        <input type="submit" class="btn btn-primary">

                    </div>
                </form>



                <div class="hot-properties hidden-xs">
                    <h4>Hot Properties</h4>
                    <%                       list01 = GetAllProperties.getHotProperties(5);
                        for (Property elem : list01) {
                    %>

                    <div class="row">
                        <div class="col-lg-4 col-sm-5"><img src="images/uploads/<%=elem.getImages()%>" class="img-responsive img-circle" alt="properties"/></div>
                        <div class="col-lg-8 col-sm-7">
                            <h5><a href="property-detail.jsp?id=<%=elem.getIdplot()%>"><%=elem.getName()%></a></h5>
                            RS<%=elem.getPrice()%></div>
                    </div>

                    <%
                        }
                    %>




                </div>

                <%
                    Cookie[] cookie = request.getCookies();
                    if (cookie != null) {

                %>


                <div class="recommended">
                    <h4>Recommended Properties</h4>
                    <div id="myCarousel" class="carousel slide">
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                            <li data-target="#myCarousel" data-slide-to="2" class=""></li>
                            <li data-target="#myCarousel" data-slide-to="3" class=""></li>
                        </ol>
                        <!-- Carousel items -->
                        <div class="carousel-inner">


                            <%     for (Cookie getCookie : cookie) {

                                    if (getCookie.getName().equals("name")) {
                                        keywordCookie = getCookie.getValue();
                                        break;
                                    }
                                }

                                list01 = GetAllProperties.getRecommendedProperties(keywordCookie);
                                for (Property getRecommended : list01) {
                                    if (count == 0) {
                                        isActiveEnabled = "active";
                                    } else {
                                        isActiveEnabled = "";
                                    }
                                    count++; // create only one tag active

                            %>
                            <div class="item <%=isActiveEnabled%>">
                                <div class="row">
                                    <div class="col-lg-4"><img src="images/uploads/<%=getRecommended.getImages()%>" class="img-responsive" alt="properties"/></div>
                                    <div class="col-lg-8">
                                        <h5><a href="property-detail.jsp"><%=getRecommended.getName()%></a></h5>
                                        <p class="price"><%=getRecommended.getPrice()%></p>
                                        <a href="property-detail.jsp?id=<%=getRecommended.getIdplot()%>" class="more">More Detail</a> </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>


                <%                    }
                %>


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
                        ;

                        List<Property> list = null;
                        if (request.getParameter("searching") != null && request.getParameter("searching").equals("yes")) {

                            list = GetAllProperties.getAllReservedPropertiesByFiltering(pageid, total, nic, keyword, city, landSize, price);
                        } else {
                            list = GetAllProperties.getAllReservedProperties(pageid, total, nic);
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
                            <div class="image-holder"><img src="images/uploads/<%=e.getImages()%>" class="img-responsive" alt="properties">
                                <!--<div class="status sold">Sold</div>-->
                            </div>
                            <h4><a href="property-detail.jsp"><%=e.getName()%></a></h4>
                            <p class="price">Price: RS<%=e.getPrice()%></p>
                            <div class="listing-detail"><span data-toggle="tooltip" data-placement="bottom" data-original-title="Bed Room"><%=e.getBedRoom()%></span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Living Room"><%=e.getLivingRoom()%></span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Parking"><%=e.getParking()%></span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Kitchen"><%=e.getKichen()%></span> </div>
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
                            %><li><a href="my-properties.jsp?page=<%=i%>"><%=i%></a></li><%
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