<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!doctype html>
<html lang="en">
<head>
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
    <body>
        <h1>Rooster voor <c:out value="${medewerker.voornaam}"/></h1>
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

                    <!-- dit moet het worden, alle voorstellingen waarvoor de ingelogde medewerker is ingepland -->
                    <!-- <c:forEach items="${alleVoorstellingsTaken}" var="voorstellingstaak"/> -->
                    <!-- <c:if test="${voorstellingstaak.medewerkerId == medewerker.medewerkerId}">  -->

                   <!--  <tr> -->
                        <!-- <td><c:out value="${voorstellingstaak.voorstellingId.naam}"/></td> -->
                        <!-- <td><c:out value="${voorstellingstaak.voorstellingId.datum}"/></td> -->
                        <!-- <td><c:out value="${voorstellingstaak.taakId.taakNaam}"/></td> </c:if> -->


                    <c:forEach items="${alleVoorstellingen}" var="voorstelling">
                    <tr>
                        <td><c:out value="${voorstelling.naam}"/></td>
                        <td><c:out value="${voorstelling.datum}"/></td>

                    </tr>
                    </c:forEach>
                </tbody>
            </table>
    </body>
</html>