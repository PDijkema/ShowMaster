function beschikbaarheidStatusDoorgeven(voorstellingId, beschikbaarheidStatus, contextPath) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
    }
  };
  xhttp.open("GET", contextPath + "/rooster/openvoorstelling/inschrijven/" + voorstellingId + "/" + beschikbaarheidStatus, true);
  xhttp.send();
}


function roosterLaden(voorstellingId, contextPath) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("rooster").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET",  contextPath + "/rooster/voorstelling/" + voorstellingId, true);
  xhttp.send();
}

function taakInvullen(voorstellingId, taakId, contextPath) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("taakInvullen").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", contextPath +  "/planner/voorstellingen/voorstellingsTaak/medewerkerKoppelen/" + voorstellingId + "/"+ taakId, true);
  xhttp.send();
}

function opslaanVoorstelling(voorstellingId, taakId, contextPath) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("taakInvullen").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", contextPath +  "/planner/voorstellingen/voorstellingsTaak/medewerkerKoppelen/" + voorstellingId + "/"+ taakId, true);
  xhttp.send();
}
