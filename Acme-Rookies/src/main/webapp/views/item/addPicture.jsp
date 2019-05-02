<%--
 * action-2.jsp
 *
 * Copyright (C) 2018 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<form:form action="item/provider/addPicture.do" modelAttribute="url">

	<security:authorize access="hasRole('PROVIDER')">
	
		<%-- Hidden properties--%>
		<form:hidden path="targetId" />

		<%-- Link--%>
		<form:label path="link">
			<spring:message code="item.link" />
		</form:label>
		<form:input path="link" />
		<form:errors class="error" path="link" />
		<br>
		<br>


		<%-- Buttons --%>

		<input type="submit" name="save" value="<spring:message code="item.save"/>" />
		
		<input type="button" name="cancel"
			value="<spring:message code="item.cancel" />"
			onClick="javascript: window.location.replace('item/display.do?itemId=${item.id}')" />
	<br><br>
	
	
	</security:authorize>
	
</form:form>

