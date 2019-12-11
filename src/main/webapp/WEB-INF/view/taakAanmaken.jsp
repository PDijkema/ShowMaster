<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
    <head>
        <title>Maak een nieuwe taak aan</title>
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
                        <input type="submit" value="Sla taak op" />
                    </td>
                </tr>
            </table>
        </form:form>
    </body>
</html>