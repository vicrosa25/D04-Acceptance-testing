<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<!-- Listing Grid -->
<display:table name="items" id="row" requestURI="${requestURI}" pagesize="5" class="displaytag">

	<!-- Edit -->
	<security:authorize access="hasRole('PROVIDER')">
	<spring:message code="item.edit" var="editHeader" />
	<display:column title="${editHeader}">
		<a href="item/provider/edit.do?itemId=${row.id}"> <spring:message code="item.edit" /></a>
	</display:column>
	</security:authorize>


	<!-- Name -->
	<spring:message code="item.name" var="nameHeader" />
	<display:column property="name" title="${nameHeader}" />

	<!-- Description -->
	<spring:message code="item.description" var="descriptionHeader" />
	<display:column property="description" title="${descriptionHeader}" />

	<!-- Link -->
	<spring:message code="item.link" var="linkHeader" />
	<display:column property="link" title="${linkHeader}" />
	
	<!-- Display -->
	<spring:message code="item.display.item" var="dispalyHeader" />
	<display:column title="${displayHeader}">
		<a href="item/display.do?itemId=${row.id}"><spring:message code="item.display" /></a>
	</display:column>

</display:table>


<!-- Add Item -->
<security:authorize access="hasRole('PROVIDER')">
<a href=item/provider/create.do><spring:message code="item.create" /></a>
</security:authorize>


