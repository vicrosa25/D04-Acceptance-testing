<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<form:form action="provider/edit.do" modelAttribute="provider">

	<%-- Hidden properties from pruned provider--%>
	<form:hidden path="id" />

	<%-- Name --%>
	<acme:textbox code="provider.name" path="name" />
	<br>

	<%-- Surname --%>
	<acme:textbox code="provider.surname" path="surname" />
	<br>

	<%-- Photo --%>
	<acme:textbox code="company.photo" path="photo" />
	<br>

	<%-- Phone --%>
	<acme:textbox code="company.phone" path="phoneNumber" />
	<br>

	<%-- email --%>
	<acme:textbox code="provider.email" path="email" />
	<br>

	<%-- Address --%>
	<acme:textbox code="company.address" path="address" />
	<br>

	<%-- Vat --%>
	<acme:textbox code="company.vat" path="vat" />
	<br>

	<%-- Card number --%>
	<acme:textbox code="company.cardNumber" path="cardNumber" />
	<br>

	<%-- Make --%>
	<acme:textbox code="provider.make" path="make" />
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
	<input type="submit" name="save"
		value="<spring:message code="provider.save"/>"
		onClick="javascript: return phoneNumberValidator()" />
	
	<acme:cancel code="provider.cancel" url="/" />
	<acme:cancel code="company.delete" url="/provider/delete.do" />
	<acme:cancel code="company.export" url="/provider/generatePDF.do" />
</form:form>