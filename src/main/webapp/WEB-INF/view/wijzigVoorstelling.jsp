<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import = "jared.simpledatabase.*" %>

<!doctype html>
<html lang="en" xmlns:form="http://www.w3.org/1999/xhtml">
<head>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="\resources\js\validation.js"></script>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Wijzig voorstelling</title>
</head>
    <body>
        <jsp:include page="navbar.jsp" />
        <h1>Wijzigen voorstelling</h1>
        <form:form action="/planner/voorstelling/wijzigen" modelAttribute="voorstelling" method="post">
            <form:hidden path="voorstellingId"/>
            <table>
                <div>
                    <tr>
                        <td>Naam voorstelling:</td>
                        <td>
                            <form:input class="form-control mb-2 mr-sm-2" path="naam" required="required" />
                        </td>
                    </tr>
                    <tr>
                         <td>Datum en tijdstip:</td>
                         <td>
                            <form:input type="datetime-local" class="form-control mb-2 mr-sm-2" path="datum" value="${dateString}" required="required" />
                         </td>
                    </tr>
                    <tr>
                        <td>Status:</td>
                        <td>
                            <input class="form-control" type="text" placeholder="${voorstelling.status}" readonly>
                        </td>
                        <td>
                            <a onclick="return confirm('Weet je het zeker?')" class="btn btn-danger" href="/planner/voorstelling/annuleren/${voorstelling.voorstellingId}">Voorstelling annuleren</a>














                        </td>
                    </tr>
                </div>
                <tr>
                    <td colspan="1">
                        <input type="submit" class="btn btn-primary" value="Opslaan"/>
                    </td>
                </tr>
            </table>
        </form:form>
                <a class="btn btn-primary" href="/planner/voorstellingen">Overzicht Voorstellingen</a>
    </body>
</html>