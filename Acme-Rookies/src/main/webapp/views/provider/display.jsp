<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<display:table name="provider" id="row" requestURI="provider/display.do" class="displaytag">

	<!-- Name -->
	<spring:message code="provider.name" var="nameHeader" />
	<display:column property="name" title="${nameHeader}" sortable="false" />
	
	<!-- Surname -->
	<spring:message code="provider.surname" var="surnameHeader" />
	<display:column property="surname" title="${surnameHeader}" sortable="false" />
	
	<!-- Email -->
	<spring:message code="provider.email" var="emailHeader" />
	<display:column property="email" title="${emailHeader}" sortable="false" />
	
	<!-- Phonenumber -->
	<spring:message code="company.phone" var="phoneNumberHeader" />
	<display:column property="phoneNumber" title="${phoneNumberHeader}" sortable="false" />

	<!-- make -->
	<spring:message code="provider.make" var="makeHeader" />
	<display:column property="make" title="${makeHeader}" />
	
	<!-- Spammer -->
	<security:authorize access="hasRole('ADMIN')">
	<spring:message code="company.spammer" var="spammerHeader" />
	<display:column title="${spammerHeader}">
		<jstl:choose>
			<jstl:when test="${row.isSpammer != null}">
				<jstl:if test="${row.isSpammer}">
				<spring:message code="company.true" var="trueVar" />
					${trueVar}
				</jstl:if>
				<jstl:if test="${!row.isSpammer}">
				<spring:message code="company.false" var="falseVar" />
					${falseVar}
				</jstl:if>
			</jstl:when>
			<jstl:otherwise>
				N/A
			</jstl:otherwise>
		</jstl:choose>
	</display:column>
	</security:authorize>
	
</display:table>


<jstl:if test="${not empty provider.items}">
<display:table name="provider.items" id="row" requestURI="provider/display.do" class="displaytag">
	
	<!-- Title -->
	<spring:message code="item.name" var="nameHeader" />
	<display:column property="name" title="${nameHeader}" sortable="false" />
	
	<!-- description -->
	<spring:message code="item.description" var="descriptionHeader" />
	<display:column property="description" title="${descriptionHeader}" sortable="false" />
	<display:caption><spring:message code="provider.items"/></display:caption>
</display:table>
<br>
</jstl:if>
<br>
<acme:back code="rookie.goback"/>