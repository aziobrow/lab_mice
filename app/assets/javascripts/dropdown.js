$( function() {
  $('#protocolMenuBtn').click(toggleMiceDropdown)
})

$( function() {
  $('#profileMenuBtn').click(toggleProfileDropdown)
})

function toggleMiceDropdown() {
  var displayStatus = $('#protocolMenu').css('display');
  if (displayStatus === 'block')  {
    $("#protocolMenu").css("display", "none");
  } else {
    $("#protocolMenu").css("display", "block");
  }
}

function toggleProfileDropdown() {
  var displayStatus = $('#profileMenu').css('display');
  if (displayStatus === 'block')  {
    $("#profileMenu").css("display", "none");
  } else {
    console.log(displayStatus)
    $("#profileMenu").css("display", "block");
  }
}
