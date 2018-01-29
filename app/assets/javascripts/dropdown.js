$(document).on('turbolinks:load', function()  {

var lastSelectionId;

  $( function() {
    $('#protocolMenuBtn').click(toggleMiceDropdown)
  })

  $( function() {
    $('#profileMenuBtn').click(toggleProfileDropdown)
  })

  $( function() {
    $('#notificationBtn').click(toggleNotificationDropdown)
  })

  $( function() {
    $('#manageMenuBtn').click(toggleManagementDropdown)
  })

  function toggleMiceDropdown() {
    var displayStatus = $('#protocolMenu').css('display');
    if (lastSelectionId != '#protocolMenu') {
      $(lastSelectionId).css("display", "none");
    }
    if (displayStatus === 'block')  {
      $("#protocolMenu").css("display", "none");
    } else {
      $("#protocolMenu").css("display", "block");
    }
    lastSelectionId = '#protocolMenu'
  }

  function toggleProfileDropdown() {
    var displayStatus = $('#profileMenu').css('display');
    if (lastSelectionId != '#profileMenu') {
      $(lastSelectionId).css("display", "none");
    }
    if (displayStatus === 'block')  {
      $("#profileMenu").css("display", "none");
    } else {
      $("#profileMenu").css("display", "block");
    }
    lastSelectionId = '#profileMenu'
  }

  function toggleNotificationDropdown() {
    var displayStatus = $('#notificationMenu').css('display');
    if (lastSelectionId != '#notificationMenu') {
      $(lastSelectionId).css("display", "none");
    }
    if (displayStatus === 'block')  {
      $("#notificationMenu").css("display", "none");
    } else {
      $("#notificationMenu").css("display", "block");
    }
    lastSelectionId = '#notificationMenu'
  }

  function toggleManagementDropdown() {
    var displayStatus = $('#manageMenu').css('display');
    if (lastSelectionId != '#manageMenu') {
      $(lastSelectionId).css("display", "none");
    }
    if (displayStatus === 'block')  {
      $("#manageMenu").css("display", "none");
    } else {
      $("#manageMenu").css("display", "block");
    }
    lastSelectionId = '#manageMenu'
  }
})
