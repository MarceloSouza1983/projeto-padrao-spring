<%@ include file="/template/header-sistema.jsp"%>


<fieldset>
	<legend><spring:message code="usuarios-list.titulo"/></legend>

<div class="btn-toolbar list-toolbar">
	<a href="${pageContext.request.contextPath}/usuarios/form/0">
		<button class="btn btn-primary" style="margin-left: 5px;">
			<i class="fa fa-plus"></i>&nbsp;<spring:message code="usuarios-list.label.cadastrar"/> 
		</button></a>	
		<button class="btn btn-primary" style="margin-left: 5px;" data-toggle="modal" data-target="#findModal">
			<i class="fa fa-search"></i>&nbsp;<spring:message code="usuarios-list.pesquisar"/>
		</button>		
	<div class="btn-group"></div>
</div>

<table class="table table-striped table-bordered" id="dataTable">
	<thead>
		<tr>
			<th><spring:message code="usuarios-list.label.nome" /></th>
			<th><spring:message code="usuarios-list.label.email" /></th>
			<th><spring:message code="usuarios-list.label.perfis" /></th>
			<th><spring:message code="usuarios-list.label.acoes" /></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${listaUsuarios}" var="user">
			<tr>
				<td>${user.name}</td>
				<td>${user.email}</td>
				<td>
					<ul>
						<c:forEach items="${user.perfis}" var="perfil">
							<li >${perfil.nome}</li>
						</c:forEach>
					</ul>
				</td>
				<td style="text-align: center;">
				<c:if test = "${not user.admin}">
					<a href="${pageContext.request.contextPath}/usuarios/delete/${user.id}" onclick="return confirm('<spring:message code="usuarios-list.msg.excluir" /> ${user.name}?')"><i class="fa fa-trash fa-2x"></i></a> &nbsp;&nbsp;&nbsp; 
					<a href="${pageContext.request.contextPath}/usuarios/form/${user.id}"><i class="fa fa-pencil-square-o fa-2x"></i></a></td>
				</c:if>
			</tr>
		</c:forEach>
	</tbody>
</table>

<div class="modal fade" id="findModal" tabindex="-1" role="dialog" aria-labelledby="findModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><spring:message code="usuarios-list.modal.titulo" /></h4>
      </div>
      <div class="modal-body">
      
        <form:form modelAttribute="adminUserSearch" servletRelativeAction="/usuarios/find" method="post">
				
			<div class="row">	
				<div class="form-group col-md-12">
					<label><spring:message code="usuarios-list.modal.label" />:</label> <input type="text" name="textotPesquisa" class="form-control"/>
				</div>				
			</div>
	        
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal">&nbsp;<spring:message code="usuarios-list.btn.fechar" />&nbsp;</button>
	        <button type="submit" class="btn btn-primary"><spring:message code="usuarios-list.btn.pesquisar" /></button>
	      </div>
		</form:form>        
      </div>
    </div>
  </div>
</div>

</fieldset>
<%@ include file="/template/footer-sistema.jsp"%>