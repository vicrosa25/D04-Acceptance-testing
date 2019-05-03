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

<display:table name="companies" id="row" requestURI="administrator/score.do" pagesize="5" class="displaytag">

	<spring:message code="administrator.commercialName" var="commercialNameHeader" />
	<display:column property="commercialName" title="${commercialNameHeader}" />
	
	
	<spring:message code="administrator.email" var="emailHeader" />
	<display:column property="email" title="${emailHeader}" />

<%-- 	<spring:message code="administrator.score" var="scoreHeader" /> --%>
<%-- 	<display:column property="score" title="${scoreHeader}" format="{0,number,0.00}" /> --%>
	
	<!-- Audit Score -->
	<spring:message code="administrator.score" var="scoreHeader" />
	<display:column title="${scoreHeader}">
		<jstl:choose>
			<jstl:when test="${row.score != null}">
				<jstl:out value="${row.score}" />
			</jstl:when>
			<jstl:otherwise>
				Nil
			</jstl:otherwise>
		</jstl:choose>
	</display:column>

	
</display:table>

<security:authorize access="hasRole('ADMIN')">
	<a href=administrator/computeScore.do><spring:message code="administrator.launchProcedure" /></a>
</security:authorize>