function infoMeegeven (voorstellingsTaakId,voorstellingId, contextPath) {
    $('#taakVrijgeven').attr("href", contextPath + "/planner/voorstellingsTaak/taakVrijGeven/" + voorstellingId + "/" + voorstellingsTaakId);
    document.getElementById('taakVrijgeven').style.visibility = 'visible';
}

function buttonClassveranderen(teVerwijderenKlasse, gewensteKlasse, thisParameter, voorstellingId, vreemdeStatus1, vreemdeStatus2, eigenStatus, contextPath, yCoordinaat1, yCoordinaat2, eigenYcoordinaat, status1, status2) {
    var myTable = document.getElementById('myTable');
    var x = ($(thisParameter).closest('tr').index());
    x++;

    myTable.rows[x].cells[yCoordinaat1].innerHTML = '<td><a class="btn btn-secondary btn-lg my-2" role="button" onclick="buttonClassveranderen(\'btn-secondary\',' + '\'' + status1 + '\'' + ', this, '
        + voorstellingId + ',' + '\'' + eigenStatus + '\'' + ',' + '\'' + vreemdeStatus2 + '\'' + ',' + '\'' + vreemdeStatus1 + '\'' + ',' + '\'' + contextPath + '\'' + ',' + eigenYcoordinaat + ','
        + yCoordinaat2 + ',' + yCoordinaat1 + ',\'' + gewensteKlasse + '\'' + ',\'' + status2 + '\'' + ');' +
        'beschikbaarheidStatusDoorgeven(' + voorstellingId + ',' + '\'' + vreemdeStatus1 + '\'' + ',' + '\'' + contextPath + '\'' + ')">' + vreemdeStatus1 + '</a>';


    myTable.rows[x].cells[yCoordinaat2].innerHTML = '<td><a class="btn btn-secondary btn-lg my-2" role="button" onclick="buttonClassveranderen(\'btn-secondary\',' + '\'' + status2 + '\'' + ',  this, '
        + voorstellingId + ',' + '\'' + eigenStatus + '\'' + ',' + '\'' + vreemdeStatus1 + '\'' + ',' + '\'' + vreemdeStatus2 + '\'' + ',' + '\'' + contextPath + '\'' + ',' + eigenYcoordinaat + ','
        + yCoordinaat1 + ',' + yCoordinaat2 + ',\'' + gewensteKlasse + '\'' + ',\'' + status1 + '\'' + '); ' +
        'beschikbaarheidStatusDoorgeven(' + voorstellingId + ',' + '\'' + vreemdeStatus2 + '\'' + ',' + '\'' + contextPath + '\'' + ')">' + vreemdeStatus2 + '</a>';

    $(thisParameter).removeClass(teVerwijderenKlasse).addClass(gewensteKlasse);
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
            switchcount++;
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


