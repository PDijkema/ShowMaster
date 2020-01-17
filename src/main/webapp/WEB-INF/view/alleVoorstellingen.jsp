<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!doctype html>
<html lang="en">
<head>
    <title>Voorstellingen</title>
    <script src="https://kit.fontawesome.com/1eeb88da0f.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="${contextPath}\resources\css\custom.css" type="text/css" rel="stylesheet">
</head>
    <body>
        <jsp:include page="navbar.jsp" />
        <div class="container">
            <h1>Overzicht voorstellingen</h1>
            <a class="btn btn-primary" href="${contextPath}/planner/voorstelling/toevoegen">Voeg voorstelling toe</a>
            <br>
            <div class="row row-cols-1 row-cols-md-3">
                <c:forEach items="${alleVoorstellingen}" var="voorstelling">
                    <div class="col mb-4">
                        <div class="card-deck">
                            <div class="card" style="width: 18rem;">
                                <div class="card-body">
                                    <h1 class="card-title"><c:out value="${voorstelling.naam}"/></h1>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">Datum: <c:out value="${voorstelling.datum}"/></li>
                                    <li class="list-group-item">
                                        Status:
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

                                    </li>
                                </ul>
                                <div class="card-body">
                                    <td>
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
                                    <td>
                                        <a href="${contextPath}/planner/voorstelling/verwijderen/<c:out value='${voorstelling.voorstellingId}' />">
                                            <i class="fas fa-trash" title="Verwijderen"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${voorstelling.status == 'Ongepubliceerd'}">
                                                <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#exampleModal">
                                                    Publiceer
                                                </button>
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
                                                                <a class="btn btn-primary btn" href="${contextPath}/planner/voorstelling/publiceren/<c:out value='${voorstelling.voorstellingId}' />">Publiceer</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>


