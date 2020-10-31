(function () {

    $('#live-chat header').on('click', function () {

        $('.chat').slideToggle(300, 'swing');
        $('.chat-message-counter').fadeToggle(300, 'swing');

    });



})();


window.onload = function() {
  $('.chat').hide();

};
