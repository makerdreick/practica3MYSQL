<%-- 
    Document   : index
    Created on : 13 nov. 2022, 22:45:59
    Author     : Dreick Lap1
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar</title>
    </head>
    <body>
        <%
       //CONECTANOD A LA BASE DE DATOS:
       Connection con;       
       String url="jdbc:mysql://localhost:3306/tienda_online";
       String Driver="com.mysql.jdbc.Driver";
       String user="root1";
       String clave="root12";
       Class.forName(Driver);
       con=DriverManager.getConnection(url,user,clave);
       //Emnpezamos Listando los Datos de la Tabla Usuario pero de la fila seleccionada
       PreparedStatement ps;       
       int id=Integer.parseInt(request.getParameter("id"));
       ps=con.prepareStatement("delete from productos where Id="+id);
       ps.executeUpdate();
       response.sendRedirect("index.jsp");
       
       %>
    </body>
</html>
