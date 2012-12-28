module Filmtotaal
  class Client

  	def initialize(api_key)
  		@api_key = api_key
  	end

  	def movies(date)
  		self.get({'dag' => date.strftime('%d-%m-%Y'), 'sorteer' => 0})
  	end

  	def movie_tips(date)
  		self.get({'dag' => date.strftime('%d-%m-%Y'), 'sorteer' => 1})      
  	end

  	def film_of_the_day(date)
  		results = self.get({'dag' => date.strftime('%d-%m-%Y'), 'sorteer' => 2})
      results.first
  	end

  	def base_url
  		"http://www.filmtotaal.nl/api/filmsoptv.xml"
  	end

  	def get(args = "")
      url = base_url + "?apikey=#{@api_key}&" + args.map { |k,v| "#{k}=#{v}" }.join('&')
      doc = Nokogiri::XML(open(url))
      doc.xpath('//filmsoptv/film').map { |m| Movie.new(m, decoder) }
    end

    def decoder
      @decoder ||= HTMLEntities.new
    end
  end
end