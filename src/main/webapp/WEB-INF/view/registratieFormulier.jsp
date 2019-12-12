<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="utf-8">
      <title>Create an account</title>

     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  </head>

  <body>

    <div class="container">

        <form:form method="POST" modelAttribute="registratieFormulier" class="form-signin">
            <h2 class="form-signin-heading">Gebruiker aanmaken</h2>


            <spring:bind path="gebruikersnaam">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="gebruikersnaam" class="form-control" placeholder="Gebruikersnaam"
                                autofocus="true"></form:input>
                    <form:errors path="gebruikersnaam"></form:errors>
                </div>
            </spring:bind>


            <spring:bind path="wachtwoord">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="password" path="wachtwoord" class="form-control" placeholder="Wachtwoord"></form:input>
                    <form:errors path="wachtwoord"></form:errors>
                </div>
            </spring:bind>


            <spring:bind path="wachtwoordBevestigen">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <form:input type="password" path="wachtwoordBevestigen" class="form-control"
                                            placeholder="Wachtwoord bevestigen"></form:input>
                                <form:errors path="wachtwoordBevestigen"></form:errors>
                            </div>
                        </spring:bind>


             <spring:bind path="planner">
             <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:checkbox path="planner" value="Planner" /> Planner
              </div>
            </spring:bind>


            <button class="btn btn-lg btn-primary btn-block" type="submit">Verstuur</button>


        </form:form>
    </div>
