// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require jquery_nested_form
//= require bootstrap
//= require_tree

// changed the order of the jquery_ujs and jquery to get the remote function working for unfollowing kids

// For the js in the show gifts page
$(function() {
	
$(".image").click(function() {
var image = $(this).attr("rel");	
$('#image').hide();
$('#image').fadeIn('slow');
$('#image').html('<img src="' + image + '"/>');
return false;
    });
});




// For the js in the main index page

$(document).ready(function() {      
     
    //Execute the slideShow, set 4 seconds for each images
    slideShow(3000);
 
});
 
function slideShow(speed) {
 
 
    //append a LI item to the UL list for displaying caption
    $('ul.slideshow').append('<li id="slideshow-caption" class="caption"><div class="slideshow-caption-container"><h3></h3><p></p></div></li>');
 
    //Set the opacity of all images to 0
    $('ul.slideshow li').css({opacity: 0.0});
     
    //Get the first image and display it (set it to full opacity)
    $('ul.slideshow li:first').css({opacity: 1.0}).addClass('show');
     
    //Get the caption of the first image from REL attribute and display it
    $('#slideshow-caption h3').html($('ul.slideshow li.show').find('img').attr('title'));
    $('#slideshow-caption p').html($('ul.slideshow li.show').find('img').attr('alt'));
         
    //Display the caption
    $('#slideshow-caption').css({opacity: 0.7, bottom:0});
     
    //Call the gallery function to run the slideshow    
    var timer = setInterval('gallery()',speed);
     
    //pause the slideshow on mouse over
    $('ul.slideshow').hover(
        function () {
            clearInterval(timer);   
        },  
        function () {
            timer = setInterval('gallery()',speed);         
        }
    );
}




function gallery() {
 
 
    //if no IMGs have the show class, grab the first image
    var current = ($('ul.slideshow li.show')?  $('ul.slideshow li.show') : $('#ul.slideshow li:first'));
 
    //trying to avoid speed issue
    if(current.queue('fx').length == 0) {
 
        //Get next image, if it reached the end of the slideshow, rotate it back to the first image
        var next = ((current.next().length) ? ((current.next().attr('id') == 'slideshow-caption')? $('ul.slideshow li:first') :current.next()) : $('ul.slideshow li:first'));
             
        //Get next image caption
        var title = next.find('img').attr('title'); 
        var desc = next.find('img').attr('alt');    
             
        //Set the fade in effect for the next image, show class has higher z-index
        next.css({opacity: 0.0}).addClass('show').animate({opacity: 1.0}, 3000);
         
        //Hide the caption first, and then set and display the caption
        $('#slideshow-caption').slideToggle(800, function () { 
            $('#slideshow-caption h3').html(title); 
            $('#slideshow-caption p').html(desc); 
            $('#slideshow-caption').slideToggle(800); 
        }); 
     
        //Hide the current image
        current.animate({opacity: 0.0}, 1000).removeClass('show');
 
    }
 
}



// For adding and removing images in the manage file
function remove_fields(link) {
        $(link).prev("input[type=hidden]").val("1");
        $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}
