<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
    <title></title>
</head>
    <body>
        <h1>Overzicht Voorstellingen</h1>
        <table>
            <c:forEach items="${alleVoorstellingen}" var="voorstelling">
                <tr>
                    <td><c:out value="${voorstelling.naam}" /></td>
                    <td><c:out value="${voorstelling.datum}" /></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>