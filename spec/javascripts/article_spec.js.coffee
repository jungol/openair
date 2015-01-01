describe "Article", ->

	beforeEach ->
		loadFixtures "article"
		$('#article').highlight()
		@sentence_1 = $('.sentence').first()
		@collect_btn = $('#collect')
		$.fn.press_shift = ->
			keydown = $.Event('keydown')
			keydown.keyCode = 91
			$(this).trigger(keydown)

	afterEach ->
		$('body').unbind()

	it "highlights a sentence with #highlight", ->
		expect(@sentence_1).toHaveClass('highlight')
		keydown = $.Event("keydown")
		keydown.keyCode = 91
		$('body').trigger(keydown)
		@sentence_1.click()
		expect(@sentence_1).not.toHaveClass('highlight')
		@sentence_1.click()
		expect(@sentence_1).toHaveClass('highlight')

	it "calls the correct URL (ajax)", ->
		expect(@sentence_1).toHaveClass('highlight')	
		spyOn($, 'ajax')
		$('body').press_shift()
		@sentence_1.click()
		@ajax_call = $.ajax.mostRecentCall.args[0]
		expect(@sentence_1).not.toHaveClass('highlight')
		expect(@ajax_call['url']).toEqual('/highlights/1')
		expect(@ajax_call['data']['_method']).toEqual('delete')
		@sentence_1.click()
		@ajax_call = $.ajax.mostRecentCall.args[0]
		expect(@ajax_call['url']).toEqual('/highlights')
		expect(@ajax_call['data']['_method']).toEqual(null)
		expect(@ajax_call['data']['highlight']['copy_id']).toEqual(1)
		expect(@ajax_call['data']['highlight']['location']).toEqual('1')

	describe "'Collect highlights' button", ->

		beforeEach ->
			@text_1 = "This is a fake sentence that should highlight upon a click."
			@pTags = $('.section').children('p') 

		it "has the text 'Collect highlights'", ->
			expect(@collect_btn).toExist
			expect(@collect_btn.text()).toEqual('Collect highlights')

		it "changes text to 'Full article' when clicked", ->
			@collect_btn.click()
			expect(@collect_btn.text()).toEqual('Full article')
			@collect_btn.click()
			expect(@collect_btn.text()).toEqual('Collect highlights')

		it "filters highlights when clicked", ->
			@collect_btn.click()
			expect(@sentence_1).toBeVisible()
			@collect_btn.click()
			@sentence_1.removeClass('highlight')
			@collect_btn.click()
			expect(@sentence_1).toBeHidden()

		it "preserves the html structure on filter", ->
			expect(
				@pTags.children('span#1')).toHaveText(@text_1)
			@collect_btn.click()
			expect(
				@pTags.children('li').children('span')).toHaveText(@text_1)
			@collect_btn.click()
			expect(
				@pTags.children('span').first()).toHaveText(@text_1)
			expect(
				@pTags.children('span').first().next()).toHaveText("This is another fake sentence.")

	describe "'Hold SHIFT to annotate' button", ->

		beforeEach ->
			@annotate_btn = $('.annotate')

		it "responds to holding the COMMAND key", ->
			expect(@annotate_btn).toHaveText("Hold SHIFT to annotate")
			$('body').press_shift()
			expect(@annotate_btn).toHaveText("Get Annotating!")
			keyup = $.Event("keyup")
			keyup.keyCode = 91
			$('body').trigger(keyup)
			expect(@annotate_btn).toHaveText("Hold SHIFT to annotate")












