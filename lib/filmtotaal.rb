require "filmtotaal/version"
require "date"
require "open-uri"
require "nokogiri"
require "htmlentities"

directory = File.expand_path(File.dirname(__FILE__))
require File.join(directory, 'filmtotaal', 'client')
require File.join(directory, 'filmtotaal', 'movie')