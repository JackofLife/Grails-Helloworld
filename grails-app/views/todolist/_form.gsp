<%@ page import="helloworld.Todolist" %>



<div class="fieldcontain ${hasErrors(bean: todolistInstance, field: 'todoitem', 'error')} required">
	<label for="todoitem">
		<g:message code="todolist.todoitem.label" default="Todoitem" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="todoitem" required="" value="${todolistInstance?.todoitem}"/>

</div>

