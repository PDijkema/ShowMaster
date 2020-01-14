<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!doctype html>
<html lang="en">
<head>
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="\resources\css\custom.css" type="text/css" rel="stylesheet">
</head>
    <body>
        <jsp:include page="navbar.jsp" />
            <h1>Overzicht voorstellingen</h1>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope ="col">Naam</th>
                            <th scope ="col">Datum en tijd</td>
                            <th scope ="col">Taakbeheer</td>
                            <th scope ="col">Wijzigen</td>
                            <th scope ="col">Verwijderen</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${alleVoorstellingen}" var="voorstelling">
                        <tr>
                            <td><c:out value="${voorstelling.naam}"/></td>
                            <td><c:out value="${voorstelling.datum}"/></td>
                            <td><a href="/planner/voorstelling/details/<c:out value="${voorstelling.voorstellingId}" />">Taakbeheer</a></td>
                            <td><a href="/planner/voorstelling/wijzigen/<c:out value="${voorstelling.voorstellingId}" />">
                                <img src="/resources/images/icons/pencil.svg" alt="" width="30" height="30" title="Wijzigen" />
                                </a>
                            </td>
                            <td>
                                <a href="/planner/voorstelling/verwijderen/<c:out value="${voorstelling.voorstellingId}" />">
                                <img src="/resources/images/icons/trash.svg" alt="" width="30" height="30" title="Verwijderen" />
                                </a>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            <a class="btn btn-primary" href="/planner/voorstelling/toevoegen">Voeg voorstelling toe</a>
    </body>
</html>