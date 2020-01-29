<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>  <!-- PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="${contextPath}\resources\css\custom.css" type="text/css" rel="stylesheet">
<title>Excel Processing</title>
</head>
<body>
    <jsp:include page="navbar.jsp" />
    <c:url value="/planner/uploadExcelFile" var="uploadFileUrl" />
    <c:url value="/planner/excelProcessing" var="resetUrl" />
    <c:url value="/planner/excel/voorstelling/toevoegen" var="excelVoorstellingToevoegen" />

    <form method="post" enctype="multipart/form-data" action="${uploadFileUrl}?${_csrf.parameterName}=${_csrf.token}">
        <input id="gekozenBestand" type="file" name="file" accept=".xls,.xlsx"  />
        <input id="uploaden" type="submit" class='btn btn-primary' disabled="disabled" value="Uploaden" />
    </form>
    <br />
    <form method="GET" action="${resetUrl}">
        <button class="btn btn-primary" type="submit">Herstel</button>
    </form>
    <br /> ${message }
    <br />
    <br />

    <form action="${excelVoorstellingToevoegen }">
        <button class="btn btn-primary" type="submit">Voorstelling(en) toevoegen</button>
    </form>
    <br />
    <br />
    <script src="${contextPath}\resources\js\jqueryExcelUpload.js" type='text/javascript'></script>

</body>
</html>