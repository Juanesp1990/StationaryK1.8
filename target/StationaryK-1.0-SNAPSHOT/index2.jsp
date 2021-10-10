<%-- 
    Document   : index
    Created on : 5/10/2021, 10:34:04 PM
    Author     : JUANES
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Papelería Stationary K</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <table>
            <tr>
                <td class="celdas_index">
                    <div onclick="listarTodos()" class="boton_index">
                        Listar todos los productos
                    </div>
                </td>
                <td class="celdas_index">
                    <div onclick="listarTodos()" class="boton_index">
                        Actualizar producto
                    </div>
                </td>
            </tr>
        </table>
    </body>
    
<script>
function listarTodos(){
    window.location = "Peticiones.jsp?proceso=listarproducto";
};
</script>
</html>
