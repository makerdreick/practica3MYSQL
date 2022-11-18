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
        <title>Tienda</title>
    </head>
    <body style="margin-top: 30px">      
        <%
            //CONECTANOD A LA BASE DE DATOS:
            Connection con;
            String url = "jdbc:mysql://localhost:3306/tienda_online";
            String Driver = "com.mysql.jdbc.Driver";
            String user = "root1";
            String clave = "root12";
            Class.forName(Driver);
            con = DriverManager.getConnection(url, user, clave);
            PreparedStatement ps;
            //Emnpezamos Listando los Datos de la Tabla Usuario
            Statement smt;
            ResultSet rs;
            smt = con.createStatement();
            rs = smt.executeQuery("select * from productos");
            //Creamo la Tabla:     
        %>
        <div class="container"> 
            <div class="btn-group" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-primary">Erick Conde Fernandez</button>
                <button type="button" class="btn btn-primary">Tecnologias Emergentes II</button>
                <button type="button" class="btn btn-primary">7mo Semetre</button>
                <button type="button" class="btn btn-primary">Tienda Online MYSQL</button>
            </div>
            <br>
            <br>
            <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">😃Agregar Usuario</button>
            <div style="padding-left: 800px">                  
                <!-- <input type="text" class="form-control" value="Buscar"/> --->                            
            </div>
        </div>  
              
        <br>
        <div class="container">               
            <!--<a  class="btn btn-success" href="Agregar.jsp">Nuevo Registro</a> Esto es Cuando se Crea un nuevo Archivo Agregar.jsp -->         
             <table class="table table-bordered"  id="tablaDatos">
                    <thead>
                        <tr>
                            <th class="text-center">Id</th>
                            <th>Producto</th>
                            <th class="text-center">Precio</th>
                            <th class="text-center">Cantidad</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody id="tbodys">
                        <%
                            while (rs.next()) {
                        %>
                        <tr>
                            <td class="text-center"><%= rs.getInt("Id")%></td>
                            <td><%= rs.getString("producto")%></td>
                            <td class="text-center"><%= rs.getString("precio")%></td>
                            <td class="text-center"><%= rs.getString("cantidad")%></td>
                            <td class="text-center">
                                
                               
                            <a href="Editar.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-primary">Modificar</a>
                            <a href="Delete.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-danger">Elimnar</a>
                        </tr>
                        <%}%>
                </table>
            </div>        
        <div class="container">          
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                    <div class="modal-content">
                        <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Agregar Registro</h4>
                        </div>
                        <div class="modal-body">
                            <form action="" method="post">
                                <label>Producto:</label> 
                                <input type="text" name="txtpro" class="form-control" required /><br>
                                <label>Precio:</label> 
                                <input type="text" name="txtpre" class="form-control" required />
                                <label>Cantidad:</label> 
                                <input type="text" name="txtcan" class="form-control" required />
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                            
                                    <input type="submit" value="Guardar" class="btn btn-primary"/>
                                </div>
                            </form>
                        </div>
                    </div>                    
                </div>
            </div>
            <%
                String pro,pre,can;
                pro = request.getParameter("txtpro");
                pre = request.getParameter("txtpre");
                can = request.getParameter("txtcan");
                if (pre != null || pro != null || can != null ) {
                    ps = con.prepareStatement("insert into productos(producto,precio,cantidad)values('" + pro + "','" + pre + "','" + can + "')");
                    ps.executeUpdate();
                    response.sendRedirect("index.jsp");

                }
            %>
        </div>        
        <script src="js/jquery.js" type="text/javascript"></script>             
        <script src="js/bootstrap.min.js" type="text/javascript"></script>        
    </body>
</html>