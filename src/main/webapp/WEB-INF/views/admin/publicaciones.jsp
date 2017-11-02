<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<c:set var="user" value="${user}" scope="request" /> <!-- Esto envia variables a las vistas de los includes -->
<c:set var="vista" value="admin" scope="request" />
<c:set var="var" value="${var}" scope="request" />
<%@ include file="/WEB-INF/views/header.jsp" %>
								  
 <!-- main col right -->
 <div class="col-sm-9">
 <c:if test="${var.cont == 1 && not empty var.mensaje}">
 	<div class="panel panel-default">
   	  <div class="panel-heading"><h4>${var.mensaje}</h4></div>
   </div>
                                        
</c:if>

 
   <div class="panel panel-default">
   	  <div class="panel-heading"><h4>Publicaciones</h4></div>
	  <div class="panel-body">
		<div class="clearfix"></div>
		
		<table id="publicaciones" class="table table-striped table-bordered" cellspacing="0" width="100%">
			<thead>
	            <tr>
	            	<th>Fecha</th>
	            	<th>Usuario</th>
	 				<th>Texto</th>
	 				<th>Editar</th>
	 				<th>Eliminar</th>
	            </tr>
	        </thead>
	        <tfoot>
	            <tr>
	            	<th>Fecha</th>
	                <th>Usuario</th>
	 				<th>Texto</th>
	 				<th>Editar</th>
	 				<th>Eliminar</th>
	            </tr>
	        </tfoot>
	        <tbody>
	
	 		<c:forEach items="${publicaciones}" var="publicacion">
	 			<tr>
	 				<td><c:out value="${publicacion.fecha}"/></td>
	 			    <td><c:out value="${publicacion.unombre}"/></td>
	 			    <td><c:out value="${publicacion.texto}"/></td>
	 			    <td>
	 				<form action="${var.url}/admin/editarPublicacion" method="post">
		 			    <input type="text" id="id" name="id" hidden="hidden" value="<c:out value="${publicacion.id}"/>">
		 			    <button type="submit" name="submit" value="submit" class="btn btn-warning">Editar</button>
	 			    </form></td>
	 			    
	 				<td>
	 				<form action="${var.url}/admin/borrarPublicacion" method="post">
		 			    <input type="text" id="id" name="id" hidden="hidden" value="<c:out value="${publicacion.id}"/>">
		 			    <button type="submit" name="submit" value="submit" class="btn btn-danger">Eliminar</button>
	 			    </form></td>

	 		  	</tr>
	 		</c:forEach>
	 			
	 		
	 		</tbody>
 		</table>
		
		<hr>
		
	  </div>
   </div>


 </div>
 
 <script src="${var.url}/resources/js/jquery-1.11.1.min.js"></script>
 <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
 <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
  
 <script>
 	$(document).ready(function() {
	    $('#publicaciones').DataTable();
	} );
 </script>

	
<%@ include file="/WEB-INF/views/footer.jsp" %>