function roosterLaden(voorstellingId) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("rooster").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "/voorstelling/rooster/" + voorstellingId, true);
  xhttp.send();
}

function taakInvullen(voorstellingId, taakId ) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("rooster").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "/planner/voorstellingsTaak/medewerkerKoppelen/" + voorstellingId + "/"+ taakId, true);
  xhttp.send();
}