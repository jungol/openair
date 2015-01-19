$.fn.highlight = ->

	collect_btn = $('<button id="collect" class="btn">COLLECT HIGHLIGHTS</button>')
	collect_btn.insertAfter('.author')

	$.each(
		$('.temp_info').data('highlights'), (index,value)->
			$('#' + value).addClass("highlight")
		)

	#$('.updates').html('<span class = "processor">Press Command + Click the sentence you want to highlight.</span>')

	$('#content').on('mouseover', ->
		$('.updates').html('<span class = "processor">Click anywhere on a sentence to highlight it</span>')
	)

	$('#content').on('mouseout', ->
		$('.updates').html('')
	)

	#$('body').keydown( (e)-> 
	#	respondToShiftKey(e))

	#respondToShiftKey = (e)->
	#	if (e.keyCode == 18)
	#		$('body').css('cursor', 'pointer')
	#		$('.updates').html('<span class = "processor">Highlighting... (Click anywhere on a sentence to highlight it)</span>')
	#		$('.sentence').on("click", highlightSentence)
	#			#console.log("yo") #PROBELM
	#			respondToShiftKeyRelease(e))
	#
	#respondToShiftKeyRelease = (e)->
	#	$('body').css('cursor', 'default')
	#	$('.updates').html('<span class = "processor">Press Command + Click the sentence you want to highlight.</span>')		
	#	$('.sentence').unbind()
	#	$('body').unbind('keyup')

	collectHighlights = ->
		#alert "first handler"
		$(this).one("click", backToFullArticle)
		$('span:not(.highlight)').hide()
		$('span:visible').wrap('<li></li>')
		$('.margin').hide()
		#val = $('.margin').children('textarea').val()
		#$('.paragraph p').append(val)
		$('#collect').text("FULL ARTICLE")
		
	backToFullArticle = ->
		# alert "second handler"
		$('#collect').text("COLLECT HIGHLIGHTS")
		$('span:visible').unwrap()
		$('span:hidden').show()
		$('.margin').show()
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
		
	$('.sentence').on('click', highlightSentence)


