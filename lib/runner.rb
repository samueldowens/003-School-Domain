require 'nokogiri'
require 'open-uri'
require_relative 'cli.rb'
require_relative 'student.rb'
require_relative 'scraper.rb'

class Run
  URL = "http://students.flatironschool.com/"
 
  attr_accessor :urlmap, :url
 
  def initialize(url = URL)
    @url = url 
    main_page = Nokogiri::HTML(open(@url))
    all_students = main_page.css('.home-blog').css('.blog-thumb a')
    links_to_crawl = all_students.map { |std| std.attributes["href"].value  }
    @urlmap = links_to_crawl.map { |link| "http://students.flatironschool.com/" + link  }
  end

  def run_the_program
    @urlmap.each do |individual|
      student_page = Nokogiri::HTML(open(individual))
      runner = Scrape.new(student_page)
      Student.new({:name => runner.get_name, :twitter => runner.get_twitter, :github => runner.get_github, :linkedin => runner.get_linkedin, :website => runner.get_website})
    end
      CommandLine.new

  end
end

go = Run.new

go.run_the_program