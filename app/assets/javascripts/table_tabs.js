$(document).on('turbolinks:load', function()  {

  var lastContentId;
  var lastButtonId;

  $( function() {
    var contentId = $('.tabcontent').attr('id')
    $('.attribute-tablinks').click(toggleTableContent)
  })

  function toggleTableContent(event) {
    var tabButtonId = event.target.id;
    if (tabButtonId === 'harvest-data-button')  {
      $('.mouse-attributes-table').css("display", "none")
      $('.mouse-harvest-data').css("display", "table")
    } else {
      $('.mouse-harvest-data').css("display", "none")
      $('.mouse-attributes-table').css("display", "table")
    }
  }
})
