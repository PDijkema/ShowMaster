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
            <h1>Medewerker Koppelen aan Taak</h1>

            <form:form action="/voorstelling/toevoegen" modelAttribute="voorstellingsTaak" method="post">
                <table>


                    <c:forEach items="${alleMedewerkerInschrijvingen}" var="medewerkerInschrijvingVoorstelling">
                        <tr>
                            <td><c:out value="${voorstelling.naam}"/></td>
                            <td><c:out value="${voorstelling.datum}"/></td>
                            <td><a href="/voorstelling/details/<c:out value="${voorstelling.voorstellingId}" />">Taakbeheer</a></td>
                            <td><a href="/voorstelling/wijzigen/<c:out value="${voorstelling.voorstellingId}" />">Wijzigen</a></td>
                            <td><a href="/voorstelling/verwijderen/<c:out value="${voorstelling.voorstellingId}" />">Verwijderen</a></td>
                        </tr>
                    </c:forEach>

                    <tr>
                        <td colspan="1">
                            <input type="submit" class="btn btn-primary" value="Opslaan"/>
                        </td>
                    </tr>
                </table>
            </form:form>

        </body>
<h1>Terug naar</h1>
    <a class="btn btn-primary" href="/voorstelling/details/${voorstellingId}">Taakbeheer voorstelling</a>
</html>