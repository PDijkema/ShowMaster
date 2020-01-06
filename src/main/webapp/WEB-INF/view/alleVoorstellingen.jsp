<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!doctype html>
<html lang="en">
<head>
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
    <body>
        <h1>Overzicht Voorstellingen</h1>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope ="col">Naam</th>
                        <th scope ="col">Datum en tijd</th>
                        <th scope ="col">Taakbeheer</th>
                        <th scope ="col">Details</th>
                        <th scope ="col">Voorstelling</th>
                        <th scope ="col">Voorstelling</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${alleVoorstellingen}" var="voorstelling">
                    <tr>
                        <td><c:out value="${voorstelling.naam}"/></td>
                        <td><c:out value="${voorstelling.datum}"/></td>
                        <td><a href="/voorstelling/taakbeheer/<c:out value="${voorstelling.voorstellingId}" />Taken</a></td>
                        <td><a href="/voorstelling/details/<c:out value="${voorstelling.voorstellingId}" />">Details</a></td>
                        <td><a href="/voorstelling/verwijderen/<c:out value="${voorstelling.voorstellingId}" />">Verwijderen</a></td>
                        <td><a href="/voorstelling/wijzigen/<c:out value="${voorstelling.voorstellingId}" />">Wijzigen</a></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        <a class="btn btn-primary" href="/voorstelling/toevoegen">Voeg voorstelling toe</a>
    </body>
</html>