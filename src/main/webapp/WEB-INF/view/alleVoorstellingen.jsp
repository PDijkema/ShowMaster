<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


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
                <h1 id="voorstellingDisplay4">Overzicht voorstellingen</h1>
            </div>
        </div>

        <div class="container">
            <a id="voegVoorstellingToeButton" class="btn btn-primary" href="${contextPath}/planner/voorstelling/toevoegen">Voeg voorstelling toe</a>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope ="col">Naam</th>
                            <th scope ="col">Datum en tijd</th>
                            <th scope ="col">Status</th>
                            <th></th>
                            <th scope ="col">Taakbeheer</th>
                            <th scope ="col">Wijzigen</th>
                            <th scope ="col">Verwijderen</th>
                        </tr>
                    </thead>

                    <div class="row row-cols-1 row-cols-md-3">
                        <c:forEach items="${alleVoorstellingen}" var="voorstelling">
                        <tr>
                            <td><c:out value="${voorstelling.naam}"/></td>
                            <td><c:out value="${voorstelling.datum}"/></td>
                            <td>
                                <c:choose>
                                    <c:when test="${voorstelling.status == 'Geannuleerd'}">
                                        <span class="badge badge-danger">Voorstelling geannuleerd</span>
                                    </c:when>
                                    <c:otherwise>
                                        <c:out value="${voorstelling.status}"/>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${voorstelling.status == 'Ongepubliceerd'}">
                                        <div>
                                        <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#exampleModal" data-myvalue="${voorstelling.voorstellingId}">
                                            Publiceer ${voorstelling.voorstellingId}
                                        </button>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- nothing yet  -->
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${voorstelling.status == 'Geannuleerd'}">
                                        <!-- nothing yet  -->
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${contextPath}/planner/voorstelling/details/<c:out value="${voorstelling.voorstellingId}" />">
                                            <i class="fas fa-user-edit" title="Taakbeheer"></i>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
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
                            </td>
                            <td><a href="${contextPath}/planner/voorstelling/verwijderen/<c:out value='${voorstelling.voorstellingId}' />">
                                <i class="fas fa-trash" title="Verwijderen"></i>
                            </a></td>
                        </tr>
                        </c:forEach>
                    </div>

                </table>



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
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <a class="btn btn-primary btn" id="publish" href="${contextPath}/planner/voorstelling/publiceren/ />">Publiceer</a>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            $('#exampleModal').on('show.bs.modal', function (event) {
              var button = $(event.relatedTarget)
              var voorstellingId = button.data('myvalue')
              var modal = $(this)
              $('#publish').attr("href", "${contextPath}/planner/voorstelling/publiceren/" + voorstellingId);
            })
        </script>
        </div>
    </body>
</html>

<div class="container">
    <div class="row">
        <div class="card-deck">
            <div class="card">
                <div class="card-header">Header</div>
                <div class="card-body">
                    <h1 class="card-title">Card title</h1>
                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                </div>
                <div class="card-footer">
                    <small class="text-muted">Last updated 3 mins ago</small>
                </div>
            </div>
        </div>
    </div>
</div>