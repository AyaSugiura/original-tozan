
$(function() {
  $('.summit-image').click(function(){
    $('.image-modal-wrapper').fadeIn();
    $(this).clone().appendTo('.modal-image');
    $(this).addClass("active");
    toggleChangeBtn();
  });
  
  $(".next-modal").click(function(){
    $(".active").removeClass("active").next().addClass("active");
    $(".modal-image").html("");
    $(".active").clone().appendTo('.modal-image');
    toggleChangeBtn();
    
  });
  
  $(".before-modal").click(function(){
    $(".active").removeClass("active").prev().addClass("active");
    $(".modal-image").html("");
    $(".active").clone().appendTo('.modal-image');
    toggleChangeBtn();
  });
  
  
  function toggleChangeBtn() {
    var activeIndex = $('.summit-image').index($('.active'));
    $('.before-modal').show();
    $('.next-modal').show();
    if (activeIndex == 0) {
      $('.before-modal').hide();
    } 
    if (activeIndex == $(".summit-image").length -2 ) {
      $('.next-modal').hide();
    }
  }
  
  
  $(".close-modal").click(function(){
    $(".image-modal-wrapper").fadeOut();
    $(".modal-image").html("");
    $(".active").removeClass("active");
  });
  
});