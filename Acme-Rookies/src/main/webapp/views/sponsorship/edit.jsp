<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<form:form action="sponsorship/provider/edit.do" modelAttribute="sponsorship">
	
	<%-- Hidden properties from sponsorship--%>
	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="charge" />

	<%-- banner--%>
	<acme:textbox code="sponsorship.banner" path="banner" />
	<br>
	
	<%-- targetPage--%>
	<acme:textbox code="sponsorship.targetPage" path="targetPage" />
	<br>

	<%-- credit card--%>
	<form:label path="creditCard">
		<spring:message code="sponsorship.creditCard" />
	</form:label>	
	<form:input path="creditCard" type="number" />	
	<form:errors path="creditCard" cssClass="error" />
	<br>
	<br>	
		
	<!-- Select Position -->
	<acme:select items="${ positions }" itemLabel="title" code="sponsorship.position" path="position"/>
	<br>
	
	<jstl:if test="${empty positions}">
		<b><spring:message code="position.empty.list"/></b>
		<br>
	</jstl:if>
	<br>
	
	<input type="submit" name="save" value="<spring:message code="sponsorship.save"/>" />	
	<acme:cancel code="sponsorship.cancel" url="/sponsorship/provider/list.do" />
</form:form>