<%@ page import="helloworld.Todolist" %>



<div class="fieldcontain ${hasErrors(bean: todolistInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="todolist.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${todolistInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: todolistInstance, field: 'sharing', 'error')} required">
	<label for="sharing">
		<g:message code="todolist.sharing.label" default="Sharing" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sharing" from="${todolistInstance.constraints.sharing.inList}" required="" value="${todolistInstance?.sharing}" valueMessagePrefix="todolist.sharing"/>

</div>

<div class="fieldcontain ${hasErrors(bean: todolistInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="todolist.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${todolistInstance?.name}"/>

</div>

