
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
            <table class="table table-hover" id="myTable", >
                <thead>
                <tr>
                    <th scope ="col" onclick="sortTable(0)" >Voorstelling</th>
                    <th scope ="col" onclick="sortTable(1)" >Datum</th>
                    <th scope ="col" onclick="sortTable(2)" >Beschikbaar</th>
                    <th scope ="col" onclick="sortTable(3)">Misschien</th>
                    <th scope ="col" onclick="sortTable(4)">Niet Beschikbaar</th>
                </tr>
                </thead>

                <tbody>

                <c:forEach items="${voorstellingLijst}" var="voorstelling">
                    <c:if test="${voorstelling.status == 'Gepubliceerd'}">
                        <tr >

                        <td><h1><c:out value="${voorstelling.getNaam()}"/></h1></td>
                        <td><c:out value="${voorstelling.getDatum()}"/></td>

                            <td><a class="btn btn-secondary btn-lg my-2"  role="button" onclick="buttonClassveranderenSuccess('btn-secondary','btn-success', this, ${voorstelling.getVoorstellingId()}, '${misschien}', '${nietBeschikbaar}', '${contextPath}'); beschikbaarheidStatusDoorgeven(${voorstelling.getVoorstellingId()}, '${beschikbaar}','${contextPath}') ">Beschikbaar</a></td>

                            <td><a class="btn btn-secondary btn-lg my-2" role="button" onclick="buttonClassveranderen2('btn-secondary','btn-warning', this, ${voorstelling.getVoorstellingId()}, '${beschikbaar}', '${nietBeschikbaar}', '${contextPath}'); beschikbaarheidStatusDoorgeven(${voorstelling.getVoorstellingId()}, '${misschien}','${contextPath}')">Misschien</a></td>

                            <td><a class="btn btn-secondary btn-lg my-2" role="button" onclick="buttonClassveranderen3('btn-secondary','btn-danger', this, ${voorstelling.getVoorstellingId()}, '${beschikbaar}', '${misschien}', '${contextPath}'); beschikbaarheidStatusDoorgeven(${voorstelling.getVoorstellingId()}, '${nietBeschikbaar}','${contextPath}')">Niet Beschikbaar</a></td>

                        </tr>
                    </c:if>
                </c:forEach>

                        <c:forEach items="${inschrijvingen}" var="inschrijving">
                            <tr >
                                <td><h1><c:out value="${inschrijving.getVoorstelling().getNaam()}"/></h1></td>
                                <td><c:out  value="${inschrijving.getVoorstelling().getDatum()}"/></td>
                                <c:choose>
                                <c:when test="${inschrijving.getInschrijvingStatus() == 'Beschikbaar'}">
                                    <td><a class="btn btn-success btn-lg my-2"  role="button" onclick="buttonClassveranderenSuccess('btn-secondary','btn-success', this, ${inschrijving.getVoorstelling().getVoorstellingId()}, '${misschien}', '${nietBeschikbaar}', '${contextPath}'); beschikbaarheidStatusDoorgeven(${inschrijving.getVoorstelling().getVoorstellingId()}, '${beschikbaar}','${contextPath}') ">Beschikbaar</a></td>

                                    <td><a class="btn btn-secondary btn-lg my-2" role="button" onclick="buttonClassveranderen2('btn-secondary','btn-warning', this, ${inschrijving.getVoorstelling().getVoorstellingId()}, '${beschikbaar}', '${nietBeschikbaar}', '${contextPath}'); beschikbaarheidStatusDoorgeven(${inschrijving.getVoorstelling().getVoorstellingId()}, '${misschien}','${contextPath}')">Misschien</a></td>

                                    <td><a class="btn btn-secondary btn-lg my-2" role="button" onclick="buttonClassveranderen3('btn-secondary','btn-danger', this, ${inschrijving.getVoorstelling().getVoorstellingId()}, '${beschikbaar}', '${misschien}', '${contextPath}'); beschikbaarheidStatusDoorgeven(${inschrijving.getVoorstelling().getVoorstellingId()}, '${nietBeschikbaar}','${contextPath}')">Niet Beschikbaar</a></td>
                                </c:when>
                                <c:when test="${inschrijving.getInschrijvingStatus() == 'Misschien'}">
                                    <td><a class="btn btn-secondary btn-lg my-2"  role="button" onclick="buttonClassveranderenSuccess('btn-secondary','btn-success', this, ${inschrijving.getVoorstelling().getVoorstellingId()}, '${misschien}', '${nietBeschikbaar}', '${contextPath}'); beschikbaarheidStatusDoorgeven(${inschrijving.getVoorstelling().getVoorstellingId()}, '${beschikbaar}','${contextPath}') ">Beschikbaar</a></td>

                                    <td><a class="btn btn-warning btn-lg my-2" role="button" onclick="buttonClassveranderen2('btn-secondary','btn-warning', this, ${inschrijving.getVoorstelling().getVoorstellingId()}, '${beschikbaar}', '${nietBeschikbaar}', '${contextPath}'); beschikbaarheidStatusDoorgeven(${inschrijving.getVoorstelling().getVoorstellingId()}, '${misschien}','${contextPath}')">Misschien</a></td>

                                    <td><a class="btn btn-secondary btn-lg my-2" role="button" onclick="buttonClassveranderen3('btn-secondary','btn-danger', this, ${inschrijving.getVoorstelling().getVoorstellingId()}, '${beschikbaar}', '${misschien}', '${contextPath}'); beschikbaarheidStatusDoorgeven(${inschrijving.getVoorstelling().getVoorstellingId()}, '${nietBeschikbaar}','${contextPath}')">Niet Beschikbaar</a></td>
                                </c:when>
                                <c:when test="${inschrijving.getInschrijvingStatus() == 'Niet Beschikbaar'}">
                                    <td><a class="btn btn-secondary btn-lg my-2"  role="button" onclick="buttonClassveranderenSuccess('btn-secondary','btn-success', this, ${inschrijving.getVoorstelling().getVoorstellingId()}, '${misschien}', '${nietBeschikbaar}', '${contextPath}'); beschikbaarheidStatusDoorgeven(${inschrijving.getVoorstelling().getVoorstellingId()}, '${beschikbaar}','${contextPath}') ">Beschikbaar</a></td>

                                    <td><a class="btn btn-secondary btn-lg my-2" role="button" onclick="buttonClassveranderen2('btn-secondary','btn-warning', this, ${inschrijving.getVoorstelling().getVoorstellingId()}, '${beschikbaar}', '${nietBeschikbaar}', '${contextPath}'); beschikbaarheidStatusDoorgeven(${inschrijving.getVoorstelling().getVoorstellingId()}, '${misschien}','${contextPath}')">Misschien</a></td>

                                    <td><a class="btn btn-danger btn-lg my-2" role="button" onclick="buttonClassveranderen3('btn-secondary','btn-danger', this, ${inschrijving.getVoorstelling().getVoorstellingId()}, '${beschikbaar}', '${misschien}', '${contextPath}'); beschikbaarheidStatusDoorgeven(${inschrijving.getVoorstelling().getVoorstellingId()}, '${nietBeschikbaar}','${contextPath}')">Niet Beschikbaar</a></td>
                                </c:when>
                                </c:choose>
                            </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</body>



<script>









    function buttonClassveranderenSuccess(teVerwijderenKlasse, gewensteKlasse, thisParameter, voorstellingId, misschien, nietBeschikbaar, contextPath) {
        var myTable = document.getElementById('myTable');
        var x =  ($(thisParameter).closest('tr').index());
        x++;
        myTable.rows[x].cells[3].innerHTML = '<td><a class="btn btn-secondary btn-lg my-2" role="button"  onclick="buttonClassveranderen2(\'btn-secondary\',\'btn-warning\', this, '+ voorstellingId + ',' +'\'Beschikbaar\'' + ',' + '\'Niet Beschikbaar\'' + ',' + '\''+ contextPath +'\''+ '); beschikbaarheidStatusDoorgeven(' + voorstellingId + ',' + '\'' + misschien + '\'' + ',' + '\'' + contextPath + '\''+ ')">Misschien</a>';
        myTable.rows[x].cells[4].innerHTML = '<td><a class="btn btn-secondary btn-lg my-2" role="button" onclick="buttonClassveranderen3(\'btn-secondary\',\'btn-danger\', this, '+ voorstellingId +',' +'\'Beschikbaar\'' + ',' + '\'Misschien\'' + ',' + '\''+ contextPath +'\''+ '); beschikbaarheidStatusDoorgeven(' + voorstellingId + ',' + '\'' + nietBeschikbaar + '\'' + ',' + '\'' +contextPath + '\'' + ')">Niet Beschikbaar</a>';
        $(thisParameter).removeClass(teVerwijderenKlasse).addClass(gewensteKlasse);


    }

    function buttonClassveranderen2(teVerwijderenKlasse, gewensteKlasse, thisParameter, voorstellingId, beschikbaar, nietBeschikbaar, contextPath) {
        var elem = $('a[id="buttonBeschikbaar"]');
        var myTable = document.getElementById('myTable');
        var x =  ($(thisParameter).closest('tr').index());
        x++;

        myTable.rows[x].cells[2].innerHTML = '<td><a class="btn btn-secondary btn-lg my-2" role="button" onclick="buttonClassveranderenSuccess(\'btn-secondary\',\'btn-success\', this, '+ voorstellingId + ',' + '\'Misschien\'' + ',' + '\'Niet Beschikbaar\'' + ',' + '\''+ contextPath +'\''+ '); beschikbaarheidStatusDoorgeven(' + voorstellingId + ',' + '\'' + beschikbaar + '\'' + ',' + '\'' + contextPath + '\''+ ')"> Beschikbaar </a>';
        myTable.rows[x].cells[4].innerHTML = '<td><a class="btn btn-secondary btn-lg my-2" role="button" onclick="buttonClassveranderen3(\'btn-secondary\',\'btn-danger\', this, '+ voorstellingId  + ',' + '\'Beschikbaar\'' + ',' + '\'Misschien\'' + ',' + '\''+ contextPath +'\''+ '); beschikbaarheidStatusDoorgeven(' + voorstellingId + ',' + '\'' +nietBeschikbaar + '\'' + ',' + '\'' +contextPath + '\'' + ')">Niet Beschikbaar</a>';



        $(thisParameter).removeClass(teVerwijderenKlasse).addClass(gewensteKlasse);



    }
    function buttonClassveranderen3(teVerwijderenKlasse, gewensteKlasse, thisParameter, voorstellingId, beschikbaar, misschien, contextPath) {
        var elem = $('a[id="buttonBeschikbaar"]');
        var myTable = document.getElementById('myTable');
        var x =  ($(thisParameter).closest('tr').index());
        x++;
        myTable.rows[x].cells[2].innerHTML = '<td><a class="btn btn-secondary btn-lg my-2" role="button" onclick="buttonClassveranderenSuccess(\'btn-secondary\',\'btn-success\', this, '+ voorstellingId + ','+ '\'Misschien\'' + ',' + '\'Niet Beschikbaar\'' + ',' + '\''+ contextPath +'\''+ '); beschikbaarheidStatusDoorgeven(' + voorstellingId + ',' + '\'' + beschikbaar + '\'' + ',' + '\'' + contextPath + '\''+ ')">Beschikbaar</a>';
        myTable.rows[x].cells[3].innerHTML = '<td><a class="btn btn-secondary btn-lg my-2" role="button"  onclick="buttonClassveranderen2(\'btn-secondary\',\'btn-warning\', this, '+ voorstellingId + ',' + '\'Beschikbaar\'' + ',' + '\'Niet Beschikbaar\'' + ',' + '\''+ contextPath +'\''+ '); beschikbaarheidStatusDoorgeven(' + voorstellingId + ',' + '\'' + misschien + '\'' + ',' + '\'' + contextPath + '\''+ ')">Misschien</a>';

        $(thisParameter).removeClass(teVerwijderenKlasse).addClass(gewensteKlasse);
    }

    function beschikbaarheidStatusDoorgeven(voorstellingId, beschikbaarheidStatus, contextPath) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
            }
        };
        xhttp.open("GET", contextPath +   "/voorstelling/weergeven/openvoorstelling/inschrijven/" + voorstellingId + "/"+ beschikbaarheidStatus, true);
        xhttp.send();
    }

    function sortTable(n) {
        var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
        table = document.getElementById("myTable");
        switching = true;
        // Set the sorting direction to ascending:
        dir = "asc";
        /* Make a loop that will continue until
        no switching has been done: */
        while (switching) {
            // Start by saying: no switching is done:
            switching = false;
            rows = table.rows;
            /* Loop through all table rows (except the
            first, which contains table headers): */
            for (i = 1; i < (rows.length - 1); i++) {
                // Start by saying there should be no switching:
                shouldSwitch = false;
                /* Get the two elements you want to compare,
                one from current row and one from the next: */
                x = rows[i].getElementsByTagName("TD")[n];
                y = rows[i + 1].getElementsByTagName("TD")[n];
                /* Check if the two rows should switch place,
                based on the direction, asc or desc: */
                if (dir == "asc") {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        // If so, mark as a switch and break the loop:
                        shouldSwitch = true;
                        break;
                    }
                } else if (dir == "desc") {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        // If so, mark as a switch and break the loop:
                        shouldSwitch = true;
                        break;
                    }
                }
            }
            if (shouldSwitch) {
                /* If a switch has been marked, make the switch
                and mark that a switch has been done: */
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
                // Each time a switch is done, increase this count by 1:
                switchcount ++;
            } else {
                /* If no switching has been done AND the direction is "asc",
                set the direction to "desc" and run the while loop again. */
                if (switchcount == 0 && dir == "asc") {
                    dir = "desc";
                    switching = true;
                }
            }
        }
    }


</script>



<script>


</script>


