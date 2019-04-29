<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<form:form action="rookie/edit.do" modelAttribute="rookie">

	<%-- Hidden properties from rookie--%>
	<form:hidden path="id" />
	<form:hidden path="version" />
	
	<%-- Name --%>
	<acme:textbox code="rookie.name" path="name" />
	<br>

	<%-- Surname --%>
	<acme:textbox code="rookie.surname" path="surname" />
	<br>
	
	<%-- Vat --%>
	<acme:textbox code="rookie.vat" path="vat" />
	<br>
	
	<%-- CardNumber --%>
	<acme:textbox code="rookie.cardNumber" path="cardNumber" />
	<br>

	<%-- Photo --%>
	<acme:textbox code="rookie.photo" path="photo" />
	<br>

	<%-- Phone --%>
	<acme:textbox code="rookie.phone" path="phoneNumber" />
	<br>

	<%-- email --%>
	<acme:textbox code="rookie.email" path="email" />
	<br>

	<%-- Address --%>
	<acme:textbox code="rookie.address" path="address" />
	<br>

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
				return confirm('<spring:message code="rookie.confirm"/>');
		}
	</script>
	
	
	<%-- Buttons --%>
	<input type="submit" name="save" value="<spring:message code="rookie.save"/>"
		onClick="javascript: return phoneNumberValidator()" />	
	<acme:cancel code="rookie.cancel" url="/" />
	<acme:cancel code="rookie.delete" url="/rookie/delete.do" />
	<acme:cancel code="rookie.export" url="/rookie/generatePDF.do" />
</form:form>