// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery-ui/autocomplete
//= require autocomplete-rails
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery_nested_form
//= require rails.validations
//= require rails.validations.simple_form
//= require_tree .

$(".alert").addClass("in").fadeOut(4500);

/* swap open/close side menu icons */
$('[data-toggle=collapse]').click(function(){
      // toggle icon
  	$(this).find("i").toggleClass("glyphicon-chevron-right glyphicon-chevron-down");
});

$(document).ready(function () {
      $('a[href="' + this.location.pathname + '"]').parent().addClass('active');
  });

$.fn.render_form_errors = function(model_name, errors) {
  var form;
  form = this;
  this.clear_form_errors();
  return $.each(errors, function(field, messages) {
    var input;
    input = form.find('input, select, textarea').filter(function() {
      var name;
      name = $(this).attr('name');
      if (name) {
        return name.match(new RegExp(model_name + '\\[' + field + '\\(?'));
      }
    });
    input.closest('.form-group').addClass('has-error');
    return input.parent().append('<span class="help-block">' + $.map(messages, function(m) {
      return m.charAt(0).toUpperCase() + m.slice(1);
    }).join('<br />') + '</span>');
  });
};


