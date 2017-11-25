/**
 * jTinder initialization
 */


$("#tinderslide").jTinder({
  
	// dislike callback
    onDislike: function (item) {
	    // set the status text
      	var uid = document.getElementById("user_uid").value;
        $.ajax({
          url: '/update_question?uid=' + uid + '&qid=question'+ (item.index()+1) + '&ans=0',
          type: 'GET',
          dataType: 'json',
          async: true,
          data: {},
        }).done(function(data){
        }).fail(function(data){
        });
    },
	// like callback
    onLike: function (item) {
	    // set the status text
      	var uid = document.getElementById("user_uid").value;
        $.ajax({
          url: '/update_question?uid=' + uid + '&qid=question'+ (item.index()+1) + '&ans=1',
          type: 'GET',
          dataType: 'json',
          async: true,
          data: {},
        }).done(function(data){
        }).fail(function(data){
        });
    },
	animationRevertSpeed: 200,
	animationSpeed: 400,
	threshold: 1,
	likeSelector: '.like',
	dislikeSelector: '.dislike'
});

/**
 * Set button action to trigger jTinder like & dislike.
 */
$('.actions .like, .actions .dislike').click(function(e){
	e.preventDefault();
	$("#tinderslide").jTinder($(this).attr('class'));
});
