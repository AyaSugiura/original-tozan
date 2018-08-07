
$(function() {
  $('.summit-image').click(function(){
    $('.image-modal-wrapper').fadeIn();
    $(this).clone().appendTo('.modal-image');
    $(this).addClass("preview");
    toggleChangeBtn();
  });
  
  $(".next-modal").click(function(){
    $(".preview").removeClass("preview").next().addClass("preview");
    $(".modal-image").html("");
    $(".preview").clone().appendTo('.modal-image');
    toggleChangeBtn();
    
  });
  
  $(".before-modal").click(function(){
    $(".preview").removeClass("preview").prev().addClass("preview");
    $(".modal-image").html("");
    $(".preview").clone().appendTo('.modal-image');
    toggleChangeBtn();
  });
  
  
  function toggleChangeBtn() {
    var previewIndex = $('.summit-image').index($('.preview'));
    $('.before-modal').show();
    $('.next-modal').show();
    if (previewIndex == 0) {
      $('.before-modal').hide();
    } 
    if (previewIndex == $(".summit-image").length -2 ) {
      $('.next-modal').hide();
    }
  }
  
  
  $(".close-modal").click(function(){
    $(".image-modal-wrapper").fadeOut();
    $(".modal-image").html("");
    $(".preview").removeClass("preview");
  });
  
});