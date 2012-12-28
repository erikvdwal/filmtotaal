require 'spec_helper'

describe "filmtotaal" do
	before(:all) do
		config = YAML.load_file(File.join(File.dirname(__FILE__), "config.yml"))
		@client = Filmtotaal::Client.new(config['api_key'])
	end

	describe "movie" do
		it "should return todays movies" do
			movies = @client.movies(Date.today)
			movies.count.should > 0
			movies.first.should be_a(Filmtotaal::Movie)
			movies.first.genres.should be_a(Array)
			movies.first.actors.should be_a(Array)
			movies.first.start_time.should be_a(Integer)
			movies.first.end_time.should be_a(Integer)
			movies.first.runtime.should be_a(Integer)
		end

		it "should return tomorrows movies" do
			movies = @client.movies(Date.today+1)
			movies.count.should > 0
			movies.first.should be_a(Filmtotaal::Movie)
			movies.first.genres.should be_a(Array)
			movies.first.actors.should be_a(Array)
			movies.first.start_time.should be_a(Integer)
			movies.first.end_time.should be_a(Integer)
		end

		it "should not return movies after tomorrow" do
			movies = @client.movies(Date.today+2)
			movies.count.should == 0
		end

		it "should return movie tip for today" do
			movies = @client.movie_tips(Date.today)
			movies.count.should > 0
			movies.first.should be_a(Filmtotaal::Movie)
		end

		it "should return movie tip for tomorrow" do
			movies = @client.movie_tips(Date.today+1)
			movies.count.should > 0
			movies.first.should be_a(Filmtotaal::Movie)
		end

		it "should return a film of the day" do
			movie = @client.film_of_the_day(Date.today)
			movie.should be_a(Filmtotaal::Movie)
		end

		it "should not return a film of the day after tomorrow" do
			movie = @client.film_of_the_day(Date.today+2)
			movie.should be_nil
		end
	end
end