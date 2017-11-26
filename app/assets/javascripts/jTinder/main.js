/**
 * jTinder initialization
 */


$("#tinderslide").jTinder({
  
	// dislike callback
    onDislike: function (item) {
	    // set the status text
      	var id = document.getElementById("user_id").value;
        $.ajax({
          url: '/update_question?uid=' + id + '&qid=question'+ (item.index()+1) + '&ans=0',
          // url: '/update_question?uid=1&qid=question'+ (item.index()+1) + '&ans=0',
          type: 'GET',
          dataType: 'json',
          async: true,
          data: {},
        }).done(function(data){
          if (document.getElementById("last").style.display === 'none'){
            window.location = "result";
            console.log("redirect!!");
          }
        }).fail(function(data){
        });
    },
	// like callback
    onLike: function (item) {
	    // set the status text
      	var id = document.getElementById("user_id").value;
        $.ajax({
          url: '/update_question?uid=' + id + '&qid=question'+ (item.index()+1) + '&ans=1',
          // url: '/update_question?uid=1&qid=question'+ (item.index()+1) + '&ans=1',
          type: 'GET',
          dataType: 'json',
          async: true,
          data: {},
        }).done(function(data){
          if (document.getElementById("last").style.display === 'none'){
            window.location = "result";
            console.log("redirect!!");
          }
        }).fail(function(data){
        });
    },
	animationRevertSpeed: 200,
	animationSpeed: 400,
	threshold: 1,
	likeSelector: '.like',
	dislikeSelector: '.dislike',
});

/**
 * Set button action to trigger jTinder like & dislike.
 */
$('.actions .like, .actions .dislike').click(function(e){
	e.preventDefault();
	$("#tinderslide").jTinder($(this).attr('class'));
});
