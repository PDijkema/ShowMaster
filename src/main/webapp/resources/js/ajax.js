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

function voorstellingenHalen(paginaNr) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {

      document.getElementById("test").innerHTML += this.responseText;
    }
  };
  xhttp.open("GET",  "/planner/voorstellingen/" + paginaNr, true);
  xhttp.send();
}

