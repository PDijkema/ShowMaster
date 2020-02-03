
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!doctype html>
<html lang="en" xmlns:c="http://www.w3.org/1999/XSL/Transform">
<head>
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="${contextPath}\resources\css\custom.css" type="text/css" rel="stylesheet">
</head>

<body>
    <jsp:include page="navbar.jsp" />
    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="voorstellingDisplay4">Inschrijven</h1>
        </div>
    </div>
    <div class="container">
        <div class="container">
            <h1>Open voorstellingen</h1>
            <div class="card-columns">
                <c:forEach items="${voorstellingLijst}" var="voorstelling">
                    <c:if test="${voorstelling.status == 'Gepubliceerd'}">
                        <div class="card">
                            <div class="card-header">
                                <h1><c:out value="${voorstelling.getNaam()}"/></h1><c:out value="${voorstelling.getDatum()}"/>
                            </div>
                        <div class="card-body">
                            <a class="btn btn-primary" href="${contextPath}/rooster/openvoorstelling/inschrijven/<c:out value='${voorstelling.voorstellingId}'/>" role="button">Inschrijven</a>
                        </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
        <div class="container">
            <h1>Ingeschreven voorstellingen</h1>
            <div class="card-columns">
                <c:forEach items="${inschrijvingen}" var="inschrijving">
                    <div class="card">
                        <div class="card-header">
                            <h1><c:out value="${inschrijving.getVoorstelling().getNaam()}"/></h1><c:out value="${inschrijving.getVoorstelling().getDatum()}"/>
                        </div>
                        <div class="card-body">
                            <c:choose>
                                <c:when test="${inschrijving.getVoorstelling().getStatus() == 'Geannuleerd'}">
                                    <span class="badge badge-danger">Voorstelling Geannuleerd</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge badge-success">Ingeschreven</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>