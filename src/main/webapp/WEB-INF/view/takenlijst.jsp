<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS en custom css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="\resources\css\custom.css" type="text/css" rel="stylesheet">

    <title>Standaard taken</title>
  </head>
      <body>
        <jsp:include page="navbar.jsp" />
        <h1>Lijst standaardtaken</h1>

        <form:form action="/planner/takenlijst" modelAttribute="taak">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope ="col">Taaknaam</th>
                        <th scope ="col">Standaard bezetting</td>
                        <th scope ="col">Verwijderen</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${alleTaken}" var="taak">
                    <tr>
                        <td><c:out value="${taak.taakNaam}" /></td>
                        <td><c:out value="${taak.standaardBezetting}" /></td>
                        <td>
                            <a href="/planner/taak/verwijderen/<c:out value="${taak.taakId}" />">
                            <img src="/resources/images/icons/trash.svg" alt="" width="30" height="30" title="Verwijderen" />
                            </a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </form:form>
      </body>
</html>