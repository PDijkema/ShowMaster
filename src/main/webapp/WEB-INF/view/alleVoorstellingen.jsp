<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!doctype html>
<html lang="en">

    <head>
        <title>Voorstellingen</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="${contextPath}\resources\css\custom.css" type="text/css" rel="stylesheet">
        <link href="${contextPath}\resources\css\all.css" type="text/css" rel="stylesheet">
        <script src="${contextPath}\resources\js\ajax.js"></script>
        <script src="${contextPath}\resources\js\javascript.functies.js"></script>

    </head>

    <body>
        <jsp:include page="navbar.jsp" />
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1 class="voorstellingDisplay4">Overzicht voorstellingen</h1>
            </div>
        </div>

        <div class="container">
            <h2>Voorstelling toevoegen</h2>
            <a id="voegVoorstellingToeButton" class="btn btn-primary" href="${contextPath}/planner/voorstellingen/voorstelling/toevoegen">Handmatig</a>
            <a id="voorstellingenImporterenExcelButton" class="btn btn-primary" href="${contextPath}/planner/voorstellingen/excel">Excel import</a>

            <table class="table table-hover" id="myTable" >

                <thead>
                <tr>
                    <th scope="col" onclick="sortTable(0)">Voorstelling</th>
                    <th scope="col" onclick="sortTable(2)">Datum</th>
                    <th hidden scope="col" onclick="sortTable(2)">Datum2</th>
                    <th scope="col" onclick="sortTable(3)">Status</th>
                    <th scope="col" >Roosterbeheer</th>
                    <th scope="col" >Wijzigen</th>
                    <th scope="col" >Verwijderen</th>
                </tr>
                </thead>

                <c:forEach items="${alleVoorstellingen}" var="voorstelling">
                <tbody>

                <td><h2><c:out value="${voorstelling.getNaam()}"/></h2></td>
                <td> <c:out value="${voorstelling.getDatum()}"/></td>
                <td hidden><c:out value="${voorstelling.getLocalDateTime()}"/></td>
                    <td>  <c:choose>
                        <c:when test="${voorstelling.status == 'Geannuleerd'}">
                            <span class="badge badge-danger">Voorstelling geannuleerd</span>
                        </c:when>
                        <c:when test="${voorstelling.status == 'Ongepubliceerd'}">
                            <div>
                                <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal"
                                data-target="#waarschuwingsModal"
                                onclick="vullenModal(
                                'Voorstelling publiceren',
                                'Medewerkers kunnen zicht nu inschrijven voor deze voorstelling. Weet je het zeker?',
                                'Publiceer',
                                '/planner/voorstellingen/voorstelling/publiceren/<c:out value= '${voorstelling.voorstellingId}'/>')">
                                Publiceer
                                </button>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <span class="badge badge-success"><c:out value="${voorstelling.status}"/></span>
                        </c:otherwise>
                    </c:choose> </td>

                            <td>
                                <c:choose>
                                    <c:when test="${voorstelling.status == 'Geannuleerd'}">
                                        <!-- nothing yet  -->
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${contextPath}/planner/voorstellingen/voorstelling/rooster/<c:out value='${voorstelling.voorstellingId}' />">
                                            <i class="fas fa-user-edit" title="Planning"></i>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${voorstelling.status == 'Geannuleerd'}">
                                        <!-- nothing yet -->
                                    </c:when>
                                    <c:otherwise>

                                    <td> <a href="${contextPath}/planner/voorstellingen/voorstelling/wijzigen/<c:out value='${voorstelling.voorstellingId}' />">
                                          <i class="far fa-edit" title="Wijzigen"></i></a>
                                    </td>

                                    </c:otherwise>
                                </c:choose>

                                <td>
                                    <i class="fas fa-trash" title="Verwijderen" data-toggle="modal"
                                    data-target="#waarschuwingsModal"
                                    onclick="vullenModal(
                                    'Voorstelling verwijderen',
                                    'Weet je zeker dat je deze voorstelling wilt verwijderen?',
                                    'Verwijderen',
                                    '/planner/voorstellingen/voorstelling/verwijderen/<c:out value= '${voorstelling.voorstellingId}'/>')">
                                    </i>
                                </a>
                                </td>

                            </td>
                </tbody>
                </c:forEach>
            </table>
        </div>
            <jsp:include page="waarschuwingsPopups.jsp" />
            <script type="text/javascript" src="${contextPath}\resources\js\modal.functies.js"></script>
    </body>
</html>