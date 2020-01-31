
/*
    drag, dragstart, dragenter, dragexit, dragleave, dragover
*/
//TODO elementID veranderen in taakid en deze meegeven in de parameter?

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

}

function drop(event, voorstellingsTaakId, voorstellingId, contextPath) {
    event.preventDefault();
    var medewerkerId = event.dataTransfer.getData("medewerkerId");
    console.log(voorstellingsTaakId + " is the taak which medewerker has to do");
    console.log(voorstellingId + " is de voorstelling");
    console.log(medewerkerId + " is dropped data");
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


