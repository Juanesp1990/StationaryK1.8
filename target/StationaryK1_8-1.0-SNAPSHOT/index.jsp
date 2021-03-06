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
        <div class="container-fluid" ng-app = "demoCiclo3" ng-controller = "contactosController as cn">
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
                            <input class="form-control" type="number" min="0" ng-model="cn.id" required>
                        </div>
                        <div class="col-6">
                            <label>Nombre</label>
                            <input class="form-control" type="text" ng-model="cn.nombre" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Unidades</label>
                            <input class="form-control" type="text" ng-model="cn.unidades" required>
                        </div>
                        <div class="col-6">
                            <label>Proveedor</label>
                            <select class="form-control" ng-model="cn.proveedor" required>
                                <option>Nacional</option>
                                <option>Internacional</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Marca</label>
                            <select class="form-control" ng-model="cn.marca" required>
                                <option>CC</option>
                                <option>TI</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <label>Precio</label>
                            <input class="form-control" type="text" ng-model="cn.precio" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Costo</label>
                            <input class="form-control" type="text" ng-model="cn.costo" required>
                        </div>
                        
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <button  class="btn btn-success" ng-click="cn.guardarContacto()">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-primary" ng-click="cn.listarContactos()">Listar contacto</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-danger" ng-click="cn.eliminarContacto()">Eliminar contacto</button>
                        </div>
                        <div class="col-3">
                            <button  class="btn btn-warning" ng-click="cn.actualizarContacto()">Actualizar contacto</button>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <h3>Vista Previa</h3>
                    <div class="row">
                        <div class="col-6">
                            <label >Id</label>
                            <input class="form-control" type="text" value="{{cn.identificacion}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Nombre</label>
                            <input class="form-control" type="text" value="{{cn.nombre}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Unidades</label>
                            <input class="form-control" type="text" value="{{cn.apellido}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Proveedor</label>
                            <input class="form-control" type="text" value="{{cn.genero}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Marca</label>
                            <input class="form-control" type="text" value="{{cn.tipoIdentificacion}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Precio</label>
                            <input class="form-control" type="text" value="{{cn.telefono}}" disabled="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Costo</label>
                            <input class="form-control" type="text" value="{{cn.direccion}}" disabled="">
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

                        <tr ng-repeat = "contacto in cn.contactos">  
                            <td>{{ contacto.identificacion}}</td>  
                            <td>{{ contacto.nombre}}</td>  
                            <td>{{ contacto.apellido}}</td>  
                            <td>{{ contacto.genero}}</td>  
                            <td>{{ contacto.tipoIdentificacion}}</td>  
                            <td>{{ contacto.telefono}}</td>  
                            <td>{{ contacto.direccion}}</td>  
                            <td>{{ contacto.correo}}</td>  
                        </tr>  
                    </table> 
                </div>
            </div>
        </div>
    </body>
    <script>
        var app = angular.module('demoCiclo3', []);
        app.controller('contactosController', ['$http', controladorContactos]);
        function controladorContactos($http) {
            var cn = this;
            cn.listarContactos = function () {
                var url = "Peticiones.jsp";
                var params = {
                    proceso: "listarcontacto"
                };
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: params
                }).then(function (res) {
                    cn.contactos = res.data.Contactos;
                });
            };
            cn.guardarContacto = function () {
                var contacto = {
                    proceso: "guardarContacto",
                    identificacion: cn.identificacion,
                    nombre: cn.nombre,
                    apellido: cn.apellido,
                    genero: cn.genero,
                    tipoIdentificacion: cn.tipoIdentificacion,
                    telefono: cn.telefono,
                    direccion: cn.direccion,
                    correo: cn.correo
                };
                console.log(contacto);
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: contacto
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[contacto.proceso] === true) {
                            alert("Guardado con ??xito");
                           cn.listarContactos();
                        } else {
                            alert("No se guardo Por favor vefifique sus datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });

            };
            cn.eliminarContacto = function () {
                var contacto = {
                    proceso: "eliminarcontacto",
                    identificacion: cn.identificacion
                };
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: contacto
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[contacto.proceso] === true) {
                            alert("Eliminado con ??xito");
                            //                                cn.listarContactos();
                        } else {
                            alert("Por favor vefifique sus datos");
                        }
                    } else {
                        alert(res.data.errorMsg);
                    }
                });

            };
            cn.actualizarContacto = function () {

                var contacto = {
                    proceso: "actualizarcontacto",
                    identificacion: cn.identificacion,
                    nombre: cn.nombre,
                    apellido: cn.apellido,
                    genero: cn.genero,
                    tipoIdentificacion: cn.tipoIdentificacion,
                    telefono: cn.telefono,
                    direccion: cn.direccion,
                    correo: cn.correo
                };
                $http({
                    method: 'POST',
                    url: 'Peticiones.jsp',
                    params: contacto
                }).then(function (res) {
                    if (res.data.ok === true) {
                        if (res.data[contacto.proceso] === true) {
                            alert("actualizarcontacto con ??xito");
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
