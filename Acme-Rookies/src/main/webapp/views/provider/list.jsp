<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!-- Listing Grid -->
<display:table name="providers" id="row" requestURI="${ requestUri }" pagesize="5" class="displaytag">

	<!-- make -->
	<spring:message code="provider.make" var="makeHeader" />
	<display:column property="make" title="${makeHeader}" />
	
	<!-- Spammer -->
	<security:authorize access="hasRole('ADMIN')">
	<spring:message code="provider.spammer" var="spammerHeader" />
	<display:column title="${spammerHeader}">
		<jstl:choose>
			<jstl:when test="${row.isSpammer != null}">
				<jstl:if test="${row.isSpammer}">
				<spring:message code="provider.true" var="trueVar" />
					${trueVar}
				</jstl:if>
				<jstl:if test="${!row.isSpammer}">
				<spring:message code="provider.false" var="falseVar" />
					${falseVar}
				</jstl:if>
			</jstl:when>
			<jstl:otherwise>
				N/A
			</jstl:otherwise>
		</jstl:choose>
	</display:column>
	</security:authorize>

	<!-- name -->
	<spring:message code="provider.name" var="nameHeader" />
	<display:column property="name" title="${nameHeader}" />

	<!-- surname -->
	<spring:message code="provider.surname" var="surnameHeader" />
	<display:column property="surname" title="${surnameHeader}" />

	<!-- email -->
	<spring:message code="provider.email" var="emailHeader" />
	<display:column property="email" title="${emailHeader}" />


	<!-- items -->
	<display:column>
		<a href="item/provider.do?providerId=${row.id}">
			<spring:message code="provider.items" />
		</a>
	</display:column>

</display:table>