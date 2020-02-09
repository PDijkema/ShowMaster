function roosterLaden(voorstellingId, contextPath) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState === 4 && this.status === 200) {
      document.getElementById("rooster").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET",  contextPath + "/rooster/voorstelling/" + voorstellingId, true);
  xhttp.send();
}


function nieuweVoorstelling(contextPath) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState === 4 && this.status === 200) {
      document.getElementById("nieuweVoorstellingToevoegen").innerHTML = this.responseText;
        $("#kalender").datetimepicker({
          format: "d-m-Y H:i",
        });
    }
  };
  xhttp.open("GET", contextPath + "/planner/voorstellingen/voorstelling/toevoegen/", true);
  xhttp.send();
}


function wijzigVoorstelling(contextPath, voorstellingId) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState === 4 && this.status === 200) {
      document.getElementById("voorstellingWijzigen").innerHTML = this.responseText;
        $("#kalender").datetimepicker({
          format: "d-m-Y H:i",
        });
    }
  };
  xhttp.open("GET", contextPath + "/planner/voorstellingen/voorstelling/wijzigen/" + voorstellingId, true);
  xhttp.send();
}

function genereerRooster(voorstellingId, contextPath) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState === 4 && this.status === 200) {
      console.log(this.responseText);
      location.reload();
    }
  };
  xhttp.open("GET",  contextPath + "/planner/voorstellingen/voorstelling/rooster/genereer/" + voorstellingId, true);
  xhttp.send();
}