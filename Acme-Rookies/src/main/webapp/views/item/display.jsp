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




<%-- Tutorial table --%>
<display:table name="tutorial" id="row" requestURI="tutorial/display.do" class="displaytag">

	<%-- Title --%>
	<spring:message code="tutorial.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" />

	<%-- LastUpdate --%>
 	<spring:message code="tutorial.lastUpdate" var="lastUpdateHeader" />
	<display:column property="lastUpdate" title="${lastUpdateHeader}" format="{0,date,dd/MM/yyyy HH:mm}"/>
	
	<%-- Summary --%>
	<spring:message code="tutorial.summary" var="summaryHeader" />
	<display:column property="summary" title="${summaryHeader}" />

</display:table>


<%-- HandyWorker table --%>
<display:table name="handyWorker"  id="row" requestURI="tutorial/display.do" class="displaytag">
	
	<display:caption><b><spring:message code="tutorial.handyWorker"/></b></display:caption>
	
	<spring:message code="handyWorker.photo" var="phoneHeader" />
	<display:column title="${phoneHeader}">
		<img src="${row.photo}" width="100" height="100" />
	</display:column>
	
	<spring:message code="handyWorker.username" var="usernameHeader" />
	<display:column property="userAccount.username" title="${usernameHeader}" />

	<spring:message code="handyWorker.name" var="nameHeader" />
	<display:column property="name" title="${nameHeader}" />

	<spring:message code="handyWorker.surname" var="surnameHeader" />
	<display:column property="surname" title="${surnameHeader}" />

	<spring:message code="handyWorker.email" var="emailHeader" />
	<display:column property="email" title="${emailHeader}" />
	
	<spring:message code="administrator.score" var="scoreHeader" />
	<display:column property="score" title="${scoreHeader}" format="{0,number,0.00}" />
	
</display:table>


<%-- HandyWorker Social Identity Table --%>
<display:table name="handyWorker.socialIdentities"  id="row" requestURI="tutorial/display.do" class="displaytag">
	
	<display:caption><b><spring:message code="tutorial.handyWorker.socialIdentities"/></b></display:caption>
	
	<spring:message code="customer.socialIdentities.nick" var="nickHeader" />
	<display:column property="nick" title="${nickHeader}" sortable="false" />

	<spring:message code="customer.socialIdentities.socialNetwork" var="socialNetworkHeader" />
	<display:column property="socialNetwork" title="${socialNetworkHeader}" sortable="false" />

	<spring:message code="customer.socialIdentities.link" var="linkHeader" />
	<display:column autolink="true" property="link" title="${linkHeader}" sortable="false" />
	
</display:table>


<%-- Worker's Tutorials table --%>
<display:table name="tutorials" id="row" requestURI="tutorial/display.do" class="displaytag">

	<display:caption><b><spring:message code="tutorial.handyWorker.tutorials"/></b></display:caption>
	
	<%-- Title --%>
	<spring:message code="tutorial.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" />

	<%-- LastUpdate --%>
 	<spring:message code="tutorial.lastUpdate" var="lastUpdateHeader" />
	<display:column property="lastUpdate" title="${lastUpdateHeader}" format="{0,date,dd/MM/yyyy HH:mm}"/>
	
	<%-- Summary --%>
	<spring:message code="tutorial.summary" var="summaryHeader" />
	<display:column property="summary" title="${summaryHeader}" />

</display:table>



<%-- Sections table --%>
<display:table name="sections"  id="row" requestURI="tutorial/display.do" class="displaytag">

	<display:caption><b><spring:message code="tutorial.sections"/></b></display:caption>

	<spring:message code="section.number" var="numberHeader" />
	<display:column property="number" title="${numberHeader}" />

	<spring:message code="section.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" />
	
	<spring:message code="section.text" var="textHeader" />
	<display:column property="text" title="${textHeader}" />
	
	<!-- Display section link -->
	<spring:message code="section.display" var="displayHeader" />
		<display:column title="${displayHeader}">
			<a href="section/display.do?sectionId=${row.id}"> <spring:message code="section.display" /></a>
		</display:column>
	
	<!-- Create section link -->
	<jstl:if test="${tutorial.getHandyWorker().equals(principal)}">
			<spring:message code="section.edit" var="editHeader" />
			<display:column title="${editHeader}">
				<a href="section/handyWorker/edit.do?sectionId=${row.id}&tutorialId=${row.tutorial.id}">
				<spring:message code="section.edit" /></a>
			</display:column>
	</jstl:if>
	
		
</display:table>

<!-- Create Section Link -->
<jstl:if test="${tutorial.getHandyWorker().equals(principal)}">
	<a href="section/handyWorker/create.do?tutorialId=${tutorial.id}"><b><spring:message code="section.add" /></b></a>
</jstl:if>
<br><br>


<!-- Tutorial's pictures table -->
<b><spring:message code="tutorial.pictures.table"/></b>
<table>
	<jstl:forEach items="${tutorial.pictures}" var="picture">
		<td><img src="${picture.link}" width="200" height="200" /></td>
	</jstl:forEach>
</table>


<!-- Add Image to tutorial link -->
<jstl:if test="${tutorial.getHandyWorker().equals(principal)}">
	<a href="tutorial/handyWorker/addImage.do?tutorialId=${tutorial.id}"><spring:message code="tutorial.addPicture" />
	</a>
</jstl:if>
<br><br>



<%-- Button gotBack --%>
<security:authorize access="hasRole('HANDYWORKER')">
<input type="button" name="goBack"
		value="<spring:message code="complaint.goBack.myTutorials" />"
		onClick="javascript: window.location.replace('tutorial/handyWorker/list.do')" />
		
<input type="button" name="goBack"
		value="<spring:message code="complaint.goBack.tutorials" />"
		onClick="javascript: window.location.replace('tutorial/list.do')" />

</security:authorize>

<security:authorize access="hasAnyRole('ADMIN', 'CUSTOMER', 'REFEREE', 'SPONSOR')">
<input type="button" name="goBack"
		value="<spring:message code="complaint.goBack.tutorials" />"
		onClick="javascript: window.location.replace('tutorial/list.do')" />
</security:authorize>

<security:authorize access="isAnonymous()">
<input type="button" name="goBack"
		value="<spring:message code="complaint.goBack.tutorials" />"
		onClick="javascript: window.location.replace('tutorial/list.do')" />
</security:authorize>
<br><br>

<%-- Banner --%>
<img src="${banner}" width="400" height="200">


