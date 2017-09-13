<%-- 
    Document   : header
    Created on : Apr 15, 2017, 2:21:39 PM
    Author     : Ishan Darshana
--%>
<%@page import="processes.GetUsers"%>
<%@page import="mvc.User"%>
<%@page import="java.util.List"%>
<%
    boolean status = false;
    List<User> getImage = null;
    if (session.getAttribute("nic") != null) {
        status = true;

        getImage = GetUsers.getUser(session.getAttribute("email").toString());

    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Royal Gardens | Buy Sell Your Properties</title>
        <style>
            @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

            fieldset, label { margin: 0; padding: 0; }
            body{ margin: 20px; }
            h1 { font-size: 1.5em; margin: 10px; }

            /****** Style Star Rating Widget *****/

            .rating { 
                border: none;
                float: left;
            }

            .rating > input { display: none; } 
            .rating > label:before { 
                margin: 5px;
                font-size: 1.25em;
                font-family: FontAwesome;
                display: inline-block;
                content: "\f005";
            }

            .rating > .half:before { 
                content: "\f089";
                position: absolute;
            }

            .rating > label { 
                color: #ddd; 
                float: right; 
            }

            /***** CSS Magic to Highlight Stars on Hover *****/

            .rating > input:checked ~ label, /* show gold star when clicked */
            .rating:not(:checked) > label:hover, /* hover current star */
            .rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

            .rating > input:checked + label:hover, /* hover current star when changing rating */
            .rating > input:checked ~ label:hover,
            .rating > label:hover ~ input:checked ~ label, /* lighten current selection */
            .rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 

        </style>
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
        <div class="navbar-wrapper">
            <div class="navbar-inverse" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <!--<a class="navbar-brand" href="index.jsp" style="color: white;">ROYAL<strong> GARDENS</strong></a>-->
                        <a class="" href="index.jsp"><img src="images/logo.png" width="300"></a>
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <!-- Nav Starts -->
                    <div class="navbar-collapse  collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="index.jsp">Home</a></li>
                            <li><a href="post-your-property.jsp">Post Your Property</a></li>                 
                            <li><a href="buy.jsp">Buy</a></li>
                            <li><a href="about.jsp">About</a></li>
                            <li><a href="contact.jsp">Contact</a></li>

                            <%                               if (status) {

                                    for (User users : getImage) {


                            %><li><a href="DestroySession">Logout</a></li>
                            <li><a href="profile.jsp"><img src="images/uploads/users/<%=users.getImage()%>" class="img img-circle" width="50" style="border: 4px solid "></a></li><%
                                }
                            } else {
                                    %><li data-toggle="modal" data-target="#loginpop"><a href="">Login</a></li><%
                                        }
                                %> 
                        </ul>
                    </div>
                    <!-- #Nav Ends -->

                </div>
            </div>
        </div>
        <!-- #Header Starts -->

