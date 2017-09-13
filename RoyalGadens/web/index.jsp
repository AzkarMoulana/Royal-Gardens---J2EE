<%-- 
    Document   : index
    Created on : Apr 15, 2017, 2:27:19 PM
    Author     : Ishan Darshana
--%>


<%@page import="processes.GetAllProperties"%>
<%@page import="mvc.Property"%>
<%@include file="header.jsp" %>
<%!
    String buttonStatus;
    List<Property> list = null;
    String keywordCookie;
    int count;
    String isActiveEnabled = "";

%>
<%  count = 0;
    if (session.getAttribute("nic") == null) {
        response.sendRedirect("register.jsp?msg=need-login");
    }


%>
<div class="">


    <div id="slider" class="sl-slider-wrapper">

        <div class="sl-slider">

            <div class="sl-slide" data-orientation="horizontal" data-slice1-rotation="-25" data-slice2-rotation="-25" data-slice1-scale="2" data-slice2-scale="2">
                <div class="sl-slide-inner">
                    <div class="bg-img bg-img-1"></div>
                    <h2><a href="#">2 Bed Rooms and 1 Dinning Room Aparment on Sale</a></h2>
                    <blockquote>              
                        <p class="location"><span class="glyphicon glyphicon-map-marker"></span> 1890 Syndey, Australia</p>
                        <p>Until he extends the circle of his compassion to all living things, man will not himself find peace.</p>
                        <cite>$ 20,000,000</cite>
                    </blockquote>
                </div>
            </div>

            <div class="sl-slide" data-orientation="vertical" data-slice1-rotation="10" data-slice2-rotation="-15" data-slice1-scale="1.5" data-slice2-scale="1.5">
                <div class="sl-slide-inner">
                    <div class="bg-img bg-img-2"></div>
                    <h2><a href="#">2 Bed Rooms and 1 Dinning Room Aparment on Sale</a></h2>
                    <blockquote>              
                        <p class="location"><span class="glyphicon glyphicon-map-marker"></span> 1890 Syndey, Australia</p>
                        <p>Until he extends the circle of his compassion to all living things, man will not himself find peace.</p>
                        <cite>$ 20,000,000</cite>
                    </blockquote>
                </div>
            </div>

            <div class="sl-slide" data-orientation="horizontal" data-slice1-rotation="3" data-slice2-rotation="3" data-slice1-scale="2" data-slice2-scale="1">
                <div class="sl-slide-inner">
                    <div class="bg-img bg-img-3"></div>
                    <h2><a href="#">2 Bed Rooms and 1 Dinning Room Aparment on Sale</a></h2>
                    <blockquote>              
                        <p class="location"><span class="glyphicon glyphicon-map-marker"></span> 1890 Syndey, Australia</p>
                        <p>Until he extends the circle of his compassion to all living things, man will not himself find peace.</p>
                        <cite>$ 20,000,000</cite>
                    </blockquote>
                </div>
            </div>

            <div class="sl-slide" data-orientation="vertical" data-slice1-rotation="-5" data-slice2-rotation="25" data-slice1-scale="2" data-slice2-scale="1">
                <div class="sl-slide-inner">
                    <div class="bg-img bg-img-4"></div>
                    <h2><a href="#">2 Bed Rooms and 1 Dinning Room Aparment on Sale</a></h2>
                    <blockquote>              
                        <p class="location"><span class="glyphicon glyphicon-map-marker"></span> 1890 Syndey, Australia</p>
                        <p>Until he extends the circle of his compassion to all living things, man will not himself find peace.</p>
                        <cite>$ 20,000,000</cite>
                    </blockquote>
                </div>
            </div>

            <div class="sl-slide" data-orientation="horizontal" data-slice1-rotation="-5" data-slice2-rotation="10" data-slice1-scale="2" data-slice2-scale="1">
                <div class="sl-slide-inner">
                    <div class="bg-img bg-img-5"></div>
                    <h2><a href="#">2 Bed Rooms and 1 Dinning Room Aparment on Sale</a></h2>
                    <blockquote>              
                        <p class="location"><span class="glyphicon glyphicon-map-marker"></span> 1890 Syndey, Australia</p>
                        <p>Until he extends the circle of his compassion to all living things, man will not himself find peace.</p>
                        <cite>$ 20,000,000</cite>
                    </blockquote>
                </div>
            </div>
        </div><!-- /sl-slider -->



        <nav id="nav-dots" class="nav-dots">
            <span class="nav-dot-current"></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </nav>

    </div><!-- /slider-wrapper -->
</div>



<div class="banner-search">
    <div class="container"> 
        <!-- banner -->
        <h3>Buy, Sale & Rent</h3>
        <div class="searchbar">
            <div class="row">
                <div class="col-lg-6 col-sm-6">
                    <form action="buy.jsp?searching=yes" method="post">
                        <input type="text" name="keyword" class="form-control" placeholder="Search of Properties">
                        <div class="row">
                            <div class="col-lg-3 col-sm-3 ">
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
                            <div class="col-lg-3 col-sm-4">
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
                            <div class="col-lg-3 col-sm-4">
                                <select class="form-control" name="price">
                                    <option value="price">Price</option>
                                    <option value="RS150,000 - RS200,000">RS150,000 - RS200,000</option>
                                    <option value="RS200,000 - RS250,000">RS200,000 - RS250,000</option>
                                    <option value="RS250,000 - RS300,000">RS250,000 - RS300,000</option>
                                </select>
                            </div>

                            <div class="col-lg-3 col-sm-4">
                                <button class="btn btn-success"  onclick="window.location.href = 'buy.jsp'">Find Now</button>
                            </div>
                        </div>

                    </form>
                </div>
                <div class="col-lg-5 col-lg-offset-1 col-sm-6 ">
                    <p>Join now and get updated with all the properties deals.</p>
                    <%                        if (session.getAttribute("nic") == null) {
                            buttonStatus = "";
                        } else {
                            buttonStatus = "disabled";
                        }
                    %>

                    <button class="btn btn-info"   data-toggle="modal" data-target="#loginpop" <%=buttonStatus%>>Login</button>        
                </div>
            </div>
        </div>
    </div>
</div>
<!-- banner -->
<div class="container">
    <div class="properties-listing spacer"> <a href="buy.jsp" class="pull-right viewall">View All Listing</a>
        <h2>Featured Properties</h2>
        <div id="owl-example" class="owl-carousel">

            <%
                list = GetAllProperties.getHotProperties(12);
                for (Property property : list) {


            %>

            <div class="properties">
                <div class="image-holder"><img title="<%=property.getName()%>" src="images/uploads/<%=property.getImages()%>" class="img-responsive" alt="properties"/>
                    <%
                        if (property.getBuyer() != 0) {

                    %><div class="status sold">Sold</div><%    }

                    %>


                </div>
                <br>
                <h5 style="overflow: hidden; white-space: nowrap;  text-overflow: ellipsis;"><%=property.getName()%></h5>
                <p class="price">Price: RS<%=property.getPrice()%></p>
                <div class="listing-detail"><span data-toggle="tooltip" data-placement="bottom" data-original-title="Bed Room"><%=property.getBedRoom()%></span>
                    <span data-toggle="tooltip" data-placement="bottom" data-original-title="Living Room"><%=property.getLivingRoom()%></span>
                    <span data-toggle="tooltip" data-placement="bottom" data-original-title="Parking"><%=property.getParking()%></span>
                    <span data-toggle="tooltip" data-placement="bottom" data-original-title="Kitchen"><%=property.getKichen()%></span>
                </div>
                <a class="btn btn-primary" href="property-detail.jsp?id=<%=property.getIdplot()%>">View Details</a>
            </div>
            <%}%>
        </div>
    </div>
    <div class="spacer">
        <div class="row">
            <div class="col-lg-6 col-sm-9 recent-view">
                <h3>About Us</h3>
                <p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.<br><a href="about.jsp">Learn More</a></p>

            </div>

            <%
                Cookie[] cookie = request.getCookies();
                if (cookie != null) {

            %>


            <div class="col-lg-5 col-lg-offset-1 col-sm-3 recommended">
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

                            list = GetAllProperties.getRecommendedProperties(keywordCookie);
                            for (Property getRecommended : list) {
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
    </div>
</div>
<%@include file="footer.jsp" %>
