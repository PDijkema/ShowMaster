function voorstellingPubliceren (voorstellingId) {
    $('#publish').attr("href", "/planner/voorstellingen/voorstelling/publiceren/" + voorstellingId);
}

function voorstellingVerwijderen (voorstellingId) {
    $('#delete').attr("href", "/planner/voorstellingen/voorstelling/verwijderen/" + voorstellingId);
}

function gebruikerVerwijderen (medewerkerId) {
    $('#delete').attr("href", "/planner/gebruiker/overzicht/verwijderen/" + medewerkerId);
}