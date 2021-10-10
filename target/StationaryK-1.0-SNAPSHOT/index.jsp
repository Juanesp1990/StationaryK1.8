<%-- 
   
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
       
        <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>  
       
    </head>
    <body>
        <div class="container-fluid" ng-app = "papeleria" ng-controller = "productosController as pn">
            <div class="row">
                <div class="col-12">
                    <center><h1>Stationary K</h1></center> 
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <h3>Modificadores</h3>
                    <div class="row">
                        <div class="col-6">
                            <label >Id</label>
                            <input class="form-control" type="number" min="0" ng-model="pn.id" required>
                        </div>
                        <div class="col-6">
                            <label>Nombre</label>
                            <input class="form-control" type="text" ng-model="pn.nombre" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Unidades</label>
                            <input class="form-control" type="text" ng-model="pn.unidades" required>
                        </div>
                        <div class="col-6">
                            <label>Proveedor</label>
                            <select class="form-control" ng-model="pn.proveedor" required>
                                <option>Nacional</option>
                                <option>Internacional</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Marca</label>
                            <select class="form-control" ng-model="pn.marca" required>
                                <option>CC</option>
                                <option>TI</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <label>Precio</label>
                            <input class="form-control" type="text" ng-model="pn.precio" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Costo</label>
                            <input class="form-control" type="text" ng-model="pn.costo" required>
                        </div>
                        
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <button  class="btn btn-success" ng-click="pn.guardarProducto() ">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-primary" ng-click="pn.listarProductos()">Listar producto</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-danger" ng-click="pn.eliminarProducto()">Eliminar producto</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-warning" ng-click="pn.actualizarProducto()">Actualizar producto</button>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <h3>Vista Previa</h3>
                    <div class="row">
                        <div class="col-6">
                            <label >Id</label>
                            <input class="form-control" type="text" value="{{pn.id}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Nombre</label>
                            <input class="form-control" type="text" value="{{pn.nombre}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Unidades</label>
                            <input class="form-control" type="text" value="{{pn.unidades}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Proveedor</label>
                            <input class="form-control" type="text" value="{{pn.proveedor}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Marca</label>
                            <input class="form-control" type="text" value="{{pn.marca}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Precio</label>
                            <input class="form-control" type="text" value="{{pn.precio}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Costo</label>
                            <input class="form-control" type="text" value="{{pn.costo}}" disabled="">
                        </div>
                        
                    </div>
                </div>
            </div>
            <div class="row" >
                <div class="col-12 table-responsive-xl">
                    <h3>Inventario</h3>
                    <table class="table table-striped table-hover">  
                        <thead class="thead-dark">
                            <tr>  
                                <th>Id</th>  
                                <th>Nombre</th>  
                                <th>Unidades</th>  
                                <th>PRoveedor</th>  
                                <th>Marca</th>  
                                <th>Precio</th>  
                                <th>Costo</th>  
                                
                            </tr>  
                        </thead>

                        <tr ng-repeat = "Producto in pn.Producto">  
                            <td>{{ Producto.id}}</td>  
                            <td>{{ Producto.nombre}}</td>  
                            <td>{{ Producto.unidades}}</td>  
                            <td>{{ Producto.proveedor}}</td>  
                            <td>{{ Producto.marca}}</td>  
                            <td>{{ Producto.precio}}</td>  
                            <td>{{ Producto.costo}}</td>  
                              
                        </tr>  
                    </table> 
                </div>
            </div>
        </div>
    </body>
    <script>
        var app = angular.module('papeleria', []);
        app.controller('productosController', ['$http', controladorProducto]);
        function controladorProducto($http) {
            var pn = this;
            pn.listarProductos = function () {
                var url = "Peticiones.jsp";
                var params = {
                    proceso: "listarproducto"
                };
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: params
                }).then(function (res) {
                    pn.producto = res.data.Producto;
                });
            };
            pn.guardarProducto = function () {
                var producto = {
                    proceso: "guardarproducto",
                    id: pn.id,
                    nombre: pn.nombre,
                    apellido: pn.apellido,
                    genero: pn.genero,
                    tipoIdentificacion: pn.tipoIdentificacion,
                    telefono: pn.telefono,
                    direccion: pn.direccion
                };
                console.log(producto);
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: producto
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[producto.proceso] === true) {
                            alert("Guardado con éxito");
                           pn.listarproducto();
                        } else {
                            alert("No se guardo Por favor vefifique sus datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });

            };
            pn.eliminarProducto = function () {
                var producto = {
                    proceso: "eliminarproducto",
                    identificacion: pn.id
                };
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: producto
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[producto.proceso] === true) {
                            alert("Eliminado con éxito");
                            //                                cn.listarContactos();
                        } else {
                            alert("Por favor vefifique sus datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });

            };
            pn.actualizarProducto = function () {

                var producto = {
                    proceso: "actualizarproducto",
                    id: pn.id,
                    nombre: pn.nombre,
                    apellido: pn.unidades,
                    genero: pn.proveedor,
                    tipoIdentificacion: pn.marca,
                    telefono: pn.precio,
                    direccion: pn.costo
                    
                };
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: producto
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[producto.proceso] === true) {
                            alert("actualizarproducto con éxito");
                            //                                cn.listarContactos();
                        } else {
                            alert("Por favor vefifique sus datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });

            };
           
        }
    </script>  
</html>
