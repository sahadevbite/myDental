<%-- 
    Document   : DentalRegister
    Created on : 01-Feb-2016, 20:14:57
    Author     : Luke
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Register</title>
        <link rel="icon" type="image/png" href="MyDental.png"/>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link href="Styles.css" type="text/css" rel="stylesheet">
    </head>
    <body>        
             <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span> 
                    </button>
                    <a class="navbar-brand" href="myDental">myDental</a>      
                </div>
                 <div class="collapse navbar-collapse" id="myNavbar">
                    
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/myDental">Home</a></li>
                    </ul>
                </div>
            </div>
        </nav>

             <div class="container">
                <form class="form-signin" role="form" method="POST" action="DentalRegister">
                <h2 class="form-signin-heading">Register</h2>
                <label for="username" class="sr-only">Username</label>
                <input type="text" name="username" class="form-control" placeholder="Username" required autofocus>
                
                <label for="inputPassword" class="sr-only">Password</label>
                
                <input type="password" name="password" class="form-control" placeholder="Password" required>
                <label for="name" class="sr-only">First Name</label>
                
                <input type="text" name="name" class="form-control" placeholder="First Name" required>
                <label for="surname" class="sr-only">Second Name</label>
                
                <input type="text" name="surname" class="form-control" placeholder="Second Name" required>
                <input type="submit" value="Register">   
            </form>
              </div>
         
    </body>
</html>