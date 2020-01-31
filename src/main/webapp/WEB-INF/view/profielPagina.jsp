<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Profielpagina</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="${contextPath}\resources\css\custom.css" type="text/css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/1eeb88da0f.js" crossorigin="anonymous"></script>
</head>

    <body>
        <jsp:include page="navbar.jsp" />
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1 class="voorstellingDisplay4">Profielpagina</h1>
            </div>
        </div>
        <div class="container">
            <form:form modelAttribute="medewerkerProfielGegevens" class="form-signin">

                <form:hidden path="profielId"></form:hidden>

                <div class="col-md-5 col-sm-5 col-xs-12">
                <h3>${medewerkerProfielGegevens.voornaam} &nbsp;${medewerkerProfielGegevens.tussenvoegsel} &nbsp;${medewerkerProfielGegevens.achternaam} &nbsp;</h3>
                <ul style = "list-style: none;"">
                <li><i class="fas fa-home" style="width:50px;"></i> ${medewerkerProfielGegevens.straatnaam} &nbsp;${medewerkerProfielGegevens.huisnummer}${medewerkerProfielGegevens.toevoeging} &nbsp;, &nbsp;${medewerkerProfielGegevens.postcode} &nbsp;${medewerkerProfielGegevens.woonplaats} &nbsp;</li>
                <li><i class="fas fa-mobile-alt" style="width:50px;"></i> ${medewerkerProfielGegevens.telefoonnummer} &nbsp;</li>
                <li><i class="fas fa-envelope" style="width:50px;"></i> ${medewerkerProfielGegevens.emailadres} &nbsp;</li>
                <li><i class="fas fa-birthday-cake" style="width:50px;"></i> ${medewerkerProfielGegevens.geboortedatum} &nbsp;</li>
                <li><i class="fas fa-id-card" style="width:50px;"></i> ${medewerkerProfielGegevens.getMedewerker().getGebruikersnaam()} </li>

                </ul>
                <table>
                    <tr>
                        <th>Voorkeurstaak</th>
                    </tr>
                    <tr>
                        <td>${medewerkerProfielGegevens.voorkeurstaak.taakNaam} (nog) niet ingevuld</td> <!-- dit moet anders, moet placeholder worden oid -->
                    </tr>
                    <tr></tr>
                    <tr></tr>
                    <tr></tr>
                    </table>

                <button class="btn btn-primary" type="submit">Gegevens wijzigen</button>
            </form:form>
        </div>
    </body>
</html>