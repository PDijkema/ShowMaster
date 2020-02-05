function vullenModal (titel, bodyText, buttonText, href) {
    $("#waarschuwingsModalLabel").text(titel)
    $("#waarschuwingsModalBody").text(bodyText)
    $('#doorgaan').text(buttonText)
    $('#doorgaan').attr("href", href);
}