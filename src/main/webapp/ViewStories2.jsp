<%-- 
    Document   : ViewStories2
    Created on : 27-Apr-2016, 17:43:55
    Author     : Luke
--%>

<%@page import= "java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "stores.*" %>
<%@ page import= "models.*" %>
<%@ page import="lib.CassandraHosts"%>
<%@ page import="com.datastax.driver.core.Cluster"%>
<%@ page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Stories</title>
        <link rel="icon" type="image/png" href="MyDental.png"/>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link href="Styles.css" type="text/css" rel="stylesheet"> 
    </head>
    <body class="body">
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span> 
                    </button>
                    <a class="navbar-brand" href="/myDental">myDental</a>      
                </div>  
                <ul class="nav navbar-nav">
                    <li><a href="dentistPortal.jsp">Dashboard Home</a></li>
                </ul>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/myDental/logout">Logout</a></li>
                    </ul>
                </div>
            </div>

            <%  LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                Cluster cluster = null;
                cluster = CassandraHosts.getCluster();

                PicModel picMod = new PicModel();
                picMod.setCluster(cluster); %>
        </nav> 



        <%                    if (lg != null) {
                if (lg.getloggedin()) {

        %>
        <div class="col-lg-12">
            <h1 class="page-header"><%=lg.getFirstName()%>'s Stories</h1>
        </div>

        <%
             } else {%>
        <h1>Your uploaded Images</h1>
        <%}%>
        <%
            java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
            int lsFlags = 0;
            if (lsPics == null) {
        %>
        <p><strong>You have made no stories yet!</strong></p>
        <%
        } else {
            Iterator<Pic> iterator;
            iterator = lsPics.iterator();
            while (iterator.hasNext()) {
                Pic p = (Pic) iterator.next();
                lsFlags = picMod.getFlagsForPic(p.getSUUID());

                if (lsFlags != 0) {%>


        <form>	
            <input type="text" name="flags" value="<%=picMod.getFlagsForPic(p.getSUUID())%>" hidden>           
            <input type="text" name="picid" value="<%=p.getSUUID()%>" hidden> 
            <input type="text" name="login" value="<%=lg.getUsername()%>" hidden>  
            <input type="text" name="page" value="login" hidden >  			
            <button class="btn btn-danger" role="button" disabled><img src="Pictures/!.jpg" alt="" height="30" width="30"/></button>	
            <a href="/myDental/Comments/<%=p.getSUUID()%>" class="btn btn-info" role="button">Notes</a>
        </form>
        <%      } else {%>

        <form method="POST" action="/myDental/Flag">	
            <input type="text" name="flags" value="<%=picMod.getFlagsForPic(p.getSUUID())%>" hidden>
          <!--  <a name="flags"><span class="badge"><%=picMod.getFlagsForPic(p.getSUUID())%></span></a> -->
            <input type="text" name="picid" value="<%=p.getSUUID()%>" hidden> 
            <input type="text" name="login" value="<%=lg.getUsername()%>" hidden>  
            <input type="text" name="page" value="login" hidden >  			
            <button type="submit" class="btn btn-success" role="button" disabled><img src="Pictures/!.jpg" alt="" height="30" width="30"/></button>	
            <a href="/myDental/Comments/<%=p.getSUUID()%>" class="btn btn-info" role="button">Notes</a>
        </form>

        <%  }
        %>

        <a><img src="/myDental/Thumb/<%=p.getSUUID()%>"></a><br/><%
            if (p.getCaption().isEmpty()) {
            } else {%>

        <div>
            <b><strong><%out.println(p.getCaption());%></strong></b>
        </div>

        <form method="POST" action="EditPic">
            <input type="text" name="user" value="<%=p.getUser()%>"  >
            <input name="picid" value="<%=p.getSUUID()%>" >
            <input type="text" name="caption" placeholder="Enter a new caption here..">
            </br>													
            <input type="submit" value="Submit Change"> 	</br>
        </form> 
        <%  }
                    }
                }
            }
        %>

    </div>
</div>
</body>
</html>