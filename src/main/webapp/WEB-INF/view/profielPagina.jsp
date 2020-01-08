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

        <div class="container">

            <form:form modelAttribute="medewerkerProfielGegevens" class="form-signin">
                <h1>Profielpagina</h1>
                <h2 class="form-signin-heading">Persoonlijke gegevens</h2>

                <form:hidden path="medewerkerId" />

                <table>
                    <tr>
                        <th>Gebruikersnaam</th>
                    </tr>
                    <tr>
                        <td>${medewerkerProfielGegevens.getMedewerker().getGebruikersnaam()}</td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <th>Voornaam</th>
                    </tr>
                    <tr>
                        <td>${medewerkerProfielGegevens.voornaam} &nbsp;</td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <th>Tussenvoegsel</th>
                    </tr>
                    <tr>
                        <td>${medewerkerProfielGegevens.tussenvoegsel} &nbsp;</td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <th>Achternaam</th>
                    </tr>
                    <tr>
                        <td>${medewerkerProfielGegevens.achternaam} &nbsp;</td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <th>Emailadres</th>
                    </tr>
                    <tr>
                        <td>${medewerkerProfielGegevens.emailadres} &nbsp;</td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <th>Geboortedatum</th>
                    </tr>
                    <tr>
                        <td>${medewerkerProfielGegevens.geboortedatum} &nbsp;</td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <th>Telefoonnummer</th>
                    </tr>
                    <tr>
                        <td>${medewerkerProfielGegevens.telefoonnummer} &nbsp;</td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <th>Voorkeurstaak</th>
                    </tr>
                    <tr>
                        <td>${medewerkerProfielGegevens.getMedewerker().voorkeurstaak.taakNaam} &nbsp;</td>
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
                        <td>${medewerkerProfielGegevens.straatnaam} &nbsp;</td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <th>Huisnummer</th>
                    </tr>
                    <tr>
                        <td>${medewerkerProfielGegevens.huisnummer} &nbsp;</td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <th>Toevoeging</th>
                    </tr>
                    <tr>
                        <td>${medewerkerProfielGegevens.toevoeging} &nbsp;</td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <th>Postcode</th>
                    </tr>
                    <tr>
                        <td>${medewerkerProfielGegevens.postcode} &nbsp;</td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <th>Woonplaats</th>
                    </tr>
                    <tr>
                        <td>${medewerkerProfielGegevens.woonplaats} &nbsp;</td>
                    </tr>
                    <tr></tr>
                </table>

                <button class="btn btn-primary" type="submit">Gegevens wijzigen</button>
                <a href="/medewerker/welkom">  <button type="button" class="btn btn-primary">Terug naar welkom</button> </a>

            </form:form>
            </div>

        </body>
</html>