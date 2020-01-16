<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Inloggen</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="\resources\css\custom.css" type="text/css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="${contextPath}\resources\js\validation.js"></script>
	</head>

  <body>
    <header>
        <div class="header-bottom">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="#">
                <img src="https://hetbolwerk.nl/wp-content/themes/hetbolwerk/images/hetbolwerklogo.svg" height="30" class="d-inline-block align-top" alt="Poppodium Het Bolwerk">
                </a>
            </nav>
        </div>

    <div class="container">
      <form method="POST" action="${contextPath}/login"  class="needs-validation" novalidate="true">
        <h2 class="form-heading">Log in</h2>

        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span class = "alert-success">${message}</span>

            <div class="my-2">
            <input name="username" type="text" class="form-control" placeholder="Gebruikersnaam"
                   autofocus="true" required="true">
                <div class="invalid-feedback">
                    Voer een gebruikersnaam in
                </div>
            </div>

                <div class="my-2">
            <input name="password" type="password" class="form-control" placeholder="Wachtwoord" required="true"/>
                    <div class="invalid-feedback">
                        Voer een wachtwoord in
                    </div>

                </div>

            <div class="text-danger">
            <small>${error}</small> </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="my-2">
                <button class="btn btn-primary" type="submit">Log in</button>
                <a href="${contextPath}/registreer"> <button class="btn btn-primary" type="button" >Gebruiker aanmaken</button></a>
            </div>



        </div>
      </form>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
  </body>
</html>