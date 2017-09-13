<%-- 
    Document   : Register
    Created on : Apr 15, 2017, 2:57:42 PM
    Author     : Ishan Darshana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<%    if (session.getAttribute("nic") != null) {
        response.sendRedirect("index.jsp");
    }
%>

<div class="container">
    <div class="spacer">

        <div class="row register">
            <div class="col-md-6">
                <h3><strong>REGISTER</strong></h3><hr>

                <%
                    if (request.getParameter("userexist") != null && request.getParameter("userexist").equals("true")) {
                %>
                <div class="alert alert-danger">
                    <strong>Hi!</strong>I think you already registered!
                </div>
                <%} else { %>
                <strong><p id="register-error" class="error-font"></p></strong>
                <%}%>
                <form method="POST" action="MVCUserPattern" name="createUsers" onsubmit="return validateRegisterForm()">

                    <div class="row">
                        <div class="col-md-12">
                            <input type="text" class="form-control" placeholder="NIC" name="nic">
                        </div>
                        <div class="col-md-12">
                            <input type="text" class="form-control" placeholder="Full Name" name="name">
                        </div>
                        <div class="col-md-12">
                            <input type="email" class="form-control" placeholder="Enter Email" name="email">
                        </div>
                        <div class="col-md-12">
                            <input type="text" class="form-control" placeholder="Contact" name="contact">
                        </div>
                        <div class="col-md-12">
                            <select class="form-control" name="location">
                                <option value="City">City</option>
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
                        <div class="col-md-12">
                            <input type="text" class="form-control" placeholder="Username" name="username">
                        </div>
                        <div class="col-md-12">
                            <input type="password" class="form-control" placeholder="Password" name="password">
                        </div>
                        <div class="col-md-12">
                            <input type="password" class="form-control" placeholder="Confirm Password" name="conformpassword">
                        </div>
                        <div class="col-md-3 ">
                            <button type="submit" class="btn btn-success">Register</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-6 login">
                <h3><strong>LOGIN</strong></h3><hr>
                <div class="row">
                    <form method="POST" action="userLogin">

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="sr-only" for="exampleInputEmail2">Email address</label>
                                <input type="email" class="form-control" id="exampleInputEmail2" placeholder="Enter email" name="email">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="sr-only" for="exampleInputPassword2">Password</label>
                                <input type="password" class="form-control" id="exampleInputPassword2" placeholder="Password" name="password">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="alert alert-danger">
                                <strong>Invalid Login!</strong> 
                                <%      if (request.getParameter("msg") != null) {

                                        if (request.getParameter("msg").equals("invalid")) {
                                            out.write("Invalid Login");
                                        } else if (request.getParameter("msg").equals("need-login")) {
                                            out.write("Please Login to get access");
                                        } else if (request.getParameter("msg").equals("cap")) {
                                            out.write("to access profile features you have to create your account first");
                                        }
                                    }

                                %>
                            </div>

                        </div>

                        <div class="col-md-12">

                            <div class="checkbox">
                                <label><input type="checkbox" name="remember-me" title="Remember Me"></label>
                            </div>

                        </div>

                        <div class="col-md-3 ">
                            <br>
                            <button type="submit" class="btn btn-success">Sign in</button>

                        </div>
                        <div class="col-md-12 ">

                            <img src="images/logo-large.png" width="500">

                        </div>


                    </form>          
                </div>
            </div>

        </div>
    </div>
</div>

<%@include file="footer.jsp" %>
