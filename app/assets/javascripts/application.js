// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks 
//= require_tree .

function sliderInit(){
    if ($("#structure-options").length) {
        $('.main-gallery').flickity({
          // options
          cellAlign: 'left',
          contain: true,
          pageDots: false,
          wrapAround: true,  

        });
        var flktyStrct = new Flickity('.main-gallery.type');
        var structure = $("#sentence-data").data("structure");
        flktyStrct.selectCell( "#" + structure, true, true );

        var flktyTense = new Flickity('.main-gallery.tense');
        var tense = $("#sentence-data").data("tense");
        flktyTense.selectCell( "#" + tense, true, true );

        var flktyMod = new Flickity('.main-gallery.tense-modifier');
        var tenseMod = $("#sentence-data").data("tense-modifier");
        flktyMod.selectCell( "#" + tenseMod, true, true );

        $('.main-gallery.type').on( 'settle.flickity', function(e) {
            element = flktyStrct.selectedCell.element;
            $(element).find("form").submit();
        })

        $('.main-gallery.tense').on( 'settle.flickity', function(e) {
            element = flktyTense.selectedCell.element;
            $(element).find("form").submit();
        })

        $('.main-gallery.tense-modifier').on( 'settle.flickity', function(e) {
            element = flktyMod.selectedCell.element;
            $(element).find("form").submit();
        })
    }
    
    if ($("#verb-options").length) {
    }
}

document.addEventListener("turbolinks:load", function() {
  sliderInit();
})

$(document).on("click", ".word", function(){
    $(".word").removeClass("active");
    $(this).addClass("active");
})