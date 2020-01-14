<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="\resources\css\custom.css" type="text/css" rel="stylesheet">
</head>
    <body>
        <h2>Persoonlijk rooster</h2>
            <form:hidden path="profielId" />

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope ="col">Naam</th>
                        <th scope ="col">Datum en tijd</td>
                        <th scope ="col">Taak</td>
                        <th scope ="col">Collega's</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${allePersoonlijkeVoorstellingsTaken}" var="allePersoonlijkeVoorstellingsTaken">
                        <tr>
                            <td><c:out value="${allePersoonlijkeVoorstellingsTaken.getVoorstelling().getNaam()}"/></td>
                            <td><c:out value="${allePersoonlijkeVoorstellingsTaken.getVoorstelling().getDatum()}"/></td>
                            <td><c:out value="${allePersoonlijkeVoorstellingsTaken.getTaak().getTaakNaam()}"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
    </body>
</html>