
<%@ page import="helloworld.Todolist" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'todolist.label', default: 'Todolist')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-todolist" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-todolist" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'todolist.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="sharing" title="${message(code: 'todolist.sharing.label', default: 'Sharing')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'todolist.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'todolist.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${todolistInstanceList}" status="i" var="todolistInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${todolistInstance.id}">${fieldValue(bean: todolistInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: todolistInstance, field: "sharing")}</td>
					
						<td><g:formatDate date="${todolistInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: todolistInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${todolistInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
