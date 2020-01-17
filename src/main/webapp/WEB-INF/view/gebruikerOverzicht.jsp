
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!doctype html>
<html lang="en">
<head>
    <title>Gebruikersoverzicht</title>
    <script src="https://kit.fontawesome.com/1eeb88da0f.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="${contextPath}\resources\css\custom.css" type="text/css" rel="stylesheet">
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
                            <a href="${contextPath}/planner/gebruiker/verwijderen/<c:out value="${gebruiker.medewerkerId}"/>">
                                <i class="fas fa-trash" title="Verwijderen"></i>
                            </a>
                        </td>

                    </tr>
                    </c:forEach>
                </tbody>
            </table>
    </body>
</html>