<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="nl"><!--<![endif]-->

    <head>

	<!-- Wordpress header scripts and styles -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="\resources\css\custom.css" type="text/css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	</head>

	<body class="home page-template-default page page-id-70">
        <form:hidden path="medewerkerId" />
        <form:hidden path="planner" />

        <header>
            <div id="headerNavbar">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a class="navbar-brand" href="/startpagina">
                    <img src="https://hetbolwerk.nl/wp-content/themes/hetbolwerk/images/hetbolwerklogo.svg" height="30" class="d-inline-block align-top" alt="Poppodium Het Bolwerk">
                    </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav">
                            <a class="nav-item nav-link active" href="/startpagina">STARTPAGINA <span class="sr-only">(current)</span></a>
                            <sec:authorize access="hasRole('PLANNER')">
                                <a class="nav-item nav-link" href="/planner/voorstellingen">VOORSTELLINGEN</a>
                                <a class="nav-item nav-link" href="/planner/taak/aanmaken">TAAK AANMAKEN</a>
                                <a class="nav-item nav-link" href="/planner/gebruiker/overzicht">GEBRUIKERSOVERZICHT</a>
                                <a class="nav-item nav-link" href="/registreer">GEBRUIKER AANMAKEN</a>
                            </sec:authorize>
                            <a class="nav-item nav-link" href="/profielpagina">PROFIELGEGEVENS</a>
                            <c:if test="${pageContext.request.userPrincipal.name != null}">
                                <form id="logoutform" action="${contextPath}/logout" method="post">
                                    <input name="utf8" type="hidden" value="✓">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </c:if>
                                    <button class="btn btn-outline-primary" type="submit">
                                    Uitloggen
                                    </button>
                                </form>
                        </div>
                    </div>
                </nav>
            </div>
        </header>
    </body>
</html>