<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!-- Listing Grid -->
<display:table name="audits" id="row" pagesize="5" class="displaytag">

	<!-- moment -->
	<spring:message code="audit.moment" var="momentHeader" />
	<display:column property="moment" title="${momentHeader}" format="{0,date,dd/MM/yyyy}" />
	
	<!-- text -->
	<spring:message code="audit.text" var="textHeader" />
	<display:column property="text" title="${textHeader}" />
	
	<!-- score -->
	<spring:message code="audit.score" var="scoreHeader" />
	<display:column property="score" title="${scoreHeader}" />
	
	<!-- status 
	<spring:message code="audit.status" var="statusHeader" />
	<display:column title="${deadlineHeader}">
			<jstl:if test="${row.finalMode}">
				<spring:message code="audit.finalMode" />
			</jstl:if>
			<jstl:if test="${not row.finalMode}">
				<spring:message code="audit.draftMode" />
			</jstl:if>
	</display:column>-->
		
	<!-- Display -->
	<spring:message code="audit.display" var="displayHeader" />
	<display:column title="${ displayHeader }">
		<a href="audit/auditor/display.do?auditId=${row.id}">
		<spring:message code="audit.display" /></a>
	</display:column>
	
	<!-- Editar -->	
	<spring:message code="audit.edit" var="editHeader" />
	<display:column title="${editHeader}">
			<jstl:if test="${not row.finalMode}">
				<a href="audit/auditor/edit.do?auditId=${row.id}">
				<spring:message code="audit.edit" /></a>
			</jstl:if>
			<jstl:if test="${row.finalMode}">
				<spring:message code="audit.finalMode" />
			</jstl:if>
	</display:column>
	
	
	<!-- Borrar -->	
	<spring:message code="audit.delete" var="deleteHeader" />
	<display:column title="${deleteHeader}">
			<jstl:if test="${not row.finalMode}">
				<a href="audit/auditor/delete.do?auditId=${row.id}">
				<spring:message code="audit.delete" /></a>
			</jstl:if>
			<jstl:if test="${row.finalMode}">
				<spring:message code="audit.finalMode" />
			</jstl:if>
	</display:column>
</display:table>

<!-- Create Link -->
<security:authorize access="hasRole('AUDITOR')">
	<a href=audit/auditor/create.do><spring:message code="audit.create" /></a>
</security:authorize>