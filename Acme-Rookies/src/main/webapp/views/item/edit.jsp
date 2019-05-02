<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="item/provider/edit.do" modelAttribute="item">

	<%-- Hidden properties--%>
	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="provider" />
	<form:hidden path="pictures" />
	

	<%-- Name --%>
	<acme:textbox code="item.name" path="name" />
	<br>

	<%-- Description --%>
	<acme:textbox code="item.description" path="description" />
	<br>

	<%-- link --%>
	<acme:textbox code="item.link" path="link" />
	<br>


	<%-- Buttons --%>

	<input type="submit" name="save" value="<spring:message code="item.save"/>" />

	<jstl:if test="${item.id != 0 }">
		<input type="submit" name="delete" value="<spring:message code="item.remove"/>" />
	</jstl:if>

	<input type="button" name="cancel"
		value="<spring:message code="item.cancel" />"
		onClick="javascript: window.location.replace('item/provider/list.do')" />
	<br>
	<br>

</form:form>

