<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!doctype html>
<html lang="en">

    <head>
        <title>Voorstellingen</title>
        <script src="https://kit.fontawesome.com/1eeb88da0f.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="${contextPath}\resources\css\custom.css" type="text/css" rel="stylesheet">
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
            <a id="nieuweVoorstellingModalButton" class="btn btn-primary" <%--onclick="nieuweVoorstelling('${contextPath}')"--%> data-toggle="modal" data-target="#nieuweVoorstellingModal">Voorstelling Toevoegen</a>
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

                <td><h1><c:out value="${voorstelling.getNaam()}"/></h1></td>
                <td> <c:out value="${voorstelling.getDatum()}"/></td>
                <td hidden><c:out value="${voorstelling.getLocalDateTime()}"/></td>
                    <td>  <c:choose>
                        <c:when test="${voorstelling.status == 'Geannuleerd'}">
                            <span class="badge badge-danger">Voorstelling geannuleerd</span>
                        </c:when>
                        <c:when test="${voorstelling.status == 'Ongepubliceerd'}">
                            <div>
                                <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#exampleModal" onclick="voorstellingIdMeegeven(${voorstelling.voorstellingId})">
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
                                <a href="${contextPath}/planner/voorstellingen/voorstelling/verwijderen/<c:out value='${voorstelling.voorstellingId}' />">
                                    <i class="fas fa-trash" title="Verwijderen"></i>
                                </a>
                                </td>
                            </td>
                </tbody>
                </c:forEach>
            </table>
        </div>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2 class="modal-title" id="exampleModalLabel">Voorstelling publiceren</h2>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Medewerkers kunnen zicht nu inschrijven voor deze voorstelling. Weet je het zeker?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Sluiten</button>
                            <a class="btn btn-primary btn" id="publish" href="${contextPath}/planner/voorstellingen/voorstelling/publiceren/ />">Publiceer</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="nieuweVoorstellingModal" tabindex="-1" role="dialog" aria-labelledby="nieuweVoorstellingModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2 class="modal-title" id="nieuweVoorstellingModalLabel">Voorstelling Toevoegen</h2>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <%--<p id="nieuweVoorstellingToevoegen"></p>--%>

                            <tr>
                                <td>Naam voorstelling:</td>
                                <td>
                                    <input class="form-control mb-2 mr-sm-2" path="naam" required="required" />
                                </td>
                            </tr>
                            <tr>
                                <td>Datum en tijdstip:</td>
                                <td>
                                    <input id="kalender" class="form-control mb-2 mr-sm-2" path="localDateTime" value="${dateString}" required="required" />
                                </td>
                            </tr>
                        </div>
                        <div class="modal-footer">
                            <a type="button" class="btn btn-primary btn" id="opslaanVoorstelling" href="${contextPath}/planner/voorstellingen/voorstelling/toevoegen">Opslaan</a>
                            <button type="button"  class="btn btn-secondary" data-dismiss="modal">Sluiten</button>
                        </div>
                    </div>
                </div>
            </div>

            <script type="text/javascript">
                function voorstellingIdMeegeven (voorstellingId) {
                        $('#publish').attr("href", "${contextPath}/planner/voorstellingen/voorstelling/publiceren/" + voorstellingId);
                }
            </script>

            <link rel="stylesheet" href="${contextPath}\resources\css\jquery.datetimepicker.min.css">
            <script src="${contextPath}\resources\js\jquery.js"></script>
            <script src="${contextPath}\resources\js\jquery.datetimepicker.full.js"></script>

            <script>
                $(document).ready(function(){
                    $("#kalender").datetimepicker({
                        format: "d-m-Y H:i",
                    });
                });
            </script>
    </body>
</html>