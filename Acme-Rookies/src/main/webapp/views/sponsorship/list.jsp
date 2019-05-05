<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<display:table name="sponsorships" id="row" requestURI="sponsorship/provider/list.do" pagesize="5" class="displaytag">
	<!-- banner -->
	<spring:message code="sponsorship.banner" var="bannerHeader" />
	<display:column property="banner" title="${bannerHeader}"/>

	<!-- creditCard -->
	<spring:message code="sponsorship.targetPage" var="targetPageHeader" />
	<display:column property="targetPage" title="${targetPageHeader}" />

	<!-- creditCard -->
	<spring:message code="sponsorship.creditCard" var="creditCardHeader" />
	<display:column property="creditCard" title="${ creditCardHeader }" />
	
	<!-- position -->
	<spring:message code="sponsorship.position" var="positionHeader" />
	<display:column property="position.title" title="${positionHeader}"/>
	
								<!-- ACTIONS -->
	<!-- Display -->
	<spring:message code="sponsorship.display" var="displayHeader" />
	<display:column title="${displayHeader}" >
		<a href="sponsorship/provider/display.do?sponsorshipId=${row.id}">
			<spring:message code="sponsorship.display" /></a>
	</display:column>
	
	<!-- Edit -->
	<spring:message code="sponsorship.edit" var="editHeader" />
	<display:column title="${editHeader}" >
		<a href="sponsorship/provider/edit.do?sponsorshipId=${row.id}">
			<spring:message code="sponsorship.edit" /></a>
	</display:column>
</display:table>

<a href=sponsorship/provider/create.do><spring:message code="sponsorship.create" /></a>