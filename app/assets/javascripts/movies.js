// // Place all the behaviors and hooks related to the matching controller here.
// // All this logic will automatically be available in application.js.
//
// $(".upvote").on("click", function(event) {
//   event.preventDefault();
//   var ReviewId = this.parentElement.parentElement.parentElement.id;
//   var $t = $(this).parent().parent();
//   $.ajax({
//     method: "POST",
//     url: ("/reviews/" + ReviewId + "/upvote"),
//     data: { review_id: ReviewId },
//     dataType: "json"
//   }).done(function(data){
//     $($t.siblings("#score")).text(data);
//   })
// });
//
// $(".downvote").on("click", function(event) {
//   event.preventDefault();
//   var ReviewId = this.parentElement.parentElement.parentElement.id;
//   var $t = $(this).parent().parent();
//   $.ajax({
//     method: "POST",
//     url: ("/reviews/" + ReviewId + "/downvote"),
//     data: { review_id: ReviewId },
//     dataType: "json"
//   }).done(function(data){
//     $($t.siblings("#score")).text(data);
//   })
// });
