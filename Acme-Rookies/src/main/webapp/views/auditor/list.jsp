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

<display:table name="auditors" id="row" requestURI="${requestURI}" pagesize="5" class="displaytag">

	<spring:message code="auditor.name" var="nameHeader" />
	<display:column property="name" title="${nameHeader}" />

	<spring:message code="auditor.surname" var="surnameHeader" />
	<display:column property="surname" title="${surnameHeader}" />
	
	<spring:message code="auditor.vat" var="vatHeader" />
	<display:column property="vat" title="${vatHeader}" />
	
	<spring:message code="auditor.cardNumber" var="cardNumberHeader" />
	<display:column property="cardNumber" title="${cardNumberHeader}" />
	
	<spring:message code="auditor.email" var="emailHeader" />
	<display:column property="email" title="${emailHeader}" />
	
	<spring:message code="auditor.phone" var="phoneHeader" />
	<display:column property="phoneNumber" title="${phoneHeader}" />
	
	<spring:message code="auditor.address" var="addressHeader" />
	<display:column property="address" title="${addressHeader}" />

</display:table>

<security:authorize access="hasRole('ADMIN')">
	<a href=auditor/create.do><spring:message code="auditor.create" /></a>
</security:authorize>