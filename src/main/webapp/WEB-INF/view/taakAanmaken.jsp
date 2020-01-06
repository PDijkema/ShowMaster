<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html lang="en">
    <head>
        <title>Maak een nieuwe taak aan</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <h1>Maak een nieuwe taak aan</h1>

        <form:form action="/taak/aanmaken" modelAttribute="taak" method="post">
            <table>
                <tr>
                    <td>Taaknaam:</td>
                    <td>
                        <form:input path="taakNaam" />
                    </td>
                </tr>
                <tr>
                    <td>Standaard bezetting:</td>
                    <td>
                        <form:input path="standaardBezetting" />
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                         <button class="btn btn-primary" type="submit">Sla taak op</button>
                    </td>
                </tr>
            </table>
        </form:form>
    </body>
</html>