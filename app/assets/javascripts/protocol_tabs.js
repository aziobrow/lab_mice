$(document).on('turbolinks:load', function()  {

var lastContentId;
var lastButtonId;

  $( function() {
    var contentId = $('.tabcontent').attr('id')
    $('.tablinks').click(toggleTabContent)
  })

  function toggleTabContent(event) {
    var tabButtonId = event.target.id;
    var tabContentId = `#${tabButtonId}Content`;
    if (tabContentId != lastContentId) {
      $(lastContentId).css("display", "none");
      if (lastButtonId != null) {
        $(`#${lastButtonId}`).removeClass("active");
      }
      lastButtonId = tabButtonId;
      lastContentId = tabContentId;
    }
    var displayStatus = $(tabContentId).css('display');
      if (displayStatus === 'flex')  {
        $(tabContentId).css("display", "none");
      } else {
        $(tabContentId).css("display", "flex");
        $(`#${tabButtonId}`).addClass("active");
      }
  }
})
