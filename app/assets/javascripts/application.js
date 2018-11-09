// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks

//= require jquery3
//= require popper
//= require bootstrap
//= require_tree .

(function($) {
  "use strict"

  // NAVIGATION
  var responsiveNav = $('#responsive-nav'),
      catToggle     = $('#responsive-nav .category-nav .category-header'),
      catList       = $('#responsive-nav .category-nav .category-list'),
      menuToggle    = $('#responsive-nav .menu-nav .menu-header'),
      menuList      = $('#responsive-nav .menu-nav .menu-list');

  catToggle.on('click', function() {
    menuList.removeClass('open');
    catList.toggleClass('open');
  });

  menuToggle.on('click', function() {
    catList.removeClass('open');
    menuList.toggleClass('open');
  });

  $(document).click(function(event) {
    if (!$(event.target).closest(responsiveNav).length)
    {
      if (responsiveNav.hasClass('open'))
      {
        responsiveNav.removeClass('open');
        $('#navigation').removeClass('shadow');
      } else
      {
        if ($(event.target).closest('.nav-toggle > button').length)
        {
          if (!menuList.hasClass('open') && !catList.hasClass('open'))
          {
            $('.menu-list').addClass('open');
          }
          $('#navigation').addClass('shadow');
          $('#responsive-nav').addClass('open');
        }
      }
    }
  });

})(jQuery);