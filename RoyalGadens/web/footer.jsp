<%-- 
    Document   : footer
    Created on : Apr 15, 2017, 2:25:30 PM
    Author     : Ishan Darshana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="footer">

    <div class="container">



        <div class="row">
            <div class="col-lg-3 col-sm-3">
                <h4>Information</h4>
                <ul class="row">
                    <li class="col-lg-12 col-sm-12 col-xs-3"><a href="about.jsp">About</a></li>
                    <li class="col-lg-12 col-sm-12 col-xs-3"><a href="agents.php">Agents</a></li>         
                    <li class="col-lg-12 col-sm-12 col-xs-3"><a href="blog.php">Blog</a></li>
                    <li class="col-lg-12 col-sm-12 col-xs-3"><a href="contact.php">Contact</a></li>
                </ul>
            </div>

            <div class="col-lg-3 col-sm-3">
                <h4>Newsletter</h4>
                <p>Get notified about the latest properties in our marketplace.</p>
                <form class="form-inline">
                    <input type="text" placeholder="Enter Your email address" class="form-control" style="width: 100%;">
                    <button class="btn btn-success" type="button">Notify Me!</button></form>
            </div>

            <div class="col-lg-3 col-sm-3">
                <h4>Follow us</h4>
                <a href="#"><img src="images/facebook.png" alt="facebook"></a>
                <a href="#"><img src="images/twitter.png" alt="twitter"></a>
                <a href="#"><img src="images/linkedin.png" alt="linkedin"></a>
                <a href="#"><img src="images/instagram.png" alt="instagram"></a>
            </div>

            <div class="col-lg-3 col-sm-3">
                <h4>Contact us</h4>
                <p><b>Royal Gardens Inc.</b><br>
                    <span class="glyphicon glyphicon-map-marker"></span> 8290 Colombo 05, Sri Lanka<br>
                    <span class="glyphicon glyphicon-envelope"></span> info@royalgardens.com<br>
                    <span class="glyphicon glyphicon-earphone"></span> (011) 456-7890</p>
            </div>
        </div>

        <p class="copyright">Copyright <%= new java.text.SimpleDateFormat("yyyy").format(new java.util.Date())%>. All rights reserved.	</p>


    </div></div>




<!-- Modal -->
<div id="loginpop" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="row">
                <div class="col-sm-6 login">
                    <h4>Login</h4>
                    <form method="POST" action="userLogin">
                        <div class="form-group">
                            <label class="sr-only" for="exampleInputEmail2">Email address</label>
                            <input type="email" class="form-control" id="exampleInputEmail2" placeholder="Enter email" name="email">
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="exampleInputPassword2">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword2" placeholder="Password" name="password">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> Remember me
                            </label>
                        </div>
                        <button type="submit" class="btn btn-success">Sign in</button>
                    </form>          
                </div>
                <div class="col-sm-6">
                    <h4>New User Sign Up</h4>
                    <p>Join today and get updated with all the properties deal happening around.</p>
                    <button type="submit" class="btn btn-info"  onclick="window.location.href = 'register.jsp'">Join Now</button>
                </div>

            </div>
        </div>
    </div>
</div>

<div id="loginpop-2" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="row">

                <div class="col-sm-12">
                    <h4>Reserve Now</h4>
                    <p>Lorem Ipsum Lorem Ipsum  Blah blah blah. </p>
                    <button type="submit" class="btn btn-info"  onclick="window.location.href = 'buy.jsp?r=<%=request.getParameter("id")%>'">Reserve</button>
                </div>

            </div>
        </div>
    </div>
</div>

<div id="loginpop-3" class="modal fade">
    <<div class="modal-dialog">
        <div class="modal-content">
            <div class="row">
               
                <div class="col-sm-12">
                    <h5>Account Deactivation will cause</h5><hr>
                    <ul style="margin: 0;">
                        <li>All uploaded beats will be deleted.</li>
                        <li>You won't be able to re-activate your Account.</li>
                        <li>Your profile and beats won't be shown on Obeats anymore.</li>
                        
                    </ul><br>
                    <button type="submit" class="btn btn-info"  onclick="window.location.href = 'register.jsp'">I got it! deactivate now</button>
                </div>

            </div>
        </div>
    </div>
</div>




</body>
</html>

