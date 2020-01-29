
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!doctype html>
<html lang="en">
<head>
    <title>Gebruikersoverzicht</title>
    <script src="https://kit.fontawesome.com/1eeb88da0f.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="${contextPath}\resources\css\custom.css" type="text/css" rel="stylesheet">
</head>
    <body>
        <jsp:include page="navbar.jsp" />
        <div class="container">
        <h1>Medewerker uitnodigen</h1>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" >Stuur uitnodiging</button>
            <h1>Gebruikersoverzicht</h1>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope ="col">Naam</th>
                            <th scope ="col">Verwijderen</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${alleGebruikers}" var="gebruiker">
                            <tr>
                                <td><c:out value="${gebruiker.gebruikersnaam}"/></td>
                                <td>
                                    <a href="${contextPath}/planner/gebruiker/verwijderen/<c:out value="${gebruiker.medewerkerId}"/>">
                                        <i class="fas fa-trash" title="Verwijderen"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
    </body>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="exampleModalLabel">Medewerker uitnodigen</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form:form action="${contextPath}/planner/gebruiker/overzicht/uitnodigen" modelAttribute="uitnodigingMedewerker" method="post">
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">E-mailadres Ontvanger:</label>
                        <form:input class="form-control" id="recipient-name" path="emailAdres"/>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Bericht:</label>
                        <form:input class="form-control" id="message-text" path="bericht"/>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Sluiten</button>
                        <input type="submit" class="btn btn-primary" value="Verstuur"/>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>

<!--<script>
$('#exampleModal').on('show.bs.modal', function (event) {
  //var button = $(event.relatedTarget) // Button that triggered the modal
  //var recipient = button.data('whatever') // Extract info from data-* attributes
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  modal.find('.modal-title').text('New message to ' + recipient)
  modal.find('.modal-body input').val(recipient)
})
</script>-->

</html>