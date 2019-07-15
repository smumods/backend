//= require active_admin/base
//= require activeadmin_addons/all

$('form .input.array').each(function() {
    var $wrapper = $('.array-inputs', this);
    var $insertArea = $(".array-input button[data-action=add]").closest(".array-input");
    $(".array-input button[data-action=add]", $(this)).click(function(e) {
        $('.array-input:first-child', $wrapper).clone(true).insertBefore($insertArea).find('input').val('').focus();
    });
    $('.array-input button[data-action=remove]', $wrapper).click(function() {
        if ($('.array-input', $wrapper).length > 2) {
            $(this).parent('.array-input').remove();
        }
    });
});