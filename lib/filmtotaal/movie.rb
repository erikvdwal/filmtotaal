module Filmtotaal
  class Movie
    attr_reader :title, :year, :url, :director, :actors, :genres, :countries, :plot, :tagline, :imdb_id, :imdb_rating, :rating, :votes, :start_time, :end_time, :channel, :runtime, :movie_tip, :cover_url
  	def initialize(data, decoder)
      @title = decoder.decode(data.xpath('titel').text)
      @year = data.xpath('jaar').text.to_i
  		@url = data.xpath('ft_link').text
      @director = decoder.decode(data.xpath('regisseur').text)
      @actors = decoder.decode(data.xpath('cast').text).split(':')
      @genres = decoder.decode(data.xpath('genres').text).split(':')
      @countries = decoder.decode(data.xpath('land').text).split(':')
      @plot = decoder.decode(data.xpath('synopsis').text)
      @tagline = decoder.decode(data.xpath('tagline').text)
      @rating = data.xpath('ft_rating').text.to_f
      @votes = data.xpath('ft_votes').text.to_i
      @imdb_id = "tt#{data.xpath('imdb_id').text}"
      @imdb_rating = data.xpath('imdb_rating').text.to_f
      @imdb_votes = data.xpath('imdb_votes').text.to_i
      @start_time = data.xpath('starttijd').text.to_i
      @end_time = data.xpath('eindtijd').text.to_i
      @runtime = data.xpath('duur').text.to_i
      @channel = decoder.decode(data.xpath('zender').text)
      @movie_tip = data.xpath('filmtip').text.to_i == 1 ? true : false
      @cover_url = data.xpath('cover').text
  	end
  end
end