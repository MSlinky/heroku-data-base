<%@ page import="launch.Conexion" %>
<%
    if(request.getParameter("accion") != null){
//Login
        if(request.getParameter("accion").equals("login")){
            Conexion objConexion = new Conexion();    
            out.println(objConexion.executeQuery("SELECT id_nivel FROM public.\"Usuario\" WHERE correo='"+request.getParameter("user")+"' AND password='"+request.getParameter("password")+"';", request.getParameter("accion")));
            objConexion.Close();
        }
//Registrar cliente        
        else if(request.getParameter("accion").equals("RegCliente")){
            Conexion objConexion = new Conexion();
            out.println(objConexion.executeInsert("INSERT INTO public.\"Cliente\" (nombre, apellido, estado, municipio, colonia, calle, num_int, num_ext, codigo_postal, rfc, correo_electronico) VALUES ('"+
                        request.getParameter("nombre")+"','"+
                        request.getParameter("apellido")+"','"+
                        request.getParameter("estado")+"','"+
                        request.getParameter("municipio")+"','"+
                        request.getParameter("colonia")+"','"+
                        request.getParameter("calle")+"','"+
                        request.getParameter("numInt")+"','"+
                        request.getParameter("numExt")+"','"+
                        request.getParameter("CP")+"','"+
                        request.getParameter("RFC")+"','"+
                        request.getParameter("email")+"');"));
            objConexion.Close();
        }
//Registrar producto
        else if(request.getParameter("accion").equals("RegProducto")){
            Conexion objConexion = new Conexion();
            out.println(objConexion.executeInsert("INSERT INTO public.\"Productos\" (nombre, descripcion, codigo, precio, \"cantidadInventario\") VALUES ('"+
                        request.getParameter("nombrePro")+"','"+
                        request.getParameter("descripcionPro")+"','"+
                        request.getParameter("codigoPro")+"','"+
                        request.getParameter("precioPro")+"','"+
                        request.getParameter("cantidadPro")+"');"));
            objConexion.Close();
        }
//Ver un productos        
        else if(request.getParameter("accion").equals("OnlyProducto")){
            Conexion objConexion = new Conexion();    
            out.println(objConexion.executeQuery("SELECT * FROM public.\"Productos\" WHERE id_producto="+request.getParameter("id"), request.getParameter("accion")));
            objConexion.Close();
        }
//Ver todos los productos        
        else if(request.getParameter("accion").equals("AllProductos")){
            Conexion objConexion = new Conexion();    
            out.println(objConexion.executeQuery("SELECT * FROM public.\"Productos\" ORDER BY id_producto", request.getParameter("accion")));
            objConexion.Close();
        }
//Eliminar producto
        else if(request.getParameter("accion").equals("EliminarProducto")){
            Conexion objConexion = new Conexion();    
            out.println(objConexion.executeInsert("DELETE FROM public.\"Productos\" WHERE id_producto="+request.getParameter("id")));
            objConexion.Close();
        }
//Modificar producto
        else if(request.getParameter("accion").equals("ModProducto")){
            Conexion objConexion = new Conexion();    
            out.println(objConexion.executeInsert("UPDATE public.\"Productos\" SET nombre = '"+
                    request.getParameter("nombrePro")+"',"+
                    "descripcion = '"+request.getParameter("descripcionPro")+"',"+
                    "codigo = '"+request.getParameter("codigoPro")+"',"+
                    "precio = '"+request.getParameter("precioPro")+"',"+
                    "\"cantidadInventario\" = '"+request.getParameter("cantidadPro")+"' WHERE id_producto = '"+request.getParameter("id")+"' "));
            objConexion.Close();
        }
//Ver todos los clientes        
        else if(request.getParameter("accion").equals("AllClientes")){
            Conexion objConexion = new Conexion();    
            out.println(objConexion.executeQuery("SELECT * FROM public.\"Cliente\" ORDER BY id_cliente", request.getParameter("accion")));
            objConexion.Close();
        }
//Ver un cliente        
        else if(request.getParameter("accion").equals("OnlyCliente")){
            Conexion objConexion = new Conexion();    
            out.println(objConexion.executeQuery("SELECT * FROM public.\"Cliente\" WHERE id_cliente="+request.getParameter("id"), request.getParameter("accion")));
            objConexion.Close();
        }
//Eliminar cliente
        else if(request.getParameter("accion").equals("EliminarCliente")){
            Conexion objConexion = new Conexion();    
            out.println(objConexion.executeInsert("DELETE FROM public.\"Cliente\" WHERE id_cliente="+request.getParameter("id")));
            objConexion.Close();
        }
//Modificar cliente
        else if(request.getParameter("accion").equals("ModCliente")){
            Conexion objConexion = new Conexion();    
            out.println(objConexion.executeInsert("UPDATE public.\"Cliente\" SET "+
                    "nombre = '"+request.getParameter("nombre")+"',"+
                    "apellido = '"+request.getParameter("apellido")+"',"+
                    "estado = '"+request.getParameter("estado")+"',"+
                    "municipio = '"+request.getParameter("municipio")+"',"+
                    "colonia = '"+request.getParameter("colonia")+"',"+
                    "calle = '"+request.getParameter("calle")+"',"+
                    "num_int = '"+request.getParameter("numInt")+"',"+
                    "num_ext = '"+request.getParameter("numExt")+"',"+
                    "codigo_postal = '"+request.getParameter("CP")+"',"+
                    "rfc = '"+request.getParameter("RFC")+"',"+
                    "correo_electronico = '"+request.getParameter("email")+"' WHERE id_cliente = '"+request.getParameter("id")+"' "));
            objConexion.Close();
        }
//Todas las facturas
        else if(request.getParameter("accion").equals("AllFacturas")){
            Conexion objConexion = new Conexion();    
            out.println(objConexion.executeQuery("SELECT * FROM public.\"Factura\" ORDER BY fecha", request.getParameter("accion")));
            objConexion.Close();
        }
//Ver factura
        else if(request.getParameter("accion").equals("OnlyFactura")){
            Conexion objConexion = new Conexion();    
            out.println("["+objConexion.executeQuery("SELECT * FROM public.\"Factura\", public.\"Cliente\" WHERE public.\"Factura\".id_factura="+request.getParameter("id"), request.getParameter("accion"))+","+
                            objConexion.executeQuery("SELECT * FROM public.\"ArticuloFactura\" WHERE public.\"ArticuloFactura\".id_factura="+request.getParameter("id"), request.getParameter("accion"))+"]");
            objConexion.Close();
        }
        else{
            out.println("{\""+request.getParameter("accion")+"\":[]}");
        }
    }else{
        out.println("Accion es null");
    }
    
%>
