$( function() {
  $('#protocolMenuBtn').click(toggleMiceDropdown)
})

$( function() {
  $('#profileMenuBtn').click(toggleProfileDropdown)
})

$( function() {
  $('#notificationBtn').click(toggleNotificationDropdown)
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

function toggleNotificationDropdown() {
  var displayStatus = $('#notificationMenu').css('display');
  if (displayStatus === 'block')  {
    $("#notificationMenu").css("display", "none");
  } else {
    console.log(displayStatus)
    $("#notificationMenu").css("display", "block");
  }
}
