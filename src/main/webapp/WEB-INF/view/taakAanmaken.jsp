<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html lang="en">
    <head>
        <title>Maak een nieuwe taak aan</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="${contextPath}\resources\css\custom.css" type="text/css" rel="stylesheet">
        <script src="${contextPath}\resources\js\validation.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </head>

    <body>
        <jsp:include page="navbar.jsp" />
            <div class="jumbotron jumbotron-fluid">
                <div class="container">
                    <h1 class="voorstellingDisplay4">Nieuwe taak aanmaken</h1>
                </div>
            </div>
        <div class="container">
        <form:form action="${contextPath}/planner/taak/aanmaken" modelAttribute="taak" method="post" novalidate="true" class="needs-validation">
            <table>
                <tr>
                    <td>Taaknaam:</td>
                    <td>
                        <form:input class="form-control" path="taakNaam" required="true" />
                         <div class="invalid-feedback">Voer een geldige taaknaam in.</div>
                    </td>
                </tr>
                <tr>
                    <td>Standaard bezetting:</td>
                    <td>
                        <form:input class="form-control" path="standaardBezetting" required="true" input="integer" pattern="\d{1,5}" min="0"  />
                        <div class="invalid-feedback">
                            Voer een getal in.
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button class="btn btn-primary" type="submit">Taak opslaan</button>
                    </td>
                </tr>
            </table>
        </form:form>
        </div>
    </body>
</html>