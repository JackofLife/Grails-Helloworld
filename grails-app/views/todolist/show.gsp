
<%@ page import="helloworld.Todolist" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'todolist.label', default: 'Todolist')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-todolist" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-todolist" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list todolist">
			
				<g:if test="${todolistInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="todolist.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${todolistInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${todolistInstance?.sharing}">
				<li class="fieldcontain">
					<span id="sharing-label" class="property-label"><g:message code="todolist.sharing.label" default="Sharing" /></span>
					
						<span class="property-value" aria-labelledby="sharing-label"><g:fieldValue bean="${todolistInstance}" field="sharing"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${todolistInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="todolist.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${todolistInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${todolistInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="todolist.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${todolistInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:todolistInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${todolistInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
