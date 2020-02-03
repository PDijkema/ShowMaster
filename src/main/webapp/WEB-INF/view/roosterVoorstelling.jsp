<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html lang="en" xmlns:c="http://www.w3.org/1999/XSL/Transform" xmlns:jsp="http://java.sun.com/JSP/Page">
    <head>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="${contextPath}\resources\css\custom.css" type="text/css" rel="stylesheet">
        <script src="${contextPath}\resources\js\ajax.js"></script>
        <script src="${contextPath}\resources\js\dragNdrop.js"></script>
        <script src="https://kit.fontawesome.com/1eeb88da0f.js" crossorigin="anonymous"></script>

        <title>Rooster</title>
    </head>
    <body>
    <jsp:include page="navbar.jsp"/>
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1 id="voorstellingDisplay4" class="display-4">${voorstelling.naam}</h1>
                <h3 id="voorstellingDatumDisplay4" class="display-4"> ${voorstelling.datum}</h3>
            </div>
        </div>

    <div class="container">
        <div class="row flex-xl-nowrap">
                <div class="col-md-3 col-xl-2 py-md-3 pl-md-5 bd-sidebar">
                    <h2>Dienst toevoegen</h2>
                    <ul class="nav flex-column">
                        <c:forEach items="${alleTaken}" var="taak">
                            <li class="nav-item"><a href="${contextPath}/planner/voorstellingsTaak/toevoegen/${voorstelling.voorstellingId}/
                        <c:out value='${taak.taakId}' />">
                                <c:out value="${taak.taakNaam}"/>
                            </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            <div class="col-8" role="main">
                <h1>Diensten bij voorstelling</h1>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col">Taak</th>
                        <th scope="col">Medewerker</th>
                        <th scope="col">Taak vrijgeven</th>
                        <th scope="col">Taak Verwijderen</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${takenBijVoorstelling}" var="takenBijVoorstelling">
                        <tr>
                            <td>
                                <c:out value="${takenBijVoorstelling.getTaak().getTaakNaam()}"/>
                            </td>
                            <td>
                                <!-- DROPDIV-->
                                <c:choose>
                                <c:when test="${empty takenBijVoorstelling.getMedewerker().getGebruikersnaam()}">
                                <div class="voorstellingsTaak" id="${takenBijVoorstelling.voorstellingsTaakId}" ondrop="drop(event, ${takenBijVoorstelling.voorstellingsTaakId}, ${takenBijVoorstelling.voorstelling.voorstellingId}, '${contextPath}')", ondragover="allowDrop(event)" ondragenter="enterDrag(event)">
                                Openstaand
                                </div>
                                <td>
                                <i class="fas fa-user-plus" title="Invullen" data-toggle="modal" data-target="#exampleModal" onclick="taakInvullen(${voorstelling.voorstellingId}, ${takenBijVoorstelling.voorstellingsTaakId}, '${contextPath}')"/></i>
                                </td>
                                </c:when>
                                <c:otherwise>
                                    <div class="beschikbareMedewerker">
                                    <c:out value="${takenBijVoorstelling.getMedewerker().getGebruikersnaam()}"/>
                                    </div>
                                    <td>
                                        <i onclick="taakInvullen(${voorstelling.voorstellingId}, ${takenBijVoorstelling.voorstellingsTaakId}, '${contextPath}'); infoMeegeven(${takenBijVoorstelling.voorstellingsTaakId},${voorstelling.voorstellingId}, '${contextPath}')" class="far fa-edit" title="Wijzigen" data-toggle="modal" data-target="#exampleModal"  ></i>
                                    </td>
                                </c:otherwise>
                                </c:choose>
                                </td>
                                <td>
                                <a href="${contextPath}/planner/voorstellingsTaak/verwijderen/${voorstelling.voorstellingId}/<c:out value='${takenBijVoorstelling.voorstellingsTaakId}' />">
                                    <i class="fas fa-trash" title="Verwijderen"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <a class="btn btn-primary" href="${contextPath}/planner/voorstellingen">Overzicht Voorstellingen</a>
            </div>
            <div class="col-4" id="dropzoneBeschikbareMedewerkers">
                <h1 id="beschikbareMedewerkers">Beschikbare medewerkers</h1>
                <c:forEach items="${beschikbareMedewerkers}" var="medewerkerInschrijvingVoorstelling">
                    <!-- ONDRAGDIV-->
                    <div class="beschikbareMedewerker" draggable="true" id="<c:out value='${medewerkerInschrijvingVoorstelling.medewerker.medewerkerId}'/>" ondragstart="dragStart(event, ${medewerkerInschrijvingVoorstelling.medewerker.medewerkerId})" ondrag="dragging(event)">
                        <p><c:out value="${medewerkerInschrijvingVoorstelling.medewerker.gebruikersnaam}"/></p>
                    </div>
                    <!-- ONDRAGDIV-->
                </c:forEach>
            </div>
        </div>
    </div>
    </body>
</html>
