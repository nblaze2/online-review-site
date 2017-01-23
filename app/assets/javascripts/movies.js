// // // Place all the behaviors and hooks related to the matching controller here.
// // // All this logic will automatically be available in application.js.
// //
// $(document).ready( function(){
//
//   $(".upvote").on("click", function(event) {
//     event.preventDefault();
//     var ReviewId = this.parentElement.parentElement.id;
//     var $t = $(this).parent().parent();
//     $.ajax({
//       method: "POST",
//       url: ("/api/reviews/" + ReviewId + "/upvote"),
//       data: { review_id: ReviewId },
//       dataType: "json"
//     }).done(function(data){
//       $($t.siblings("#score")).text(data);
//     })
//   });
//
//   $(".downvote").on("click", function(event) {
//     event.preventDefault();
//     var ReviewId = this.parentElement.parentElement.id;
//     var $t = $(this).parent().parent();
//     $.ajax({
//       method: "POST",
//       url: ("/api/reviews/" + ReviewId + "/downvote"),
//       data: { review_id: ReviewId },
//       dataType: "json"
//     }).done(function(data){
//       $($t.siblings("#score")).text(data);
//     })
//   });
// });
