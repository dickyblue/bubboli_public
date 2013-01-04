# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery.fn.submitOnCheck = ->
  @find('input[type=submit]').remove()
  @find('input[type=checkbox]').click ->
    $(this).parent('form').submit()
  this
 
jQuery ->
  $('.edit_gift_accession').submitOnCheck()


$ ->
	$('select[rel="autocomplete"]').each ->
        option = []     
        $(this).find('option').each ->     
            option.push $(this).text()
        
        input = $('<input>')
        input.attr('type','text')
        input.attr('name', $(this).attr('name') )
        input.attr('id', $(this).attr('id') )  
        input.attr('class', $(this).attr('class') )
        input.attr('data-provide', 'typeahead' )
        input.val($(this).attr('data_default'))
        $(this).replaceWith(input)
        
        $(input).typeahead({
            source: option
        });
        
        
