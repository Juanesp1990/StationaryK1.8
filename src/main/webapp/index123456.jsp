<%-- 
    Document   : index
    Created on : 16/06/2021, 03:18:34 PM
    Author     : fido
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TiendaTIC</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
       
        <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>  
       
    </head>
    <body>
        <div class="container-fluid" ng-app = "Tienda" ng-controller = "productosController as pd">
            <div class="row">
                <div class="col-12">
                    <center><h1>TiendaTIC</h1></center> 
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <h3>Sección 1</h3>
                    <div class="row">
                        <div class="col-6">
                            <label >Codigo</label>
                            <input class="form-control" type="number" min="0" ng-model="pd.codigo" required>
                        </div>
                        <div class="col-6">
                            <label>Nombre</label>
                            <input class="form-control" type="text" ng-model="pd.nombre" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Marca</label>
                            <input class="form-control" type="text" ng-model="pd.marca" required>
                        </div>
                        <div class="col-6">
                            <label>Cantidad</label>
                            <input class="form-control" type="text" ng-model="pd.cantidad" required>
                                                                                  </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Categoria</label>
                            <select class="form-control" ng-model="pd.categoria" required>
                                <option>Perecederos</option>
                                <option>No perecederos</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <label>Precio</label>
                            <input class="form-control" type="text" ng-model="pd.precio" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Distribuido por </label>
                            <input class="form-control" type="text" ng-model="pd.distribuidoPor" required>
                        </div>
                        <div class="col-6">
                            <label>Fecha de vencimiento</label>
                            <input class="form-control" type="text" ng-model="pd.fechaDeVencimiento" required> 
                                                                            </div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <button  class="btn btn-success" ng-click="pd.guardarProducto()">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-primary" ng-click="pd.listarProducto()">Listar</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-danger" ng-click="pd.eliminarProducto()">Eliminar</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-warning" ng-click="pd.actualizarProducto()">Actualizar</button>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <h3>Sección 2</h3>
                    <div class="row">
                        <div class="col-6">
                            <label >Codigo</label>
                            <input class="form-control" type="text" value="{{pd.codigo}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Nombre</label>
                            <input class="form-control" type="text" value="{{pd.nombre}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Marca</label>
                            <input class="form-control" type="text" value="{{pd.marca}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Cantidad</label>
                            <input class="form-control" type="text" value="{{pd.cantidad}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Categoria</label>
                            <input class="form-control" type="text" value="{{pd.categoria}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Precio</label>
                            <input class="form-control" type="text" value="{{pd.precio}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Distribuido por</label>
                            <input class="form-control" type="text" value="{{pd.distribuidoPor}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Fecha de Vencimiento</label>
                            <input class="form-control" type="text" value="{{pd.fechaDeVencimiento}}" disabled="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" >
                <div class="col-12 table-responsive-xl">
                    <h3>Sección 3</h3>
                    <table class="table table-striped table-hover">  
                        <thead class="thead-dark">
                            <tr>  
                                <th>Codigo</th>  
                                <th>Nombre</th>  
                                <th>Marca</th>  
                                <th>Cantidad</th>  
                                <th>Categoria</th>  
                                <th>Precio</th>  
                                <th>Distribuido por</th>  
                                <th>Fecha de vencimiento</th>  
                            </tr>  
                        </thead>

                        <tr ng-repeat = "producto in pd.productos">  
                            <td>{{ producto.codigo}}</td>  
                            <td>{{ producto.nombre}}</td>  
                            <td>{{ producto.marca}}</td>  
                            <td>{{ producto.cantidad}}</td>  
                            <td>{{ producto.categoria}}</td>  
                            <td>{{ producto.precio}}</td>  
                            <td>{{ producto.distribuidopor}}</td>  
                            <td>{{ producto.fechadevencimiento}}</td>  
                        </tr>  
                    </table> 
                </div>
            </div>
        </div>
    </body>
    <script>
        var app = angular.module('Tienda', []);
        app.controller('productosController', ['$http', controladorProductos]);
        function controladorProductos($http) {
            var pd = this;
            pd.listarProductos = function () {
                var url = "Peticiones.jsp";
                var params = {
                    proceso: "listarproducto"
                };
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: params
                }).then(function (res) {
                    pd.contactos = res.data.Productos;
                });
            };
            pd.guardarProducto = function () {
                var producto = {
                    proceso: "guardarProducto",
                    codigo: pd.codigo,
                    nombre: pd.nombre,
                    marca: pd.marca,
                    cantidad: pd.cantidad,
                    categoria: pd.categoria,
                    precio: pd.precio,
                    distribuidoPor: pd.distribuidoPor,
                    fechaDeVencimiento: pd.fechaDeVencimiento
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
                           pd.listarProductos();
                        } else {
                            alert("No se guardo Por favor vefifique sus datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });

            };
            pd.eliminarProducto = function () {
                var producto = {
                    proceso: "eliminarproducto",
                    codigo: pd.codigo
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
            pd.actualizarProductos = function () {

                var producto = {
                    proceso: "actualizarproducto",
                    codigo: pd.codigo,
                    nombre: pd.nombre,
                    marca: pd.marca,
                    cantidad: pd.cantidad,
                    categoria: pd.categoria,
                    precio: pd.precio,
                    distribuidoPor: pd.distribuidoPor,
                    fechaDevencimiento: pd.fechaDeVencimiento
                };
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: producto
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[producto.proceso] === true) {
                            alert("actualizarprodcuto con éxito");
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
