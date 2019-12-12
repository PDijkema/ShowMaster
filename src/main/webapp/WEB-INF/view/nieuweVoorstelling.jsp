<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">
<head>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

  <meta charset="utf-8">
  <title>Nieuwe voorstelling</title>
</head>

    <script>
      $(function () {
        $('#datetimepicker1').datetimepicker();
     });
    </script>

    <body>
        <h1>Nieuwe voorstelling</h1>
        <form:form action="/voorstelling/toevoegen" modelAttribute="voorstelling" method="post">
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