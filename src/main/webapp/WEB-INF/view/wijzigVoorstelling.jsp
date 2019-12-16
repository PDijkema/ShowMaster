<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">
<head>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <meta charset="utf-8">
  <title>Wijzig voorstelling</title>
</head>
    <body>
        <h1>Wijzig voorstelling</h1>
        <form:form action="/voorstelling/wijzigen" modelAttribute="voorstelling" method="post">
            <table>
                <tr>
                    <td>Naam voorstelling:</td>
                    <td>
                        <form:input path="naam"/>
                    </td>
                </tr>
                <tr>
                     <td>Datum en tijdstip:</td>
                     <td>
                        <input type="datetime-local" name="datum"/>
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