<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="nl"><!--<![endif]-->

    <head>

	<!-- Wordpress header scripts and styles -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="stylesheet.css"/>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</head>

	<body class="home page-template-default page page-id-70">
        <form:hidden path="medewerkerId" />
        <form:hidden path="planner" />

        <header>
            <div class="header-bottom">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a class="navbar-brand" href="#">
                    <img src="https://hetbolwerk.nl/wp-content/themes/hetbolwerk/images/hetbolwerklogo.svg" height="30" class="d-inline-block align-top" alt="Poppodium Het Bolwerk">
                    </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        </button>
                    <div class="collapse navbar-collapse" id="navbarNavDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item active">
                                <a class="nav-link" href="/medewerker/welkom">Startpagina <span class="sr-only">(current)</span></a>
                            </li>
                            <sec:authorize access="hasRole('PLANNER')">
                            <li class="nav-item">
                                <a class="nav-link" href="/voorstellingen">Voorstellingen</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/taak/aanmaken">Taak aanmaken</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/planner/gebruiker/overzicht">Gebruiker overzicht</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/registreer">Gebruiker aanmaken</a>
                            </li>
                            </sec:authorize>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Mijn profiel
                                </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="/profielpagina">Mijn profielgegevens</a>
                                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                                        <form id="logoutform" action="${contextPath}/logout" method="post">
                                        <input name="utf8" type="hidden" value="✓">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    </c:if>
                                        <button type="submit" class="dropdown-item dropdown-signout">
                                        Uitloggen
                                        </button>
                                        </form>
                            </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </header>
    </body>
</html>