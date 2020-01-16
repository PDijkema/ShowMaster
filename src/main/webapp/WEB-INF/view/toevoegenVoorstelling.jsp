<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en" xmlns:form="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link rel="stylesheet" href="\resources\js\jquery.datetimepicker.min.css">
    <script src="\resources\js\jquery.js"></script>
    <script src="\resources\js\jquery.datetimepicker.full.js"></script>


    <title>Nieuwe voorstelling</title>
</head>
<body>
<h1>Nieuwe voorstelling</h1>
<form:form action="/planner/voorstelling/toevoegen" modelAttribute="voorstelling" method="post">
    <form:hidden path="voorstellingId"/>
    <table>
        <div>
            <tr>
                <td>Naam voorstelling:</td>
                <td>
                    <form:input class="form-control mb-2 mr-sm-2" path="naam" required="required" />
                </td>
            </tr>
<!--
            <tr>
                <td>Datum en tijdstip:</td>
                <td>
                    <form:input type="datetime-local" class="form-control mb-2 mr-sm-2" path="datum" value="${dateString}" required="required" />
                </td>
            </tr>
  -->
            <tr>
                <td>Datum en tijdstip:</td>
                <td>
                    <form:input id="datetime-local" class="form-control mb-2 mr-sm-2" path="datum" value="${dateString}" required="required" />
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



<script>
$("#datetime-local").datetimepicker({
    format: "d-m-Y H:i",
});
</script>

</body>



</html>