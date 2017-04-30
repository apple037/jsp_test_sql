<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.lang.*" %>
<%
  String ip = "140.120.54.114:3306";
  String user = "jspuser";
  String pwd = "jspuser";
  String db = "jspuser";
  String driver = "com.mysql.jdbc.Driver";
  Connection con = null;
  Statement stmt = null;
  ResultSet rs = null;
  try{
    String url = "jdbc:mysql://" + ip + "/" + db + "?useUnicode=true&characterEncoding=utf-8";
    Class.forName(driver).newInstance();
    con = DriverManager.getConnection(url,user,pwd);
    stmt = con.createStatement();
    String sql = "select * from travel; ";
    rs = stmt.executeQuery(sql);
  }catch(Exception ex){
    out.println(ex);
  }
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
       String id = rs.getString("id");
       String name = rs.getString("name");
       String photo = rs.getString("photo");
       String location = rs.getString("location");
       String description = rs.getString("description");
       String createdAt = rs.getString("createdAt");
    %>

     <div class="col s6">
         <div class="card horizontal">
             <div class="card-image" style="padding:2vh;">
                 <img src="<%=photo%>" style="width:17vh;height:19vh;">
             </div>
             <div class="card-stacked">
                 <div class="card-content">
                     <h style="font-size:20px;font-weight:bold;"><%=name%></h>
                     <p>地點： <%=location%></p>
                     <p>建立於： <%=createdAt%></p>
                 </div>
                 <div class="card-action">
                   <a href="detail.jsp?id=<%=id%>">詳細資訊</a>
                 </div>
             </div>
         </div>
     </div>
    <%}}%>
  </body>
</html>
