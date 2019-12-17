<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">
<head>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <meta charset="utf-8">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <title>Nieuwe/Wijzig voorstelling</title>
</head>
    <body>
        <h1>Nieuwe/Wijzig voorstelling</h1>
        <form:form action="/voorstelling/toevoegen" modelAttribute="voorstelling" method="post">
            <form:hidden path="voorstellingId"/>
            <table>
                <tr>
                    <td>Naam voorstelling:</td>
                    <td>
                        <form:input path="naam" required="required" />
                    </td>
                </tr>
                <tr>
                     <td>Datum en tijdstip:</td>
                     <td>
                        <fmt:formatDate value="${voorstelling.datum}" var="dateString" pattern="yyyy-MM-dd'T'HH:mm" />
                        <form:input type="datetime-local" path="datum" value="${dateString}" required="required" />
                     </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Opslaan"/>
                    </td>
                </tr>
            </table>
        </form:form>
    </body>
</html>