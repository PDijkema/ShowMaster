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

            <form:form action="/planner/voorstellingsTaak/medewerkerKoppelen/${voorstellingId}/${voorstellingsTaakId}/${medewerker.medewerkerId}" modelAttribute="voorstellingsTaak" method="post">
                <form:hidden path="voorstellingsTaakId"/>
                <table>


                    <c:forEach items="${beschikbareMedewerkers}" var="medewerker">
                        <tr>
                            <td><c:out value="${medewerker.gebruikersnaam}"/></td>
                            <td></td>
                            <td><a href="/planner/voorstellingsTaak/medewerkerKoppelen/${voorstellingId}/${voorstellingsTaakId}/${medewerker.medewerkerId}">Selecteer</a></td>
                        </tr>
                    </c:forEach>


                </table>
            </form:form>

        </body>
    <a class="btn btn-primary" href="/planner/voorstelling/details/${voorstellingId}">Terug</a>
</html>