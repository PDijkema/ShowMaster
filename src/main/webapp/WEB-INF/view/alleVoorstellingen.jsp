<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
    <title></title>
</head>
    <body>
        <h1>Overzicht Voorstellingen</h1>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope ="col">Naam</th>
                        <th scope ="col">Datum en tijd</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${alleVoorstellingen}" var="voorstelling">
                    <tr>
                        <td><c:out value="${voorstelling.naam}"/></td>
                        <td><c:out value="${voorstelling.datum}"/></td>
                        <td><a href="/voorstelling/verwijderen/<c:out value="${voorstelling.voorstellingId}" />">Verwijderen</a></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <a href="/voorstelling/toevoegen">Voeg voorstelling toe</a>
    </body>
</html>