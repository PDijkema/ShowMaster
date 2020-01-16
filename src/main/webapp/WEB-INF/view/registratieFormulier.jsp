<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Gebruiker aanmaken</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="${contextPath}\resources\css\custom.css" type="text/css" rel="stylesheet">
        <script src="${contextPath}\resources\js\validation.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </head>

    <body>
    <jsp:include page="navbar.jsp" />
        <div class="container">
            <form:form method="POST" modelAttribute="registratieFormulier" class="needs-validation" novalidate="true">
            <h1>Gebruiker aanmaken</h1>

                <spring:bind path="gebruikersnaam">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="gebruikersnaam" class="form-control ${status.error ? 'is-invalid' : ' '}" placeholder="Gebruikersnaam" autofocus="true" required="true" pattern="[^\s]+"></form:input>
                    <div class="invalid-feedback">
                    Voer een geldige gebruikersnaam in
                    </div>
                        <small><form:errors path="gebruikersnaam" cssClass="text-danger" element="div"></form:errors> </small>
                    </div>
                </spring:bind>

                <spring:bind path="wachtwoord">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="password" path="wachtwoord" class="form-control ${status.error ? 'is-invalid' : ''}" placeholder="Wachtwoord" required="true" pattern="[^\s]+"></form:input>
                            <div class="invalid-feedback">
                            Voer een geldig wachtwoord in
                            </div>
                        <small><form:errors path="wachtwoord" cssClass="text-danger" element="div"></form:errors></small>
                    </div>
                </spring:bind>

                <spring:bind path="wachtwoordBevestigen">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="password" path="wachtwoordBevestigen" class="form-control ${status.error ? 'is-invalid' : ' '}"
                            placeholder="Wachtwoord bevestigen" required="true" pattern="[^\s]+"></form:input>
                        <small><form:errors path="wachtwoordBevestigen" cssClass="text-danger" element="div"></form:errors></small>
                    </div>
                </spring:bind>

                <spring:bind path="planner">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:checkbox path="planner" value="Planner" /> Planner
                    </div>
                </spring:bind>
            <button class="btn btn-primary" type="submit">Verstuur</button>
            </form:form>
        </div>
    </body>
</html>
