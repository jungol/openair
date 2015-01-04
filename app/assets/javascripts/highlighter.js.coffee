$.fn.highlight = ->

	collect_btn = $('<button id="collect">Collect highlights</button>')
	collect_btn.insertAfter('h1#article_title')

	$.each(
		$('.temp_info').data('highlights'), (index,value)->
			$('#' + value).addClass("highlight")
		)

	$('.updates').html('<span class = "processor">Press Command + Click the sentence you want to highlight.</span>')

	$('body').keydown( (e)-> 
		respondToShiftKey(e))

	respondToShiftKey = (e)->
		if (e.keyCode == 91)
			$('body').css('cursor', 'pointer')
			$('.updates').html('<span class = "processor">Highlighting... (Click anywhere on a sentence to highlight it)</span>')
			$('.sentence').on("click", highlightSentence)
			$('body').keyup( (e) ->
				#console.log("yo") #PROBELM
				respondToShiftKeyRelease(e))

	respondToShiftKeyRelease = (e)->
		$('body').css('cursor', 'default')
		$('.updates').html('<span class = "processor">Press Command + Click the sentence you want to highlight.</span>')		
		$('.sentence').unbind()
		$('body').unbind('keyup')

	collectHighlights = ->
		#alert "first handler"
		$(this).one("click", backToFullArticle)
		$('span:not(.highlight)').hide()
		$('span:visible').wrap('<li></li>')
		$('#collect').text("Full article")
		
	backToFullArticle = ->
		# alert "second handler"
		$('#collect').text("Collect highlights")
		$('span:visible').unwrap()
		$('span:hidden').show()
		$(this).one("click", collectHighlights)
	
	$('#collect').one("click", collectHighlights)

	highlightSentence = ->
		$(this).toggleClass('highlight')
		copyid = $('.temp_info').data('copyid')
		id = $(this).attr('id')
		if (!$(this).hasClass('highlight'))
			method = "delete"
			url = "/highlights/" + copyid
		else
			method = null
			url = "/highlights"
		data = { "_method": method, highlight: { copy_id: copyid, location: id } }
		$.ajax({
			type: "POST",
			url: url,
			data: data,
			success: ->
			error: ->
				alert "Hot damn! Something went wrong. Your highlight might not be saved."
		})
		


