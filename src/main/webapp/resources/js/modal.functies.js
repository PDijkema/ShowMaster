function voorstellingIdMeegevenPublicatie (voorstellingId) {
    $('#publish').attr("href", "/planner/voorstellingen/voorstelling/publiceren/" + voorstellingId);
}

function voorstellingIdMeegevenVerwijderen (voorstellingId) {
    $('#delete').attr("href", "/planner/voorstellingen/voorstelling/verwijderen/" + voorstellingId);
}