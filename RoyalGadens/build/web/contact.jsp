<%-- 
    Document   : contact
    Created on : Apr 16, 2017, 10:10:07 AM
    Author     : Ishan Darshana
--%>
<%@include file="header.jsp" %>


<div class="container">
    <div class="spacer">
        <div class="row contact">
            <div class="col-lg-6 col-sm-6 ">
                <h2>Send Us An Email</h2><hr>
                <p>You can email us directly at <strong>info@royalgardens.com</strong>, or send us a message using the form below. 
                    <strong>Please read our <a href="#faq">FAQ</a> below before emailing us your question.</strong> If your question 
                    is already answered on our FAQ we may not send you a reply.</p>


                <input type="text" class="form-control" placeholder="Full Name">
                <input type="text" class="form-control" placeholder="Email Address">
                <input type="text" class="form-control" placeholder="Contact Number">
                <textarea rows="6" class="form-control" placeholder="Message"></textarea>
                <button type="submit" class="btn btn-success" name="Submit">Send Message</button>




            </div>
            <div class="col-lg-6 col-sm-6 ">
                <div class="well"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15844.139448403494!2d79.86363352458991!3d6.886427723362429!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae25bd260b4fa11%3A0xf580e12fb12d21f3!2sColombo+05%2C+Colombo!5e0!3m2!1sen!2slk!4v1492319385718" width="100%" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe></div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="top-margin" style="width: 100%;" id="faq"><hr>


                    <h3 class="top-margin"><strong>Frequently Asked Questions</strong></h3>
                    <p>We've been asked every question you can think of (and probably some you can't) 
                        so we decided to drop all the answers on to this page so you can get instant answers to your questions.
                    </p>
                    <div>
                        <p class="top-margin" id="flip-1">
                            <strong>Are beats removed from the website once bought?</strong>
                        </p>
                        <p class="slide-down-style" id="panel-1">

                            No. 
                            When a beat is bought, it will remain on the website listed as "OWN" and 
                            can still be bought by others.
                        </p>
                    </div>
                    <div>
                        <p id="flip-2">
                            <strong>What if two different people buy the same beat?</strong>
                        </p>

                        <p class="slide-down-style" id="panel-2">
                            If two different people buy the same beat, they can still each copyright their 
                            own song they make with that beat, and sell, distribute, perform and 
                            broadcast that song, keeping all their own royalties.
                        </p>

                    </div>
                    <div>
                        <p id="flip-3">
                            <strong>What if two different people buy the same beat?</strong>
                        </p>

                        <p class="slide-down-style" id="panel-3">
                            If two different people buy the same beat, they can still each copyright their 
                            own song they make with that beat, and sell, distribute, perform and 
                            broadcast that song, keeping all their own royalties.
                        </p>

                    </div>
                    <div>
                        <p id="flip-4">
                            <strong>What if two different people buy the same beat?</strong>
                        </p>

                        <p class="slide-down-style" id="panel-4">
                            If two different people buy the same beat, they can still each copyright their 
                            own song they make with that beat, and sell, distribute, perform and 
                            broadcast that song, keeping all their own royalties.
                        </p>

                    </div>
                    <br><hr>





                </div>
            </div>
        </div>
        <div class="row contact">
            <div class="col-lg-6 col-sm-6 ">
                <h2 class="top-margin">Report an Issue</h2><hr>
                <p>while using this system,you may experienced some problems,feel free to report them to us</p>
                <strong><p id="profile-error" class="error-font"></p></strong>
                <form action="ReportIssue" method="get" name="createIssue" onsubmit="return validateIssueForm()">
                    <input type="text" class="form-control" placeholder="Fault Name" name="faultname">
                    <textarea rows="6" class="form-control" placeholder="Description" name="description" ></textarea>
                    <input type="text" class="form-control" placeholder="URL of Page" name="url">
                    <button type="submit" class="btn btn-success" name="Submit">Send Issue</button>
                </form>
            </div>

        </div>
    </div>
</div>

<%@include file="footer.jsp" %>
