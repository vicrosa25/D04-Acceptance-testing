<%--
 * action-1.jsp
 *
 * Copyright (C) 2018 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>





<form:form action="administrator/rebranding.do" modelAttribute="mesage">
	
	<security:authorize access="hasRole('ADMIN')">

	<%-- Hidden properties from message--%>
	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="sender" />
	<form:hidden path="moment" />
	<form:hidden path="recipients" />
	<form:hidden path="tags" />
	<form:hidden path="isNotification" />
	<form:hidden path="subject" />
	<form:hidden path="priority" />
	<form:hidden path="body" />
	
	<input type="button" name="submit"
			value="<spring:message code="administrator.cancel" />"
			onClick="this.disabled = true;" />


	</security:authorize>
</form:form>