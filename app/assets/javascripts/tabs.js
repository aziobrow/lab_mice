$(document).on('turbolinks:load', function()  {

  $( function() {
    var contentId = $('.tabcontent').attr('id')
    $('.tablinks').click(toggleTabContent)
  })

  function toggleTabContent(event) {
    var tabId = event.target.id;
    var tabContentId = `#${tabId}Content`;
    var displayStatus = $(tabContentId).css('display');
    if (displayStatus === 'block')  {
      $(tabContentId).css("display", "none");
    } else {
      $(tabContentId).css("display", "block");
    }
  }
})
