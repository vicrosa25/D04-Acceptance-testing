<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!-- Listing Grid -->
<display:table name="audits" id="row" pagesize="5" requestURI="audit/auditor/list.do" class="displaytag">

	<!-- moment -->
	<spring:message code="audit.moment" var="momentHeader" />
	<display:column property="moment" title="${momentHeader}" format="{0,date,dd/MM/yyyy}" />
	
	<!-- text -->
	<spring:message code="audit.text" var="textHeader" />
	<display:column property="text" title="${textHeader}" />
	
	<!-- score -->
	<spring:message code="audit.score" var="scoreHeader" />
	<display:column property="score" title="${scoreHeader}" />
		
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

<display:table name="positions" id="row" requestURI="audit/auditor/list.do" pagesize="5" class="displaytag">
	<!-- Title -->
	<spring:message code="position.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" />
	
	<!-- Ticker -->
	<spring:message code="position.ticker" var="tickerHeader" />
	<display:column property="ticker" title="${tickerHeader}" />
	
	<!-- Description -->
	<spring:message code="position.description" var="descriptionHeader" />
	<display:column property="description" title="${descriptionHeader}" />
	
	<!-- Deadline -->
	<spring:message code="position.deadline" var="deadlineHeader" />
	<display:column property="deadline" title="${deadlineHeader}" format="{0,date,dd/MM/yyyy}" />
	
	<!-- Profile -->
	<spring:message code="position.profile" var="profileHeader" />
	<display:column property="profile" title="${profileHeader}" />
	
	<!-- Skills -->
	<spring:message code="position.skills" var="skillsHeader" />
	<display:column property="skills" title="${skillsHeader}" />
	
	<!-- Technologies -->
	<spring:message code="position.technologies" var="technologiesHeader" />
	<display:column property="technologies" title="${technologiesHeader}" />
	
	<!-- Salary -->
	<spring:message code="position.salary" var="salaryHeader" />
	<display:column property="salary" title="${salaryHeader}" />

		
	<!-- Company -->
	<spring:message code="position.company" var="companyHeader" />
	<display:column title="${ companyHeader }">
		<a href="company/display.do?companyId=${row.company.id}">${row.company.commercialName}</a>
	</display:column>
	
	
	<!-- create audit -->
	<display:column>
				<a href="audit/auditor/create.do?positionId=${row.id}">
				<spring:message code="audit.create" /></a>
	</display:column>
	<display:caption><spring:message code="audit.positions"/></display:caption>
</display:table>