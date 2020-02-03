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
            <a id="voegVoorstellingToeButton" class="btn btn-primary" href="${contextPath}/planner/voorstelling/toevoegen">Handmatig</a>
            <a id="voorstellingenImporterenExcelButton" class="btn btn-primary" href="${contextPath}/planner/excelProcessing">Excel import</a>
            <div class="card-columns">
                <c:forEach items="${alleVoorstellingen}" var="voorstelling">
                    <div class="card">
                        <div class="card-header">
                            <h1><c:out value="${voorstelling.naam}"/></h1>
                            <c:out value="${voorstelling.datum}" />
                        </div>
                        <div class="card-body">
                            <p class="card-text">Hey, Luke! May the Force be with you. Still, she's got a lot of spirit. I don't know, what do you think?</p>

                        </div>
                        <ul class="list-group list-group-flush" style="text-align:center">
                            <li class="list-group-item">
                                <c:choose>
                                    <c:when test="${voorstelling.status == 'Geannuleerd'}">
                                        <span class="badge badge-danger">Voorstelling geannuleerd</span>
                                    </c:when>
                                    <c:when test="${voorstelling.status == 'Ongepubliceerd'}">
                                        <div>
                                            <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#exampleModal" data-voorstelling="${voorstelling.voorstellingId}">
                                                Publiceer
                                            </button>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge badge-success"><c:out value="${voorstelling.status}"/></span>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                            <li class="list-group-item">
                                <c:choose>
                                    <c:when test="${voorstelling.status == 'Geannuleerd'}">
                                        <!-- nothing yet  -->
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${contextPath}/planner/voorstelling/details/<c:out value='${voorstelling.voorstellingId}' />">
                                            <i class="fas fa-user-edit" title="Taakbeheer"></i>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${voorstelling.status == 'Geannuleerd'}">
                                        <!-- nothing yet -->
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${contextPath}/planner/voorstelling/wijzigen/<c:out value='${voorstelling.voorstellingId}' />">
                                            <i class="far fa-edit" title="Wijzigen"></i>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                                <a href="${contextPath}/planner/voorstelling/verwijderen/<c:out value='${voorstelling.voorstellingId}' />">
                                    <i class="fas fa-trash" title="Verwijderen"></i>
                                </a>
                            </li>
                        </ul>
                        <div class="card-footer">
                            <small class="text-muted"></small>
                        </div>
                    </div>
                </c:forEach>
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
                            <a class="btn btn-primary btn" id="publish" href="${contextPath}/planner/voorstelling/publiceren/ />">Publiceer</a>
                        </div>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
                $('#exampleModal').on('show.bs.modal', function(event) {
                    var button = $(event.relatedTarget)
                    var voorstellingId = button.data('voorstelling')
                    var modal = $(this)
                    $('#publish').attr("href", "${contextPath}/planner/voorstelling/publiceren/" + voorstellingId);
                })
            </script>
        </div>
    </body>
</html>

