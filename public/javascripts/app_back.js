function updateVote(elem){
		$.ajax({
				url: elem.attr('href'),
				success: function(data){
						var id= '#votes_' + data['id'];
                        $(id).html(data['votes']);
				} 
		});
}


$(document).ready(function(){
		$('.jax').click(function(){
				updateVote($(this));
				return false; 
		})
});
