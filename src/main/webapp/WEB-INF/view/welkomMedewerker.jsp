<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Welkom</title>
    <link rel="stylesheet" id="fontawesome-css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css?ver=4.4.0" type="text/css" media="all">
    <link rel="stylesheet" id="themebase-style-css" href="https://hetbolwerk.nl/wp-content/themes/hetbolwerk/styles/main.css?v=4&amp;ver=5.0.8" type="text/css" media="all">
    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
</head>
    <body>
        <jsp:include page="navbar.jsp" />
            <h2>Welkom</h2>

                <div class="featured-page col-12">
                    <div class="row">
                        <div class="col-12">
                            <div class="row">
                                <div class="thumbnail col-12 col-lg-4" style="background-image: url(https://hetbolwerk.nl/wp-content/uploads/2018/08/visual-poppodiumhetbolwerk.jpg);">
                                </div>
                                <div class="info col-12 col-lg-8">
                                    <div class="title">Persoonlijk rooster</div>
                                    <p>Zie hier je persoonlijke rooster</p>
                                    <div class="buttons">
                                        <a href="/voorstelling/weergeven/openvoorstelling" title="Inschrijven voorstelling" class="button">Inschrijven voorstelling
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    </body>
</html>

