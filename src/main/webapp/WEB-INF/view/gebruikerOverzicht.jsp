<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!doctype html>
<html lang="en">
    <head>
        <title>Gebruikersoverzicht</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="${contextPath}\resources\css\custom.css" type="text/css" rel="stylesheet">
        <link href="${contextPath}\resources\css\all.css" type="text/css" rel="stylesheet">
        <script src="${contextPath}\resources\js\javascript.functies.js"></script>
    </head>

    <body>
        <jsp:include page="navbar.jsp" />
        <input type="hidden" id="modelAttr" name="modelAttr" value="${error}"/>
            <div class="jumbotron jumbotron-fluid">
                <div class="container">
                    <h1 class="voorstellingDisplay4">Gebruikersoverzicht</h1>
                </div>
            </div>
            <div class=container>
                <button id="medewerkerUitnodigenButton" type="button" class="btn btn-primary" data-toggle="modal" data-target="#uitnodigingModal" onClick="clearModal();" >Nieuwe medewerker uitnodigen</button>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope ="col">Naam</th>
                            <th scope ="col">E-mailadres</th>
                            <th scope ="col">Verwijderen</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${alleGebruikers}" var="gebruiker">
                            <tr>
                                <td>${gebruiker.medewerkerProfielGegevens.voornaam}
                                    <c:if test="${empty gebruiker.medewerkerProfielGegevens.tussenvoegsel}"></c:if>
                                    <c:if test="${not empty gebruiker.medewerkerProfielGegevens.tussenvoegsel}">
                                        ${gebruiker.medewerkerProfielGegevens.tussenvoegsel}</c:if>
                                        ${gebruiker.medewerkerProfielGegevens.achternaam}
                                </td>
                                <td><c:out value="${gebruiker.gebruikersnaam}"/></td>
                                <td>
                                    <i class="fas fa-trash" title="Verwijderen" data-toggle="modal"
                                    data-target="#waarschuwingsModal"
                                    onclick="vullenModal(
                                    'Gebruiker verwijderen',
                                    'Weet je zeker dat je deze gebruiker wilt verwijderen?',
                                    'Verwijderen',
                                    '/planner/gebruiker/overzicht/verwijderen/<c:out value= '${gebruiker.medewerkerId}'/>')">
                                    </i>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        <jsp:include page="waarschuwingsPopups.jsp" />
        <script type="text/javascript" src="${contextPath}\resources\js\modal.functies.js"></script>
    </body>
        <div class="modal fade" id="uitnodigingModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="exampleModalLabel">Medewerker uitnodigen</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form:form action="${contextPath}/planner/gebruiker/overzicht/uitnodigen" novalidate="true" modelAttribute="emailMetToken" method="post" class="was-validated needs-validation" id="uitnodigingsForm" >
                                <spring:bind path="emailadres">
                                    <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <label class="col-form-label">E-mailadres:</label>
                                        <form:input type="email" path="emailadres" class="form-control" placeholder="Emailadres" required="true" id="emailveld" />
                                        <div class="invalid-feedback">
                                            Voer het e-mailadres van de ontvanger in
                                        </div>
                                        <small><form:errors path="emailadres" cssClass="text-danger" element="div"></form:errors></small>
                                    </div>
                                </spring:bind>
                            <div class="form-group">
                                <label class="col-form-label">Bericht:</label>
                                <form:textarea type="email" class="form-control" path="bericht" placeholder="Typ hier je bericht, de inschrijflink wordt automatisch meegestuurd" required="true" id="tekstVeld" />
                            </div>
                            <div class="modal-footer">
                                <input  type="submit" class="btn btn-primary" value="Verstuur"/>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
</html>