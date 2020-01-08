<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Profielpagina</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

    <body>
        <jsp:include page="navbar.jsp" />
        <div class="container">

            <form:form modelAttribute="medewerker" class="form-signin">
                <h1>Profielpagina</h1>
                <h2 class="form-signin-heading">Persoonlijke gegevens</h2>

                <form:hidden path="medewerkerId" />
                <form:hidden path="planner" />

                    <table>
                        <tr>
                            <th>Gebruikersnaam</th>
                        </tr>
                        <tr>
                            <td>${medewerker.gebruikersnaam}</td>
                        </tr>
                        <tr></tr>
                        <tr>
                            <th>Voornaam</th>
                        </tr>
                        <tr>
                            <td>${medewerker.voornaam} &nbsp;</td>
                        </tr>
                        <tr></tr>
                        <tr>
                            <th>Tussenvoegsel</th>
                        </tr>
                        <tr>
                            <td>${medewerker.tussenvoegsel} &nbsp;</td>
                        </tr>
                        <tr></tr>
                        <tr>
                            <th>Achternaam</th>
                        </tr>
                        <tr>
                            <td>${medewerker.achternaam} &nbsp;</td>
                        </tr>
                        <tr></tr>
                        <tr>
                            <th>Emailadres</th>
                        </tr>
                        <tr>
                            <td>${medewerker.emailadres} &nbsp;</td>
                        </tr>
                        <tr></tr>
                        <tr>
                            <th>Geboortedatum</th>
                        </tr>
                        <tr>
                            <td>${medewerker.geboortedatum} &nbsp;</td>
                        </tr>
                        <tr></tr>
                        <tr>
                            <th>Telefoonnummer</th>
                        </tr>
                        <tr>
                            <td>${medewerker.telefoonnummer} &nbsp;</td>
                        </tr>
                        <tr></tr>
                        <tr>
                            <th>Voorkeurstaak</th>
                        </tr>
                        <tr>
                            <td>${medewerker.voorkeurstaak.taakNaam} &nbsp;</td>
                        </tr>
                        <tr></tr>
                        <tr></tr>
                        <tr></tr>
                        </table>

                        <h2>Adresgegevens</h2>
                        <table>
                        <tr>
                            <th>Straatnaam</th>
                        </tr>
                        <tr>
                            <td>${medewerker.straatnaam} &nbsp;</td>
                        </tr>
                        <tr></tr>
                        <tr>
                            <th>Huisnummer</th>
                        </tr>
                        <tr>
                            <td>${medewerker.huisnummer} &nbsp;</td>
                        </tr>
                        <tr></tr>
                        <tr>
                            <th>Toevoeging</th>
                        </tr>
                        <tr>
                            <td>${medewerker.toevoeging} &nbsp;</td>
                        </tr>
                        <tr></tr>
                        <tr>
                            <th>Postcode</th>
                        </tr>
                        <tr>
                            <td>${medewerker.postcode} &nbsp;</td>
                        </tr>
                        <tr></tr>
                        <tr>
                            <th>Woonplaats</th>
                        </tr>
                        <tr>
                            <td>${medewerker.woonplaats} &nbsp;</td>
                        </tr>
                        <tr></tr>
                    </table>
                <button class="btn btn-primary" type="submit">Gegevens wijzigen</button>
            </form:form>
        </div>
    </body>
</html>