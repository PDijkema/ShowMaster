<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- https://bootsnipp.com/snippets/z8b1X -->


<!doctype html>
<html lang="en" xmlns:form="http://www.w3.org/1999/xhtml">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <title>Profielpagina</title>
</head>

    <body>
    <h1>Profielpagina</h1>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>

    <form:form action="/profielWijzigen" modelAttribute="medewerker">

        <div class="container">
            <form class="form-horizontal" role="form">
                <h2>Persoonlijke gegevens</h2>
                <div class="form-group">
                    <label for="gebruikersnaam" class="col-sm-3 control-label">Gebruikersnaam* </label>
                    <div class="col-sm-9">
                        <input type="text" id="gebruikersnaam" placeholder="Gebruikersnaam" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="wachtwoord" class="col-sm-3 control-label">Wachtwoord* </label>
                    <div class="col-sm-9">
                        <input type="password" id="wachtwoord" placeholder="Wachtwoord" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="wachtwoordBevestigen" class="col-sm-3 control-label">Bevestig wachtwoord* </label>
                    <div class="col-sm-9">
                        <input type="password" id="wachtwoordBevestigen" placeholder="Wachtwoord" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="voornaam" class="col-sm-3 control-label">Voornaam* </label>
                    <div class="col-sm-9">
                        <input type="text" id="voornaam" placeholder="Voornaam" class="form-control" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <label for="tussenvoegsel" class="col-sm-3 control-label">tussenvoegsel</label>
                    <div class="col-sm-9">
                        <input type="text" id="tussenvoegsel" placeholder="Tussenvoegsel" class="form-control" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <label for="achternaam" class="col-sm-3 control-label">Achternaam* </label>
                    <div class="col-sm-9">
                        <input type="text" id="achternaam" placeholder="Achternaam" class="form-control" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <label for="emailadres" class="col-sm-3 control-label">Emailadres* </label>
                    <div class="col-sm-9">
                        <input type="email" id="emailadres" placeholder="Emailadres" class="form-control" name="emailadres">
                    </div>
                </div>
                <div class="form-group">
                    <label for="geboortedatum" class="col-sm-3 control-label">Geboortedatum </label>
                    <div class="col-sm-9">
                        <input type="date" id="geboortedatum" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="telefoonnummer" class="col-sm-3 control-label">Telefoonnummer* </label>
                    <div class="col-sm-9">
                        <input type="phoneNumber" id="telefoonnummer" placeholder="Telefoonnummer" class="form-control">
                    </div>
                </div>

                <div class="form-group" xmlns:form="http://www.w3.org/1999/xhtml">
                    <label class="col-sm-3 control-label">Voorkeurstaak </label>  <!-- for="voorkeurstaakId"  dit werkt niet-->
                    <div class="col-sm-9">
                        <form:select path="voorkeurstaak">
                            <form:option value="0" label="Select" />
                            <form:options items="${takenLijst}" itemValue="taakId" itemLabel="taakNaam" />
                        </form:select>
                    </div>
                </div>

                <div></div>
                <div></div>
                <h2>Adresgegevens</h2>
                <div class="form-group">
                    <label for="straatnaam" class="col-sm-3 control-label">Straatnaam* </label>
                    <div class="col-sm-9">
                        <input type="text" id="straatnaam" placeholder="Straatnaam" class="form-control">
                    </div>
                </div>

                <!-- deze checken, zit nu pijltje omhoog/naar beneden in -->
                <div class="form-group">
                    <label for="huisnummer" class="col-sm-3 control-label">Huisnummer* </label>
                    <div class="col-sm-9">
                        <input type="number" id="huisnummer" placeholder="Huisnummer" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="toevoeging" class="col-sm-3 control-label">Toevoeging </label>
                    <div class="col-sm-9">
                        <input type="text" id="toevoeging" placeholder="Toevoeging" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="postcode" class="col-sm-3 control-label">Postcode* </label>
                    <div class="col-sm-9">
                        <input type="text" id="postcode" placeholder="Postcode" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="woonplaats" class="col-sm-3 control-label">Woonplaats* </label>
                    <div class="col-sm-9">
                        <input type="text" id="woonplaats" placeholder="Woonplaats" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <span class="help-block">*Verplichte velden</span>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Opslaan</button>
            </form>
        </div>
    </form:form>
    <hr>
    </body>
</html>