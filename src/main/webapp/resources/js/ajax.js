function beschikbaarheidStatusDoorgeven(voorstellingId, beschikbaarheidStatus, contextPath, thisObject, teVerwijderenKlasse, gewensteKlasse, yCoordinaat1, yCoordinaat2) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function () {
    if (this.readyState === 4 && this.status === 200) {
      buttonClassveranderen(teVerwijderenKlasse, gewensteKlasse, thisObject, yCoordinaat1, yCoordinaat2)
    }
  };
  xhttp.open("GET", contextPath + "/voorstelling/weergeven/openvoorstelling/inschrijven/" + voorstellingId + "/" + beschikbaarheidStatus, true);
  xhttp.send();
}


function roosterLaden(voorstellingId, contextPath) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("rooster").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET",  contextPath + "/voorstelling/rooster/" + voorstellingId, true);
  xhttp.send();
}

function taakInvullen(voorstellingId, taakId, contextPath) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("taakInvullen").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", contextPath +  "/planner/voorstellingsTaak/medewerkerKoppelen/" + voorstellingId + "/"+ taakId, true);
  xhttp.send();
}

function opslaanVoorstelling(voorstellingId, taakId, contextPath) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("taakInvullen").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", contextPath +  "/planner/voorstellingsTaak/medewerkerKoppelen/" + voorstellingId + "/"+ taakId, true);
  xhttp.send();
}
