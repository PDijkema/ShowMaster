
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">
<head>
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="\resources\css\custom.css" type="text/css" rel="stylesheet">
</head>
    <body>
        <jsp:include page="navbar.jsp" />
        <h1>Gebruikersoverzicht</h1>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope ="col">Naam</th>
                        <th scope ="col">Verwijderen</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${alleGebruikers}" var="gebruiker">
                    <tr>
                        <td><c:out value="${gebruiker.gebruikersnaam}"/></td>

                        <td>
                            <a href="/planner/gebruiker/verwijderen/<c:out value="${gebruiker.medewerkerId}"/>">
                                <img src="/resources/images/icons/trash.svg" alt="" width="30" height="30" title="Verwijderen" />
                            </a>
                        </td>

                    </tr>
                    </c:forEach>
                </tbody>
            </table>
    </body>
</html>