$.fn.takeNotesTest = ->
	
	$('.margin').each( ()->
		paragraph_div = $('<div>').css({
			position: 'absolute',
			visibility: 'hidden',
			display: 'block',
			width: 523.328
		})
		paragraph_content = $(this).prev().html()
		paragraph_div.html(paragraph_content)
		$('body').append(paragraph_div)
		paragraph_height = paragraph_div.height()
		line_height = $(this).prev().css('line-height').replace('px', '')
		lines =	((paragraph_height / parseInt(line_height)) - 1)
		$(this).children('textarea').height(paragraph_height)
		for i in [1..lines] by 1
			val = $(this).children('textarea').val()
			$(this).children('textarea').val(val + '\r\n')
	)

	$.each(
		$('.temp_info').data('notes'), (index,[location, content])->
			margin = $('#' + location)
			width = margin.children('textarea').width()
			div = $('<div>').css({
				position: 'absolute',
				visibility: 'hidden',
				display: 'block',
				width: width
			})
			div.html(content.replace(/\n/g, '<br />'))
			$('body').append(div)
			paragraph_div = $('<div>').css({
				position: 'absolute',
				visibility: 'hidden',
				display: 'block',
				width: 523.328
			})			
			paragraph_content = margin.prev().html()
			paragraph_div.html(paragraph_content)
			$('body').append(paragraph_div)
			paragraph_height = paragraph_div.height()
			#alert "paragraph_height: " + paragraph_height
			line_height = margin.prev().css('line-height').replace('px','')
			paragraph_lines = Math.round((paragraph_height / line_height) - 1)
			#alert "paragraph_lines: " + paragraph_lines
			div_height = div.height()
			text_lines = Math.round( (div_height / line_height) - 1 )
			line_diff = paragraph_lines - text_lines
			#alert "Line diff: " + line_diff
			if line_diff > 0
				for i in [1..line_diff] by 1
					content = content + '\r\n'
			margin.children('textarea').val(content)
		)

	keyboardSave = (e, textarea)->
		if (e.keyCode == 13 && e.shiftKey)
			textarea.blur()
			saveNote(textarea)

	saveNote = (textarea) ->
		paragraph_id = textarea.parent().attr('id')
		content = textarea.val()
		copyid = $('.temp_info').data('copyid')
		data = {note: { copy_id: copyid, location: paragraph_id, content: content}}
		$.ajax({
			type: "POST",
			url: "/notes",
			data: data,
			success: ->
				$('.updates').html('<span class = "processor"> Saved. </span>')
			error: ->
				$('.updates').html('<span class = "processor"> Your note didn\'t save. Please try refreshing the page. (And sorry about the trouble!) </span>')
		})


	$('.margin').children('textarea').keydown( (e)->
		textarea = $(this)
		keyboardSave(e, textarea)
		)

	$('.margin').children('textarea').on('blur', ->
		textarea = $(this)
		saveNote(textarea)
	)


	$('.margin').children('textarea').on('click', ()->
		$(this).on('mouseout', ->
			saveNote($(this))
		)

		$(this).parent().css('margin-bottom', '-23px')
		$('.updates').html('<span class = "processor"> Editing... (Press Shift + Enter to Save) </span>')
		$(this).keydown((e)->
			if (e.shiftKey)
				$('.updates').html('<span class = "processor"> Press Enter to Save Your Edit...</span>')
		)	
		$(this).on('blur', ()->
			$('.updates').html('')
			$(this).scrollTop(0)
		)
		$(this).keyup((e)->
			$('.updates').html('<span class = "processor"> Editing... (Press Shift + Enter to Save) </span>')
		)
	)





