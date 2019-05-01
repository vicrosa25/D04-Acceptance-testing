<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<!-- Listing Grid -->
<display:table name="items" id="row" requestURI="${requestURI}" pagesize="5" class="displaytag">

	<!-- Edit -->
	<spring:message code="item.edit" var="editHeader" />
	<display:column title="${editHeader}">
		<a href="iteml/provider/edit.do?itemId=${row.id}"> <spring:message code="item.edit" /></a>
	</display:column>


	<!-- Name -->
	<spring:message code="item.name" var="nameHeader" />
	<display:column property="name" title="${nameHeader}" />

	<!-- Description -->
	<spring:message code="item.description" var="descriptionHeader" />
	<display:column property="description" title="${descriptionHeader}" />

	<!-- Link -->
	<spring:message code="item.link" var="linkHeader" />
	<display:column property="link" title="${linkHeader}" />
	
	<!-- Remove -->
	<spring:message code="item.remove.item" var="removeHeader" />
	<display:column title="${removeHeader}">
		<a href="item/provider/delete.do?itemId=${row.id}"> <spring:message code="item.remove.item" /></a>
	</display:column>

</display:table>


<!-- Add Social Profile -->
<a href=item/provider/create.do><spring:message code="item.create" /></a>



