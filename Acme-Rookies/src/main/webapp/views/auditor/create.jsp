<%--
 * action-2.jsp
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
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<form:form action="auditor/admin/create.do" modelAttribute="auditor">

	<%-- Hidden properties from actor--%>
	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="userAccount.Authorities" />
	<form:hidden path="messages" />

	<%-- UserAccount--%>

	<%-- username--%>
	<form:label path="userAccount.username">
		<spring:message code="auditor.username" />
	</form:label>
	<form:input path="userAccount.username" />
	<form:errors class="error" path="userAccount.username" />
	<br>
	<br>

	<%-- password--%>
	<form:label path="userAccount.password">
		<spring:message code="auditor.password" />
	</form:label>
	<form:password path="userAccount.password" />
	<form:errors class="error" path="userAccount.password" />
	<br>
	<br>

	<%-- Name --%>
	<form:label path="name">
		<spring:message code="auditor.name" />
	</form:label>
	<form:input path="name" />
	<form:errors class="error" path="name" />
	<br>
	<br>


	<%-- Surname --%>
	<form:label path="surname">
		<spring:message code="auditor.surname" />
	</form:label>
	<form:input path="surname" />
	<form:errors class="error" path="surname" />
	<br>
	<br>
	
	<%-- Vat --%>
	<form:label path="vat">
		<spring:message code="auditor.vat" />
	</form:label>
	<form:input path="vat" />
	<form:errors class="error" path="vat" />
	<br>
	<br>
	
	<%-- Card Number --%>
	<form:label path="cardNumber">
		<spring:message code="auditor.cardNumber" />
	</form:label>
	<form:input path="cardNumber" />
	<form:errors class="error" path="cardNumber" />
	<br>
	<br>

	<%-- Photo --%>
	<form:label path="photo">
		<spring:message code="auditor.photo" />
	</form:label>
	<form:input path="photo" />
	<form:errors class="error" path="photo" />
	<br>
	<br>
	
	<%-- email --%>
	<form:label path="email">
		<spring:message code="auditor.email" />
	</form:label>
	<form:input path="email" />
	<form:errors class="error" path="email" />
	<br>
	<br>

	<%-- Phone --%>
	<form:label path="phoneNumber">
		<spring:message code="auditor.phone" />
	</form:label>
	<form:input path="phoneNumber" />
	<form:errors class="error" path="phoneNumber" />
	<br>
	<br>

	<%-- Address --%>
	<form:label path="address">
		<spring:message code="auditor.address" />
	</form:label>
	<form:input path="address" />
	<form:errors class="error" path="address" />
	<br>
	<br>


	<script type="text/javascript">
		function phoneNumberValidator() {

			var phoneNumber = document.getElementById("phoneNumber").value;

			var patternCCACPN = /^([+]\d{1,3}[(]\d{1,3}[)]\d{4,})/
			$;
			var patternCCPN = /^([+]\d{1,3}\d{4,})/
			$;
			var patternPN = /^(\d{4,})/
			$;

			if (patternCCACPN.test(phoneNumber))
				return true;
			else if (patternCCPN.test(phoneNumber))
				return true;
			else if (patternPN.test(phoneNumber))
				return true;
			else
				return confirm('<spring:message code="rookie.confirm"/>');
		}
	</script>
	<%-- Buttons --%>
	<security:authorize access="hasRole('ADMIN')">
		<input type="submit" name="save"
			value="<spring:message code="auditor.save" />"
			onClick="javascript: return phoneNumberValidator()" />

		<input type="button" name="cancel"
			value="<spring:message code="auditor.cancel" />"
			onClick="javascript: window.location.replace('auditor/admin/list.do')" />
	</security:authorize>
	<br>
	<br>
</form:form>
