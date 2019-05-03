<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<form:form action="audit/auditor/edit.do" modelAttribute="audit">
	
	<%-- Hidden properties--%>
	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="moment" />
	<form:hidden path="position" />
	
	<%-- Text--%>
	<acme:textbox code="audit.text" path="text" />
	<br>
	
	<%-- Score--%>
	<acme:numberbox code="audit.score" path="score" />
	<br>	

	<%-- finalMode --%>
	<form:label path="finalMode"><spring:message code="audit.finalMode" /></form:label>
	<form:select id="modeDropdown" path="finalMode">
		<form:option value="">--</form:option>
		<form:option value="0"><spring:message code="audit.false" /></form:option>
		<form:option value="1"><spring:message code="audit.true" /></form:option>
	</form:select>
	<form:errors class="error" path="finalMode" />
	<br>
	<br>
	
	<input type="submit" name="save" value="<spring:message code="audit.save"/>" />
	<acme:cancel code="audit.cancel" url="/audit/auditor/list.do" />
</form:form>
