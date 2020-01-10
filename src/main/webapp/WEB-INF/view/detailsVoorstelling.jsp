<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
<table lang="en">
<head>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Details Voorstelling</title>
</head>
    <body>
    <jsp:include page="navbar.jsp" />
    <h1>Details voorstelling</h1>
    <table class="table table-hover">
        <thead>
            <tr>
                <th scope="col">Naam voorstelling</th>
                <th scope="col">Datum en tijdstip</th>
            </tr>
        </thead>
        <tr>
            <td scope="col">${voorstelling.naam}</td>
            <td scope="col">${voorstelling.datum}</td>
        </tr>
    </table>

    <h1>Diensten bij voorstelling</h1>
    <table class="table table-hover">
        <thead>
            <tr>
                <th scope="col">Taak</th>
                <th scope="col">Medewerker</th>
                <th scope="col">Verwijderen</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${takenBijVoorstelling}" var="takenBijVoorstelling">
                <tr>
                    <td><c:out value="${takenBijVoorstelling.getTaak().getTaakNaam()}"/></td>
                    <td>
                        <c:choose>
                            <c:when test="${empty takenBijVoorstelling.getMedewerker().getGebruikersnaam()}">
                                Openstaand
                            </c:when>
                            <c:otherwise>
                                <c:out value="${takenBijVoorstelling.getMedewerker().getGebruikersnaam()}"/>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td><a href="/planner/voorstellingsTaak/verwijderen/${voorstelling.voorstellingId}/<c:out value='${takenBijVoorstelling.voorstellingsTaakId}' />">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h1>Diensten toevoegen</h1>
        <table>
            <tbody>
                <c:forEach items="${alleTaken}" var="taak">
                    <td></td><a class="btn btn-primary" href="/planner/voorstellingsTaak/toevoegen/${voorstelling.voorstellingId}/<c:out value='${taak.taakId}' />"><c:out value="${taak.taakNaam}"/></a></td>
                </c:forEach>
            </tbody>
        </table>
    </body>

</table>
<h1>Terug naar</h1>
<a class="btn btn-primary" href="/planner/voorstellingen">Overzicht Voorstellingen</a>
</html>