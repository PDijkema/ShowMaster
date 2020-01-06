
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">
<head>
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<body>
<h1>Overzicht open voorstellingen</h1>

<table  class="table table-hover"  >

    <thead>
    <tr>
        <th scope ="col">Voorstelling naam</th>
        <th scope ="col">Datum en tijd</th>
        <th scope ="col">Inschrijven</th>



    </tr>
    </thead>
    <tbody>

    <c:forEach items="${voorstellingLijst}" var="voorstelling">
        <tr>
            <td><c:out value="${voorstelling.getNaam()}"/></td>
            <td><c:out value="${voorstelling.getDatum()}"/></td>
            <td><a class="btn btn-primary" href="/voorstelling/weergeven/openvoorstelling/inschrijven/<c:out value="${voorstelling.voorstellingId}"/>" role="button">Inschrijven</a></td>

        </tr>
    </c:forEach>


    </tbody>
</table>

</body>