<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en" xmlns:form="http://www.w3.org/1999/xhtml">
<head>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <meta charset="utf-8">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <title>Nieuwe/Wijzig voorstelling</title>
</head>
    <body>
        <h1>Beheer voorstelling</h1>
        <form:form action="/voorstelling/toevoegen" modelAttribute="voorstelling" method="post">
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
                </div>
                <tr><td><h2>Bezetting taken</h2></td></tr>
                <div>
                    <c:forEach items="${alleTaken}" var="taak">
                        <tr>
                          <td>
                            <label class="input-group"/>
                            <label colspan="1" type="text" class="form-control" aria-label="five button addons" aria-describedby="button-addon"><c:out value="${taak.taakNaam}"/></label>
                              <div>
                                  <select class="custom-select" id="inputGroupSelect03" aria-label="Example select with button addon">
                                      <option selected>Geen</option>
                                      <option value="1">1</option>
                                      <option value="2">2</option>
                                      <option value="3">3</option>
                                  </select>
                              </div>
                          </td>
                        </tr>
                    </c:forEach>
                </div>
                <tr>
                    <td colspan="1">
                        <input type="submit" class="btn btn-primary" value="Opslaan"/>
                    </td>
                </tr>
            </table>
        </form:form>
        <div colspan="1">
            <a class="btn btn-primary" href="/voorstellingen">Overzicht Voorstellingen</a>
        </div>
    </body>
</html>