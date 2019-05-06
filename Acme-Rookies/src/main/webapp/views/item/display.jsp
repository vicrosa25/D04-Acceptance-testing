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
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>




<%-- Items table --%>
<display:table name="item" id="row" requestURI="item/provider/display.do" class="displaytag">

	<%-- Name --%>
	<spring:message code="item.name" var="nameHeader" />
	<display:column property="name" title="${nameHeader}" />

	<%-- Description --%>
 	<spring:message code="item.description" var="lastUpdateHeader" />
	<display:column property="description" title="${lastUpdateHeader}" />
	
	<%-- Link --%>
	<spring:message code="item.link" var="linkHeader" />
	<display:column property="link" title="${linkHeader}" />

</display:table>


<!-- Item's pictures table -->
<b><spring:message code="item.pictures.table"/></b>
<table>
	<jstl:forEach items="${item.pictures}" var="picture">
		<td><img src="${picture.link}" width="200" height="200" /></td>
	</jstl:forEach>
</table>


<!-- Add Picture -->
<security:authorize access="hasRole('PROVIDER')">
	<a href="item/provider/addPicture.do?itemId=${item.id}"><spring:message code="item.addPicture" /></a>
	
	<br><br>
	<%-- Button gotBack --%>
	<input type="button" name="goBack"
			value="<spring:message code="item.goBack" />"
			onClick="javascript: window.location.replace('item/provider/list.do')" />
	
</security:authorize>

<security:authorize access="hasAnyRole('HACKER', 'COMPANY', 'ADMIN', 'AUDITOR')">
	<br><br>
	<%-- Button gotBack --%>
	<input type="button" name="goBack"
			value="<spring:message code="item.goBack" />"
			onClick="javascript: window.location.replace('item/listAll.do')" />
</security:authorize>

<security:authorize access="isAnonymous()">
	<br><br>
	<%-- Button gotBack --%>
	<input type="button" name="goBack"
			value="<spring:message code="item.goBack" />"
			onClick="javascript: window.location.replace('item/listAll.do')" />
</security:authorize>



