<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
<html lang="en" xmlns:c="http://www.w3.org/1999/XSL/Transform" xmlns:jsp="http://java.sun.com/JSP/Page">
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
                            <th scope="col">Koppelen</th>
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
                                            <td><a href="/voorstellingsTaak/medewerkerKoppelen/${voorstelling.voorstellingId}/<c:out value='${takenBijVoorstelling.voorstellingsTaakId}' />">Koppelen</a></td>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="${takenBijVoorstelling.getMedewerker().getGebruikersnaam()}"/>
                                            <td><a href="/voorstellingsTaak/medewerkerKoppelen/${voorstelling.voorstellingId}/<c:out value='${takenBijVoorstelling.voorstellingsTaakId}' />">Wijzigen</a></td>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td><a href="/voorstellingsTaak/verwijderen/${voorstelling.voorstellingId}/<c:out value='${takenBijVoorstelling.voorstellingsTaakId}' />">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            <h1>Diensten toevoegen</h1>
                <table>
                    <tbody>
                        <c:forEach items="${alleTaken}" var="taak">
                            <td><a class="btn btn-primary" href="/voorstellingsTaak/toevoegen/${voorstelling.voorstellingId}/<c:out value="${taak.taakId}" />"><c:out value="${taak.taakNaam}"/></a></td>
                        </c:forEach>
                    </tbody>
                </table>
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        </body>
    <h1>Terug naar</h1>
        <a class="btn btn-primary" href="/voorstellingen">Overzicht Voorstellingen</a>
</html>