<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>PC 03</title>
</head>
<body> 

 <div class="container">
 <h1>Crud de Docente</h1>
		 <div class="col-md-23" >  
			  	<form id="idFormElimina" action="eliminaDocente">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaDocente" class="simple_form" id="defaultForm2"  method="post">
							
						<div class="row">
						<div class="col-md-3">	
							<div class="form-group">
							  	<label class="control-label" for="id_nonbre_filtro">NOMBRE</label>
							  	<input class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="100"/>
							</div>
						</div>
					</div>			
							
							
					<div class="row">	
					<div class="col-md-3">
							<button type="submit" class="btn btn-primary" id="validateBtnw1" >FILTRA</button><br>&nbsp;<br>
						</div>					
						<div class="col-md-3">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" >REGISTRA</button><br>&nbsp;<br>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="tableAlumno" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Nombre</th>
												<th>Dni</th>
												<th>Fecha Nac</th>
												<th>Sueldo</th>
												<th>e-mail</th>
												<th>Sexo</th>
												<th>Categoria</th>
												<th>Actualiza</th>
												<th>Elimina</th>
											</tr>
										</thead>
										<tbody>
												   
												<c:forEach items="${docentes}" var="x">
													<tr>
														<td>${x.idDocente}</td>
														<td>${x.nombre}</td>
														<td>${x.dni}</td>
														<td>${x.fechaNacimiento}</td>
														<td>${x.sueldo}</td>
														<td>${x.email}</td>
														<td>${x.sexo}</td>
														<td>${x.categoria.nombre}</td>														
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idDocente}','${x.nombre}','${x.dni}','${x.fechaNacimiento}','${x.sueldo}','${x.email}','${x.sexo}','${x.categoria.idCategoria}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' id='id_update' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idDocente}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/delete.gif' width='auto' height='auto' />
															</button>
														</td>
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
  
  	 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Docente</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaDocente" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Docente</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_dni">Dni</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_dni" name="dni" placeholder="Ingrese el número de dni" type="text" maxlength="8"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_num_mujeres">Fecha de Nacimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_fechaNacimiento" name="fechaNacimiento" placeholder="ingresefecha de nacimiento" type="text"maxlength="10" />
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_maxima">Sueldo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_sueldo" name="sueldo" placeholder="Ingrese sueldo" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_email">E mail</label>
		                                        <div class="col-lg-5">
													<input  class="form-control" id="id_reg_email" name="email" placeholder="Ingrese email" type="email" maxlength="150"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_sexo">Sexo</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_sexo" name="sexo" class='form-control'>
							                            	<option value="No seleccionado">[Seleccione]</option>
							                            	<option value="Masculino">Masculino</option>
							                            	<option value="Femenino">Femenino</option>
							                         </select>
													
		                                        </div>
		                                    </div>  
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_categori">Categoria</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_categoria" name="categoria.idCategoria" class='form-control'>
							                            	<option value="">[Seleccione]</option>							                            	
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">REGISTRA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
  
   <div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Docente</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaDocente" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Modalidad</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID Docente</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idDocente" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_dni">Dni</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_dni" name="dni" placeholder="Ingrese el número de dni" type="text" maxlength="8"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_num_mujeres">Fecha de Nacimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_fechaNacimiento" name="fechaNacimiento" placeholder="ingresefecha de nacimiento" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_maxima">Sueldo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_sueldo" name="sueldo" placeholder="Ingrese sueldo" type="text"maxlength="10" />
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_email">E mail</label>
		                                        <div class="col-lg-5">
													<input  class="form-control" id="id_act_email" name="email" placeholder="Ingrese email" type="email" maxlength="150"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_sexo">Sexo</label>
		                                        <div class="col-lg-5">
													<select id="id_act_sexo" name="sexo" class='form-control'>
							                            	<option value="">[Seleccione]</option>
							                            	<option value="Masculino">Masculino</option>
							                            	<option value="Femenino">Femenino</option>
							                         </select>
													
		                                        </div>
		                                    </div>  
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_categori">Categoria</label>
		                                        <div class="col-lg-5">
													<select id="id_act_categoria" name="categoria.idCategoria" class='form-control'>
							                            	<option value="">[Seleccione]</option>							                            	
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">ACTUALIZA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        </div>

		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
		 

</div>



<script type="text/javascript">

$.getJSON("cargaCategoria", {}, function(data,q,t){
	console.log(data);
	
	$.each(data, function(index,item){
		$("#id_reg_categoria").append("<option value="+ item.idCategoria +">"+ item.nombre +"</option>");	
		$("#id_act_categoria").append("<option value="+ item.idCategoria +">"+ item.nombre +"</option>");		
	});
	
});

function eliminar(id){	
	$('input[id=id_elimina]').val(id);
	$('#idFormElimina').submit();
}

function registrar(){	
	$('#idModalRegistra').modal("show");}

function editar(id,nombre,dni,fechaNacimiento,sueldo, email,sexo,idCategoria){	
	$('input[id=id_ID]').val(id);
	$('input[id=id_act_nombre]').val(nombre);
	$('input[id=id_act_dni]').val(dni);
	$('input[id=id_act_fechaNacimiento]').val(fechaNacimiento);
	$('input[id=id_act_sueldo]').val(sueldo);
	$('input[id=id_act_email]').val(email);
	$('input[id=id_act_sexo]').val(sexo);
	$('select[id=id_act_categoria]').val(idCategoria);
	$('#idModalActualiza').modal("show");
}


$(document).ready(function() {
    $('#tableAlumno').DataTable();
} );
</script>

<script type="text/javascript">
	$('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"nombre": {
        		selector : '#id_reg_nombre',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El nombre es de 3 a 100 caracteres',
                    	min : 3,
                    	max : 100
                    }
                }
            },
            "fechaNacimiento": {
        		selector : '#id_reg_fechaNacimiento',
                validators: {
                	notEmpty : {
						message : 'fechaEvento es un campo obligatorio'
					},
					regexp : {
						regexp : /^\d{4}([\-/.])(0?[1-9]|1[1-2])\1(3[01]|[12][0-9]|0?[1-9])$/,
						message : 'Fecha es aa-mm-dd'
					}
                }
            },
            "sueldo": {
        		selector : '#id_reg_sueldo',
                validators: {
                	notEmpty : {
						message : 'sueldo es un campo obligatorio'
					},
					regexp : {
						regexp : /^[0-9]*\.?[0-9]{1,2}$/,
						message : 'sueldo es decimal'
					}
                }
            },
            "dni": {
        		selector : '#id_reg_dni',
                validators: {
                	notEmpty : {
						message : 'El dni es un campo obligatorio'
					},
					regexp : {
						regexp : /^[0-9]{8}$/,
						message : 'El dni es  entero de 8 caracteres'
					}
                }
            },
           
            
            "categoria.idCategoria": {
        		selector : '#id_reg_categoria',
                validators: {
                	notEmpty: {
                        message: 'la categoria es un campo obligatorio'
                    },
                }
            },
            "sexo": {
        		selector : '#id_reg_sexo',
                validators: {
                	notEmpty: {
                        message: 'el sexo es un campo obligatorio'
                    },
                }
            },
        	
        }   
    });
</script>

<script type="text/javascript">
	$('#id_form_actualiza').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"nombre": {
        		selector : '#id_act_nombre',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El nombre es de 3 a 100 caracteres',
                    	min : 3,
                    	max : 100
                    }
                }
            },
            "fechaNacimiento": {
        		selector : '#id_act_fechaNacimiento',
                validators: {
                	notEmpty : {
						message : 'fechaEvento es un campo obligatorio'
					},
					regexp : {
						regexp : /^\d{4}([\-/.])(0?[1-9]|1[1-2])\1(3[01]|[12][0-9]|0?[1-9])$/,
						message : 'Fecha es aa-mm-dd'
					}
                }
            },
            "sueldo": {
        		selector : '#id_act_sueldo',
                validators: {
                	notEmpty : {
						message : 'sueldo es un campo obligatorio'
					},
					regexp : {
						regexp : /^[0-9]*\.?[0-9]{1,2}$/,
						message : 'sueldo es decimal'
					}
                }
            },
            "dni": {
        		selector : '#id_act_dni',
                validators: {
                	notEmpty : {
						message : 'El dni es un campo obligatorio'
					},
					regexp : {
						regexp : /^[0-9]{8}$/,
						message : 'El dni es  entero de 8 caracteres'
					}
                }
            },
           
            
            "categoria.idCategoria": {
        		selector : '#id_act_categoria',
                validators: {
                	notEmpty: {
                        message: 'la categoria es un campo obligatorio'
                    },
                }
            },
            "sexo": {
        		selector : '#id_act_sexo',
                validators: {
                	notEmpty: {
                        message: 'el sexo es un campo obligatorio'
                    },
                }
            },
        	
        }   
    });
</script>

    
</body>
</html> 