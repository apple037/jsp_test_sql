<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.lang.*" %>
  <jsp:useBean id = "database" class="com.database.Database">
    <jsp:setProperty property="ip" name="database" value="140.120.54.114"/>
    <jsp:setProperty property="port" name="database" value="3306"/>
    <jsp:setProperty property="db" name="database" value="jspuser"/>
    <jsp:setProperty property="user" name="database" value="jspuser"/>
    <jsp:setProperty property="password" name="database" value="jspuser"/>
  </jsp:useBean>
  <%
    String id = request.getParameter("id");
    database.connectDB();
    String sql = "select * from travel where id = " + id +";";
    database.query(sql);
    ResultSet rs = database.getRS();
  %>
<html>
  <head>
    <title>030</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
    <style>
      .card-header{
        font-size:20px;
        font-weight: bold;
      }
    </style>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>

  <script>
    $(".button-collapse").sideNav();
  </script>
  </head>
  <body>
    <div class="navbar-fixed">
       <nav>
           <div class="nav-wrapper">
             <center>
               <h style="font-size:25px;font-weight:bold;">旅遊景點</h>
             </center>
           </div>
       </nav>
   </div>
   <div class="row">
       <%
       if ( rs != null ){
         while(rs.next()){
         String name = rs.getString("name");
         String photo = rs.getString("photo");
         String description = rs.getString("description");
      %>

       <div class="col s12">
           <div class="card horizontal">
               <div class="card-image" style="padding:2vh;">
                   <img src="<%=photo%>" style="height:100%;">
               </div>
               <div class="card-stacked">
                   <div class="card-content">
                       <h style="font-size:20px;font-weight:bold;"><%=name%></h>
                       <p><%=description%></p>
                   </div>
               </div>
           </div>
       </div>
      <%}}%>
  </body>
</html>
