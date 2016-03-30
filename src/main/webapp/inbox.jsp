<%-- 
    Document   : Inbox
    Created on : 23-Mar-2016, 18:50:50
    Author     : Luke
--%>

<%@page import="java.util.*"%>
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
        <title>Inbox</title>
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
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/myDental/logout">Logout</a></li>
                    </ul>
                </div>
            </div>

            <%  LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");%>
            <%
                Cluster cluster = null;
                cluster = CassandraHosts.getCluster();

                PicModel picMod = new PicModel();
                picMod.setCluster(cluster);


            %>
        </nav> 

        <div class="container">

            <div class="row">

                <%                    if (lg != null) {
                        if (lg.getloggedin()) {

                %>
                <div class="col-lg-12">
                    <h1 class="page-header"><%=lg.getUsername()%>'s Inbox</h1>
                </div>
                <%}
                } else {%>
                <h1>Your Inbox</h1>
                <%}%>
                 <%
                    java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
                    int lsFlags = 0;
                    if (lsPics == null) {
                %>
                <%
                } else {
                    Iterator<Pic> iterator;
                    iterator = lsPics.iterator();
                    while (iterator.hasNext()) {
                        Pic p = (Pic) iterator.next();
                        lsFlags = picMod.getFlagsForPic(p.getSUUID());
                        
                        if (lsFlags != 0){                %>

                <div class="container-fluid">
                    <form>
                        <a name="flags"><span class="badge"><%=picMod.getFlagsForPic(p.getSUUID())%></span></a> 
                        <input type="text" name="picid" value="<%=p.getSUUID()%>" hidden> 
                        <a name="flags"><span class="badge"><%=lg.getUsername()%></span></a>  
                        <input type="text" name="page" value="login" hidden>  			
                        <a href="/myDental/Comments/<%=p.getSUUID()%>" class="btn btn-info" role="button">Notes</a>
                        </form>
                    <a><img src="/myDental/Thumb/<%=p.getSUUID()%>"></a><br/><%
                                if (p.getCaption().isEmpty()) {
                                } else {
                                    out.println(p.getCaption());
                                }
                            }
                        }
                    }
                %>

                    
                </div>
            </div>
        </div>
        
</body>
</html>
