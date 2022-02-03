//= require jquery
//= require jquery_ujs
//= require_tree .

const initDatePicker = (query) => {
  $('.date-picker').each(function () {
    $(this).datepicker({
      templates: {
        leftArrow: '<i class="now-ui-icons arrows-1_minimal-left"></i>',
        rightArrow: '<i class="now-ui-icons arrows-1_minimal-right"></i>'
      }
    }).on('show', function () {
      $('.datepicker').addClass('open');

      datepicker_color = $(this).data('datepicker-color');
      if (datepicker_color.length != 0) {
        $('.datepicker').addClass('datepicker-' + datepicker_color + '');
      }
    }).on('hide', function () {
      $('.datepicker').removeClass('open');
    });
  });
};

export { initDatePicker};
