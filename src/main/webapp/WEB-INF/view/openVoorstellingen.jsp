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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="${contextPath}\resources\css\custom.css" type="text/css" rel="stylesheet">
        <script src="${contextPath}\resources\js\ajax.js"></script>
        <script src="${contextPath}\resources\js\javascript.functies.js"></script>
    </head>

    <body>
        <jsp:include page="navbar.jsp"/>
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1 class="voorstellingDisplay4">Inschrijven</h1>
            </div>
        </div>
        <div class="container">
            <div class="container">
                <h1>Open voorstellingen</h1>
                <table class="table table-hover" id="myTable" ,>
                    <thead>
                        <tr>
                            <th scope="col" onclick="sortTable(0)">Voorstelling</th>
                            <th scope="col" onclick="sortTable(1)">Datum</th>
                            <th scope="col" onclick="sortTable(2)">Beschikbaar</th>
                            <th scope="col" onclick="sortTable(3)">Misschien</th>
                            <th scope="col" onclick="sortTable(4)">Niet Beschikbaar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${voorstellingLijst}" var="voorstelling">
                            <c:if test="${voorstelling.status == 'Gepubliceerd'}">
                                <tr>
                                    <td><h1><c:out value="${voorstelling.getNaam()}"/></h1></td>
                                    <td><c:out value="${voorstelling.getDatum()}"/></td>
                                    <td>
                                        <a class="btn btn-secondary btn-lg my-2" role="button"
                                           onclick="
                                           beschikbaarheidStatusDoorgeven(${voorstelling.getVoorstellingId()}, '${beschikbaar}','${contextPath}', this, 'btn-secondary', 'btn-success', 3, 4) ">${beschikbaar}</a>
                                    </td>
                                    <td>
                                        <a class="btn btn-secondary btn-lg my-2" role="button"
                                           onclick="
                                           beschikbaarheidStatusDoorgeven(${voorstelling.getVoorstellingId()}, '${misschien}','${contextPath}', this, 'btn-secondary','btn-warning',2,4 )">${misschien}</a>
                                    </td>
                                    <td>
                                        <a class="btn btn-secondary btn-lg my-2" role="button"
                                           onclick="
                                           beschikbaarheidStatusDoorgeven(${voorstelling.getVoorstellingId()}, '${nietBeschikbaar}','${contextPath}', this, 'btn-secondary','btn-danger', 2,3)">${nietBeschikbaar}</a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        <c:forEach items="${inschrijvingen}" var="inschrijving">
                            <tr>
                                <td><h1><c:out value="${inschrijving.getVoorstelling().getNaam()}"/></h1></td>
                                <td><c:out value="${inschrijving.getVoorstelling().getDatum()}"/></td>
                                <c:choose>
                                    <c:when test="${inschrijving.getInschrijvingStatus() == beschikbaar}">
                                        <td>
                                            <a class="btn btn-success btn-lg my-2" role="button" id='test'
                                               onclick="
                                                       beschikbaarheidStatusDoorgeven(${inschrijving.getVoorstelling().getVoorstellingId()}, '${beschikbaar}','${contextPath}', this, 'btn-secondary', 'btn-success', 3, 4) ">${beschikbaar}</a>
                                        </td>
                                        <td><a id='test4' class="btn btn-secondary btn-lg my-2" role="button"
                                               onclick="
                                                       beschikbaarheidStatusDoorgeven(${inschrijving.getVoorstelling().getVoorstellingId()}, '${misschien}','${contextPath}', this, 'btn-secondary','btn-warning',2,4 )">${misschien}</a>
                                        </td>
                                        <td><a class="btn btn-secondary btn-lg my-2" role="button"
                                               onclick="
                                                       beschikbaarheidStatusDoorgeven(${inschrijving.getVoorstelling().getVoorstellingId()}, '${nietBeschikbaar}','${contextPath}', this, 'btn-secondary','btn-danger', 2,3)">${nietBeschikbaar}</a>
                                        </td>
                                    </c:when>
                                    <c:when test="${inschrijving.getInschrijvingStatus() == misschien}">
                                        <td>
                                            <a class="btn btn-secondary btn-lg my-2" role="button"
                                               onclick=" beschikbaarheidStatusDoorgeven(${inschrijving.getVoorstelling().getVoorstellingId()}, '${beschikbaar}','${contextPath}', this, 'btn-secondary', 'btn-success', 3, 4)  ">${beschikbaar}</a>
                                        </td>
                                        <td>
                                            <a class="btn btn-warning btn-lg my-2" role="button"
                                               onclick="
                                                       beschikbaarheidStatusDoorgeven(${inschrijving.getVoorstelling().getVoorstellingId()}, '${misschien}','${contextPath}', this, 'btn-secondary','btn-warning',2,4 )">${misschien}</a>
                                        </td>
                                        <td>
                                            <a class="btn btn-secondary btn-lg my-2" role="button"
                                               onclick="
                                                       beschikbaarheidStatusDoorgeven(${inschrijving.getVoorstelling().getVoorstellingId()}, '${nietBeschikbaar}','${contextPath}', this, 'btn-secondary','btn-danger', 2,3)">${nietBeschikbaar}</a>
                                        </td>
                                    </c:when>
                                    <c:when test="${inschrijving.getInschrijvingStatus() == nietBeschikbaar}">
                                        <td>
                                            <a class="btn btn-secondary btn-lg my-2" role="button"
                                               onclick="beschikbaarheidStatusDoorgeven(${inschrijving.getVoorstelling().getVoorstellingId()}, '${beschikbaar}','${contextPath}', this, 'btn-secondary', 'btn-success', 3, 4) ">${beschikbaar}</a>
                                        </td>
                                        <td><a class="btn btn-secondary btn-lg my-2" role="button"
                                               onclick=" beschikbaarheidStatusDoorgeven(${inschrijving.getVoorstelling().getVoorstellingId()}, '${misschien}','${contextPath}', this, 'btn-secondary','btn-warning',2,4 )">${misschien}</a>
                                        </td>
                                        <td>
                                            <a class="btn btn-danger btn-lg my-2" role="button"
                                               onclick="beschikbaarheidStatusDoorgeven(${inschrijving.getVoorstelling().getVoorstellingId()}, '${nietBeschikbaar}','${contextPath}', this, 'btn-secondary','btn-danger', 2,3)">${nietBeschikbaar}</a>
                                        </td>
                                    </c:when>
                                </c:choose>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>