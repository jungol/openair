include ApplicationHelper

def make_citation(article)
	authors = []
	article.authors.each do |author|
	  authors << "#{author.last_name}, #{author.first_name[0]}."
	end
	author_string = authors.map(&:inspect).join(', &')
	year_published = article.publication.year
	title = article.title
	#journal_name = self.publication.journal.name
	volume = article.publication.volume
	issue = article.publication.issue
	@citation = "#{author_string} (#{year_published}). #{title}. journal_name, #{volume}(#{issue}, pp. 437-456."
	return @citation
end