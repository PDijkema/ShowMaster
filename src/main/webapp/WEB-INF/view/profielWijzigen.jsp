<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="utf-8">
      <title>Profiel wijzigen</title>

     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  </head>

    <body>

     <div class="container">

            <form:form method="POST" modelAttribute="medewerker" class="form-signin">
                <h1>Profiel wijzigen</h1>
                <h2 class="form-signin-heading">Persoonlijke gegevens</h2>

                <form:hidden path="medewerkerId" />
                <form:hidden path="wachtwoord" />
                <form:hidden path="planner" />

                <spring:bind path="gebruikersnaam">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label for="gebruikersnaam" class="col-sm-3 control-label">Gebruikersnaam* </label>
                        <form:input type="text" path="gebruikersnaam" class="form-control" placeholder="Gebruikersnaam"
                                    autofocus="true"></form:input>
                        <form:errors path="gebruikersnaam"></form:errors>
                    </div>
                </spring:bind>

                <spring:bind path="voornaam">
                    <div>
                        <label for="voornaam" class="col-sm-3 control-label">Voornaam* </label>
                        <form:input type="text" path="voornaam" class="form-control" placeholder="Voornaam"></form:input>
                    </div>
                </spring:bind>

                <spring:bind path="tussenvoegsel">
                                <div>
                                    <label for="tussenvoegsel" class="col-sm-3 control-label">Tussenvoegsel</label>
                                    <form:input type="text" path="tussenvoegsel" class="form-control"
                                                placeholder="Tussenvoegsel"></form:input>
                                </div>
                </spring:bind>

                <spring:bind path="achternaam">
                    <div>
                        <label for="achternaam" class="col-sm-3 control-label">Achternaam</label>
                        <form:input type="text" path="achternaam" class="form-control"
                                    placeholder="Achternaam"></form:input>
                    </div>
                </spring:bind>

                <spring:bind path="emailadres">
                    <div>
                        <label for="emailadres" class="col-sm-3 control-label">Emailadres</label>
                        <form:input type="email" path="emailadres" class="form-control"
                                    placeholder="Emailadres"></form:input>
                    </div>
                </spring:bind>

                <spring:bind path="geboortedatum">
                    <div>
                        <label for="geboortedatum" class="col-sm-3 control-label">Geboortedatum</label>
                        <form:input type="date" path="geboortedatum" class="form-control"
                                    placeholder="yyy-mm-dd"></form:input>
                    </div>
                </spring:bind>

                <spring:bind path="telefoonnummer">
                    <div>
                        <label for="telefoonnumer" class="col-sm-3 control-label">Telefoonnummer</label>
                        <form:input type="text" path="telefoonnummer" class="form-control"
                                    placeholder="Telefoonnummer"></form:input>
                    </div>
                </spring:bind>

                <spring:bind path="voorkeurstaak">
                    <div>
                        <label for="voorkeurstaak" class="col-sm-3 control-label">Voorkeurstaak</label>
                        <form:select path="voorkeurstaak">
                                    <form:option value="0" label="Select" />
                                    <form:options items="${takenLijst}" itemValue="taakId" itemLabel="taakNaam" />
                                </form:select>
                    </div>
                </spring:bind>

                <hr>
                <hr>
                <h2>Adresgegevens</h2>
                <spring:bind path="straatnaam">
                    <div>
                        <label for="straatnaam" class="col-sm-3 control-label">Straatnaam</label>
                        <form:input type="text" path="straatnaam" class="form-control"
                                    placeholder="Straatnaam"></form:input>
                    </div>
                </spring:bind>

                <spring:bind path="huisnummer">
                    <div>
                        <label for="huisnummer" class="col-sm-3 control-label">Huisnummer</label>
                        <form:input type="number" path="huisnummer" class="form-control"
                                    placeholder="Huisnummer" min="0"></form:input>
                    </div>
                </spring:bind>

                <spring:bind path="toevoeging">
                    <div>
                        <label for="toevoeging" class="col-sm-3 control-label">Toevoeging</label>
                        <form:input type="text" path="toevoeging" class="form-control"
                                    placeholder="Toevoeging"></form:input>
                    </div>
                </spring:bind>

                <spring:bind path="postcode">
                    <div>
                        <label for="postcode" class="col-sm-3 control-label">Postcode</label>
                        <form:input type="text" path="postcode" class="form-control"
                                    placeholder="Postcode"></form:input>
                    </div>
                </spring:bind>

                <spring:bind path="woonplaats">
                    <div>
                        <label for="woonplaats" class="col-sm-3 control-label">Woonplaats</label>
                        <form:input type="text" path="woonplaats" class="form-control"
                                    placeholder="Woonplaats"></form:input>
                    </div>
                </spring:bind>

                <p>*Verplichte velden</p>

                <button class="btn btn-primary" type="submit">Opslaan</button>

            </form:form>
        </div>

    </body>
</html>