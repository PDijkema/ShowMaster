<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en" xmlns:form="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Beheer Taken</title>
</head>
    <body>
        <h1>
            Beheer voorstelling
        </h1>

        <form action="/taken/toevoegen" method="post">
            <table>
                <tr>
                    <th>Taaknaam</th>
                    <th>Aantal</th>
                </tr>
                    <c:forEach items="${alleTaken}" var="taak">
                        <tr>
                            <div class="input-group mb-3">
                                <td>
                                    <div class="input-group-prepend">
                                        <p><c:out value="${taak.taakNaam}"/></p>
                                        <input type="hidden" value="${taak.taakId}"/>

                                    </div>
                                </td>
                                <td>
                                    <select name="aantal" class="custom-select" id="inputGroupSelect03" aria-label="button addon">
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
                    <input type="submit" class="btn btn-primary" value="Opslaan">
                </td>
            </table>
        </form>
        <a class="btn btn-primary" href="/voorstellingen">Overzicht Voorstellingen</a>
    </body>

</html>