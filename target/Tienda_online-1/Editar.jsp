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
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
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
       ResultSet rs;
       int id=Integer.parseInt(request.getParameter("id"));
       ps=con.prepareStatement("select * from productos where Id="+id);
       rs=ps.executeQuery();
       while(rs.next()){
                         %>
        <div class="container">
            <h1>Modificar Registro</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                ID:
                <input type="text" readonly="" class="form-control" value="<%= rs.getInt("Id")%>"/>
                 Producto:
                <input type="text" name="txtpro" class="form-control" value="<%= rs.getString("producto")%>"/><br>
              
                 Precio:
                <input type="text" name="txtpre" class="form-control" value="<%= rs.getString("precio")%>"/>
                 Cantidad:
                 <input type="text" name="txtcan" class="form-control" value="<%= rs.getString("cantidad")%>"/><br>
                 <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                
                <a href="index.jsp">Regresar</a>
            </form>
            <%}%>
        </div>
    </body>
</html>
<%
   String pro,pre,can;
                pro = request.getParameter("txtpro");
                pre = request.getParameter("txtpre");
                can = request.getParameter("txtcan");
                if (pre != null || pro != null || can != null ) {
                   ps=con.prepareStatement("update productos set producto='"+pro+"',precio='"+pre+"', cantidad='"+can+"'where Id="+id);
                    ps.executeUpdate();
                    response.sendRedirect("index.jsp");
    }
       
       
%>
