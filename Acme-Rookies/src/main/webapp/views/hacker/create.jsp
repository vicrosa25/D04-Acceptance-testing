<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="hacker/create.do" modelAttribute="hackerForm">

	<%-- UserAccount--%>

	<%-- username--%>
	<acme:textbox code="hacker.username" path="userAccount.username" />
	<br>

	<%-- password--%>
	<acme:password code="hacker.password" path="userAccount.password" />
	<br>

	<%-- Name --%>
	<acme:textbox code="hacker.name" path="name" />
	<br>

	<%-- Surname --%>
	<acme:textbox code="hacker.surname" path="surname" />
	<br>
	
	<%-- Vat --%>
	<acme:textbox code="hacker.vat" path="vat" />
	<br>
	
	<%-- Credit Card --%>
	<acme:textbox code="hacker.cardNumber" path="cardNumber" />
	<br>

	<%-- Photo --%>
	<acme:textbox code="hacker.photo" path="photo" />
	<br>

	<%-- Phone --%>
	<acme:textbox code="hacker.phone" path="phoneNumber" />
	<br>

	<%-- email --%>
	<acme:textbox code="hacker.email" path="email" />
	<br>

	<%-- Address --%>
	<acme:textbox code="hacker.address" path="address" />
	<br>
	
	<%-- Accept Legal term --%>
	<form:label path="accepted">
		<spring:message code="register.terms.accept" />
	</form:label>
	<form:checkbox path="accepted"/>
	<form:errors path="accepted" cssClass="error" />
	<br><br>

	<script type="text/javascript">
		function phoneNumberValidator() {

			var phoneNumber = document.getElementById("phoneNumber").value;

			var patternCCACPN = /^(\+[1-9][0-9]{0,2}) (\([1-9][0-9]{0,2}\)) (\d{3}\d+)/
			$;
			var patternCCPN = /^(\+[1-9][0-9]{0,2}) (\d{3}\d+)/
			$;
			var patternPN = /^(\d{3}\d+)/
			$;

			if (patternCCACPN.test(phoneNumber))
				return true;
			else if (patternCCPN.test(phoneNumber))
				return true;
			else if (patternPN.test(phoneNumber))
				return true;
			else
				return confirm('<spring:message code="administrator.confirm"/>');
		}
	</script>


	<%-- Buttons --%>
	<input type="submit" name="save"
		value="<spring:message code="hacker.save"/>" 
		onClick="javascript: return phoneNumberValidator()" />
	<acme:cancel code="hacker.cancel" url="/" />
</form:form>