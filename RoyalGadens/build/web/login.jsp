<%-- 
    Document   : login
    Created on : Apr 22, 2017, 10:32:03 PM
    Author     : Ishan Darshana
--%>

<html>
    <head>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    </head>
    <body>
        <div class="container">

            <div class="row top-margin">
                <h3><strong>ADMINISTRATOR LOGIN</strong></h3><hr>
                <%        if (request.getParameter("id") != null && request.getParameter("id").equals("error")) {
                %>
                <p style="color: red;"><b>Invalid Username/Password</b></p>
                <%
                    }
                %>
                <div class="col-md-6">
                    <form method="POST" action="j_security_check">
                        <input type="text" name="j_username" class="form-control" placeholder="username"><br>
                        <input type="password" name="j_password" class="form-control" placeholder="password"><br>
                        <div class="row">
                            <div class="col-md-3">
                                <input type="submit" value="Login!" class="btn">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
    </body>
</html>