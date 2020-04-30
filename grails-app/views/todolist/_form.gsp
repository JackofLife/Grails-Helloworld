<%@ page import="helloworld.Todolist" %>



<div class="fieldcontain ${hasErrors(bean: todolistInstance, field: 'Todoitem', 'error')} required">
	<label for="Todoitem">
		<g:message code="todolist.todoitem.label" default="Todoitem" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="Todoitem" required="" value="${todolistInstance?.todoitem}"/>

</div>

