function updateVote(elem)
{
  $.ajax(
  {
    url: elem.attr('href'),
    success: function(data)
    {
      var id= '#votes_' + data['id'];
      $(id).html(data['votes']);
      var id_button= '#vote_button_' + data['id'];
      $(id_button).html("&nbsp;&nbsp;");
    }
  });
}


$(document).ready(function(){
		$('.jax').click(function(){
				updateVote($(this));
				return false; 
		})
});
