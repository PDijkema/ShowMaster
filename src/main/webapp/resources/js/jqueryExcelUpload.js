$(document).ready(function () {
        $('#gekozenBestand').on('input change', function () {
            if ($(this).val() != '') {
                $('#uploaden').prop('disabled', false);
            } else {
                $('#uploaden').prop('disabled', true);
            }
        });
    });