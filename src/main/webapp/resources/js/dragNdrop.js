
function dragStart(event, medewerkerId) {
    console.log(medewerkerId)
    event.dataTransfer.setData("medewerkerId", medewerkerId)
}

function dragging(event) {
    console.log("dragging")
}

function allowDrop(event) {
    event.preventDefault();
}
function enterDrag(event) {
    console.log("dragging over");
    if (event.target.className == "voorstellingsTaak") {
        event.target.style.background = "darkgray";
    }
}
function leaveDrag(event) {
    if (event.target.className == "voorstellingsTaak") {
        event.target.style.background = "";
    }
}


function drop(event, voorstellingsTaakId, voorstellingId, contextPath) {
    event.preventDefault();
    var medewerkerId = event.dataTransfer.getData("medewerkerId");
    console.log(voorstellingsTaakId + " is the taak voor de medewerker");
    console.log(voorstellingId + " is de voorstelling");
    console.log(medewerkerId + " is de medewerkerId");
    event.target.appendChild(document.getElementById(medewerkerId));

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            //document.getElementById("taakInvullen").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", contextPath +  "/planner/voorstellingsTaak/medewerkerKoppelen/" + voorstellingId + "/" + voorstellingsTaakId + "/" + medewerkerId, true);
    xhttp.send();
}


