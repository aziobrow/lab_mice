$( function() {
  $('.dropbtn').click(myFunction)
})

  function myFunction() {
    var displayStatus = $('#Demo1').css('display');
    if (displayStatus === 'block')  {
      $("#Demo1").css("display", "none");
    } else {
      $("#Demo1").css("display", "block");
    }
  }
