function infoMeegeven (voorstellingsTaakId,voorstellingId, contextPath) {
    $('#taakVrijgeven').attr("href", contextPath + "/planner/voorstellingsTaak/taakVrijGeven/" + voorstellingId + "/" + voorstellingsTaakId);
    document.getElementById('taakVrijgeven').style.visibility = 'visible';
}

