<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="message/admin/broadcast.do" modelAttribute="mesage">

	<security:authorize access="hasRole('ADMIN')">

		<%-- Hidden properties from message--%>
		<form:hidden path="id" />
		<form:hidden path="version" />
		<form:hidden path="sender" />
		<form:hidden path="moment" />
		<form:hidden path="recipients" />
		<form:hidden path="tags" />
		<form:hidden path="isNotification" />


		<%-- Subject --%>
		<form:label path="subject">
			<spring:message code="message.subject" />
		</form:label>
		<form:input path="subject" />
		<form:errors class="error" path="subject" />
		<br>
		<br>

		<form:label path="priority">
			<spring:message code="message.priority" />
		</form:label>
		<form:select id="priorityDropdown" path="priority">
			<form:option value="0">--Select Priority--</form:option>
			<form:option value="LOW">LOW</form:option>
			<form:option value="MEDIUM">MEDIUM</form:option>
			<form:option value="HIGH">HIGH</form:option>
		</form:select>
		<form:errors class="error" path="priority" />
		<br>
		<br>

		<%-- Body --%>
		<form:label path="body">
			<spring:message code="message.body" />
		</form:label>
		<form:textarea path="body" />
		<form:errors class="error" path="body" />
		<br>
		<br>


		<%-- Buttons --%>
		<input type="submit" name="send"
			value="<spring:message code="message.send"/>" />

		<input type="button" name="cancel"
			value="<spring:message code="message.cancel" />"
			onClick="javascript: window.location.replace('message/list.do')" />

		<br>
		<br>
	</security:authorize>
</form:form>