
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="beschikbaar" value="Beschikbaar"/>
<c:set var="misschien" value="Misschien"/>
<c:set var="nietBeschikbaar" value="Niet Beschikbaar"/>

<!doctype html>
<html lang="en" xmlns:c="http://www.w3.org/1999/XSL/Transform">
<head>
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="${contextPath}\resources\css\custom.css" type="text/css" rel="stylesheet">
</head>

<body>
    <jsp:include page="navbar.jsp" />
    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="voorstellingDisplay4">Inschrijven</h1>
        </div>
    </div>
    <div class="container">
        <div class="container">
            <h1>Open voorstellingen</h1>
            <table class="table table-hover" id="myTable">
                <thead>
                <tr>
                    <th scope ="col">Voorstelling</th>
                    <th scope ="col">Datum</th>
                    <th scope ="col">Beschikbaar</th>
                    <th scope ="col">Misschien</th>
                    <th scope ="col">Niet Beschikbaar</th>
                </tr>
                </thead>

                <tbody>

                <c:forEach items="${voorstellingLijst}" var="voorstelling">
                    <c:if test="${voorstelling.status == 'Gepubliceerd'}">
                        <tr >

                        <td><h1><c:out value="${voorstelling.getNaam()}"/></h1></td>
                        <td><c:out value="${voorstelling.getDatum()}"/></td>
                            <td><a class="btn btn-secondary btn-lg my-2"  role="button" onclick="buttonClassveranderen('btn-secondary','btn-success', this) ">Beschikbaar</a></td>
                            <td><a class="btn btn-secondary btn-lg my-2" role="button" onclick="buttonClassveranderen2('btn-secondary','btn-warning', this)">Misschien</a></td>
                            <td><a class="btn btn-secondary btn-lg my-2" role="button" onclick="buttonClassveranderen3('btn-secondary','btn-danger', this)">Niet Beschikbaar</a></td>

                        </tr>

                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="container">
            <h1>Ingeschreven voorstellingen</h1>
            <div class="card-columns">
                <c:forEach items="${inschrijvingen}" var="inschrijving">
                    <div class="card">
                        <div class="card-header">
                            <h1><c:out value="${inschrijving.getVoorstelling().getNaam()}"/></h1><c:out value="${inschrijving.getVoorstelling().getDatum()}"/>
                        </div>
                        <div class="card-body">
                            <c:choose>
                                <c:when test="${inschrijving.getVoorstelling().getStatus() == 'Geannuleerd'}">
                                    <span class="badge badge-danger">Voorstelling Geannuleerd</span>
                                </c:when>
                                <c:otherwise>

                                        <div class="list-group mr-2">
                                            <c:choose>
                                            <c:when test="${inschrijving.getInschrijvingStatus() == 'Beschikbaar'}">
                                                <button class="btn btn-success btn-lg my-2 focus {background: green;}" role="button">Beschikbaar</button>
                                                <a class="btn btn-warning btn-lg my-2" href="${contextPath}/voorstelling/weergeven/openvoorstelling/inschrijven/<c:out value='${inschrijving.getVoorstelling().getVoorstellingId()}'/>"  role="button">Misschien</a>
                                                <a class="btn btn-danger btn-lg my-2" href="${contextPath}/voorstelling/weergeven/openvoorstelling/inschrijven/<c:out value='${inschrijving.getVoorstelling().getVoorstellingId()}'/>"  role="button">Niet Beschikbaar</a>
                                            </c:when>
                                                <c:when test="${inschrijving.getInschrijvingStatus() == 'Misschien'}">
                                                    <a class="btn btn-success btn-lg my-2" href="${contextPath}/voorstelling/weergeven/openvoorstelling/inschrijven/<c:out value='${inschrijving.getVoorstelling().getVoorstellingId()}'/>"  role="button">Beschikbaar</a>
                                                    <button class="btn btn-warning btn-lg my-2 focus {background: yellow;}" role="button">Misschien</button>
                                                    <a class="btn btn-danger btn-lg my-2" href="${contextPath}/voorstelling/weergeven/openvoorstelling/inschrijven/<c:out value='${inschrijving.getVoorstelling().getVoorstellingId()}'/>"  role="button">Niet Beschikbaar</a>
                                                </c:when>
                                                <c:when test="${inschrijving.getInschrijvingStatus() == 'Niet Beschikbaar'}">
                                                    <a class="btn btn-success btn-lg my-2" href="${contextPath}/voorstelling/weergeven/openvoorstelling/inschrijven/<c:out value='${inschrijving.getVoorstelling().getVoorstellingId()}'/>"  role="button">Beschikbaar</a>
                                                    <a class="btn btn-warning btn-lg my-2" href="${contextPath}/voorstelling/weergeven/openvoorstelling/inschrijven/<c:out value='${inschrijving.getVoorstelling().getVoorstellingId()}'/>"  role="button">Misschien</a>
                                                    <button class="btn btn-danger btn-lg my-2 focus {background: red;}" role="button">Niet Beschikbaar</button>
                                                </c:when>
                                            </c:choose>

                                        </div>

                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>

<script>









    function buttonClassveranderen(teVerwijderenKlasse, gewensteKlasse, thisParameter) {
        var myTable = document.getElementById('myTable');
        var x =  ($(thisParameter).closest('tr').index());
        x++;
        myTable.rows[x].cells[3].innerHTML = '<a class="btn btn-secondary btn-lg my-2" role="button" onclick="buttonClassveranderen2(\'btn-secondary\',\'btn-warning\', this)">Misschien</a>';
        myTable.rows[x].cells[4].innerHTML = '<a class="btn btn-secondary btn-lg my-2" role="button" onclick="buttonClassveranderen3(\'btn-secondary\',\'btn-danger\', this)">Niet Beschikbaar</a>';
        $(thisParameter).removeClass(teVerwijderenKlasse).addClass(gewensteKlasse);


    }

    function buttonClassveranderen2(teVerwijderenKlasse, gewensteKlasse, thisParameter) {
        var elem = $('a[id="buttonBeschikbaar"]');
        var myTable = document.getElementById('myTable');
        var x =  ($(thisParameter).closest('tr').index());
        x++;
        myTable.rows[x].cells[2].innerHTML = '<td><a class="btn btn-secondary btn-lg my-2" role="button" onclick="buttonClassveranderen(\'btn-secondary\',\'btn-success\', this)">Beschikbaar</a>';
        myTable.rows[x].cells[4].innerHTML = '<td><a class="btn btn-secondary btn-lg my-2" role="button" onclick="buttonClassveranderen3(\'btn-secondary\',\'btn-danger\', this)">Niet Beschikbaar</a>';

        $(thisParameter).removeClass(teVerwijderenKlasse).addClass(gewensteKlasse);

    }
    function buttonClassveranderen3(teVerwijderenKlasse, gewensteKlasse, thisParameter) {
        var elem = $('a[id="buttonBeschikbaar"]');
        var myTable = document.getElementById('myTable');
        var x =  ($(thisParameter).closest('tr').index());
        x++;
        myTable.rows[x].cells[2].innerHTML = '<td><a class="btn btn-secondary btn-lg my-2" role="button" onclick="buttonClassveranderen(\'btn-secondary\',\'btn-success\', this)">Beschikbaar</a>';
        myTable.rows[x].cells[3].innerHTML = '<td><a class="btn btn-secondary btn-lg my-2" role="button"  onclick="buttonClassveranderen2(\'btn-secondary\',\'btn-warning\', this)">Misschien</a>';

        $(thisParameter).removeClass(teVerwijderenKlasse).addClass(gewensteKlasse);

    }
</script>



<script>


</script>


