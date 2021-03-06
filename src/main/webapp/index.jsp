<%-- 
    Document   : Index
    Author     : Luke Kelly
--%>

<%@page import="stores.LoggedIn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>myDental</title>
    <link rel="icon" type="image/png" href="MyDental.png"/>      
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link href="Styles.css" type="text/css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <body class="body bodyindex" id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
        <nav class="navbar navbar-default navbar-inverse">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span> 
                    </button>
                    <a class="navbar-brand" href="/myDental">myDental</a>      
                </div>
                <%
                    LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                    if (lg != null) {
                        if (lg.getloggedin()) {
                %>        
                <div class="collapse navbar-collapse" id="myNavbar">
                  
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/myDental/logout">Logout <span class="glyphicon glyphicon-log-out"></span></a></li>
                    </ul>
                </div>

                <%
                    }
                } else {
                %>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
 
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/myDental/Login" ><span class="glyphicon glyphicon-log-in"></span>Patient Login</a></li>
                        <li><a href="/myDental/DentalLogin"><span class="glyphicon glyphicon-log-in"></span>Dentist Login</a></li>
                        <!-- <li><a href="DentalRegister.jsp">DentalRegister</a></li> 
                        <!--       <li><a href="/myDental/Register">Register</a></li> -->
                    </ul>
                </div>
                <%
                    }
                %>
            </div>       
        </nav>



        <div id="main" class="jumbotron text-center">
            <h1><strong>Enhancing Dental Communication</strong></h1>
            <p><strong>We help support effective communication between patients and their dental team</strong></p>
        </div>



        <div id="services" class="container-fluid text-center bg-grey">
            <br>
            <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <span class="glyphicon glyphicon-inbox"></span>
                    <h4>Receive</h4>
                    <p>Receive your treatment before the consultation</p>
                </div>
                <div class="col-sm-4">
                    <span class="glyphicon glyphicon-eye-open"></span>
                    <h4>View Treatments</h4>
                    <p>Procedures encapsulated through image stories</p>
                </div>
                <div class="col-sm-4">
                    <span class="glyphicon glyphicon-flag"></span>
                    <h4>Report Issues</h4>
                    <p>Flag elements of your treatment</p>
                </div>
            </div>
            <br><br>
            <div class="row">
                <div class="col-sm-4">
                    <span class="glyphicon glyphicon-comment"></span>
                    <h4>Feedback</h4>
                    <p>Provide your dentist with direct feedback prior to consultation</p>
                </div>
                <div class="col-sm-4">
                    <span class="glyphicon glyphicon-certificate"></span>
                    <h4>CERTIFIED</h4>
                    <p>Research involving NHS practitioners</p>
                </div>
                <div class="col-sm-4">
                    <span class="glyphicon glyphicon-edit"></span>
                    <h4>Tailored Consultations</h4>
                    <p>Tailor your consultations to your personal needs</p>
                </div>
            </div>
        </div>
        </div>
            
            
       <!-- <div id="about" class="container-fluid bg-grey">
            <div class="row">
                <div class="col-sm-7">
                    <h4><strong>About myDental</strong></h4> 
                    <p><strong>myDental has been built upon the success of usability researchers at the University of Dundee. Lead by Prof. Annalu Waller, the research discovered that the improvement of communications between patients and dental practiitioners can reduce the levels of anxiety experienced for both parties during a consultation</strong></p>
                </div>

                <div class="col-sm-5">
                    <span> <img src="Pictures/screens.png" alt=""/></span>
                </div>
            </div>
        </div> -->
            
            
        <footer class="container-fluid text-center bg-grey">
            <a href="#" title="Back to Top!">
                <span class="glyphicon glyphicon-chevron-up"></span>
            </a>
            <p>&COPY; myDental 2016</p> 
            <p>- Luke Kelly -</p> 
        </footer>


        <!-- <script>
             $(document).ready(function () {
 // Add smooth scrolling to all links in navbar + footer link
                 $(".navbar a, footer a[href='#myPage']").on('click', function (event) {
 
 // Prevent default anchor click behavior
                     event.preventDefault();
 
 // Store hash
                     var hash = this.hash;
 
 // Using jQuery's animate() method to add smooth page scroll
 // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
                     $('html, body').animate({
                         scrollTop: $(hash).offset().top
                     }, 2000, function () {
 
 // Add hash (#) to URL when done scrolling (default click behavior)
                         window.location.hash = hash;
                     });
                 });
             })
         </script> -->

    </body>


</html>
