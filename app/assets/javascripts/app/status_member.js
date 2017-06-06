$(document).ready(function(){
  var memberStatus = { "member": { } };
  $(".member-accepted").click(function(event) {
    var memberId = $(this).data("id");
    memberStatus["member"]["status"] = "accepted";
    $.ajax({
        type : 'PATCH',
        url : '/members/' + memberId,
        data : memberStatus
      });
  });
  $(".member-denied").click(function(event) {
    var memberId = $(this).data("id");
    memberStatus["member"]["status"] = "denied";
    $.ajax({
        type : 'PATCH',
        url : '/members/' + memberId,
        data : memberStatus
      });
  });
})
