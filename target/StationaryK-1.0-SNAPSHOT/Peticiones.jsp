<%-- 
    Document   : Peticiones
    Created on : 5/10/2021, 10:04:21 PM
    Author     : JUANES
--%>

<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Logica.Producto"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" language="java" pageEncoding="iso-8859-1" session="true"%>


<%    
    List<Producto> lista = null;
    String respuesta = "{";

    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "actualizarproducto",
        "eliminarproducto",
        "listarproducto",
        "guardarproducto"
    });
    
    String proceso = "" + request.getParameter("proceso");

    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        
        if (proceso.equals("guardarproducto")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            int unidades = Integer.parseInt(request.getParameter("unidades"));
            String proveedor = request.getParameter("proveedor");
            String marca = request.getParameter("marca");
            double precio = Double.parseDouble(request.getParameter("precio"));
            double costo = Double.parseDouble(request.getParameter("costo"));
            
            Producto c= new Producto();
            c.setId(id);
            c.setNombre(nombre);
            c.setUnidades(unidades);
            c.setProveedor(proveedor);
            c.setMarca(marca);
            c.setPrecio(precio);
            c.setCosto(costo);
           
            if (c.guardarProducto()){
                    respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminarproducto")) {
            int id = Integer.parseInt(request.getParameter("id"));
            //su codigo acá
            Producto c= new Producto();
            if (c.borrarProducto(id)) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listarproducto")) {
            //su codigo acá
            Producto c= new Producto();
            try {
                lista = c.listarProductos();
                respuesta += "\"" + proceso + "\": true,\"Producto\":" + new Gson().toJson(lista);
            } catch (SQLException ex) {
                respuesta += "\"" + proceso + "\": true,\"Producto\":[]";
                Logger.getLogger(Producto.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("actualizarproducto")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            int unidades = Integer.parseInt(request.getParameter("unidades"));
            String proveedor = request.getParameter("proveedor");
            String marca = request.getParameter("marca");
            double precio = Double.parseDouble(request.getParameter("precio"));
            double costo = Double.parseDouble(request.getParameter("costo"));
          
            //su codigo acá
            Producto c= new Producto(); 
            c.setNombre(nombre);
            c.setId(id);
            c.setUnidades(unidades);
            c.setProveedor(proveedor);
            c.setMarca(marca);
            c.setPrecio(precio);
            c.setCosto(costo);
            if (c.actualizarProducto()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        }

        // ------------------------------------------------------------------------------------- //
        // -----------------------------------FIN PROCESOS-------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }
    // Usuario sin sesión.
    // Responder como objeto JSON codificación ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
    
    JsonObject json_respuesta = new JsonParser().parse(respuesta).getAsJsonObject();

   
    if(json_respuesta.get("ok").getAsBoolean() == true){
        if(json_respuesta.get("listarproducto").getAsBoolean() == true){
            for(Producto p: lista){
                // Listado de productos
                out.println(p.toString());
            }
        }
    }
%>
