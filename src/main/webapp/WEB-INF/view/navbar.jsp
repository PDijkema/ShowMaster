<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="nl"><!--<![endif]-->

    <head>

	<!-- Wordpress header scripts and styles -->
    <link rel="stylesheet" id="fontawesome-css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css?ver=4.4.0" type="text/css" media="all">
    <link rel="stylesheet" id="themebase-style-css" href="https://hetbolwerk.nl/wp-content/themes/hetbolwerk/styles/main.css?v=4&amp;ver=5.0.8" type="text/css" media="all">

	</head>

	<body class="home page-template-default page page-id-70">
		<header>
			<div class="header-bottom">
				<div class="container">
					<div class="row">
						<div class="logo">
                                <h1>
									<a class="main-logo" title="Poppodium Het Bolwerk">
										<img src="https://hetbolwerk.nl/wp-content/themes/hetbolwerk/images/hetbolwerklogo.svg" alt="Poppodium Het Bolwerk">
									</a>
									<a class="responsive-logo" title="Poppodium Het Bolwerk">
										<img src="https://hetbolwerk.nl/wp-content/themes/hetbolwerk/images/hetbolwerklogo-beeldmerk.svg" alt="Poppodium Het Bolwerk">
									</a>
								</h1>
                        </div>
						<div class="col-12 main-nav">
							<ul class="nav primary">
							    <li class="menu-item menu-item-type-post_type menu-item-object-page">
							        <a href="/medewerker/welkom">Startpagina</a></li>
                                <c:if test="${role == 'planner'}">
                                    <li class="menu-item menu-item-type-post_type menu-item-object-page">
                                        <a href="/voorstellingen">Voorstellingen</a></li>
                                    <li class="menu-item menu-item-type-post_type menu-item-object-page">
                                        <a href="/planner/gebruiker/overzicht">Gebruikersoverzicht</a></li>
                                    </c:if>
                                <li class="menu-item menu-item-type-post_type menu-item-object-page">
                                    <a href="/profielpagina">Profielpagina</a></li>
                                 <li class="menu-item menu-item-type-post_type menu-item-object-page">
                                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                                        <form id="logoutForm" method="POST" action="${contextPath}/logout">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        </form>
                                    </c:if>
                                    <a onclick="document.forms['logoutForm'].submit()">Uitloggen</a>
                            </ul>
                                <div class="responsive-toggle"></div>
						</div>
					</div>
				</div>
			</div>
		</header>
    </body>
</html>