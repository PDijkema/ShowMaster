<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
<table lang="en">
<head>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Details Voorstelling</title>
</head>
    <table>
        <h1>Details voorstelling</h1>
        <tr>
            <td scope="col">Naam voorstelling:</td>
            <td scope="col">${voorstelling.naam}</td>
        </tr>
        <tr>
            <td scope="col">Datum en tijdstip:</td>
            <td scope="col">${voorstelling.datum}</td>
        </tr>
    </table>

    <h1>Taken</h1>
    <table class="table table-hover">
        <thead>
            <tr>
                <th scope="col">Taak</th>
                <th scope="col">Medewerker</th>
            </tr>
        </thead>
        <tbody>


        </tbody>
    </table>





        <h1>Taken</h1>
        <form:form >
            <table>
                <tr>
                    <th>Taaknaam</th>
                    <th>Medewerker</th>
                </tr>
                <c:forEach items="${alleTaken}" var="taak">
                    <tr>
                        <div class="input-group mb-3">
                            <td>
                                <div class="input-group-prepend">
                                    <p><c:out value="${taak.taakNaam}"/></p>
                                    <p><input type="hidden"  c:out value="${taak.taakId}"/></p>

                                </div>
                            </td>
                            <td>
                                <select name="${taak.taakNaam}" class="custom-select" id="inputGroupSelect03" aria-label="button addon">
                                    <option selected>Geen</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select>
                            </td>
                        </div>
                    </tr>
                </c:forEach>
                <td>
                    <input type="hidden" name="voorstellingId" value="${taak.taakId}"/></p>
                </td>
            </table>
        </form:form>

        <a class="btn btn-primary" href="/voorstellingen">Overzicht Voorstellingen</a>
    </body>
</html>