function voorstellingPubliceren (voorstellingId) {
    $("#waarschuwingsModalLabel").text("Voorstelling publiceren")
    $("#waarschuwingsModalBody").text('Medewerkers kunnen zicht nu inschrijven voor deze voorstelling. Weet je het zeker?')
    $('#doorgaan').text('Publiceer')
    $('#doorgaan').attr("href", "/planner/voorstellingen/voorstelling/publiceren/" + voorstellingId);
}

function voorstellingVerwijderen (voorstellingId) {
    $("#waarschuwingsModalLabel").text("Voorstelling verwijderen")
    $("#waarschuwingsModalBody").text('Weet je zeker dat je deze voorstelling wilt verwijderen?')
    $('#doorgaan').text('Verwijderen')
    $('#doorgaan').attr("href", "/planner/voorstellingen/voorstelling/verwijderen/" + voorstellingId);
}

function gebruikerVerwijderen (medewerkerId) {
    $("#waarschuwingsModalLabel").text("Gebruiker verwijderen")
    $("#waarschuwingsModalBody").text('Weet je zeker dat je deze gebruiker wilt verwijderen?')
    $('#doorgaan').text('Verwijderen')
    $('#doorgaan').attr("href", "/planner/gebruiker/overzicht/verwijderen/" + medewerkerId);
}