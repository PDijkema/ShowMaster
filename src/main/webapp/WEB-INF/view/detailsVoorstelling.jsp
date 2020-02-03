<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en" xmlns:c="http://www.w3.org/1999/XSL/Transform" xmlns:jsp="http://java.sun.com/JSP/Page">

    <head>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="${contextPath}\resources\css\custom.css" type="text/css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="${contextPath}\resources\js\ajax.js"></script>
        <script src="https://kit.fontawesome.com/1eeb88da0f.js" crossorigin="anonymous"></script>

        <title>Details voorstelling</title>
    </head>

    <body>
        <jsp:include page="navbar.jsp" />
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1 id="voorstellingDisplay4" class="display-4">${voorstelling.naam}</h1>
                <h3 id="voorstellingDatumDisplay4" class="display-4"> ${voorstelling.datum}</h3>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row flex-xl-nowrap">
                <div class="col-md-3 col-xl-2 py-md-3 pl-md-5 bd-sidebar">
                    <h2>Dienst toevoegen</h2>
                    <ul class="nav flex-column">
                        <c:forEach items="${alleTaken}" var="taak">
                            <li class="nav-item">
                                <a href="${contextPath}/planner/voorstelling/voorstellingsTaak/toevoegen/${voorstelling.voorstellingId}/
                                <c:out value=" ${taak.taakId} " />">
                                <c:out value="${taak.taakNaam}" />
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <main class="col-md-9 col-xl-8 py-md-3 pl-md-5 bd-content" role="main">
                    <h1>Diensten bij voorstelling</h1>
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th scope="col">Taak</th>
                            <th scope="col">Medewerker</th>
                            <th scope="col">Toewijzen/wijzigen</th>
                            <th scope="col">Verwijderen</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${takenBijVoorstelling}" var="takenBijVoorstelling">
                            <tr>
                                <td>
                                    <c:out value="${takenBijVoorstelling.getTaak().getTaakNaam()}" />
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${empty takenBijVoorstelling.getMedewerker().getGebruikersnaam()}">
                                            Openstaand
                                <td>
                                    <i class="fas fa-user-plus" title="Invullen" data-toggle="modal" data-target="#exampleModal" onclick="taakInvullen(${voorstelling.voorstellingId}, ${takenBijVoorstelling.voorstellingsTaakId}, '${contextPath}')" /></i>
                                </td>
                                </c:when>
                                <c:otherwise>
                                    <c:out value="${takenBijVoorstelling.getMedewerker().getGebruikersnaam()}" />
                                    <td>
                                        <i onclick="taakInvullen(${voorstelling.voorstellingId}, ${takenBijVoorstelling.voorstellingsTaakId}, '${contextPath}'); infoMeegeven(${takenBijVoorstelling.voorstellingsTaakId},${voorstelling.voorstellingId}, '${contextPath}')" class="far fa-edit" title="Wijzigen" data-toggle="modal" data-target="#exampleModal"></i>
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
                    <a class="btn btn-primary" href="${contextPath}/planner/voorstelling/alle">Overzicht Voorstellingen</a>
                </main>
            </div>
        </div>

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title" id="exampleModalLabel">Taak Beheren</h2>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p id="taakInvullen"></p>
                    </div>
                    <div class="modal-footer">

                        <a style="visibility:hidden;" type="button" class="btn btn-primary btn" id="taakVrijgeven" href="${contextPath}/planner/voorstelling/voorstellingsTaak/taakVrijGeven/ / /">Taak Vrijgeven</a>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Sluiten</button>
                    </div>
                </div>
            </div>
        </div>

    </body>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="${contextPath}\resources\js\javascript.functies.js"></script>

</html>

