<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!doctype html>
<html lang="en" xmlns:form="http://www.w3.org/1999/xhtml">

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
            <a id="nieuweVoorstellingModalButton" class="btn btn-primary" onclick="nieuweVoorstelling('${contextPath}')" data-toggle="modal" data-target="#nieuweVoorstellingModal">Toevoegen</a>
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
                                        <td></td>
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

                                    <td>
                                        <i class="far fa-edit" title="Wijzigen" data-toggle="modal"
                                         data-target="#wijzigVoorstellingModal"
                                         onclick="wijzigVoorstelling('${contextPath}','${voorstelling.voorstellingId}')">
                                         </i>
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
                                </td>
                            </td>
                </tbody>
                </c:forEach>
            </table>
        </div>
        <div class="modal fade" id="nieuweVoorstellingModal" tabindex="-1" role="dialog" aria-labelledby="nieuweVoorstellingModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title" id="nieuweVoorstellingModalLabel">Voorstelling toevoegen</h2>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p id="nieuweVoorstellingToevoegen"></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="wijzigVoorstellingModal" tabindex="-1" role="dialog" aria-labelledby="wijzigVoorstellingModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title" id="wijzigVoorstellingModalLabel">Voorstelling wijzigen</h2>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p id="voorstellingWijzigen"></p>
                    </div>
                </div>
            </div>
        </div>
            <jsp:include page="waarschuwingsPopups.jsp" />
            <script type="text/javascript" src="${contextPath}\resources\js\modal.functies.js"></script>
            <link rel="stylesheet" href="${contextPath}\resources\css\jquery.datetimepicker.min.css">
            <script src="${contextPath}\resources\js\jquery.js"></script>
            <script src="${contextPath}\resources\js\jquery.datetimepicker.full.js"></script>
    </body>
</html>

